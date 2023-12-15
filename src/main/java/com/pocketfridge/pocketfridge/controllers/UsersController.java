package com.pocketfridge.pocketfridge.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pocketfridge.pocketfridge.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UsersController {
    private final UsersService usersService;

    @Autowired
    public UsersController(UsersService usersService){
        this.usersService = usersService;
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public String getUser(@RequestParam String login) throws JsonProcessingException {
        return usersService.getUser(login);
    }

    @GetMapping("/getPassword")
    public String getPassword(@RequestParam String login){
        return usersService.getPassword(login);
    }

//    @PostMapping("/addUser")
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public ResponseEntity<String> addUser( @RequestParam String firstName, @RequestParam String lastName,
                                          @RequestParam String login, @RequestParam String password, @RequestParam String email){
        usersService.addUser(firstName, lastName, login, password, email);
        return ResponseEntity.ok("Data saved");
    }

    @GetMapping("/checkPassword")
    public boolean checkPassword(@RequestParam String login, @RequestParam String password){
        return usersService.checkPassword(login, password);
    }

    @PutMapping("/removeUser")
    public ResponseEntity<String> removeUser(@RequestParam String login){
        usersService.removeUser(login);
        return ResponseEntity.ok("Ok");
    }


}
