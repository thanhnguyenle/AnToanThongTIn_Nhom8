package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.cart;

import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "AddCartServlet", value = "/add-cart")
public class AddServlet extends HttpServlet {
    private ProductService productService;
    private Product product;
    private String id;

    public AddServlet() {
        productService = ProductService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get product id from request
        id = request.getParameter("id");
        product = productService.getItem(id);
        if(product != null){
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null){
                cart = Cart.getInstance();
            }
            cart.putProduct(product);
            session.setAttribute("cart", cart);
        }
//        Cookie cookie[] = request.getCookies();
//        String txt = "";
//        for (Cookie c: cookie) {
//            if(c.getName().equals("id")){
//                txt = txt + c.getValue();
//                c.setMaxAge(0);
//                response.addCookie(c);
//            }
//        }
//        if(txt.isEmpty()){
//            txt = id;
//        } else {
//            txt += "," + id;
//        }
//
//        Cookie cookie1 = new Cookie("id", txt);
//        cookie1.setMaxAge(60 * 60 * 24);
//        response.addCookie(cookie1);

        response.sendRedirect(request.getContextPath() +"/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}