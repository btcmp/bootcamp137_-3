package com.xsis.batch137.controller;

import java.io.StringReader;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.AddressHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.itextpdf.text.FontFactory;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Phrase;
import com.lowagie.text.html.simpleparser.HTMLWorker;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.xsis.batch137.model.TransferStock;
import com.xsis.batch137.model.TransferStockDetail;
import com.xsis.batch137.service.TransferStockDetailService;
import com.xsis.batch137.service.TransferStockService;

public class TransferStockPrintView extends AbstractPdfView {

	@Autowired
	TransferStockDetailService tsdService;
	
	@Autowired
	TransferStockService tsService;
	
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<TransferStockDetail> tsd = (List<TransferStockDetail>) model.get("tsd");
		
		
		Date date = null;
		String from = null;
		String to = null;
		String status = null;
		String notes = null;
		
		for (TransferStockDetail tsdetGetTs : tsd) {
			date = tsdetGetTs.getTransferStock().getModifiedOn();
			from = tsdetGetTs.getTransferStock().getFromOutlet().getName();
			to = tsdetGetTs.getTransferStock().getToOutlet().getName();
			status = tsdetGetTs.getTransferStock().getStatus();
			notes = tsdetGetTs.getTransferStock().getNotes();
		}
		
		//System.out.println(ts.getId());
		//TransferStock ts = tsService.getTransferStockById(id);
		
		PdfPTable table = new PdfPTable(3);
		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		
		HTMLWorker htmlWorker = new HTMLWorker(doc);
		String str = "<html><head></head><body>"+
				"<br/>" +
		        "<h1 style='text-align: center;'>Transfer Stock Detail</h1>" +
		        "<br/>" +
		        "<p>Date : "+date+ "</p>" +
		        "<p>From : "+from+ "</p>" +
		        "<p>To : "+to+ "</p>" +
		        "<p>Status : "+status+ "</p>" +
		        "<p>Notes : "+notes+ "</p>" +
		        "<br/>" +
		        "</body></html>";
		
			htmlWorker.parse(new StringReader(str));
			
			 table.addCell("Item");
			 table.addCell("Transfer Qty. ");
			 table.addCell("In Stock");

			
			for (TransferStockDetail tsdet : tsd) {
				table.addCell(tsdet.getItemVariant().getItem().getName()+"-"+tsdet.getItemVariant().getName());
				table.addCell(String.valueOf(tsdet.getTransferQty()));
				table.addCell(String.valueOf(tsdet.getInStock()));
			}

			doc.add(table);
	}
}