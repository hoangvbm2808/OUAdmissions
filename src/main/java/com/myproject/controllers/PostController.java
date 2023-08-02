/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.service.PostService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Thanh
 */
@Controller
public class PostController {
    @Autowired
    private PostService postService; 
    
    @RequestMapping("/post_info")
    public String postInfo(Model model, @RequestParam Map<String, String> params) {
        int id = Integer.parseInt(params.get("postId").toString());
        model.addAttribute("post", this.postService.getPostById(id));
        return "post_info";
    }
}
