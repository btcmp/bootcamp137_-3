package com.xsis.batch137.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xsis.batch137.model.ItemInventory;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.PurchaseRequestService;
import com.xsis.batch137.service.TransferStockService;

@Controller
public class ExportPdfController {
	
	@Autowired
	PurchaseRequestService prService;
	
	@Autowired
	TransferStockService tsService;
	
	@Autowired
	ItemInventoryService ivtService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping(value = "/generate/pr", method = RequestMethod.GET)
	ModelAndView generatePdf(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		response.setHeader("Content-Disposition", "attachment; filename=\"pr.pdf\"");
		response.setContentType("application/pdf");
		java.util.List<PurchaseRequest> pr = prService.selectAll();

	return new ModelAndView("pdfView","pr", pr);
 	}
	
	@RequestMapping(value = "/generate/ts", method = RequestMethod.GET)
	ModelAndView generatePdfs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		response.setHeader("Content-Disposition", "attachment; filename=\"transfer_stock.pdf\"");
		response.setContentType("application/pdf");
		java.util.List<TransferStock> tss = tsService.selectAll();

	return new ModelAndView("pdfViewTS","tss",tss);
 	}
	
	@RequestMapping(value = "/generate/item", method = RequestMethod.GET)
	ModelAndView generatePdfItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		response.setHeader("Content-Disposition", "attachment; filename=\"item.pdf\"");
		response.setContentType("application/pdf");
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		long outId = outlet.getId();
		java.util.List<ItemInventory> ivt = ivtService.getItemInventoryByOutletLogin(outId);

	return new ModelAndView("pdfViewIvt","ivt",ivt);
 	}
	
	
}