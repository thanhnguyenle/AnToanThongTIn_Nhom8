package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.topping;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ToppingService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ToppingServlet", value = "/topping")
public class ListServlet extends HttpServlet {
    private ToppingService toppingService = ToppingService.getInstance();


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Topping> toppings = toppingService.findAll();
        System.out.println("----------" + toppings.get(0));
        request.setAttribute("toppings", toppings);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/toppingManagement.jsp");
        rd.forward(request, response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
