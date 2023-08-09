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
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Thanh
 */
@Repository
@Transactional
public class PostRepositoryImpl implements PostRepository {

    @Autowired
    LocalSessionFactoryBean factory;

    @Autowired
    private Environment env;

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
        q.setParameter("i", id);
        return q.getSingleResult();
    }

    @Override
    public List<Post> getPosts(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Post> q = b.createQuery(Post.class);
        Root root = q.from(Post.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(b.like(root.get("title"), String.format("%%%s%%", kw)));
            }

            String typeOfTrainningId = params.get("typeOfTrainningId");
            if (typeOfTrainningId != null && !typeOfTrainningId.isEmpty()) {
                predicates.add(b.equal(root.get("typeoftrainningId"), Integer.parseInt(typeOfTrainningId)));
            }

            q.where(predicates.toArray(Predicate[]::new));
        }
        q.orderBy(b.desc(root.get("id")));

        Query query = s.createQuery(q);

        if (params != null) {
            String page = params.get("page");
            if(page == null) {
                page = "1";
            }
            if(!page.equals("0")){
                int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
                query.setFirstResult((Integer.parseInt(page) - 1) * pageSize);
                query.setMaxResults(pageSize);
            }
        }

        return query.getResultList();
    }

    @Override
    public int countPosts() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT COUNT(*) FROM Post");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdatePost(Post p) {
        Session s = this.factory.getObject().getCurrentSession();
        System.out.println("INFO_Before_try");
        try {
            System.out.println("INFO_Before_ADD");
            if (p.getId() == null){
                 s.save(p);
            }
            else{
                s.update(p);
            }
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}
