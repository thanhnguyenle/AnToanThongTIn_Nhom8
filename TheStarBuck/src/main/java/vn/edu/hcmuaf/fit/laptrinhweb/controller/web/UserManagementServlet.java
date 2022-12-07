package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PostService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagement_Servlet", value = "/user-management")
public class UserManagementServlet extends HttpServlet {

    OrderService orderService = OrderService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.getRequestDispatcher("/views/web/userManagement.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Orders> listOrders = orderService.findAll();
        for(Orders or:listOrders){
            System.out.println(or.toString());
        }
        request.setAttribute("orders",listOrders);
        request.getRequestDispatcher("/views/web/userManagement.jsp").forward(request,response);
    }
}
