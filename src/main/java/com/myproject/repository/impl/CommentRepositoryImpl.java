/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.pojo.Comment;
import com.myproject.pojo.Post;
import com.myproject.repository.CommentRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Thanh
 */
@Repository
@Transactional
public class CommentRepositoryImpl implements CommentRepository{
    @Autowired
    LocalSessionFactoryBean factory;
    
    @Override
    public List<Object> getComments() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Comment");
        return q.getResultList();
    }
    
    @Override
    public List<Object> getCommentByPost(int postId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        List<Predicate> predicates = new ArrayList<>();
        Root rComment = q.from(Comment.class);
        q.select(rComment);

        Predicate p = b.equal(rComment.get("postId"), postId);
        predicates.add(p);
        q.where(predicates.toArray(Predicate[]::new));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Comment addOrUpdateComment(Comment comment) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (comment.getId() == null) {
                s.save(comment);
                System.out.println("Add success!!");
            } else {
                s.update(comment);
                System.out.println("Update success!!");
            }
            return comment;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public List<Object> getCommentByReply(int reply) {
        Session s = this.factory.getObject().openSession();
        Query q = s.createQuery("FROM Comment where reply = :reply");
        q.setParameter("reply", reply);
        return q.getResultList();
    }
    
    @Override
    public Comment getCommentById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Comment.class, id);
    }

    @Override
    public boolean deleteComment(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Comment c = this.getCommentById(id);
        try {
            s.delete(c);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
