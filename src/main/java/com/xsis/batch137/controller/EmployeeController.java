package com.xsis.batch137.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.Role;
import com.xsis.batch137.service.EmployeeService;
import com.xsis.batch137.service.OutletService;
import com.xsis.batch137.service.RoleService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	EmployeeService empService;
	
	@Autowired
	RoleService rs;
	
	@Autowired
	OutletService os;
	
	@RequestMapping
	public String index(Model model) {
		List<Employee> emps = empService.selectAll();
		List<Role> roles = rs.selectAll();
		List<Outlet> outlets = os.selectActive();
		model.addAttribute("roles", roles);
		model.addAttribute("emps", emps);
		model.addAttribute("outlets", outlets);
		return "employee/employee";
	}
	
	@ModelAttribute("employee")
	public Employee getEmployeeForm() {
		return new Employee();
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Employee emp) {
	//public String save(@Valid @ModelAttribute("employee") Employee emp, BindingResult binding, Model model) {
		/*if(binding.hasErrors()) {
			List<Employee> emps = empService.selectAll();
			model.addAttribute("emps", emps);
			return "employee";
		}*/
		empService.save(emp);
		//return "redirrect:/employee";
	}
	
	@RequestMapping("/get-all")
	@ResponseBody
	public List<Employee> getAll(){
		return empService.selectAll();
	}
	
	@RequestMapping(value="/nonaktif/{id}", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public void nonaktifkan(@PathVariable long id) {
		empService.nonaktif(id);
	}
	
	@RequestMapping("/get-one/{id}")
	@ResponseBody
	public Employee getOne(@PathVariable long id) {
		System.out.println("exeecute");
		return empService.getOne(id);
	}
	
	@RequestMapping("/cek-email")
	@ResponseBody
	public int getEmployeeByEmail(@RequestParam(value="email", defaultValue="") String email) {
		return empService.countEmployeeByEmail(email);
	}
	
	@RequestMapping("/cek-user")
	@ResponseBody
	public int getUserByUsername(@RequestParam(value="user", defaultValue="") String username) {
		return empService.countUserByUsername(username);
	}
}
