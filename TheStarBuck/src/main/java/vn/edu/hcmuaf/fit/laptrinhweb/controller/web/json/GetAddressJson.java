package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.json;

import com.google.gson.Gson;
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
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "GetAddress_Json", urlPatterns = {"/getAddressJson"}, initParams = {
        @WebInitParam(name = "id", value = "ac0001"),
})
public class GetAddressJson extends HttpServlet {
    private IAddressService addressService = AddressService.getInstance();
    List<Address> addressList;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                addressList = addressService.getByAccountID(id);
            }
        });
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        if (addressList != null) {
            resp.setCharacterEncoding("utf-8");
            String json = new Gson().toJson(addressList);
            PrintWriter out = resp.getWriter();
            try {
                out.println(json);
            } finally {
                out.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
