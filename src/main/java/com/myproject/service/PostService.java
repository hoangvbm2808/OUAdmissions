/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.myproject.service;

import com.myproject.pojo.Post;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Thanh
 */
public interface PostService {
    List<Post> getPost();
    List<Object> getPostByType(String typeoftrainningId);
    Object getPostById(int id);
    List<Post> getPosts(Map<String, String> params);
    int countPosts();
//    List<Post> getPostsByPage(Map<String, String> params, int page);
}
