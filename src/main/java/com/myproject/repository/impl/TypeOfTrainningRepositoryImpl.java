/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.pojo.Typeoftrainning;
import com.myproject.repository.TypeOfTrainningRepository;
import java.util.List;
import jdk.nashorn.internal.runtime.regexp.JoniRegExp;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jca.support.LocalConnectionFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Thanh
 */
@Repository
@Transactional
public class TypeOfTrainningRepositoryImpl implements TypeOfTrainningRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Typeoftrainning> getTypeOfTrainning() {
        Session s = this.factory.getObject().openSession();
        Query q = s.createQuery("FROM Typeoftrainning");
        
        return q.getResultList();
    }
    
}
