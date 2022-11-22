package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.topping;



import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ToppingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        request.getRequestDispatcher(request.getContextPath() +"/topping").forward(request, response);
        System.out.println("------------------");
        String id = request.getParameter("id");

        System.out.println(id);
        boolean check = toppingService.deleteItem(id) == 1;
        if(check){
            System.out.println("++++++++");
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() +"/topping");

    }
}
