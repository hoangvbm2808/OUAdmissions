/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.myproject.service;

import java.util.List;

/**
 *
 * @author Thanh
 */
public interface DepartmentService {
    List<Object> getDepartment();
    Object getDepartmentById(int id);
}
