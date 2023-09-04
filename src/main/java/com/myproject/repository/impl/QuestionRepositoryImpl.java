/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository.impl;

import com.myproject.pojo.Comment;
import com.myproject.pojo.Question;
import com.myproject.repository.QuestionRepository;
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
public class QuestionRepositoryImpl implements QuestionRepository {
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private Environment env;

    @Override
    public Question addOrUpdateQuestion(Question q) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (q.getId() == null) {
                s.save(q);
                System.out.println("Add success!!");
            } else {
                s.update(q);
                System.out.println("Update success!!");
            }
            return q;
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public List<Object> getListQuestionsByLive(int liveId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
        List<Predicate> predicates = new ArrayList<>();
        Root rQuestion = q.from(Question.class);
        q.select(rQuestion);

        Predicate p = b.equal(rQuestion.get("livestreamId"), liveId);
        predicates.add(p);
        q.where(predicates.toArray(Predicate[]::new));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean deleteQuestion(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Question c = this.getQuestionById(id);
        try {
            s.delete(c);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Question getQuestionById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Question.class, id);
    }

    @Override
    public List<Object> getQuestionByAnswer(int answer) {
        Session s = this.factory.getObject().openSession();
        Query q = s.createQuery("FROM Question where answer = :answer");
        q.setParameter("answer", answer);
        return q.getResultList();
    }

    @Override
    public List<Object> getListQuestions() {
        Session s = this.factory.getObject().openSession();
        Query q = s.createQuery("FROM Question");
        return q.getResultList();
    }
    
}
