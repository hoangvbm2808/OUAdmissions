/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.controllers;

import com.myproject.pojo.Comment;
import com.myproject.pojo.Question;
import com.myproject.pojo.User;
import com.myproject.service.QuestionService;
import com.myproject.service.UserService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Thanh
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiQuestionController {
    
    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private JavaMailSender emailSender;
    
    @Autowired
    private Environment env;
    
//    @GetMapping("/questions/")
//    public ResponseEntity<List<Object>> getListQuestions(@RequestParam Map<String, String> params) {
//        List<Object> questions = this.questionService.getListQuestionsForQuestion(params);
//        List<Object> questionsAndAnswer = this.questionService.getListQuestionsForQuestionAndAnswer();
//        int count = this.questionService.countQuetionsNotLive();
//        System.out.println(count);
//        System.out.println(questions);
////        System.out.println(questionsAndAnswer);
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_QUESTION_SIZE"));
//        double totalPages = Math.ceil(count*1.0/pageSize);
//        
//        //Tạo hashmap để chứa list và page
//        Map<String, Object> response = new HashMap<>();
//        response.put("questions", questions);
//        response.put("pages", totalPages);
//        response.put("questionsAndAnswer", questionsAndAnswer);
//        
//        return new ResponseEntity<>(questions, HttpStatus.OK);
//    }
    
    @GetMapping("/questions/")
    public ResponseEntity<Map<String, Object>> getListQuestions(@RequestParam Map<String, String> params) {
        List<Object> questions = this.questionService.getListQuestionsForQuestion(params);
        List<Object> questionsAndAnswer = this.questionService.getListQuestionsForQuestionAndAnswer();
        int count = this.questionService.countQuetionsNotLive();
        System.out.println(count);
        System.out.println(questions);
//        System.out.println(questionsAndAnswer);
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_QUESTION_SIZE"));
        double totalPages = Math.ceil(count*1.0/pageSize);
        
        //Tạo hashmap để chứa list và page
        Map<String, Object> response = new HashMap<>();
        response.put("questions", questions);
        response.put("pages", totalPages);
        response.put("questionsAndAnswer", questionsAndAnswer);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    
    @PostMapping("/questions/{id}")
    public ResponseEntity<Object> update(@PathVariable(value = "id") int id, @RequestBody Question question) {
        Question c = this.questionService.getQuestionById(id);
        c.setContent(question.getContent());
        return new ResponseEntity<>(this.questionService.addOrUpdateQuestion(c),HttpStatus.OK);
    }
    
    @DeleteMapping("/questions/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteQuestion(@PathVariable(value = "id") int id) {
        this.questionService.deleteQuestion(id);
    }
    
    @GetMapping("/live_info/{id}/questions")
    public ResponseEntity<List<Object>> listQuestions(@PathVariable(value = "id") int id) {
        List<Object> questions = this.questionService.getListQuestionsByLive(id);
        return new ResponseEntity<>(questions,HttpStatus.OK);
    }
     
    @GetMapping("/questions/{id}")
    public ResponseEntity<Object> getQuestionById(@PathVariable(value = "id") int id) {
        Object questions = this.questionService.getQuestionById(id);
        return new ResponseEntity<>(questions,HttpStatus.OK);
    }
    
    @GetMapping("/questions/getdate")
    public ResponseEntity<Object> getDate() {
        return new ResponseEntity<>(this.questionService.getDate().toString(), HttpStatus.OK);
    }      
}
