package vn.edu.hcmuaf.fit.laptrinhweb.controller.web.payment;

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
import vn.edu.hcmuaf.fit.laptrinhweb.service.impl.OrderService;

import java.io.IOException;

@WebServlet(name = "CheckoutPayment_Servlet", value = "/payment-checkout")
public class UploadInvoice extends HttpServlet {
    private OrderService orderService;
    private GenderPdf genderPdf;

    public UploadInvoice() {
        orderService = OrderService.getInstance();
        genderPdf = GenderPdf.instance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/views/web/payment.jsp").forward(request, response);
        doPost(request, response);
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
        orders.setPromo("");
        for(Product product:cart.getProductList()){
            orders.getProductList().put(product.getId(),product);
        }


        boolean checkFlag = orderService.createOrder(account, cart, orders);
        System.out.println("------ " + checkFlag);
        if (checkFlag) {
            //generate PDF:
            genderPdf.generatePDF(account,orders,request);
            Orders orders1 = orderService.getItemByIdAc(account.getId());
            session.removeAttribute("cart");
          //  session.setAttribute("order", orders1);
          //  session.setAttribute("productSold", cart.getProductList().stream().collect(toCollection(ArrayList::new)));
            request.getRequestDispatcher("/views/web/order.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/payment");
        }
    }

}
