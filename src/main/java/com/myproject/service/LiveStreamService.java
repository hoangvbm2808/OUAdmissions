/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.myproject.service;

import com.myproject.pojo.Livestream;
import java.util.List;

/**
 *
 * @author Thanh
 */
public interface LiveStreamService {
    List<Object> getLiveStreams();
    Object getLiveById(int id);
    boolean addLive(Livestream l);
}
