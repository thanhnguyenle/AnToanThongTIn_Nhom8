package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.send_mail;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.properties.AssetProperties;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "AccountVerifyServlet", value = "/activeAccount")
public class AccountVerifyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SendEmail se = SendEmail.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailTo = request.getParameter("email");
        if (emailTo != null) {
            StringBuilder result = new StringBuilder();
            InputStream is = new URL(AssetProperties.getBaseUrl() + "views/web/content_mail/active_user.jsp").openStream();
            BufferedReader netIn = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
            String line = "";
            String link = AssetProperties.getBaseUrl() + "activeAccountSuccess";
            while ((line = netIn.readLine()) != null) {
                String old = "#baseurl#";
                if (line.contains(old)) {
                    line = line.replaceAll(old, link);
                }
                result.append(line.trim());
            }
            boolean test = se.sendEmail(emailTo, result.toString());
            if (test) {
                RequestDispatcher rd = request.getRequestDispatcher("/user-home");
                rd.forward(request, response);
            }
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/user-home");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
