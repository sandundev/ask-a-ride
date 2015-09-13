package com.sandun.askaride.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Author: Sandun Lewke Bandara
 */
@RequestMapping(value="/service/search")
@Controller
public class DeliveryServiceSearchController {


	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
    public String showPage(HttpServletRequest request , HttpServletResponse response){
    	System.out.println(request.getRequestURI());
        return "search-result";
    }

}
