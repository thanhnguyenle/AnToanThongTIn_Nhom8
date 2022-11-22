package vn.edu.hcmuaf.fit.laptrinhweb.controller.admin.topping;


import vn.edu.hcmuaf.fit.laptrinhweb.model.Topping;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ToppingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateToppingServlet", value = "/updateTopping")
public class UpdateServlet extends HttpServlet {
    private ToppingService toppingService = ToppingService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Topping topping = toppingService.getItem(id);

        HttpSession session = request.getSession();
        session.setAttribute("topping", topping);
        request.getRequestDispatcher("/views/admin/toppingEdition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idTopping");
        String name = request.getParameter("nameTopping");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String modifedBy = request.getParameter("modifedBy");

        Topping topping = toppingService.getItem(id);

        topping.setId(id);
        topping.setName(name);
        topping.setQuantity(Integer.parseInt(quantity));
        topping.setPrice(Double.parseDouble(price));
        topping.setModifiedBy(modifedBy);

        toppingService.save(topping);

        response.sendRedirect(request.getContextPath() +"/topping");
    }
}
