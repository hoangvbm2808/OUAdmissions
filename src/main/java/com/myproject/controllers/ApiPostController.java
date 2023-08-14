/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.pojo.Post;
import com.myproject.service.PostService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author vbmho
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiPostController {
    @Autowired
    private PostService postService;
    
    @DeleteMapping("/admin/post/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePost(@PathVariable(value = "id") int id) {
        this.postService.deletePost(id);
    }
    
    @GetMapping("/listPost")
    public ResponseEntity<List<Post>> listPost() {
        List<Post> types = this.postService.getPost();
        return new ResponseEntity<>(types,HttpStatus.OK);
    }
    
    @GetMapping("/listGet5Post/{id}")
    public ResponseEntity<List<Object>> get5PostByType(String typeoftrainningId, @PathVariable(value = "id") int id) {
        String i = String.valueOf(id);
        List<Object> types = this.postService.get5PostByType(i);
        return new ResponseEntity<>(types,HttpStatus.OK);
    }
}
