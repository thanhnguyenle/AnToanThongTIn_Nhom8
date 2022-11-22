package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.account;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "CreateAccountServlet", value = "/createAccount")
public class CreateServlet extends HttpServlet {
    AccountService accountService = AccountService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// show form
        request.getRequestDispatcher("/views/admin/accountAddition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = request.getParameter("idAccount");
        String username = request.getParameter("nameAccount");
        String fullname = request.getParameter("fullNameAccount");
        String active = request.getParameter("active"); // how to get?
        String phoneNumber = request.getParameter("phoneAccount");
        String email = request.getParameter("emailAccount");
        String image = request.getParameter("avatar");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String about = request.getParameter("about");
        String groupId = request.getParameter("groupId");
//        String createdDate = request.getParameter("createdDate");//new SimpleDateFormat("yyyy-MM-dd").format(new Date())
        String createdBy = request.getParameter("createdBy");
        Account account = new Account();
        account.setId("");
        account.setUsername(username);
        account.setFullname(fullname);
        if(active.equals("0")){
            account.setActive(false);
        } else {
        account.setActive(true);}
        account.setPhoneNumber(phoneNumber);
        account.setEmail(email);
        account.setAvatar(image);
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        md.update(password.getBytes());
        byte[] digest = md.digest();
        password = DatatypeConverter.printHexBinary(digest).toUpperCase();
        account.setPassword(password);
        account.setAddressId(address);
        account.setAboutMe(about);
        account.setGroupId(groupId);
        account.setCreatedBy(createdBy);

        accountService.save(account);

        response.sendRedirect(request.getContextPath() +"/account");
    }
}
