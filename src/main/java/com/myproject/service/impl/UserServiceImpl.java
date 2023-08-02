/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.pojo.User;
import com.myproject.repository.UserRepository;
import com.myproject.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author vbmho
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @Autowired
    private UserRepository userRepository;
    
    @Override
    public List<User> getUsers() {
        return this.userRepository.getUsers();
    }

    @Override
    public Object getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public boolean addUser(User user) {
        String pass = user.getPassword();
        
        user.setActive(Boolean.TRUE);
        user.setUserRole(User.USER);
        user.setPassword(this.passwordEncoder.encode(pass));
                
        return this.userRepository.addUser(user);
    }

    @Override
    public List<User> getUsers(String name) {
        return this.userRepository.getUser(name);
    }

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        List<User> users = this.getUsers(name);
        if (users.isEmpty())
            throw new UsernameNotFoundException("User does not exist!!!");
        
        User u = users.get(0);
        
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(u.getUserRole()));
        return new org.springframework.security.core.userdetails.User(u.getUsername(),
                u.getPassword(), auth);
    }
    
}
