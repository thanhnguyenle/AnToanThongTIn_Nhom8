package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import java.io.IOException;

@WebServlet(name = "UpdateProductServlet", value = "/updateProduct")
public class UpdateServlet extends HttpServlet {
    ProductService productService = ProductService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product product = productService.getItem(id);
        System.out.println(product.getImage());
        HttpSession session = request.getSession();
        session.setAttribute("product", product);
        System.out.println(product.toString());
        request.getRequestDispatcher("/views/admin/productEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idProduct");
        String name = request.getParameter("nameProduct");
        String type = request.getParameter("type");
        String ingredients = request.getParameter("Ingredients");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String active = request.getParameter("active");
        String hot = request.getParameter("hot");
        String view = request.getParameter("view");
        String description = request.getParameter("description");
        String image = request.getParameter("avatar");
        String descriptionSeo = request.getParameter("descriptionSeo");
        String keywordSeo = request.getParameter("keywordSeo");
        String titleSeo = request.getParameter("titleSeo");
        String note = request.getParameter("Note");
        String modifiedBy = request.getParameter("modifiedBy");

        Product product = productService.getItem(id);

        product.setId(id);
        product.setName(name);
        product.setIdCategory(type);
        product.setIngredients(ingredients);
        product.setPrice(Double.parseDouble(price));
        product.setDiscount(Double.parseDouble(discount));
        if (active.equals("0")) {
            product.setActive(false);
        } else {
            product.setActive(true);
        }
        product.setHot(Integer.parseInt(hot));
        product.setView(Integer.parseInt(view));
        product.setDescription(description);
        product.setImage(image);
        product.setDescriptionSeo(descriptionSeo);
        product.setKeywordSeo(keywordSeo);
        product.setTitleSeo(titleSeo);
        product.setNote(note);
        product.setModifiedBy(modifiedBy);

        productService.save(product);

        response.sendRedirect(request.getContextPath() + "/product");
    }
}
