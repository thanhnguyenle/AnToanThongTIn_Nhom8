package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.slide;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Slide;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.SlideService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SlideServlet", value = "/slide")
public class ListServlet extends HttpServlet {
    private final SlideService slideService = SlideService.getInstance();


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Slide> slidesMini = slideService.printTypeSlide("MINI",5);
        request.setAttribute("slidesMini", slidesMini);
        List<Slide> slidesTitle = slideService.printTypeSlide("TITLE",3);
        request.setAttribute("slidesTitle", slidesTitle);
        List<Slide> slidesBanner = slideService.printTypeSlide("BANNER",1);
        request.setAttribute("slidesBanner", slidesBanner);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/slideManagement.jsp");
        rd.forward(request,response);
//        response.sendRedirect(request.getContextPath() + request.getServletPath() +  "/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
