/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.myproject.repository;

import com.myproject.pojo.Post;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Thanh
 */
public interface PostRepository {
    List<Post> getPost();
    List<Object> getPostByType(String typeoftrainningId);
    Post getPostById(int id);
    List<Post> getPosts(Map<String, String> params);
    int countPosts();
//    List<Post> getPostsByPage(Map<String, String> params, int page);

    boolean addOrUpdatePost(Post p);
    boolean deletePost(int id);
}
