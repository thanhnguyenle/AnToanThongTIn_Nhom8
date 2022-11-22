package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin;

import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "admin-home", value = "/admin-home")
public class HomeController extends HttpServlet {
    private AccountService accountService = AccountService.getInstance();
    private ProductService productService = ProductService.getInstance();
    private OrderService orderService = OrderService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalAcc = accountService.getAmountItem();
        int totalPro = productService.totalItem();
        int totalOrder = orderService.getAmountItem();
        double sumMoney = orderService.getSumMoney();
        System.out.println(totalAcc);
        request.setAttribute("totalAcc", totalAcc);
        request.setAttribute("totalPro", totalPro);
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("sumMoney", sumMoney);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
