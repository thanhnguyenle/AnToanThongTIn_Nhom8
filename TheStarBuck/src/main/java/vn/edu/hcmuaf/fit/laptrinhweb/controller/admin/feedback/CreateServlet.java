package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.feedback;






import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateFeedbackServlet", value = "/createFeedback")
public class CreateServlet extends HttpServlet {
    FeedbackService feedbackService = FeedbackService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// show form
        request.getRequestDispatcher("/views/admin/feedbackAddition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idAcc = request.getParameter("idAccount");
        String idPr = request.getParameter("idProduct");
        String content = request.getParameter("contentAccount");
        String rate = request.getParameter("rate");
        String status = request.getParameter("status");
        String createdBy = request.getParameter("createdBy");

        FeedBack feedBack = new FeedBack();

        feedBack.setId("");
        feedBack.setIdAccount(idAcc);
        feedBack.setIdProduct(idPr);
        feedBack.setContent(content);
        feedBack.setRate(Integer.parseInt(rate));
        feedBack.setStatus(status);
        feedBack.setCreatedBy(createdBy);

        feedbackService.save(feedBack);

        response.sendRedirect(request.getContextPath() +"/feedback");
    }
}
