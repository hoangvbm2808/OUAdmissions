/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.components.JwtService;
import com.myproject.pojo.Comment;
import com.myproject.pojo.User;
import com.myproject.service.UserService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Thanh
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {
    @Autowired
    private JwtService jwtService;
    @Autowired
    private UserService userService;
    
    @PostMapping("/login/")
    @CrossOrigin
    public ResponseEntity<String> login(@RequestBody User user) {
        if (this.userService.authUser(user.getUsername(), user.getPassword()) == true) {
            String token = this.jwtService.generateTokenLogin(user.getUsername());
            
            return new ResponseEntity<>(token, HttpStatus.OK);
        }
        return new ResponseEntity<>("error", HttpStatus.BAD_REQUEST);
    }
    
    @GetMapping("/test/")
    @CrossOrigin
    public ResponseEntity<String> test(Principal pricipal) {
        return new ResponseEntity<>("SUCCESSFUL", HttpStatus.OK);
    }
    
   
    @PostMapping(path = "/register-user/", 
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE}, 
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @CrossOrigin
    public ResponseEntity<Object> addUser(@RequestParam Map<String, String> params, @RequestPart MultipartFile avatar) {
//        System.out.println("===================="+user.getUsername());
        User user = this.userService.addUserAPI(params, avatar);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
    
    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<User> details(Principal user) {
        User u = this.userService.getUserByUserName(user.getName());
        
        return new ResponseEntity<>(u, HttpStatus.OK);
    }
    
    @PostMapping("/change-password/")
    @CrossOrigin
    public ResponseEntity<Object> changePass(@RequestParam Map<String, String> params) {
        if (this.userService.authUser(params.get("username").toString(), 
                params.get("password").toString())) {
            User u1 = this.userService.changePassword(params);
            return new ResponseEntity<>(u1, HttpStatus.OK);
        }
        return new ResponseEntity<>(null,HttpStatus.CREATED);
    }
    
//    @PostMapping("/change-password/")
//    @CrossOrigin
//    public ResponseEntity<Taikhoan> changePassword(@RequestParam Map<String, String> params) {
//        if (this.tkService.authUser(params.get("tenTaiKhoan").toString(), params.get("matKhau").toString()) == true) {
//            Taikhoan a = tkService.thayDoiMatKhau(params);
//
//            return new ResponseEntity<>(a, HttpStatus.OK);
//        }
//        return new ResponseEntity<>(null, HttpStatus.CREATED);
//    }
    
}
