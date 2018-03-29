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
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.OutletService;
import com.xsis.batch137.service.TransferStockService;

@Controller
@RequestMapping("/transfer-stock")
public class TransferStockController {
	//a
	@Autowired
	TransferStockService transferStockService;
	
	@Autowired
	OutletService outletService;
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@RequestMapping
	public String index(Model model) {
		List<TransferStock> transferStocks=transferStockService.selectAll();
		List<Outlet> outlets = outletService.selectAll();
		model.addAttribute("transferStocks", transferStocks);
		model.addAttribute("outlets", outlets);
		return "/transferStock/transferStock";
	}
	
	@RequestMapping(value="/search-item",method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchItem(@RequestParam(value="search",defaultValue="") String search){
		List<ItemInventory> itemInventories = itemInventoryService.searchItemInventoryByItemName(search);
		return itemInventories;
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody TransferStock transferStock) {
		transferStockService.save(transferStock);
	}
	
}
