package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.send_mail;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.properties.AssetProperties;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IAccountService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
//forget password
@WebServlet(name = "SendMailForm", value = "/send_mail")
public class SendMailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SendEmail sendEmailService  = SendEmail.getInstance();
    IAccountService accountService = AccountService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/sendMail.jsp");
        rd.forward(request,response);
        System.out.println("day la phuong thuc get");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        String emailTo = request.getParameter("hello");
        if(emailTo!=null){
            Account account = accountService.getAccountByEmail(emailTo);
            if(account!=null) {
                HttpSession httpSession = request.getSession();
                String code = sendEmailService.getRandom();
                StringBuilder result = new StringBuilder();
                InputStream is = new URL(AssetProperties.getBaseUrl() + "views/web/content_mail/forget_password.jsp").openStream();
                BufferedReader netIn = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
                String line = "";
                while ((line = netIn.readLine()) != null) {
                    String old = "#codeResetPassword#";
                    if (line.contains(old)) {
                        line = line.replaceAll(old, code);
                    }
                    result.append(line.trim());
                }
                is.close();
                netIn.close();
                httpSession.setAttribute("authcode", code);
                httpSession.setAttribute("id_auth", account.getId());
                sendEmailService.sendEmail(emailTo, result.toString());
                RequestDispatcher rd = request.getRequestDispatcher("/views/web/OTP.jsp");
                rd.forward(request, response);
            }else{
                System.out.println("Account must not null");
            }
        }else{
            System.out.println("emailTo must not null");
        }
    }
}
;