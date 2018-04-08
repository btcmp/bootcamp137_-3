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
import com.xsis.batch137.model.TransferStock;

public class TransferStockPDFView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<TransferStock> tss = (List<TransferStock>) model.get("tss");
		   
		   PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Created Date");
			table.addCell("From Outlet");
			table.addCell("To Outlet");
			table.addCell("Notes");

			for (TransferStock tsss : tss) {
				table.addCell(String.valueOf(tsss.getCreatedOn()));
				table.addCell(tsss.getFromOutlet().getName());
				table.addCell(tsss.getToOutlet().getName());
				table.addCell(tsss.getNotes());
			}
			doc.add(table);
	}
}