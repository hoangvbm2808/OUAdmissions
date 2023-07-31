/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service;

import com.myproject.pojo.User;
import java.util.List;

/**
 *
 * @author vbmho
 */
public interface UserService {
    List<User> getUsers();
    Object getUserById(int id);
}
