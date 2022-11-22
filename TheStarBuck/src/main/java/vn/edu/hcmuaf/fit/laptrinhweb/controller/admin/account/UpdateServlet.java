package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.account;

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

@WebServlet(name = "UpdateAccountServlet", value = "/updateAccount")
public class UpdateServlet extends HttpServlet {
    AccountService accountService = AccountService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Account acc = accountService.getAcc(id);
        HttpSession session = request.getSession();
        session.setAttribute("acc", acc);
        request.getRequestDispatcher("/views/admin/accountEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idAccount");
        String active = request.getParameter("active"); // how to get?
        String avatar = request.getParameter("avatar");
        String createdDate = request.getParameter("createData");

        Account account = accountService.getAcc(id);


        if(active.equals("0")){
            account.setActive(false);
        } else {
            account.setActive(true);}

        System.out.println(avatar);
        account.setAvatar(avatar);

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        try {
            date = df.parse(createdDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println(account.isActive());

//        accountService.save(account);
        System.out.println(accountService.save(account));

        response.sendRedirect(request.getContextPath() +"/account");
    }
}
