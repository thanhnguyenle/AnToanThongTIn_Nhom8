package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.certificate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PublicKeyService;

import java.io.IOException;


@WebServlet(name = "DeleteCertificate_Servlet", value = "/deleteCertificate")
public class ViewServlet extends HttpServlet {
  PublicKeyService publicKeyService = PublicKeyService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Long check = publicKeyService.delete(id);
        if (check>0) {
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/all-certificate");

    }
}
