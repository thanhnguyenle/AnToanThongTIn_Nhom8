package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.shipper;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ShipperService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShipperServlet", value = "/shipper")
public class ListServlet extends HttpServlet {
    private ShipperService shipperService = ShipperService.getInstance();


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Shipper> shippers = shipperService.findAll();
        request.setAttribute("shippers", shippers);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/shipperManagement.jsp");
        rd.forward(request, response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
