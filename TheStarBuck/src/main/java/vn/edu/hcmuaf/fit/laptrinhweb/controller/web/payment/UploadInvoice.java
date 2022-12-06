package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

@WebServlet(name = "UploadInvoice_Servlet", value = "/upload-invoice")
public class UploadInvoice extends HttpServlet {
    public UploadInvoice() {}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();
    }

}
