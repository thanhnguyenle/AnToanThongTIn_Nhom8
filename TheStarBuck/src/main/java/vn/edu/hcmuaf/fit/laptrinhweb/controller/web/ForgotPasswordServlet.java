package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ForgotPasswordServlet", value = "/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/web/forgetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String codeEmail = (String) session.getAttribute("authcode");
            String code = request.getParameter("authcode");
            RequestDispatcher rd;
            if (code.equals(codeEmail)) {
                rd = request.getRequestDispatcher("/views/web/login.jsp");
            } else {
                rd = request.getRequestDispatcher("/views/web/verifyEmail.jsp");
            }
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    // lam vo hieu hoa người dung
    public static void deleteAvailableSession(HttpServletRequest request) {
        if (request.getSession(false) != null) {
            request.getSession(false).invalidate();
        }
    }

}
