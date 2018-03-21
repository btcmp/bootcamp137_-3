package com.xsis.batch137.controller;

import java.io.InputStream;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Supplier;
import com.xsis.batch137.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

	@Autowired
	SupplierService supplierService;
	
	@RequestMapping
	public String view(Model model) {
		List<Supplier> sups = supplierService.selectAll();
		model.addAttribute("suppliers", sups);
		return "supplier-view";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save (@RequestBody Supplier supplier) {
		supplierService.save(supplier);
	}
	
	@RequestMapping(value="/take/{id}", method=RequestMethod.GET)
	public void getOne(@PathVariable long id, Model model) {
		Supplier supplier = supplierService.getOne(id);
		model.addAttribute("supplier", supplier);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Supplier supplier) {
		supplierService.update(supplier);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		supplierService.delete(id);
	}
}
