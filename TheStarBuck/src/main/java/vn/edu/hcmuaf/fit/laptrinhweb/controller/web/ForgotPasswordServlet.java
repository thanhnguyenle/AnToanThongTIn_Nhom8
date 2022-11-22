package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "ForgotPasswordServlet", value = "/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/web/forgetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            String codeEmail = (String) session.getAttribute("authcode");
            String code = request.getParameter("authcode");
            RequestDispatcher rd;
            if(code.equals(codeEmail)){
                rd = request.getRequestDispatcher("/views/web/login.jsp");
            }
            else{
                rd = request.getRequestDispatcher("/views/web/verifyEmail.jsp");
            }
            rd.forward(request,response);
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
