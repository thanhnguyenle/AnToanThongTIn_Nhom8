package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.cart;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "UpdateCartServlet", value = "/cart-updateQuantity")
public class UpdateServlet extends HttpServlet {
    private ProductService productService;

    public UpdateServlet() {
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
        if(cart.getProduct(id) == null){
            response.setStatus(404);
            return;
        }
        int quantity = cart.getProduct(id).getQuantitySold();
        try {
            quantity =  Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e){
            response.getWriter().println(
                    new Gson().toJson(Map.of("quantity",quantity))
            );
            return;
        }

        int quantityAfterUpdate = cart.updateQuantitySold(id, quantity);
        session.setAttribute("cart", cart);
        response.getWriter().println(
                new Gson().toJson(Map.of("quantity",quantityAfterUpdate))
        );
    }

}