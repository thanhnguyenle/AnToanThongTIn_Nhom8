package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.payment;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Account;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Cart;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Orders;
import vn.edu.hcmuaf.fit.laptrinhweb.model.Product;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.BillService;
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;

import static java.util.stream.Collectors.toCollection;

@WebServlet(name = "CheckoutPayment_Servlet", value = "/payment-checkout")
public class CheckoutServlet extends HttpServlet {
    private OrderService orderService;
    private GenderPdf genderPdf;
    BillService billService = BillService.getInstance();

    public CheckoutServlet() {
        orderService = OrderService.getInstance();
        genderPdf = GenderPdf.instance();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get cart from session
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Cart cart = (Cart) session.getAttribute("cart");
        Account account = (Account) session.getAttribute("account");
        Orders orders = new Orders();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String note = "name: " + name + ", phone number: " + phone + ", email: " + email;
        String addresses = request.getParameter("addresses");
        String addressDetail = request.getParameter("addressDetail");
        String payment = request.getParameter("payment");
        String address = addresses + "\nDetail: " + addressDetail;
        orders.setName(name);
        orders.setPhone(phone);
        orders.setEmail(email);
        orders.setIdAccount(account.getId());
        orders.setSubTotal(cart.getSubTotalPrice());
        orders.setGrandTotal(cart.getTotalPrice());
        orders.setNote(note);
        orders.setAddress(address);
        orders.setIdSession("session");
        orders.setToken("token");
        orders.setStatus("status");
        orders.setItemDiscount(1);
        orders.setTax(1);
        orders.setShipping(1);
        orders.setId("");
        int num = billService.getAmountItem()+1;;
        String idbill = "bi"+fillID(num+"");
        orders.setPromo(idbill);
        for(Product product:cart.getProductList()){
            orders.getProductList().put(product.getId(),product);
        }
        boolean checkFlag = orderService.createOrder(account, cart, orders);
        if (checkFlag) {
            //redirect bill
            String  json = new Gson().toJson("Successful!");
            PrintWriter out = response.getWriter();
            try {
                out.println(json);
            } finally {
                out.close();
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/payment");
        }
    }
    public String fillID(String id){
        String re = "";
        while((id.length()+re.length())<4){
            re+="0";
        }
        return re+id;
    }
}
