package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.json;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Post;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.PageRequest;
import vn.edu.hcmuaf.fit.laptrinhweb.service.IPostService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.PostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "post",urlPatterns = {"/post"},initParams = {
        @WebInitParam(name="id",value = "po0001"),
})
public class GetPostJson extends HttpServlet {
    private final IPostService postService = PostService.getInstance();
    private Post post;
    private IPageAble pageable;
    private final CrawlPostToJson crawlPost = CrawlPostToJson.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postID = req.getParameter("post_id");
        System.out.println(postID);
        Thread thread = new Thread(() -> {
            post = postService.findById(postID);
            post.setPost_content(crawlPost.crawlPostAt(post.getPost_url()));
        });
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        if(post!=null) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");
            String json = new Gson().toJson(post);
            PrintWriter out = resp.getWriter();
            try {
                out.println(json);
            } finally {
                out.close();

            }
        }else
            System.err.println("ERROR!");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
