package com.pocketfridge.pocketfridge.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductsService implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemp;

    @Override
    public void run(String... args) throws Exception {
    }

    public String getProducts() throws JsonProcessingException {

        String sql = "SELECT c.name as category_name, p.name as product_name " +
                "FROM Products p " +
                "INNER JOIN Categories c on p.categoryId = c.id " +
                "ORDER BY c.name";

        Map<String, List<String>> resultMap = new HashMap<>();

        jdbcTemp.query(sql, (rs, rowNum) -> {
            String category = rs.getString("category_name");
            String product = rs.getString("product_name");

            resultMap.computeIfAbsent(category, k -> new ArrayList<>())
                    .add(product);

            return null;
        });

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(resultMap);
    }
}
