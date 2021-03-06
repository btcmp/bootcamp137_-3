package com.xsis.batch137.controller;

import java.io.StringReader;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.html.simpleparser.HTMLWorker;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.xsis.batch137.model.ItemInventory;

public class ItemPDFView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<ItemInventory> ivt = (List<ItemInventory>) model.get("ivt");
		   
		   PdfPTable table = new PdfPTable(5);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			HTMLWorker htmlWorker = new HTMLWorker(doc);
			  String str = "<html><head></head><body>"+
					"<br/>" +
			        "<h1 style='text-align: center;'>Item Data</h1>" +
			        "<br/>" +
			        "</body></html>";
			   htmlWorker.parse(new StringReader(str));
			
			table.addCell("Name");
			table.addCell("Category");
			table.addCell("Unit Price");
			table.addCell("In Stock");
			table.addCell("Stock Alert");

			for (ItemInventory ivts : ivt) {
				String price = String.format("Rp%,.0f", ivts.getItemVariant().getPrice()).replaceAll(",", ".");
				table.addCell(ivts.getItemVariant().getName());
				table.addCell(ivts.getItemVariant().getItem().getCategory().getName());
				table.addCell(price);
				table.addCell(String.valueOf(ivts.getEndingQty()));
				if(ivts.getEndingQty() < ivts.getAlertAtQty()) {
					table.addCell("LOW");
				}
				
				else {
					table.addCell("OK");
				}
				
			}
			doc.add(table);
			
			//System.out.println(mataUang);
	}
}