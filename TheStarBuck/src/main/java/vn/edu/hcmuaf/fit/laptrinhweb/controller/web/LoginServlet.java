package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "LoginServlet", value = "/doLogin")
public class LoginServlet extends HttpServlet {
    private AccountService accountService ;
    private Account account;
    private String username;
    private String password;
    public LoginServlet(){
        accountService = AccountService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        username = request.getParameter("username");
        password = request.getParameter("password");
        String error = "";
        //decode password
        if (password != null) {
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(password.getBytes());
                byte[] digest = md.digest();
                password = DatatypeConverter.printHexBinary(digest).toUpperCase();
            } catch (NoSuchAlgorithmException e) {
                error = "";
            }

            account = accountService.login(username, password);

            HttpSession session = request.getSession();
            if (account != null) {
                if (!account.isActive()) {
                    error = "Account is blocked";
                    session.setAttribute("error", error);
//                    request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
                    response.sendRedirect("doLogin");
                } else {
                    session.setAttribute("account", account);
                    if (account.getGroupId().equals("MOD")) {
                        response.sendRedirect(request.getContextPath() + "/admin-home");
                    } else {
                        request.getRequestDispatcher("/user-home").forward(request, response);
                    }
                }
            } else {
                if (!accountService.checkUsername(username)) {
                    error = "Username is not exist";
                } else {
                    error = "Password is incorrect";
                }
                session.setAttribute("error", error);
//                request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
                response.sendRedirect("doLogin");
            }
        }
    }
    // lam vo hieu hoa người dung
    public static void deleteAvailableSession(HttpServletRequest request) {
        if (request.getSession(false) != null) {
            request.getSession(false).invalidate();
        }
    }

}
