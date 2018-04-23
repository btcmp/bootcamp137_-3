package com.xsis.batch137.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;
import com.xsis.batch137.model.Supplier;
import com.xsis.batch137.service.SupplierService;

@Controller
@RequestMapping("master/supplier")
public class SupplierController {

	@Autowired
	SupplierService supplierService;
	
	@RequestMapping
	public String view(Model model) {
		List<Province> provinces = supplierService.getAllProvince();
		List<Supplier> sups = supplierService.selectAll();
		model.addAttribute("provinces", provinces);
		model.addAttribute("suppliers", sups);
		return "/supplier/supplier-view";
	}
	
	@RequestMapping(value="/get-region/{id}", method=RequestMethod.GET)
	@ResponseBody
	public List<Region> getRegionByProvince(@PathVariable long id){
		List<Region> regions = supplierService.getRegionByProvince(id);
		return regions;
	}
	
	@RequestMapping(value="/get-district/{id}", method=RequestMethod.GET)
	@ResponseBody
	public List<District> getDistrictByRegion(@PathVariable long id){
		List<District> districts = supplierService.getDistrictByRegion(id);
		return districts;
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save (@RequestBody Supplier supplier) {
		supplierService.save(supplier);
	}
	
	@RequestMapping(value="/take/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Supplier getOne(@PathVariable long id) {
		Supplier supplier = supplierService.getOne(id);
		return supplier;
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
	
	@RequestMapping(value="/search")
	@ResponseBody
	public List<Supplier> search(@RequestParam(value="search", defaultValue="") String search){
		List<Supplier> suppliers = supplierService.searchSupplier(search);
		return suppliers;
	}
	
	@RequestMapping(value="/count")
	@ResponseBody
	public int countName(@RequestParam(value="name") String name) {
		return supplierService.countName(name);
	}
	
	@RequestMapping(value="/counts")
	@ResponseBody
	public int countEmail(@RequestParam(value="email") String email) {
		return supplierService.countEmail(email);
	}
}
