package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Category;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.CategoryService;

import java.io.IOException;

@WebServlet(name = "UpdateCategoryServlet", value = "/updateCategory")
public class UpdateServlet extends HttpServlet {
    CategoryService categoryService = CategoryService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Category category = categoryService.getItem(id);

        HttpSession session = request.getSession();
        session.setAttribute("category", category);
        request.getRequestDispatcher("/views/admin/categoryEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idCategory");
        String name = request.getParameter("nameCategory");
        String icon = request.getParameter("iconCategory");
        String avatar = request.getParameter("avatar");
        String active = request.getParameter("active");
        String createdBy = request.getParameter("createdBy");

        Category category = categoryService.getItem(id);

        category.setId(id);
        category.setName(name);
        category.setIcon(icon);
        category.setAvatar(avatar);
        if (active.equals("0")) {
            category.setActive(false);
        } else {
            category.setActive(true);
        }
        category.setCreatedBy(createdBy);

        categoryService.save(category);

        response.sendRedirect(request.getContextPath() + "/category");
    }
}
