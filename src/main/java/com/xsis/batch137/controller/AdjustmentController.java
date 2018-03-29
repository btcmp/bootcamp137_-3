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

import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.service.AdjustmentService;

@Controller
@RequestMapping("adjustment")
public class AdjustmentController {

	@Autowired
	AdjustmentService adjustmentService;
	
	@RequestMapping
	public String selectAll(Model model) {
		List<Adjustment> adjustments = adjustmentService.getAll();
		model.addAttribute("adjustments", adjustments);
		return "/adjustment/adjustment-view";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Adjustment adjustment) {
		adjustmentService.save(adjustment);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@RequestParam("id") long id) {
		adjustmentService.delete(id);
	}
	
	@RequestMapping(value="/take", method=RequestMethod.GET)
	@ResponseBody
	public Adjustment getOne(@PathVariable long id) {
		return adjustmentService.getOne(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Adjustment adjustment) {
		adjustmentService.update(adjustment);
	}
}
