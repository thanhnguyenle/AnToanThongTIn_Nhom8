package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import java.io.IOException;


@WebServlet(name = "DetailProductServlet", value = "/detailProduct")
public class DetailProductServlet extends HttpServlet {
    private ProductService productService;
    private Product product;
    private String id;

    public DetailProductServlet() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = request.getParameter("id");
        product = productService.getItem(id);
        HttpSession session = request.getSession();
        session.setAttribute("product", product);
        request.getRequestDispatcher("/views/web/productDetails.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello");
    }
}
