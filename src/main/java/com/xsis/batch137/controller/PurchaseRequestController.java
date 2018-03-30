package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.OutletService;
import com.xsis.batch137.service.PurchaseRequestService;

@Controller
@RequestMapping("/transaksi/purchase-request")
public class PurchaseRequestController {

	@Autowired
	PurchaseRequestService prService;
	
	@Autowired
	OutletService oService;
	
	@Autowired
	ItemInventoryService iService;
	
	@RequestMapping
	public String index(Model model) {
		List<PurchaseRequest> prs = prService.selectAll();
		List<Outlet> outlets = oService.selectActive();
		List<ItemInventory> items = iService.selectAll();
		model.addAttribute("prs", prs);
		model.addAttribute("items", items);
		model.addAttribute("outlets", outlets);
		return "purchaseRequest/purchaseRequest";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody PurchaseRequest pr) {
		prService.save(pr);
	}
	
	@RequestMapping("/get-all")
	@ResponseBody
	public List<PurchaseRequest> getAll(){
		return prService.selectAll();
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public List<ItemInventory> search(@RequestParam(value="search-item", defaultValue="") String search){
		return iService.searchInventoryByItemName(search);
	}
}
