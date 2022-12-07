package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.payment;

import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.VerticalAlignment;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.OrderItem;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.properties.AssetProperties;

import java.io.*;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;

public class GenderPdf {
    private static GenderPdf genderPdf;
    public static GenderPdf instance(){
        if(genderPdf==null) genderPdf = new GenderPdf();
        return genderPdf;
    }
    private File getResourceFile(HttpServletRequest request)
    {
        ServletContext context = request.getServletContext();
        String fullPath = context.getRealPath("/template/invoice.pdf");
        System.out.println(fullPath);
        return new File(fullPath);
    }
        public boolean generatePDF(Account account,Orders orders,HttpServletRequest request) {
        File file = getResourceFile(request);
        DeviceRgb deviceRgb = new DeviceRgb(63,169,219);
        try {
            PdfWriter pdfWriter = new PdfWriter(file);
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            Document document = new Document(pdfDocument);
            pdfDocument.setDefaultPageSize(PageSize.A4);

            float col  = 280f;
            float columnWidth[] = {col,col};
            Table table = new Table(columnWidth);

            table.setBackgroundColor(deviceRgb).setFontColor(ColorConstants.WHITE);

            table.addCell(new Cell().add(new Paragraph("INVOICE")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE).setMarginTop(30f).setMarginBottom(30f).setFontSize(30f).setBorder(Border.NO_BORDER));
            table.addCell(new Cell().add(new Paragraph("THE STARBUCK\nNong Lam University\n0123456789")).setTextAlignment(TextAlignment.LEFT).setVerticalAlignment(VerticalAlignment.MIDDLE).setMarginTop(30f).setMarginBottom(30f).setFontSize(10f).setBorder(Border.NO_BORDER));;

            float colWidth [] = {80,300,100,80};
            Table customerInfoTable = new Table(colWidth);
            customerInfoTable.addCell(new Cell(0,4).add(new Paragraph("Customer Information").setBold()).setBorder(Border.NO_BORDER));

            customerInfoTable.addCell(new Cell().add(new Paragraph("Name:")).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph(account.getFullname())).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph("Invoice No:")).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph(orders.getId())).setBorder(Border.NO_BORDER));

            customerInfoTable.addCell(new Cell().add(new Paragraph("Mobile:")).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph(account.getPhoneNumber())).setBorder(Border.NO_BORDER));
            customerInfoTable.addCell(new Cell().add(new Paragraph("Date:")).setBorder(Border.NO_BORDER));
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            customerInfoTable.addCell(new Cell().add(new Paragraph(dtf.format(now))).setBorder(Border.NO_BORDER));

            float itemInfoColWidth[] = {140,140,140,140};
            Table itemInfoTable = new Table(itemInfoColWidth);

            //header
            itemInfoTable.addCell(new Cell().add(new Paragraph("Product").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("Topping").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("Amount").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
            itemInfoTable.addCell(new Cell().add(new Paragraph("Unit Price ($)").setBold()).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));

            //items
            double totalPrice = 0;
            for(Map.Entry<String, Product> entry :orders.getProductList().entrySet()){
                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getValue().getName())).setTextAlignment(TextAlignment.LEFT).setVerticalAlignment(VerticalAlignment.MIDDLE));
                itemInfoTable.addCell(new Cell().add(new Paragraph("No")).setTextAlignment(TextAlignment.LEFT).setVerticalAlignment(VerticalAlignment.MIDDLE));
                itemInfoTable.addCell(new Cell().add(new Paragraph(entry.getValue().getQuantitySold()+"")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
                double price = Math.round((entry.getValue().getPrice() - entry.getValue().getDiscount())*100)/100.0* entry.getValue().getQuantitySold();
                itemInfoTable.addCell(new Cell().add(new Paragraph(price+"")).setTextAlignment(TextAlignment.CENTER).setVerticalAlignment(VerticalAlignment.MIDDLE));
                totalPrice+=price;
            }

            itemInfoTable.addCell(new Cell().add(new Paragraph("")).setBackgroundColor(deviceRgb).setBorder(Border.NO_BORDER));
            itemInfoTable.addCell(new Cell().add(new Paragraph("")).setBackgroundColor(deviceRgb).setBorder(Border.NO_BORDER));
            itemInfoTable.addCell(new Cell().add(new Paragraph("Total Amount")).setBold().setTextAlignment(TextAlignment.RIGHT).setBackgroundColor(deviceRgb).setBorder(Border.NO_BORDER));
            itemInfoTable.addCell(new Cell().add(new Paragraph(totalPrice+"")).setTextAlignment(TextAlignment.CENTER).setBackgroundColor(deviceRgb).setBorder(Border.NO_BORDER));
            document.add(table);
            document.add(new Paragraph("\n"));
            document.add(customerInfoTable);
            document.add(new Paragraph("\n"));
            document.add(itemInfoTable);
            document.close();
            System.out.println("PDF CREATED");
            return true;
        } catch (FileNotFoundException e) {
            return false;
        }

    }
    public static void main(String[] args) throws IOException {

    }
}
