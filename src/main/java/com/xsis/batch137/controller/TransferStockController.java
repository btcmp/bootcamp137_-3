package com.xsis.batch137.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.xsis.batch137.model.TransferStockHistory;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.OutletService;
import com.xsis.batch137.service.TransferStockDetailService;
import com.xsis.batch137.service.TransferStockHistoryService;
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
	
	@Autowired
	TransferStockHistoryService transferStockHistoryService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	public String index(Model model) {
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		long outletId = outlet.getId();
		System.out.println(outletId);
		List<TransferStock> transferStocks=transferStockService.getTransferStockByOutletIdLogin(outletId);
		List<Outlet> outlets = outletService.selectAll();
		List<TransferStockDetail> transferStockDetails=transferStockDetailService.selectAll();
		model.addAttribute("transferStockDetails",transferStockDetails);
		model.addAttribute("transferStocks", transferStocks);
		model.addAttribute("outlets", outlets);
		model.addAttribute("outlet",outlet);
		return "/transferStock/transferStock";
	}
	
	@RequestMapping(value="/search-item",method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchItem(@RequestParam(value="search",defaultValue="") String search, @RequestParam(value="outlet-id",defaultValue="") Long id){
		List<ItemInventory> itemInventories = itemInventoryService.searchItemInventoryByItemName(search);
		List<ItemInventory> inventz = new ArrayList<>();
		if(itemInventories != null) {
			for(ItemInventory invent : itemInventories) {
				System.out.println("outlet id="+id+" inventoutlet"+invent.getOutlet().getId());
				if(invent.getOutlet().getId() == id) {
					inventz.add(invent);
				}
			}
		}
		return inventz;
	}
	
	@RequestMapping(value = "/search-outlet", method = RequestMethod.GET)
	public String indexSearch(Model model, @RequestParam(value="search", defaultValue="") Long search) {
		List<TransferStock> transferStocks = transferStockService.getTransferStockByOutletId(search);
		List<Outlet> outlets = outletService.selectAll();
		List<ItemInventory> itemsInventorys= itemInventoryService.selectAll();
		model.addAttribute("transferStocks", transferStocks);
		model.addAttribute("outlets", outlets);
		model.addAttribute("itemInventorys", itemsInventorys);
		return "/transferStock/transferStock";
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
	
	@RequestMapping(value="/update-inventory-data",method=RequestMethod.GET)
	@ResponseBody
	public List<TransferStockDetail> updateInventoryData(@RequestParam(value="search",defaultValue="") Long search){
		List<TransferStockDetail> transferStockDetails = transferStockDetailService.updateInventoryData(search);
		return transferStockDetails;
	}
	
	
	@RequestMapping(value="/search-transfer-stock-history",method=RequestMethod.GET)
	@ResponseBody
	public List<TransferStockHistory> searchTransferStockHistoryByTransferStockId(@RequestParam(value="search",defaultValue="") Long search){
		List<TransferStockHistory> transferStockHistory = transferStockHistoryService.getTransferStockHistoryByTransferStockId(search);
		return transferStockHistory;
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
