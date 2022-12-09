package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "LogoutServlet", value = "/doLogout")
public class LogoutServlet extends HttpServlet {
    AccountService accountService = AccountService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Account account = (Account) session.getAttribute("account");
            account.setLastLogin(new Date());
            accountService.save(account);
            session.removeAttribute("account");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/web/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
