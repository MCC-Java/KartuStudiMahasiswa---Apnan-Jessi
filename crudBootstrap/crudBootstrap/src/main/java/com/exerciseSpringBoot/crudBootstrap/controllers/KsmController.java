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
    
    //Menuju ke laman login
     @GetMapping("/login")
    public String login(){
        return "login";
    }
    
	//mengecek isi dari form login
    @RequestMapping(value="/check",method=RequestMethod.POST )
    public String checkLogin(@ModelAttribute(name="loginForm") LoginForm loginForm, Model model){
        
        String username = loginForm.getUsername();
        String password = loginForm.getPassword();
        
        if("admin".equals(username) && "admin".equals(password)){
            return "ksm";
        }
        model.addAttribute("invalid",true);
        return "login";
    }
    
}
