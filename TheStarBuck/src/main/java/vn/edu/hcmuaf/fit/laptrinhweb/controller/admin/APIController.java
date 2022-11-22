package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "APIController", value = "/api/*")
public class APIController extends HttpServlet {
    AccountService accountService = AccountService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getPathInfo();
        switch (action){
            case "/account":
                account(request, response);
                break;
        }
    }

    private void account(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "create":
                creatAccount(request, response);
                break;
            case  "get":
                getAccount(request, response);
                break;
            case "update":
                updateAccount(request, response);
                break;
        }
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) {

    }

    private void getAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Account> list = accountService.getAll();
//        HttpSession session = request.getSession();
        List<Account> accs = new ArrayList<Account>(list.values());
//        session.setAttribute("accs", accs);
//        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/accountManagement.jsp");
//        rd.forward(request,response);

        PrintWriter pw =response.getWriter();
        pw.println(new Gson().toJson(accs));
        pw.close();
    }

    private void creatAccount(HttpServletRequest request, HttpServletResponse response) {
//        trong đây làm như 1 controller

    }

}
