package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.address;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AddressService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        response.sendRedirect(request.getContextPath() +"/address");
    }
}
