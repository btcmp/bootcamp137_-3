package com.xsis.batch137.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.xsis.batch137.model.ItemInventory;

public class ItemPDFView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<ItemInventory> ivt = (List<ItemInventory>) model.get("ivt");
		   
		   PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Name");
			table.addCell("Category");
			table.addCell("Unit Price");
			table.addCell("In Stock");

			for (ItemInventory ivts : ivt) {
				table.addCell(ivts.getItemVariant().getName());
				table.addCell(ivts.getItemVariant().getItem().getCategory().getName());
				table.addCell(String.valueOf(ivts.getItemVariant().getPrice()));
				table.addCell(String.valueOf(ivts.getEndingQty()));
			}
			doc.add(table);
	}
}