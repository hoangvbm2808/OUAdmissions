/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.repository.DepartmentRepository;
import java.util.List;
import org.hibernate.CacheMode;
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
public class DepartmentRepositoryImpl implements DepartmentRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Object> getDepartment() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Department");
        
        return q.getResultList();    
    }

    @Override
    public Object getDepartmentById(int i) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Department WHERE id= :i");
        q.setParameter("i",i);
        return q.getSingleResult();
    }
    
}
