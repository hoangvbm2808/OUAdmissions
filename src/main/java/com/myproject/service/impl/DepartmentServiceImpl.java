/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.pojo.Department;
import com.myproject.repository.DepartmentRepository;
import com.myproject.service.DepartmentService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

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

    @Override
    public Department getDepartmentById_admin(int id) {
        return this.depaDepartment.getDepartmentById_admin(id);
    }

    @Override
    public List<Department> getDepartments(Map<String, String> params) {
        return this.depaDepartment.getDepartments(params);
    }

    @Override
    public int countDepartments() {
        return this.depaDepartment.countDepartments();
    }

    @Override
    public boolean addOrUpdateDepartment(Department d) {
        return this.depaDepartment.addOrUpdateDepartment(d);
    }

    @Override
    public boolean deleteDepartment(int id) {
        return this.depaDepartment.deleteDepartment(id);
    }

}
