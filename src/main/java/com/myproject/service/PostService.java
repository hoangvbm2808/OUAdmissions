/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.myproject.service;

import com.myproject.pojo.Post;
import java.util.List;

/**
 *
 * @author Thanh
 */
public interface PostService {
    List<Post> getPost();
    List<Object> getPostByType(String typeoftrainningId);
    Object getPostById(int id);
}
