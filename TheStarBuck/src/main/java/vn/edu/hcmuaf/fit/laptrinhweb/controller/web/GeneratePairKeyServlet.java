package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.model.PublicKey;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagement_Servlet", value = "/user-management")
public class GeneratePairKeyServlet extends HttpServlet {

    OrderService orderService = OrderService.getInstance();
    PublicKeyService publicKeyService = PublicKeyService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Account account = (Account) httpSession.getAttribute("account");
        if(account!=null){
            List<Orders> listOrders = orderService.getItemByIdAc(account.getId());
            List<PublicKey> publicKeys = publicKeyService.getPKByAccountID(account.getId());
            request.setAttribute("orders",listOrders);
            request.setAttribute("publickey",publicKeys);
            request.getRequestDispatcher("/views/web/userManagement.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
