package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AddressService;

import java.io.IOException;

@WebServlet(name = "CreateAddressServlet", value = "/createAddress")
public class CreateServlet extends HttpServlet {
    AddressService addressService = AddressService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// show form
        request.getRequestDispatcher("/views/admin/addressAddition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String addressDetail = request.getParameter("addressDetail");
        String createdBy = request.getParameter("createdBy");

        Address address = new Address();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        address.setId("");
        address.setIdAccount(account.getId());
        address.setProvinceCode(province);
        address.setDistrictCode(district);
        address.setWardCode(ward);
        address.setAddressDetails(addressDetail);
        address.setModifiedBy(createdBy);
        address.setCreatedBy(createdBy);

        addressService.save(address);

        response.sendRedirect(request.getContextPath() + "/address");
    }
}
