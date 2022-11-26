package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.order;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;

import java.io.IOException;

@WebServlet(name = "UpdateOrderServlet", value = "/updateOrder")
public class UpdateServlet extends HttpServlet {
    private OrderService orderService = OrderService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Orders order = orderService.getItem(id);

        HttpSession session = request.getSession();
        session.setAttribute("order", order);
        request.getRequestDispatcher("/views/admin/orderEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idOrder");


        Orders orders = orderService.getItem(id);


        orderService.save(orders);

        response.sendRedirect(request.getContextPath() + "/order");
    }
}
