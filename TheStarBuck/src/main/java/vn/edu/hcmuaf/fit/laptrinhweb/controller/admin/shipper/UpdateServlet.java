package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.shipper;



import vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ShipperService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateShipperServlet", value = "/updateShipper")
public class UpdateServlet extends HttpServlet {
    private ShipperService shipperService = ShipperService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Shipper shipper = shipperService.getItem(id);

        HttpSession session = request.getSession();
        session.setAttribute("shipper", shipper);
        request.getRequestDispatcher("/views/admin/shipperEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idShipper");
        String name = request.getParameter("nameShipper");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String modifiedBy = request.getParameter("modifiedBy");

        Shipper shipper = shipperService.getItem(id);

//        shipper.setId(id);
        shipper.setName(name);
        shipper.setMobile(mobile);
        shipper.setAddress(address);
        shipper.setModifiedBy(modifiedBy);

        shipperService.save(shipper);

        response.sendRedirect(request.getContextPath() +"/shipper");
    }
}
