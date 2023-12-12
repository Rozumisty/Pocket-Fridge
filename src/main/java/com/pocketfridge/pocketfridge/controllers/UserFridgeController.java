package com.pocketfridge.pocketfridge.controllers;

import com.pocketfridge.pocketfridge.models.UserFridge;
import com.pocketfridge.pocketfridge.services.UserFridgeService;
import com.pocketfridge.pocketfridge.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserFridgeController {

    private final UserFridgeService userFridgeService;

    @Autowired
    public UserFridgeController(UserFridgeService userFridgeService){
        this.userFridgeService = userFridgeService;
    }

    @RequestMapping(value ="/getUserFridge", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public String getUserFridge(@RequestParam String login){
        return userFridgeService.getUserFridge(login);
    }
}
