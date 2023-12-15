package com.pocketfridge.pocketfridge.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Service;


import java.util.*;
import java.sql.Date;
import java.util.stream.Collectors;

/**
 * Видалення з БД
 */

@Service
public class UserFridgeService implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemp;

    @Override
    public void run(String... args) throws Exception {
    }


    //категорія
    public String getUserFridge(String login) throws JsonProcessingException {
        String sql = "SELECT c.name as category_name, p.name as product_name, uf.quantity, uf.expirationDate " +
                "FROM UserFridge AS uf " +
                "LEFT JOIN Products AS p ON uf.productId = p.id " +
                "LEFT JOIN Categories AS c ON p.categoryId = c.id " +
                "WHERE uf.userId = ?";

        Map<String, List<Map<String, Object>>> resultMap = jdbcTemp.query(sql,
                        (rs, rowNum) -> {
                            String category = rs.getString("category_name");
                            String product = rs.getString("product_name");
                            int quantity = rs.getInt("quantity");
                            String expirationDate = rs.getString("expirationDate");

                            Map<String, Object> result = new HashMap<>();
                            result.put("category", category);
                            result.put("product", product);
                            result.put("quantity", quantity);
                            result.put("expirationDate", expirationDate);

                            return result;
                        }, getUserId(login))
                .stream()
                .collect(Collectors.groupingBy(
                        r -> r.get("category").toString(),
                        HashMap::new,
                        Collectors.toList())
                );

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(resultMap);
    }

    public void addProduct(int userId, String productName, int quantity, Date expirationDate) {

        boolean exist = false;

        String sql = "SELECT expirationDate FROM UserFridge uf " +
                "JOIN Products p ON p.id = uf.productId " +
                "WHERE p.name = ? AND userId = ?";

        List<Date> dates = jdbcTemp.queryForList(sql, Date.class, productName, userId);

        if (!dates.isEmpty()) {
            for (Date date : dates) {
                if (date.equals(expirationDate)) {
                    String sqlUpd = "UPDATE UserFridge SET quantity = quantity + ? " +
                            "WHERE productId = (SELECT id FROM Products WHERE name = ?)" +
                            " AND expirationDate = ? AND userId = ?";
                    jdbcTemp.update(sqlUpd, quantity, productName, date, userId);
                    exist = true;
                    break;
                }
            }
        }
        if (!exist){
            String sqladd = "INSERT INTO UserFridge (userid, productId, quantity, additionDate, expirationDate) " +
                    "VALUES (?, " +
                    "(SELECT id FROM Products WHERE name = ?), ?, ?, ?)";

            jdbcTemp.update(sqladd, userId, productName, quantity, java.time.LocalDate.now(), expirationDate);
        }
    }

    private Integer getProductId(String productName) {
        String sql = "SELECT id FROM Products WHERE name = ?";
        return jdbcTemp.queryForObject(sql, Integer.class, productName);
    }

    private String getProductName(int productID) {
        String sql = "SELECT name FROM Products WHERE id = ?";

        return jdbcTemp.queryForObject(sql, String.class, productID);
    }


    public String getUserId(String login) {
        String sql = "SELECT id FROM Users WHERE login = ?";
        return jdbcTemp.queryForObject(sql, String.class, login);
    }

}
