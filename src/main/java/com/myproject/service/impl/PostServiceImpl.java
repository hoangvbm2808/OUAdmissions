/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.pojo.Post;
import com.myproject.repository.PostRepository;
import com.myproject.service.PostService;
import java.util.List;
import java.util.Map;
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
    public List<Object> getPostByType(int typeoftrainningId
            , Map<String, String> params
    ) {
        return this.postRepo.getPostByType(typeoftrainningId, params);
    }

    @Override
    public Post getPostById(int id) {
        return this.postRepo.getPostById(id);
    }

    @Override
    public List<Post> getPosts(Map<String, String> params) {
        return this.postRepo.getPosts(params);
    }

    @Override
    public long countPosts() {
        return this.postRepo.countPosts();
    }
    
   
    @Override
    public boolean addOrUpdatePost(Post p) {
        return this.postRepo.addOrUpdatePost(p);
    }

    @Override
    public boolean deletePost(int id) {
        return this.postRepo.deletePost(id);
    }

    @Override
    public List<Object> get5PostByType(int typeoftrainningId) {
        return this.postRepo.get5PostByType(typeoftrainningId);
    }
    
    
    
}
