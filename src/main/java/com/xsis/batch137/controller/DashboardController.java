package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.service.DashboardService;

@Controller
@RequestMapping
public class DashboardController {

	@Autowired
	DashboardService ds;
	
	@RequestMapping("/dashboard")
	public String index(Model model) {
		int jmlPO = ds.countApprovedPO();
		model.addAttribute("jmlPO", jmlPO);
		int jmlSo = ds.countSalesOrder();
		model.addAttribute("jmlSo", jmlSo);
		int jmlTs = ds.countSubmittedTs();
		model.addAttribute("jmlTs", jmlTs);
		int jmlAdj = ds.countSubmittedAdjustment();
		model.addAttribute("jmlAdj", jmlAdj);
		return "dashboard";
	}
	
	@RequestMapping("/dashboard/po")
	public String listApprovedPO(Model model) {
		List<PurchaseOrder> pos = ds.getApprovedPO();
		model.addAttribute("pos", pos);
		return "purchaseOrder/approved";
	}
}
