package com.xsis.batch137.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.service.ItemInventoryService;
import com.xsis.batch137.service.PurchaseOrderService;
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
	PurchaseOrderService poService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping(value = "/generate/pr", method = RequestMethod.GET)
	ModelAndView generatePdf(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		//user data
		response.setHeader("Content-Disposition", "attachment; filename=\"pr.pdf\"");
		response.setContentType("application/pdf");
		List<PurchaseRequest> pr = prService.selectByOutlet();
		return new ModelAndView("pdfViewPr","pr", pr);
 	}
	
	@RequestMapping(value = "/generate/ts", method = RequestMethod.GET)
	ModelAndView generatePdfs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		response.setHeader("Content-Disposition", "attachment; filename=\"transfer_stock.pdf\"");
		response.setContentType("application/pdf");
		Outlet outlet = (Outlet) httpSession.getAttribute("outletLogin");
		long outId = outlet.getId();
		java.util.List<TransferStock> tss = tsService.getTransferStockByOutletIdLogin(outId);

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
		List<ItemInventory> ivt = ivtService.getItemInventoryByOutletLogin(outId);

	return new ModelAndView("pdfViewIvt","ivt",ivt);
 	}
	
	@RequestMapping(value = "/generate/po", method = RequestMethod.GET)
	ModelAndView generatePdfPo(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"po.pdf\"");
		response.setContentType("application/pdf");
		List<PurchaseOrder> pos = poService.getByOutlet();
		return new ModelAndView("pdfViewPo","pos", pos);
 	}
}