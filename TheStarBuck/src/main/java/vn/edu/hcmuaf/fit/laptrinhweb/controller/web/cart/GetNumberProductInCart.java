package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.cart;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetNumberProductInCart", value = "/num-cart")
public class GetNumberProductInCart extends HttpServlet {
    private ProductService productService;

    public GetNumberProductInCart() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart!=null){
                int num = cart.getProductList().size();
                String json = new Gson().toJson(num);
                PrintWriter out = response.getWriter();
                try {
                    out.println(json);
                } finally {
                    out.close();
                }
            }else{
                PrintWriter out = response.getWriter();
                try {
                    out.println("0");
                } finally {
                    out.close();
                }
            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}