package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginFacebookServlet", value = "/doLoginFacebook")
public class LoginFacebookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    LoginFacebookServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String action = request.getParameter("action");
        if (action.equals("Face")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String id = request.getParameter("id");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
