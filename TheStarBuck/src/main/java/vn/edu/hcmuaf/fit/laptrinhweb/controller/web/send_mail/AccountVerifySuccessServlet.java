package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.send_mail;

import vn.edu.hcmuaf.fit.laptrinhweb.service.IAccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/activeAccountSuccess")
public class AccountVerifySuccessServlet extends HttpServlet {
    IAccountService accountService = AccountService.getInstance();
    protected void doGet(HttpServletRequest  request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    protected void processRequest (HttpServletRequest  request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean check = false;
        if(email!=null){
            check =  accountService.verifyAccount(email);
        }
        RequestDispatcher dispatcher;
        if(check){
            dispatcher = request.getRequestDispatcher("/views/web/content_mail/active_user_success.jsp");
        }else{
            dispatcher = request.getRequestDispatcher("/views/web/content_mail/active_user_lose.jsp");
        }
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
