/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.service.DepartmentService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Thanh
 */
@Controller
@ControllerAdvice
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private Environment env;
    
    @RequestMapping("/department_info")
    public String departmentInfo(Model model, @RequestParam Map<String, String> params) {
        String id = params.get("departId").toString();
        model.addAttribute("department", this.departmentService.getDepartmentById(Integer.parseInt(id)));
        return "department_info";
    }
}
