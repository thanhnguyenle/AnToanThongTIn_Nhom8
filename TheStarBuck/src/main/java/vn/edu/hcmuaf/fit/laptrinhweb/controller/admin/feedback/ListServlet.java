package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.feedback;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.FeedbackService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FeedbackServlet", value = "/feedback")
public class ListServlet extends HttpServlet {
    private FeedbackService feedbackService = FeedbackService.getInstance();


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FeedBack> feedbacks = feedbackService.findAll();
        request.setAttribute("feedbacks", feedbacks);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/feedbackManagement.jsp");
        rd.forward(request, response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
