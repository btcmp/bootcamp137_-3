package com.xsis.batch137.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.xsis.batch137.model.PurchaseRequest;

public class PurchaseRequestPDFView extends AbstractPdfView {
	
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<PurchaseRequest> prs = (List<PurchaseRequest>) model.get("pr");
		   
		   PdfPTable table = new PdfPTable(3);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			//table.addCell("Created On");
			table.addCell("PR No");
			table.addCell("Notes");
			table.addCell("Status");

			for (PurchaseRequest pr : prs) {
				//table.addCell(pr.getCreatedOn());
				table.addCell(pr.getPrNo()); 
				table.addCell(pr.getNotes()); 
				table.addCell(pr.getStatus()); 
			}
			doc.add(table);
	}
}
