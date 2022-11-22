package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet(name = "SerchByAjax", value = "/searchAjax")
public class SearchByAjax extends HttpServlet {
    ProductService productService = ProductService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        String txtSearch = request.getParameter("search");
        List<Product> products = productService.searchByName(txtSearch);
        PrintWriter pw = response.getWriter();
//        pw.write(products);
        pw.println(new Gson().toJson(products));
        pw.close();

//        request.getRequestDispatcher("/views/web/menu.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch = request.getParameter("product_search");
        System.out.println(txtSearch);
        List<Product> products = productService.searchByName('%' + txtSearch.trim() + '%');
        PrintWriter pw = response.getWriter();
//        pw.write(products);
        pw.println(new Gson().toJson(products));
        System.out.println(products);
        pw.close();
    }
}
