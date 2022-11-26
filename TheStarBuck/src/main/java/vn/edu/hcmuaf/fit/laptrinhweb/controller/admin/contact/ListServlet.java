package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.contact;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Contact;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ContactService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListContactServlet", value = "/admin-contact")

public class ListServlet extends HttpServlet {
    private ContactService contactService = ContactService.getInstance();


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contact> contacts = contactService.findAll();
        request.setAttribute("contacts", contacts);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/contactManagement.jsp");
        rd.forward(request, response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
