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
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "ProfileUserPassword",value = "/user-profile-pass")
public class ChangePasswordServlet extends HttpServlet {
    AccountService accountService = AccountService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        session.setAttribute("account",account);
        request.getRequestDispatcher("/views/web/profileChangePass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      Account account = (Account) session.getAttribute("account");
      String pass = account.getPassword();
      String passwordOla = request.getParameter("passwordOld");
      String passwordNew = request.getParameter("passwordNew");
        try {
            if(accountService.checkChangePass(pass,passwordOla) && passwordNew.equals(passwordOla)){
             String passwordNewMb5 = accountService.mdbPassword(passwordNew);
             account.setPassword(passwordNewMb5);
             accountService.updatePass(passwordNewMb5,account.getId());
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/index.jsp");
            rd.forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

    }
}
