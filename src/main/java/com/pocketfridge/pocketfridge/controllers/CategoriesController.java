package com.pocketfridge.pocketfridge.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pocketfridge.pocketfridge.models.Categories;

import com.pocketfridge.pocketfridge.services.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CategoriesController {
    private final CategoriesService categoriesService;

    @Autowired
    public CategoriesController(CategoriesService categoriesService){
        this.categoriesService = categoriesService;
    }

    @RequestMapping(value ="/getCategories", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public String getCategories(){
        try {
            return categoriesService.getCategories();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }
}
