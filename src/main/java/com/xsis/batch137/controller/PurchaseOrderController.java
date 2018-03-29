package com.xsis.batch137.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/transaksi/purchase-order")
public class PurchaseOrderController {

	@RequestMapping
	public String index() {
		return "purchaseOrder/purchaseOrder";
	}
}
