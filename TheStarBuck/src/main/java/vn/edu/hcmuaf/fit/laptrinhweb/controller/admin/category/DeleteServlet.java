package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.category;


import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "DeleteCategoryServlet", value = "/deleteCategory")
public class DeleteServlet extends HttpServlet {
    CategoryService categoryService = CategoryService.getInstance();

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(request.getContextPath() +"/category").forward(request, response);
        System.out.println("------------------");
        String id = request.getParameter("id");

        System.out.println(id);
        boolean check = categoryService.deleteItem(id) == 1;
        if(check){
            System.out.println("++++++++");
            doPost(request, response);
        } else {
            System.out.println("------------- something wrong");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() +"/category");

    }
}
