package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.send_mail;

import vn.edu.hcmuaf.fit.laptrinhweb.service.IAccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/verifyCode")
public class VerifyCodeServlet extends HttpServlet {
    IAccountService accountService = AccountService.getInstance();
    protected void doGet(HttpServletRequest  request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/verifyEmail.jsp");
        rd.forward(request,response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            String codeEmail = (String) session.getAttribute("authcode");
            String idAuth = (String) session.getAttribute("id_auth");
            String code = request.getParameter("authcode");
            String pass = request.getParameter("newpass");
            String retype = request.getParameter("retypepass");
            if (code != null && pass != null && retype != null) {
                RequestDispatcher rd;
                if (code.equals(codeEmail)) {
                    rd = request.getRequestDispatcher("/views/web/login.jsp");
                    String passwordNewMb5 = accountService.mdbPassword(pass);
                    accountService.updatePass(passwordNewMb5,idAuth);
                } else {
                    rd = request.getRequestDispatcher("/views/web/OTP.jsp");
                }
                rd.forward(request, response);
            }
            } catch(ServletException| NoSuchAlgorithmException e){
                e.printStackTrace();
            }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }
}
