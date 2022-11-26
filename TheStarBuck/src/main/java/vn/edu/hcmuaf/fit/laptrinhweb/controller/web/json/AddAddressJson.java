package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.json;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IAddressService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AddressService;

import java.io.IOException;

@WebServlet(name = "AddAddressJson", urlPatterns = {"/addAddressJson"}, initParams = {
        @WebInitParam(name = "id", value = "1"),
})
public class AddAddressJson extends HttpServlet {
    private final IAddressService addressService = AddressService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        String userId = req.getParameter("ad_userId");
        String ad_provinceCode = req.getParameter("ad_provinceCode");
        String ad_districtCode = req.getParameter("ad_districtCode");
        String ad_wardCode = req.getParameter("ad_wardCode");
        String ad_addressDetail = req.getParameter("ad_addressDetail");
        if (ad_provinceCode != null && ad_districtCode != null && ad_wardCode != null) {
            Address address = new Address();
            address.setId("");
            address.setIdAccount(userId);
            address.setProvinceCode(ad_provinceCode);
            address.setDistrictCode(ad_districtCode);
            address.setWardCode(ad_wardCode);
            address.setAddressDetails(ad_addressDetail);
            address.setCreatedBy(userId);

            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    addressService.save(address);
                }
            });
            thread.start();
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } else {

        }
    }
}
