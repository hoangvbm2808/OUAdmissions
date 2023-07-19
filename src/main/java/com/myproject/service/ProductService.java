/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service;

import com.myproject.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author vbmho
 */
public interface ProductService {
    List<Product> getProducts(Map<String, String> params);
    int countProducts();
}