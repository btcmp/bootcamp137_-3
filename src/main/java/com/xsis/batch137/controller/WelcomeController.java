package com.xsis.batch137.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.User;
import com.xsis.batch137.service.EmployeeService;
import com.xsis.batch137.service.OutletService;

@Controller
@RequestMapping("/welcome-auth")
public class WelcomeController {

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	OutletService outletService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping(value="/get-one-by-username")
	@ResponseBody
	public Employee getOneByUsername(@RequestParam(value="username", defaultValue="") String username) {
		return employeeService.getEmployeeByUsername(username);
	}
	
	@RequestMapping(value="/choose-outlet")
	public String chooseOutlet(Model model, Principal principal) {
		String username = principal.getName();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		boolean superr = authentication.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_SUPER"));
		Employee emp = employeeService.getEmployeeByUsername(username);
		User user = employeeService.getUserByEmployee(emp);
		httpSession.setAttribute("usernameLogin", username);
		httpSession.setAttribute("empLogin", emp);
		httpSession.setAttribute("userLogin", user);
		List<Outlet> outlets = null;
		if(superr) {
			outlets = outletService.selectActive();
		}else {
			outlets = employeeService.getOutletByEmployee(emp); 
		}
		model.addAttribute("outlets", outlets);
		return "choose-outlet";
	}
	
	@RequestMapping(value="/home")
	public String home(@RequestParam(value="id", defaultValue="") long id) {
		Outlet outlet =  outletService.getOne(id);
		httpSession.setAttribute("outletLogin", outlet);
		return "main";
	}
}