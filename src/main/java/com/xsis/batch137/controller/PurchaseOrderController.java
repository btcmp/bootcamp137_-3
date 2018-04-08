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

import com.xsis.batch137.model.PurchaseOrder;
import com.xsis.batch137.model.PurchaseRequest;
import com.xsis.batch137.model.Supplier;
import com.xsis.batch137.service.PurchaseOrderService;
import com.xsis.batch137.service.SupplierService;

@Controller
@RequestMapping("/transaksi/purchase-order")
public class PurchaseOrderController {

	@Autowired
	PurchaseOrderService poService;
	
	@Autowired
	SupplierService supService;
	
	@RequestMapping
	public String index(Model model) {
		List<PurchaseOrder> pos = poService.getByOutlet();
		List<Supplier> sups = supService.selectAll();
		model.addAttribute("pos", pos);
		model.addAttribute("sups", sups);
		return "purchaseOrder/purchaseOrder";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody PurchaseOrder po) {
		poService.update(po);
	}
	
	@RequestMapping("/get-one/{id}")
	@ResponseBody
	public PurchaseOrder getOne(@PathVariable long id) {
		return poService.getOne(id);
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable long id, Model model) {
		PurchaseOrder po = poService.getOne(id);
		model.addAttribute("po", po);
		return "purchaseOrder/purchaseOrderDetail";
	}
	
	@RequestMapping("/get-inventory")
	@ResponseBody
	public List<Object> getInventory(@RequestParam(value="idPo", defaultValue="") long idPo, @RequestParam(value="idPod", defaultValue="") long idPod){
		return poService.getInventoryByVariantDanOutlet(idPod, idPo);
	}
	
	@RequestMapping(value="/approve/{id}", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public void approve(@PathVariable long id) {
		poService.approve(id);
	}
	
	@RequestMapping(value="/reject/{id}", method= RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public void reject(@PathVariable long id) {
		poService.reject(id);
	}
	
	@RequestMapping(value="/process/{id}", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public void process(@PathVariable long id) {
		poService.process(id);
	}
	
	@RequestMapping("/search-status")
	@ResponseBody
	public List<PurchaseOrder> getByStatus(@RequestParam(value="search", defaultValue="") String status){
		return poService.getPOByStatus(status);
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public List<PurchaseOrder> search(@RequestParam(value="search", defaultValue="") String search){
		return poService.searchGlobal(search);
	}
	
	@RequestMapping("/search-date")
	@ResponseBody
	public List<PurchaseOrder> getByDate(@RequestParam(value="awal", defaultValue="") @DateTimeFormat(pattern="yyyy-MM-dd") Date awal, @RequestParam(value="akhir", defaultValue="") @DateTimeFormat(pattern="yyyy-MM-dd") Date akhir){
		return poService.getPOByDate(awal, akhir);
	}
	
	@RequestMapping("/search-one-date")
	@ResponseBody
	public List<PurchaseOrder> getByOneDate(@RequestParam(value="date", defaultValue="") @DateTimeFormat(pattern="yyyy-MM-dd") Date date){
		return poService.getPOByOneDate(date);
	}
}
