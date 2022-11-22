package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.slide;


import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.SlideService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "DeleteSlideServlet", value = "/deleteSlide")
public class DeleteServlet extends HttpServlet {
    private SlideService slideService = SlideService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //show form
        request.getRequestDispatcher(request.getContextPath() +"/topping").forward(request, response);
        System.out.println("------------------");
        String id = request.getParameter("id");

        System.out.println(id);
        boolean check = slideService.deleteItem(id) == 1;
        if(check){
            System.out.println("++++++++");
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() +"/slide");
    }
}
