package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

@WebServlet(name = "RegisterServlet", value = "/doRegister")
public class RegisterServlet extends HttpServlet {
    private AccountService accountService = AccountService.getInstance();
    private Map<String, Object> mapCheck;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String retypepassword = request.getParameter("retypepassword");
    if(username!=null&&email!=null&&password!=null&&retypepassword!=null) {
        try {
            mapCheck = accountService.register(username, email, password, retypepassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        if (mapCheck.isEmpty()) {

            session.removeAttribute("error");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
            rd.forward(request, response);
        } else {
            for (String error : mapCheck.keySet()) {
                session.setAttribute(error, mapCheck.get(error));
            }
            request.getRequestDispatcher("/views/web/createAcc.jsp").forward(request, response);
        }
    }
    }
}
