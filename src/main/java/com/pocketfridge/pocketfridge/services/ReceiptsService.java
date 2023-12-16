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

public class ReceiptsService implements CommandLineRunner {

    @Autowired
    private JdbcTemplate jdbcTemp;

    @Override
    public void run(String... args) throws Exception {
    }


    public String checkRecipe(String login) throws JsonProcessingException {
        int userId = getUserId(login);

        String sqlQuery = "SELECT r.id AS recipe_id, c.name AS country, r.name AS recipe, r.instruction, r.video, " +
                "p.name AS product_name, rp.amount AS recipe_amount, uf.quantity " +
                "FROM Receipts r " +
                "JOIN Countries c ON r.countryId = c.id " +
                "JOIN ReceiptsProducts rp ON r.id = rp.receiptId " +
                "JOIN Products p ON rp.productId = p.id " +
                "LEFT JOIN UserFridge uf ON uf.productId = rp.productId AND uf.userId = ? " +
                "ORDER BY r.id";

        List<Map<String, Object>> rows = jdbcTemp.queryForList(sqlQuery, userId);

        List<Map<String, Object>> resultList = new ArrayList<>();
        String currentRecipeId = null;
        Map<String, Object> currentRecipe = null;

        for (Map<String, Object> row : rows) {
            String recipeId = row.get("recipe_id").toString();
            if (!recipeId.equals(currentRecipeId)) {
                // Виводимо інформацію про рецепт, тільки якщо це новий рецепт
                if (currentRecipeId != null) {
                    resultList.add(currentRecipe);
                }

                currentRecipe = new HashMap<>();
                currentRecipe.put("recipe_id", recipeId);
                currentRecipe.put("country", row.get("country"));
                currentRecipe.put("recipe", row.get("recipe"));
                currentRecipe.put("instruction", row.get("instruction"));
                currentRecipe.put("video", row.get("video"));

                currentRecipe.put("products", new ArrayList<>());
            }

            Map<String, Object> productObject = new HashMap<>();
            productObject.put("product_name", row.get("product_name"));
            productObject.put("recipe_amount", row.get("recipe_amount"));
            productObject.put("quantity_in_fridge", row.get("quantity"));

            ((List<Map<String, Object>>) currentRecipe.get("products")).add(productObject);
            currentRecipeId = recipeId;
        }

        if (currentRecipeId != null) {
            resultList.add(currentRecipe);
        }

        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(resultList);
    }

    private Map<String, Object> createRecipeMap(String recipeId, Object country, Object recipe, Object instruction, Object video, List<Map<String, Object>> productsList) {
        Map<String, Object> recipeMap = new HashMap<>();
        recipeMap.put("recipe_id", recipeId);
        recipeMap.put("country", country);
        recipeMap.put("recipe", recipe);
        recipeMap.put("instruction", instruction);
        recipeMap.put("video", video);
        recipeMap.put("products", productsList);
        return recipeMap;
    }

    private int calculateMissingQuantity(Map<String, Object> row) {
        int recipeAmount = (int) row.get("recipe_amount");
        int quantityInFridge = (row.get("quantity") != null) ? (int) row.get("quantity") : 0;

        return Math.max(0, recipeAmount - quantityInFridge);
    }

    public int getUserId(String login) {
        String sql = "SELECT id FROM Users WHERE login = ?";
        return jdbcTemp.queryForObject(sql, Integer.class, login);
    }
}
