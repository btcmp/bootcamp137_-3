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

import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.model.TransferStockDetail;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.OutletService;
import com.xsis.batch137.service.TransferStockDetailService;
import com.xsis.batch137.service.TransferStockService;

@Controller
@RequestMapping("/transaction/transfer-stock")
public class TransferStockController {
	//aa
	@Autowired
	TransferStockService transferStockService;
	
	@Autowired
	OutletService outletService;
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@Autowired
	TransferStockDetailService transferStockDetailService;
	
	@RequestMapping
	public String index(Model model) {
		List<TransferStock> transferStocks=transferStockService.selectAll();
		List<Outlet> outlets = outletService.selectAll();
		List<TransferStockDetail> transferStockDetails=transferStockDetailService.selectAll();
		model.addAttribute("transferStockDetails",transferStockDetails);
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
	
	@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public TransferStock getOneTransferStock(@PathVariable Long id) {
		TransferStock transferStock = transferStockService.getOne(id);
		return transferStock;
	}
	
	@RequestMapping(value="/search-transfer-stock-detail",method=RequestMethod.GET)
	@ResponseBody
	public List<TransferStockDetail> searchTransferStockDetailByTransferStockId(@RequestParam(value="search",defaultValue="") Long search){
		List<TransferStockDetail> transferStockDetails = transferStockDetailService.getTransferStockDetailByTransferStockId(search);
		return transferStockDetails;
	}
	
	@RequestMapping(value="/search-item-inventory",method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchInventory(@RequestParam(value="search",defaultValue="") Long search){
		List<ItemInventory> itemInventories = itemInventoryService.searchInventoryByVariant(search);
		return itemInventories;
	}
	
	
	@RequestMapping(value="/update-status/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void updateStatus(@RequestBody String newStatus, @PathVariable Long id) {
		TransferStock transferStock = transferStockService.getOne(id);
		transferStock.setStatus(newStatus);
		transferStockService.saveAtauUpdate(transferStock);
	}
	
	
	
}
