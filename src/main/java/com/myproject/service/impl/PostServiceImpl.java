/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.pojo.Post;
import com.myproject.repository.PostRepository;
import com.myproject.service.PostService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh
 */
@Service
public class PostServiceImpl implements PostService{
    
    @Autowired
    private PostRepository postRepo;
    
    @Override
    public List<Post> getPost() {
        return this.postRepo.getPost();
    }

    @Override
    public List<Object> getPostByType(String typeoftrainningId) {
        return this.postRepo.getPostByType(typeoftrainningId);
    }

    @Override
    public Object getPostById(int id) {
        return this.postRepo.getPostById(id);
    }
    
}
