package com.pocketfridge.pocketfridge.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriesService implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemp;

    @Override
    public void run(String... args) throws Exception {
    }

    public String getCategories() throws JsonProcessingException {

        String sql = "SELECT * FROM Categories";

        List<String> categories = jdbcTemp.query(sql,
                (rs, rowNum) -> rs.getString("name")
        );

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(categories);

    }
}
