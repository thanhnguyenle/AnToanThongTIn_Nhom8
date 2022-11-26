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

@WebServlet(name = "RemoveCartServlet", value = "/cart-remove")
public class RemoveServlet extends HttpServlet {
    private ProductService productService;

    public RemoveServlet() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        // load cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart.getProduct(id) == null) {
            response.setStatus(404);
            return;
        }
        cart.removeProduct(id);
        session.setAttribute("cart", cart);

    }

}
