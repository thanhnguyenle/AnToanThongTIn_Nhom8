package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.customeItem;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddCartServlet", value = "/custom-drink")
public class AddServlet extends HttpServlet {
    private ProductService productService;
    private Product product;
    private String id;

    public AddServlet() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get product id from request
        id = request.getParameter("id");
        product = productService.getItem(id);
        if(product != null){
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null){
                cart = Cart.getInstance();
            }
            cart.putProduct(product);
            session.setAttribute("cart", cart);
        }

        response.sendRedirect(request.getContextPath() +"/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
