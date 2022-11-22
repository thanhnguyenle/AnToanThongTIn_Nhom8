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

@WebServlet(name = "LoginGoogleServlet", value ="/doLoginGoogle")
public class LoginGoogleServlet  extends HttpServlet {
    private final AccountService accountService = AccountService.getInstance();
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Account account = new Account();
        String name = request.getParameter("name");
        String familyname = request.getParameter("familyname");
        String imgUrl = request.getParameter("imgUrl");
        String email = request.getParameter("email");
        account.setAvatar(imgUrl);
        account.setUsername(name);
        boolean check;
        if(accountService.checkUserEmail(email)){
            //available
            check = true;
        }else{
            //first
            check = accountService.registerByGoogle(familyname,email,imgUrl,name);
        }
        if(check){
            account = accountService.getAccountByEmail(email);
            session.setAttribute("account", account);
            response.sendRedirect(request.getContextPath() + "/user-home");
        }else{
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
            rd.forward(request,response);
        }
    }
}
