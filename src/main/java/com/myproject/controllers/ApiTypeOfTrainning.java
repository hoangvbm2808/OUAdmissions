/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.pojo.Typeoftrainning;
import com.myproject.service.TypeOfTrainningService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Thanh
 */
@RestController
public class ApiTypeOfTrainning {
    @Autowired
    private TypeOfTrainningService typeService;
    
    @GetMapping("/api/type")
    public ResponseEntity<List<Typeoftrainning>> listTypeOfTrainnings() {
        List<Typeoftrainning> types = this.typeService.getTypeOfTrainning();
        return new ResponseEntity<>(types,HttpStatus.OK);
    }
}