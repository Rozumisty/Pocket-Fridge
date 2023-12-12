package com.pocketfridge.pocketfridge.services;

import com.pocketfridge.pocketfridge.models.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class UsersService implements CommandLineRunner {

//    private
    @Autowired
    private JdbcTemplate jdbcTemp;
//    @Autowired
//    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {

    }

    public Users getUser(Integer id){
        String sql = "SELECT * FROM Users";
        List<Users> usersList = jdbcTemp.query(sql, BeanPropertyRowMapper.newInstance(Users.class));
        for(Users user: usersList){
            if(id == user.getId()){
                return user;
            }
        }
        return null;
    }

    public String getPassword(String login) {
        String sql = "SELECT * FROM Users";
        List<Users> usersList = jdbcTemp.query(sql, BeanPropertyRowMapper.newInstance(Users.class));
        for(Users user: usersList){
            if(Objects.equals(login, user.getLogin())){
                return user.getPassword();
            }
        }
        return null;
    }

    public void addUser( String firstName, String lastName, String login, String password,
                        String email){
        String sql = "INSERT INTO Users ( firstName, lastName, login, password, email, isActive, isPremium, registerDate)" +
                " VALUES ( ?, ?,?,?,?,?,?,?)";

//        System.out.println(passwordEncoder.encode(password));
        jdbcTemp.update(sql,
                 firstName, lastName, login, password, email, true, false, java.time.LocalDate.now()
        );
    }

    public boolean checkPassword(String login, String password) {
        String sql = "SELECT password FROM users WHERE login = ?";
        try {
            String storedPassword = jdbcTemp.queryForObject(sql, String.class, login);

            return password.equals(storedPassword);

        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    public void removeUser(String login){
        String sql  = "UPDATE Users SET isActive = ? WHERE login = ?";
        jdbcTemp.update(sql, false, login);
//        jdbcTemp.update("DBCC CHECKIDENT ('Users', RESEED, 0)");
    }


}
