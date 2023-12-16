package com.pocketfridge.pocketfridge.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pocketfridge.pocketfridge.models.Receipts;
import com.pocketfridge.pocketfridge.services.ReceiptsService;
import com.pocketfridge.pocketfridge.services.UserFridgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReceiptsController {
    private final ReceiptsService receiptsService;

    @Autowired
    public ReceiptsController(ReceiptsService receiptsService){
        this.receiptsService = receiptsService;
    }

    @RequestMapping(value ="/checkRecipe", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public String checkRecipe(@RequestParam String login) throws JsonProcessingException {
        return receiptsService.checkRecipe(login);
    }
}
