/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.pojo.Post;
import com.myproject.service.CategoryService;
import com.myproject.service.PostService;
import com.myproject.service.TypeOfTrainningService;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    private CategoryService cateService;

    @Autowired
    private TypeOfTrainningService typeService;
    
    @Autowired
    private Environment env;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("cates", this.cateService.getCates());
    }

    @RequestMapping("/admin/index")
    public String index(Model model, @RequestParam Map<String, String> params) {
        if (!params.isEmpty()) {
            int id = Integer.parseInt(params.get("cateId"));
            switch (id) {
                case 0://Index
                    return "redirect:/admin/index";
                case 1://Banner
                    return "redirect:/admin/banners";
                case 2://Department
                    return "redirect:/admin/departments";
                case 3://Post
                    return "redirect:/admin/post";
                case 4://Livestream
                    return "redirect:/admin/livestreams";
                case 5://Ask
                    return "redirect:/admin/questions";
                case 6://TypeOfTrainning
                    return "redirect:/admin/typeoftrainnings";
                case 7://User
                    return "redirect:/admin/user";
                case 8://Comment
                    return "redirect:/admin/post";
            }
        }
        return "index_admin";
    }
}
