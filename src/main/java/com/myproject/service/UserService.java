/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service;

import com.myproject.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author vbmho
 */
public interface UserService extends UserDetailsService {

    List<User> getUsers();

    boolean addUser(User user);

    List<User> getUsers(String name);

    Object getUserById(int id);

    boolean updateUser(User user);

    boolean deleteUser(int id);
    
    int countUsers();
    
    boolean addUserByAdmin(User user);
    
    List<String> roles();
}
