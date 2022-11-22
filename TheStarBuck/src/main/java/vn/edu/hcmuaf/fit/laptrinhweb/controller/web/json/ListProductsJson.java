package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.json;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.IPageAble;
import vn.edu.hcmuaf.fit.laptrinhweb.paging.PageRequest;
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
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "product-json",urlPatterns = {"/products"},initParams = {
        @WebInitParam(name="page-index",value = "1"),
        @WebInitParam(name="per-page",value = "9")
})
public class ListProductsJson extends HttpServlet{
    private ProductService productService;
    private List<Product> products;
    private IPageAble pageable;
    private String json,categoryID,sortBy;
    private double fromPrice = 0,toPrice = 100;
    public ListProductsJson() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        //receive request page-index and per-page
        String pageIndex = request.getParameter("page-index");
        String perPage = request.getParameter("per-page");
        int pageIndexNum = 1;
        int perPageNum = 9;
        try {
            pageIndexNum = Integer.parseInt(pageIndex);
            perPageNum = Integer.parseInt(perPage);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }
        //receive request categoryID
        categoryID = request.getParameter("category_id");
        sortBy = request.getParameter("sort_by");
        String fromPriceStr = request.getParameter("from_price");
        String orderBy = request.getParameter("order_by");
        String toPriceStr = request.getParameter("to_price");
        String text = request.getParameter("text_search");
        if(!fromPriceStr.isEmpty()&&!toPriceStr.isEmpty())
        try {
            fromPrice = Double.parseDouble(fromPriceStr);
            toPrice = Double.parseDouble(toPriceStr);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }

        pageable = new PageRequest(pageIndexNum,perPageNum);
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                products = productService.findAll(pageable,fromPrice,toPrice,categoryID,sortBy,orderBy,text);
            }
        });
        thread.start();
        try {
            thread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

            if(products!=null) {
                json  = new Gson().toJson(products);
                PrintWriter out = response.getWriter();
                try {
                    out.println(json);
                } finally {
                    out.close();

                }
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
