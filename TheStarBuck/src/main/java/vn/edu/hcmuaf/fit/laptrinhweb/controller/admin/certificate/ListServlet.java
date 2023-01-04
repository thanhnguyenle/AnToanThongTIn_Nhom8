package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.certificate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.model.MyCertificate;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CertificateAdminServlet", value = "/all-certificate")
public class ListServlet extends HttpServlet {
  PublicKeyService publicKeyService = PublicKeyService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MyCertificate> bills = publicKeyService.findAll();
        request.setAttribute("cers", bills);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/certificateManagement.jsp");
        rd.forward(request, response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}