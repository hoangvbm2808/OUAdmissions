/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.myproject.repository;

import com.myproject.pojo.Comment;
import java.util.List;

/**
 *
 * @author Thanh
 */
public interface CommentRepository {
     List<Object> getComments();
     List<Object> getCommentByPost(int postId);
     Comment addComment(Comment comment);
}
