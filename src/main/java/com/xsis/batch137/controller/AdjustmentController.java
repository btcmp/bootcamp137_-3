package com.xsis.batch137.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.xsis.batch137.model.AdjustmentHistory;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.service.AdjustmentService;

@Controller
@RequestMapping("transaksi/adjustment")
public class AdjustmentController {

	@Autowired
	AdjustmentService adjustmentService;
	
	@RequestMapping
	public String selectAll(Model model) {
		List<Adjustment> adjustments = adjustmentService.getAll();
		List<Outlet> outlets = adjustmentService.getOutletForAdjustment();
		List<ItemInventory> inventories = adjustmentService.getInventory();
		model.addAttribute("adjustments", adjustments);
		model.addAttribute("outlets", outlets);
		model.addAttribute("inventories", inventories);
		return "/Adjustment/adjustment-view";
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
	
	@RequestMapping(value="/take/{id}", method=RequestMethod.GET)
	public String getOne(@PathVariable long id, Model model) {
		Adjustment adjustment = adjustmentService.getOne(id);
		model.addAttribute("adjustment", adjustment);
		return "/Adjustment/adjustment-detail";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseBody
	public List<AdjustmentHistory> update(@RequestBody Adjustment adjustment) {
		return adjustmentService.update(adjustment);
	}
	
	@RequestMapping(value="/get-all-outlet", method=RequestMethod.GET)
	@ResponseBody
	public List<Outlet> getOutletForAdjustment() {
		List<Outlet> outlets = adjustmentService.getOutletForAdjustment();
		return outlets;
	}
	
	@RequestMapping(value="/search-item")
	@ResponseBody
	public List<ItemInventory> searchItem(@RequestParam(value="search") String search){
		List<ItemInventory> inventories = adjustmentService.searchItem(search);
		return inventories;
	}
	
	@RequestMapping(value="search")
	@ResponseBody
	public List<Adjustment> searchAdjustmentByDate(@RequestParam(value="awal") @DateTimeFormat(pattern="yyyy-MM-dd") Date awal, @RequestParam(value="akhir") @DateTimeFormat(pattern="yyyy-MM-dd") Date akhir){
		List<Adjustment> adjustments = adjustmentService.searchAdjustmentByDate(awal, akhir);
		return adjustments;
	}
	
	
}
