package com.pocketfridge.pocketfridge.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pocketfridge.pocketfridge.models.Products;
import com.pocketfridge.pocketfridge.services.ProductsService;
import com.pocketfridge.pocketfridge.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
public class ProductsController {
    private final ProductsService productsService;

    @Autowired
    public ProductsController(ProductsService productsService){
        this.productsService = productsService;
    }


    @RequestMapping(value ="/getProducts", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public String getProducts(){
        try {
            return productsService.getProducts();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }
}
