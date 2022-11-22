package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.feedback;



import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateFeedbackServlet", value = "/updateFeedback")
public class UpdateServlet extends HttpServlet {
    private FeedbackService feedbackService = FeedbackService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        FeedBack feedback = feedbackService.getItem(id);

        HttpSession session = request.getSession();
        session.setAttribute("feedback", feedback);
        request.getRequestDispatcher("/views/admin/feedbackEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idFeedback");
        String idAcc = request.getParameter("idAccount");
        String idPr = request.getParameter("idProduct");
        String content = request.getParameter("contentAccount");
        String rate = request.getParameter("rate");
        String status = request.getParameter("status");
        String modifiedBy = request.getParameter("modifiedBy");

        FeedBack feedback = feedbackService.getItem(id);

        feedback.setId(id);
        feedback.setIdAccount(idAcc);
        feedback.setIdProduct(idPr);
        feedback.setContent(content);
        feedback.setRate(Integer.parseInt(rate));
        feedback.setStatus(status);
        feedback.setModifiedBy(modifiedBy);

        feedbackService.save(feedback);

        response.sendRedirect(request.getContextPath() +"/feedback");
    }
}
