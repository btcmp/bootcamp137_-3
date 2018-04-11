package com.xsis.batch137.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.xsis.batch137.model.Outlet;
import com.xsis.batch137.model.PurchaseRequest;

public class PurchaseRequestPDFView extends AbstractPdfView {
	
	@Autowired
	HttpSession httpSession;
	
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	
		doc.setPageSize(PageSize.A4.rotate());
		doc.newPage();
		
		List<PurchaseRequest> prs = (List<PurchaseRequest>) model.get("pr");
		Outlet outlet = null;
		for(PurchaseRequest pr : prs) {
			outlet = pr.getOutlet();
		}
		
		
	   	PdfPTable table = new PdfPTable(5);
		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

		Font font = new Font(Font.BOLD, 16);
		Chunk title = new Chunk("Purchase Request", font);
		Paragraph judul = new Paragraph(title);
		judul.setAlignment(Element.ALIGN_CENTER);
		doc.add(judul);
		doc.add(new Paragraph(new Chunk("  ")));
		
		Chunk outl = new Chunk("Outlet : "+outlet.getName());
		Paragraph parout = new Paragraph(outl);
		parout.setAlignment(Element.ALIGN_LEFT);
		doc.add(parout);
		doc.add(new Paragraph(new Chunk("  ")));
		
		table.addCell("No.");
		table.addCell("Created On");
		table.addCell("PR No");
		table.addCell("Notes");
		table.addCell("Status");
		
		int i = 1;
		for (PurchaseRequest pr : prs) {
			String created = pr.getCreatedOn().toString().split("\\.")[0];
			table.addCell(String.valueOf(i));
			table.addCell(created);
			table.addCell(pr.getPrNo()); 
			table.addCell(pr.getNotes()); 
			table.addCell(pr.getStatus()); 
			i++;
		}
		doc.add(table);
	}
}
