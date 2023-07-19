/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

/**
 *
 * @author vbmho
 */
import com.myproject.service.CategoryService;
import com.myproject.service.ProductService;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
@PropertySource("classpath:configs.properties")
public class IndexController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService cateService;
    @Autowired
    private Environment env;
    Locale vnd = new Locale("vi", "VN");
    NumberFormat vietnamdongFormat = NumberFormat.getCurrencyInstance(vnd);
    
    
    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("categories", this.cateService.getCates());
        model.addAttribute("products", this.productService.getProducts(params));
        
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        int count = this.productService.countProducts();
        model.addAttribute("counter", Math.ceil(count*1.0/pageSize));
        
        return "index";
    }
}