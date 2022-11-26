package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ShipperService;

import java.io.IOException;

@WebServlet(name = "DeleteContactServlet", value = "/deleteContact")
public class DeleteServlet extends HttpServlet {
    ShipperService shipperService = ShipperService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("------------------");
        request.getRequestDispatcher(request.getContextPath() + "/contact").forward(request, response);
        String id = request.getParameter("id");

        System.out.println(id);
        boolean check = shipperService.deleteItem(id);
        if (check) {
            System.out.println("++++++++");
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/contact");

    }
}
