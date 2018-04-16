package com.xsis.batch137.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xsis.batch137.model.Adjustment;
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.service.DashboardService;
import com.xsis.batch137.service.PurchaseOrderService;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	@Autowired
	DashboardService ds;
	
	@Autowired
	PurchaseOrderService poService;
	
	@RequestMapping
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
	
	@RequestMapping("/po")
	public String listApprovedPO(Model model) {
		List<PurchaseOrder> pos = ds.getApprovedPO();
		model.addAttribute("pos", pos);
		return "purchaseOrder/approved";
	}
	
	@RequestMapping("/detail/po/{id}")
	public String detail(@PathVariable long id, Model model) {
		PurchaseOrder po = poService.getOne(id);
		model.addAttribute("po", po);
		return "purchaseOrder/purchaseOrderDetail";
	}
	
	@RequestMapping("/adj")
	public String listSubmittedAdj(Model model) {
		List<Adjustment> adjs = ds.getSubmittedAdjustment();
		model.addAttribute("adjs", adjs);
		return "/Adjustment/submitted";
	}
	
	@RequestMapping("/ts")
	public String listSubmittedTS(Model model) {
		List<TransferStock> ts = ds.getSubmittedTs();
		model.addAttribute("ts", ts);
		return "/transferStock/submitted";
	}
}
