/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.repository.DepartmentRepository;
import com.myproject.service.DepartmentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{

    @Autowired
    private DepartmentRepository depaDepartment;
    
    @Override
    public List<Object> getDepartment() {
        return this.depaDepartment.getDepartment();
    }

    @Override
    public Object getDepartmentById(int id) {
        return this.depaDepartment.getDepartmentById(id);
    }
    
}
