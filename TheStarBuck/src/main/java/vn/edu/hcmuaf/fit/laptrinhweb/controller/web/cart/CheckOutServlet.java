package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

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
        if (session.getAttribute("account") == null) {
            response.sendRedirect(request.getContextPath() + "/doLogin");
            return;
        } else if (cart==null||cart.getProductList().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        } else
            response.sendRedirect(request.getContextPath() + "/payment");

    }

}