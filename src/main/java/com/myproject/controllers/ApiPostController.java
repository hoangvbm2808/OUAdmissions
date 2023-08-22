/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.myproject.pojo.Post;
import com.myproject.service.PostService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myproject.configs.EncodingFilter;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;

/**
 *
 * @author vbmho
 */
@RestController
@RequestMapping("/api/posts")
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
    @CrossOrigin
    public ResponseEntity<List<Post>> listPost(@RequestParam Map<String, String> params) {
        List<Post> listPosts = this.postService.getPosts(params);
        return new ResponseEntity<>(listPosts, HttpStatus.OK);
    }

    @GetMapping("/getList5Post/{id}")
    public ResponseEntity<List<Object>> get5PostByType(String typeoftrainningId,
            @PathVariable(value = "id") int id) {
        List<Object> posts = this.postService.get5PostByType(id);
        System.out.println(posts.size());
        return new ResponseEntity<>(posts, HttpStatus.OK);
    }
    
    @GetMapping("/getPostByType/{id}")
    public ResponseEntity<List<Object>> getPostByType(String typeoftrainningId,
            @PathVariable(value = "id") int id) {
        List<Object> posts = this.postService.getPostByType(id);
        System.out.println(posts.size());
        return new ResponseEntity<>(posts, HttpStatus.OK);
    }

    @RequestMapping("/post_info/{id}")
    public Object postInfo(Model model, @RequestParam Map<String, String> params,
            @PathVariable(value = "id") int id) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        String i = String.valueOf(id);
        Post p = this.postService.getPostById(id);
        Object postJson = objectMapper.writeValueAsString(p);
        return new ResponseEntity<>(postJson, HttpStatus.OK);
    }
}
