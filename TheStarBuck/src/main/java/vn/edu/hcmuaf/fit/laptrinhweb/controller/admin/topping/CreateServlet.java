package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.topping;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ToppingService;

import java.io.IOException;

@WebServlet(name = "CreateToppingServlet", value = "/createTopping")
public class CreateServlet extends HttpServlet {
    ToppingService toppingService = ToppingService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// show form
        request.getRequestDispatcher("/views/admin/toppingAddition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idTopping");
        String name = request.getParameter("nameTopping");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String createdBy = request.getParameter("createdBy");

        Topping topping = new Topping();

        topping.setId("");
        topping.setName(name);
        topping.setQuantity(Integer.parseInt(quantity));
        topping.setPrice(Double.parseDouble(price));
        topping.setCreatedBy(createdBy);

        toppingService.save(topping);

        response.sendRedirect(request.getContextPath() + "/topping");
    }
}
