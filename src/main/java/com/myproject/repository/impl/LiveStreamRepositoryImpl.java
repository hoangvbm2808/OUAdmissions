/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.pojo.Livestream;
import com.myproject.repository.LiveStreamRepository;
import java.util.List;
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
public class LiveStreamRepositoryImpl implements LiveStreamRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Object> getLiveStreams() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Livestream");
        return q.getResultList();
    }

    @Override
    public Object getLiveById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("FROM Livestream WHERE id= :id");
        q.setParameter("id", id);
        return q.getSingleResult();
    }

    @Override
    public boolean addLive(Livestream l) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (l.getId() == null) {
                s.save(l);
            } else {
                s.update(l);
            }
            return true;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
    
}
