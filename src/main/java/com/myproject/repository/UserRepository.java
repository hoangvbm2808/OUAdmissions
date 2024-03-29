/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository;

import com.myproject.pojo.User;
import java.util.List;

/**
 *
 * @author vbmho
 */
public interface UserRepository {

    List<User> getUsers();

    Object getUserById(int id);

    boolean addUser(User user);

    List<User> getUser(String username);

    boolean updateUser(User user);

    boolean deleteUser(int id);
    
    int countUsers();
    
    User getUserByUsername(String username);
    
    boolean authUser(String username, String password);
    
    User addUserAPI(User user);
}
