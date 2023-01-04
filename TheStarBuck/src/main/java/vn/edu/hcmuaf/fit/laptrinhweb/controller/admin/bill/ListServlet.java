package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.bill;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Bill;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BillAdmin_Servlet", value = "/all-bill")
public class ListServlet extends HttpServlet {
    BillService billService = BillService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Bill> bills = billService.findAll();
            request.setAttribute("bills", bills);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/billManagement.jsp");
            rd.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}