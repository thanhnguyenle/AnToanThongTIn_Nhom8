package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.feedback;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.FeedbackService;

import java.io.IOException;


@WebServlet(name = "DeleteFeedbackServlet", value = "/deleteFeedback")
public class DeleteServlet extends HttpServlet {
    private FeedbackService feedbackService = FeedbackService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(request.getContextPath() + "/feedback").forward(request, response);
        System.out.println("------------------");
        String id = request.getParameter("id");

        System.out.println(id);
        boolean check = feedbackService.deleteItem(id);
        if (check) {
            System.out.println("++++++++");
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/feedback");

    }
}
