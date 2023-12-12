package com.pocketfridge.pocketfridge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class UserFridgeService implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemp;

    @Override
    public void run(String... args) throws Exception {

    }

    public String getUserFridge(String login){
        String sql = "SELECT productId, quantity FROM UserFridge WHERE userId = ?";
        List<String> productIds = jdbcTemp.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                System.out.println(rs.getString("quantity"));
                return rs.getString("productId");
            }
        }, getUserId(login));
        System.out.println(productIds);
        return productIds.toString();
    }

    private String getUserId(String login) {
        String sql = "SELECT id FROM Users WHERE login = ?";
        return jdbcTemp.queryForObject(sql, String.class, login);
    }
}
