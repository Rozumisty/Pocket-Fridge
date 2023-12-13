package com.pocketfridge.pocketfridge.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Service;


import java.util.*;
import java.sql.Date;

@Service
public class UserFridgeService implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemp;

    @Override
    public void run(String... args) throws Exception {

    }

    //категорія
    public String getUserFridge(String login) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ArrayList<LinkedHashMap<String, String>> result = new ArrayList<>();
        String sql = "SELECT productId, quantity, expirationDate FROM UserFridge WHERE userId = ?";

        int userId = Integer.parseInt(getUserId(login));

        List<Map<String, Object>> rows = jdbcTemp.queryForList(sql, userId);
        for (Map<String, Object> row : rows) {
            LinkedHashMap<String, String> item = new LinkedHashMap<>();
            item.put("productId", row.get("productID").toString());
            item.put("productName", getProductName((int)row.get("productID")));
            item.put("quantity", row.get("quantity").toString());
            item.put("expirationDate", row.get("expirationDate").toString());
            result.add(item);
        }
        return mapper.writeValueAsString(result);
    }


    // додавання кількості продуктів

    public void addProduct(int userId, String productName, int quantity, Date expirationDate){
        String sql = "INSERT INTO UserFridge(userid, productId, quantity, additionDate, expirationDate) " +
                "VALUES(?, ?, ?, ?, ?)";
        jdbcTemp.update(sql,
                userId, getProductId(productName), quantity, java.time.LocalDate.now(), expirationDate);
    }

    private String getProductName(int productID) {
        String sql = "SELECT name FROM Products WHERE id = ?";

        return jdbcTemp.queryForObject(sql, String.class, productID);
    }

    private Integer getProductId(String productName){
    String sql = "SELECT id FROM Products WHERE name = ?";
        return jdbcTemp.queryForObject(sql, Integer.class, productName);
    }

    public String getUserId(String login) {
        String sql = "SELECT id FROM Users WHERE login = ?";
        return jdbcTemp.queryForObject(sql, String.class, login);
    }

}
