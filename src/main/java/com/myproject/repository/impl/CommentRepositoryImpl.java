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
    public Comment addComment(Comment comment) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(comment);
            System.out.println("Add success!!");
            return comment;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
    
}
