/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.exerciseSpringBoot.crudBootstrap.controllers;

import com.exerciseSpringBoot.crudBootstrap.entities.Datamhs;
import com.exerciseSpringBoot.crudBootstrap.entities.Matkul;
import com.exerciseSpringBoot.crudBootstrap.services.DatamhsService;
import com.exerciseSpringBoot.crudBootstrap.services.MatkulService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ASUS
 */
@RequestMapping("api")
@RestController
public class KsmRestController {

    @Autowired
    DatamhsService datamhsservices;
    
    @Autowired
    MatkulService matkulservices;

    @GetMapping("/ksm/{nim}")
    public List<Matkul> ksm(Model model, @PathVariable(name = "nim") String nim){
        return matkulservices.getbyNIM(nim);
    }
    
 
    @RequestMapping("/delete/{kode}/{nim}")
    public String delete(@PathVariable(name = "kode") String kode, @PathVariable(name = "nim") String nim){
        matkulservices.deleteksm(kode, nim);
        return ""+nim;
    }
   
 
    @PostMapping("/savedata/{nim}")
    public String save(@ModelAttribute(value="kode") Matkul matkul, @PathVariable(name = "nim") String nim, Model model){
        if (matkulservices.checkksm(matkul.getKode(), nim)) {
            model.addAttribute("error", true);
        }
        else if (matkulservices.checkkode(matkul.getKode())==false) {
            model.addAttribute("error", true); 
        }
        else{
             matkulservices.savetoksm(matkul.getKode(),nim);
        }
        return "redirect:/ksm/"+nim;
    }
    
    @GetMapping("/alljadwal/{nim}")
    public String alljadwal(@PathVariable(name = "nim") String nim, Model model) {
        model.addAttribute("matkulll", matkulservices.getAll());
        model.addAttribute("mahasiswa", datamhsservices.getbynim(nim));
       return "jadwal";
    }
    
    
    //mengecek isi dari form login, apakah sesuai di database
    @RequestMapping("/check")
    public String checkLogin(@ModelAttribute(name = "datamhs") Datamhs datamhs, Model model) {

        String nim = datamhs.getNim();
        String password = datamhs.getPassword();

        if ((nim.equalsIgnoreCase("admin"))&&(password.equalsIgnoreCase("admin"))){
            return "redirect:/adminpage";
        }
        
        if (datamhsservices.checknim(nim)) {
            if (password.equalsIgnoreCase(datamhsservices.checkpass(nim))) {
                model.addAttribute("name", datamhsservices.checkname(nim));
                return "redirect:/ksm/"+nim;
            } else {
                 model.addAttribute("loginError", true); 
                 return "login";  
            }
        } else {
                model.addAttribute("loginError", true); 
                 return "login";  
        }
    }
    
    @GetMapping("/adminpage")
    public String ksm(Model model){
        model.addAttribute("matkul",new Matkul());
        model.addAttribute("matkulll", matkulservices.getAll());
        return "adminpage";
    }
    
    @GetMapping("/delete/{kode}")
    public String delete(@PathVariable(name = "kode") String kode){
        matkulservices.deletematkul(kode);
        return "redirect:/adminpage";
    }
    
    @PostMapping("/savematkul")
    public String save(@Valid Matkul matkul, Model model){
        if (matkulservices.checkkode(matkul.getKode())==false){ 
             matkulservices.savematkul(matkul);
             model.addAttribute("error",true);
        }
        return "redirect:/adminpage";
    }

}



