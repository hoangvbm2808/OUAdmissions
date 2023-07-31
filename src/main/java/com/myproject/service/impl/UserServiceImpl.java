/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.pojo.User;
import com.myproject.service.UserService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Service;

/**
 *
 * @author vbmho
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<User> getUsers() {
        Session s = this.factory.getObject().openSession();
        Query q = s.createQuery("FROM User");
        
        return q.getResultList();
    }

    @Override
    public Object getUserById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Post WHERE id= :i");
        q.setParameter("i",id);
        return q.getSingleResult();
    }
    
}
