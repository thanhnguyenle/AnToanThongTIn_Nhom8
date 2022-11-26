package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.profile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import java.io.IOException;

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

        response.sendRedirect(request.getContextPath() + "/admin-profile");
    }
}
