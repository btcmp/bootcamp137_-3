package com.xsis.batch137.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.User;
import com.xsis.batch137.service.EmployeeService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	EmployeeService empService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	public String doLogin(Model model, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout) {
		if(error != null){
			model.addAttribute("error", "User or password is wrong!");
		} 
		if(logout != null){
			model.addAttribute("logout", "You have been logged out!");
		}
		
		return "login";
	}
	
	@RequestMapping("/index") 
	public String index() {
		return "home";
	}
	
	@RequestMapping("/access-denied") 
	public String accessDenied() {
		return "access-denied";
	}
	
	@RequestMapping("/ubah-password")
	@ResponseBody
	public int ubahPassword(@RequestParam(value="password", defaultValue="") String password, @RequestParam(value="email", defaultValue="") String email) {
		return empService.ubahPassword(email, password);
	}
	
	@RequestMapping("/get-emp-email")
	@ResponseBody
	public Employee getEmpByEmail(@RequestParam(value="email", defaultValue="") String email) {
		return empService.getEmployeeByEmail(email);
	}
	
	@RequestMapping("/do-login")
	@ResponseStatus(HttpStatus.OK)
	public void doLoginViaAPI(HttpServletRequest request, @RequestParam(value="username", defaultValue="") String username) {
		Employee emp = empService.getEmployeeByUsername(username);
		User user = empService.getUserByEmployee(emp);
		httpSession.setAttribute("usernameLogin", username);
		httpSession.setAttribute("empLogin", emp);
		httpSession.setAttribute("userLogin", user);

		Authentication authentication = new UsernamePasswordAuthenticationToken(username, null,
				AuthorityUtils.createAuthorityList("ROLE_ADMIN"));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
	}
}
