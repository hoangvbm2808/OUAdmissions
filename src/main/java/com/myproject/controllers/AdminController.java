/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;


import com.myproject.service.PostService;
import com.myproject.service.TypeOfTrainningService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author vbmho
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class AdminController {
    @Autowired
    private PostService postService;
    
    @Autowired
    private TypeOfTrainningService typeService;
    
    @Autowired
    private Environment env;
    
    @ModelAttribute
    public void commonAttr(Model model) {
       model.addAttribute("types", this.typeService.getTypeOfTrainning());
    }
  
    @GetMapping("/admin/index")
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("posts", this.postService.getPosts(params));
        int count = this.postService.countPosts();
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        model.addAttribute("pages", Math.ceil(count*1.0/pageSize));
        
        return "admin";
    }
}
