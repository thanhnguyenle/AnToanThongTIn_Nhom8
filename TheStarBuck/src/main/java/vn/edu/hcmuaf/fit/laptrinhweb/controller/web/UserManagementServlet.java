package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PostService;

import java.io.IOException;

@WebServlet(name = "BlogServlet", value = "/blog", initParams = {
        @WebInitParam(name = "blogid", value = "po0001")})
public class UserManagementServlet extends HttpServlet {
    private final IPostService postService = PostService.getInstance();
    private int total = 0;
    private int page = 1;
    private int max_page = 9;
    private String blogId = "po0001";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //setup response
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        String blogIdTemp = request.getParameter("blogid");
        if (blogIdTemp != null && !blogIdTemp.isEmpty()) {
            blogId = blogIdTemp;
        }

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                total = postService.total();
            }
        });
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if (total != -1) {
            //paging attribute setup
            request.setAttribute("page", page);
            request.setAttribute("totalPage", (int) Math.ceil((double) total / max_page));
            request.setAttribute("blogid", blogId);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/poster.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
