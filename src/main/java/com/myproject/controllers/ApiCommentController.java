/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.pojo.Comment;
import com.myproject.pojo.User;
import com.myproject.service.CommentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Thanh
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    
    @GetMapping("/listCommentByPost/{id}")
    public ResponseEntity<List<Object>> listComment(@PathVariable(value = "id") int id) {
        List<Object> comments = this.commentService.getCommentByPost(id);
        return new ResponseEntity<>(comments,HttpStatus.OK);
    }
    
    @PostMapping("/addComment")
    public ResponseEntity<?> addUser(@RequestBody Comment comment){ 
        return new ResponseEntity<>(this.commentService.addComment(comment), HttpStatus.OK);
    }
}
