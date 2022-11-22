package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.cart;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckOutCartServlet", value = "/cart-checkout")
public class CheckOutServlet extends HttpServlet {
    private ProductService productService;

    public CheckOutServlet() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(session.getAttribute("account") == null){
            response.sendRedirect(request.getContextPath() + "/doLogin");
            return;
        } else
        if(cart.getProductList().isEmpty()){
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        } else
        response.sendRedirect(request.getContextPath() + "/payment");

    }

}