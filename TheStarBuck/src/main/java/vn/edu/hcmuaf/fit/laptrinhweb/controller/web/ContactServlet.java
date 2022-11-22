package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ContactService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContactServlet",value = "/contact")
public class ContactServlet extends HttpServlet {
    private ContactService contactService = ContactService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/contact.jsp");
        req.setAttribute("status","0");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");
        boolean isSaved= contactService.addContact(name,email,message);
        if(isSaved){
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/contact.jsp");
            rd.forward(req,resp);
        }else{
            req.setAttribute("status","2");
            req.getRequestDispatcher("/views/web/contact.jsp").forward(req,resp);
        }
    }
}
