package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.shipper;



import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ShipperService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateShipperServlet", value = "/createShipper")
public class CreateServlet extends HttpServlet {
    private ShipperService shipperService = ShipperService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// show form
        request.getRequestDispatcher("/views/admin/shipperAddition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idShipper");
        String name = request.getParameter("nameShipper");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String createdBy = request.getParameter("createdBy");

        Shipper shipper = new Shipper();

        shipper.setId("");
        shipper.setName(name);
        shipper.setMobile(mobile);
        shipper.setAddress(address);
        shipper.setCreatedBy(createdBy);

        shipperService.save(shipper);

        response.sendRedirect(request.getContextPath() +"/shipper");
    }
}
