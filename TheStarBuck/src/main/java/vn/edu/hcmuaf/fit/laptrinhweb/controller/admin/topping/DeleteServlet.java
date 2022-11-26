package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.topping;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ToppingService;

import java.io.IOException;


@WebServlet(name = "DeleteToppingServlet", value = "/deleteTopping")
public class DeleteServlet extends HttpServlet {
    private ToppingService toppingService = ToppingService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //show form
        request.getRequestDispatcher(request.getContextPath() + "/topping").forward(request, response);
        System.out.println("------------------");
        String id = request.getParameter("id");

        System.out.println(id);
        boolean check = toppingService.deleteItem(id) == 1;
        if (check) {
            System.out.println("++++++++");
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/topping");

    }
}
