package com.sandun.askaride.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Author: Daniel
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

    @RequestMapping(method = RequestMethod.GET)
    public String showPage(HttpServletRequest request , HttpServletResponse response){
    	System.out.println(request.getRequestURI());
        return request.getRequestURI().split(request.getContextPath())[1];
    }

}
