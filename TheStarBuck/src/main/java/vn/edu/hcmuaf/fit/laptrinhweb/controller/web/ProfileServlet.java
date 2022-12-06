package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import java.io.IOException;

@WebServlet(name = "ProfileUserServlet", value = "/user-profile")
public class ProfileServlet extends HttpServlet {
    AccountService accountService = AccountService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");
//        session.setAttribute("account",account);
//        request.getRequestDispatcher("/views/web/profileAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String fullname = request.getParameter("fullname");
        String avatar = request.getParameter("avatar");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phonenumber");
        String addressID = request.getParameter("addressId");

        account.setFullname(fullname);
        account.setEmail(email);
        account.setPhoneNumber(phoneNumber);
        account.setAvatar(avatar);
        account.setAddressId(addressID);

        accountService.updateAuth(account);
//        response.sendRedirect(request.getContextPath() +"/user-profile");
    }
}