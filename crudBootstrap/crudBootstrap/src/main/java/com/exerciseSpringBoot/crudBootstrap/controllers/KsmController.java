/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exerciseSpringBoot.crudBootstrap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author ASUS
 */
@Controller
public class KsmController {
    
    
    @GetMapping("/index")
    public String index(){
        return "index";
    }
    
    @GetMapping("/ksm")
    public String ksm(){
        return "ksm";
    }
    
    
    
}
