package com.sandun.askaride.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Author: Sandun Lewke Bandara
 */
@RequestMapping(value="/service/search")
@Controller
public class DeliveryServiceSearchController {


	@RequestMapping(method={RequestMethod.GET})
    public String showPage(HttpServletRequest request , HttpServletResponse response,ModelMap model) {
		model.addAttribute("address_from", request.getParameter("address_from"));
		model.addAttribute("address_to", request.getParameter("address_to"));
		
		return "search-result";
    }

}
