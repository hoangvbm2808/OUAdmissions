/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myproject.repository;

import java.util.List;
import java.util.Map;

/**
 *
 * @author vbmho
 */
public interface StatsRepository {
    List<Object[]> countProductsByCate();
    List<Object[]> statsRevenue(Map<String, String> params);
}