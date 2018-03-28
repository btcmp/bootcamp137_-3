package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.TransferStock;
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
	
	@RequestMapping
	public String index(Model model) {
		List<TransferStock> transferStocks=transferStockService.selectAll();
		List<Outlet> outlets = outletService.selectAll();
		model.addAttribute("transferStocks", transferStocks);
		model.addAttribute("outlets", outlets);
		return "/transferStock/transferStock";
	}
	
}
