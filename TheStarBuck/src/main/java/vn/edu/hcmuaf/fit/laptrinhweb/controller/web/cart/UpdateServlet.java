package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.cart;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import java.io.IOException;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
        if (cart.getProduct(id) == null) {
            response.setStatus(404);
            return;
        }
        int quantity = cart.getProduct(id).getQuantitySold();
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {
            Map<String, Integer> hashMap = Stream.of(new Object[][]{{"quantity",quantity}}).collect(Collectors.toMap(data -> (String)data[0], data -> (Integer)data[1]));
            response.getWriter().println(
                    new Gson().toJson(hashMap)
            );
            return;
        }

        int quantityAfterUpdate = cart.updateQuantitySold(id, quantity);
        session.setAttribute("cart", cart);
        Map<String, Integer> hashMap = Stream.of(new Object[][]{{"quantity",quantityAfterUpdate}}).collect(Collectors.toMap(data -> (String)data[0], data -> (Integer)data[1]));
        response.getWriter().println(
                new Gson().toJson(hashMap)
        );
    }

}