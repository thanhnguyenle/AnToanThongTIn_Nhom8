package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.profile;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "Profile", value = "/admin-profile")
public class Profile extends HttpServlet {
    AccountService accountService = AccountService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        session.setAttribute("account", account);
        request.getRequestDispatcher("/views/admin/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String fullname = request.getParameter("fullNameAccount");
        String email = request.getParameter("emailAccount");
        String phoneNumber = request.getParameter("phoneAccount");

        System.out.println(account.getId());
        account.setFullname(fullname);
        account.setEmail(email);
        account.setPhoneNumber(phoneNumber);

        accountService.updateAuth(account);

        response.sendRedirect(request.getContextPath() +"/admin-profile");
    }
}
