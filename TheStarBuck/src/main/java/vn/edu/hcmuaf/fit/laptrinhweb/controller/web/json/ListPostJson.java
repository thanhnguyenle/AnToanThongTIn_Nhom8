package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.json;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Post;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.PageRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "posts",urlPatterns = {"/posts"},initParams = {
        @WebInitParam(name="page-index",value = "1"),
        @WebInitParam(name="per-page",value = "9")
})
public class ListPostJson extends HttpServlet {
    private IPostService postService = PostService.getInstance();
    private List<Post> posts;
    private IPageAble pageable;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageIndex = req.getParameter("page-index");
        String perPage = req.getParameter("per-page");
        String text = req.getParameter("text-search");

        int pageIndexNum = 1;
        int perPageNum = 9;
        try {
            pageIndexNum = Integer.parseInt(pageIndex);
            perPageNum = Integer.parseInt(perPage);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }

        pageable = new PageRequest(pageIndexNum,perPageNum);
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                posts = postService.findAll(pageable,text);
            }
        });
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        if(posts!=null) {
            String json = new Gson().toJson(posts);
            PrintWriter out = resp.getWriter();
            try {
                out.println(json);
            } finally {
                out.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
