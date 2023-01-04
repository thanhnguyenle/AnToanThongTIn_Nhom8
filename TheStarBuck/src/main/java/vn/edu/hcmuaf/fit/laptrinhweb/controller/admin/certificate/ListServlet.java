package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.certificate.bill;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BillAdminServlet", value = "/all-bill")
public class ListServlet extends HttpServlet {
    BillService billService = BillService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Bill> bills = billService.findAll();
        request.setAttribute("bills", bills);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/billManagement.jsp");
        rd.forward(request, response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}