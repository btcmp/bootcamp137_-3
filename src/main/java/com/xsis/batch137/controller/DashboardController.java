package com.xsis.batch137.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class DashboardController {

	
	
	
	
	@RequestMapping("/dashboard")
	public String index(Model model) {
		return "dashboard";
	}
}
