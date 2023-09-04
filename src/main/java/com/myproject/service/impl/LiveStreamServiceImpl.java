/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.service.impl;

import com.myproject.pojo.Livestream;
import com.myproject.repository.LiveStreamRepository;
import com.myproject.service.LiveStreamService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh
 */
@Service
public class LiveStreamServiceImpl implements LiveStreamService{
    
    @Autowired
    private LiveStreamRepository liveRepo;
    
    @Override
    public List<Object> getLiveStreams() {
        return this.liveRepo.getLiveStreams();
    }

    @Override
    public Object getLiveById(int id) {
        return this.liveRepo.getLiveById(id);
    }

    @Override
    public boolean addLive(Livestream l) {
        return this.liveRepo.addLive(l);
    }
    
}
