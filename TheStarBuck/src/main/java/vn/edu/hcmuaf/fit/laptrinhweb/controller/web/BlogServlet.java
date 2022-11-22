package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import org.apache.http.HttpRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.PageRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogServlet", value = "/blog",initParams = {
        @WebInitParam(name="blogid",value = "po0001")})
public class BlogServlet extends HttpServlet {
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
        if(blogIdTemp!=null&&!blogIdTemp.isEmpty()){
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
        if(total!=-1) {
            //paging attribute setup
            request.setAttribute("page", page);
            request.setAttribute("totalPage", (int) Math.ceil((double) total / max_page));
            request.setAttribute("blogid",blogId);
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/poster.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException|IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
