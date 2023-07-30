/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.pojo.Post;
import com.myproject.pojo.Typeoftrainning;
import com.myproject.repository.PostRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class PostRepositoryImpl implements PostRepository{
    
    @Autowired
    LocalSessionFactoryBean factory;
    
    @Override
    public List<Post> getPost() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Post");
        
        return q.getResultList();
    }

    @Override
    public List<Object> getPostByType(String typeoftrainningId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        List<Predicate> predicates = new ArrayList<>();
        Root rPost = q.from(Post.class);
        q.select(rPost);
        
        Predicate p = b.equal(rPost.get("typeoftrainningId"), Integer.parseInt(typeoftrainningId));
        predicates.add(p);
        q.where(predicates.toArray(Predicate[]::new));
        
        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Object getPostById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Post WHERE id= :i");
        q.setParameter("i",id);
        return q.getSingleResult();
    }
}
