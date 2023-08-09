/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.pojo.User;
import com.myproject.repository.UserRepository;
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
 * @author vbmho
 */

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository{
    
    @Autowired
    LocalSessionFactoryBean factory;

    @Override
    public List<User> getUsers() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM User");
        
        return q.getResultList();
        
    }

    @Override
    public Object getUserById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM User WHERE id= :i");
        q.setParameter("i",id);
        return q.getSingleResult();
    }

    @Override
    public boolean addUser(User user) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(user);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getUser(String username) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> q = builder.createQuery(User.class);
        Root rUser = q.from(User.class);
        q = q.select(rUser);
        
        if (!username.isEmpty()) {
            Predicate p = builder.equal(rUser.get("username").as(String.class),username.trim());
            q = q.where(p);
        }
        
        Query query = s.createQuery(q);
        return query.getResultList();
    }
    
    
    
}
