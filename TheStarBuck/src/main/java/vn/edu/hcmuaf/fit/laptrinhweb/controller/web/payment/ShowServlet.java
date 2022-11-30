package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Address;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.AddressService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowPaymentServlet", value = "/payment")
public class ShowServlet extends HttpServlet {
    private ProductService productService;
    private AddressService addressService;

    public ShowServlet() {
        productService = ProductService.getInstance();
        addressService = AddressService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get cart from session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Account account = (Account) session.getAttribute("account");

        if(account!=null){
            List<Address> addresses = addressService.getByAccountID(account.getId());
            session.setAttribute("cart", cart);
            request.setAttribute("cart", cart);

            session.setAttribute("account", account);
            request.setAttribute("account", account);
            if(addresses!=null&& addresses.size()>0){
                request.setAttribute("addresses",addresses);
            }else{
                request.setAttribute("addresses",new ArrayList<Address>());
            }
            request.getRequestDispatcher("/views/web/payment.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
