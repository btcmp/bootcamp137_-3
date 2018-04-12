package com.xsis.batch137.controller;

import java.io.StringReader;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.AddressHelper;
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

public class TransferStockPDFView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<TransferStock> tss = (List<TransferStock>) model.get("tss");
		   
		   PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		
			HTMLWorker htmlWorker = new HTMLWorker(doc);
			  String str = "<html><head></head><body>"+
					"<br/>" +
			        "<h1 style='text-align: center;'>Transfer Stock Detail</h1>" +
			        "<br/>" +
			        "</body></html>";
			   htmlWorker.parse(new StringReader(str));
			
			table.addCell("Transfer Date");
			table.addCell("From Outlet");
			table.addCell("To Outlet");
			table.addCell("Notes");

			
			for (TransferStock tsss : tss) {
				table.addCell(String.valueOf(tsss.getCreatedOn()));
				table.addCell(tsss.getFromOutlet().getName());
				table.addCell(tsss.getToOutlet().getName());
				table.addCell(tsss.getNotes());
				
				List<TransferStockDetail> tsd = tsss.getTransferStockDetail();
				//TransferStockDetail tsdFix = tsd.get(0);
			
			}

			doc.add(table);
	}
}