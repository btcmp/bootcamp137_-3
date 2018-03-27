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
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;
import com.xsis.batch137.service.DistrictService;
import com.xsis.batch137.service.OutletService;
import com.xsis.batch137.service.ProvinceService;
import com.xsis.batch137.service.RegionService;

@Controller
@RequestMapping("/outlet")
public class OutletController {

	@Autowired
	OutletService outletService;
	
	@Autowired
	ProvinceService provinceService;
	
	@Autowired
	RegionService regionService;
	
	@Autowired
	DistrictService districtService;
	
	@RequestMapping
	public String view(Model model) {
		List<Province> provinces = provinceService.selectAll();
		List<Outlet> outlets = outletService.selectAll();
		model.addAttribute("provinces", provinces);
		model.addAttribute("outlets", outlets);
		return "/outlet/outlet-view";
	}
	
	@RequestMapping(value="/get-region/{id}", method=RequestMethod.GET)
	@ResponseBody
	public List<Region> getRegionByProvince(@PathVariable long id) {
		List<Region> regions = regionService.getRegionByProvince(id);
		return regions;
	}
	
	@RequestMapping(value="/get-district/{id}", method=RequestMethod.GET)
	@ResponseBody
	public List<District> getDistrictByRegion(@PathVariable long id){
		List<District> districts = districtService.getDistrictByRegion(id);
		return districts;
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Outlet outlet) {
		outletService.save(outlet);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@RequestParam("id") long id) {
		outletService.delete(id);
	}
	
	@RequestMapping(value="/take", method=RequestMethod.GET)
	public void getOne(@RequestParam("id") long id, Model model) {
		Outlet outlet = outletService.getOne(id);
		model.addAttribute("outlet", outlet);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Outlet outlet) {
		outletService.update(outlet);
	}
}
