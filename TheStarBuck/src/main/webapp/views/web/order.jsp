<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Orders" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) request.getAttribute("account");
    Orders order = (Orders) request.getAttribute("order");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layout/css.jsp"/>
    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/payment.css")%>" />
    <title>Bill</title>
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/listorder.css")%>" />

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="layout/header.jsp"/>

  <div class="row mrCheckout">
      <div class="checkout-wrap col-xcol-md-6 col-sm-11 s-11 pull-right">
          <ul class="checkout-bar">
              <li class="visited checkout-title"><span>CART</span>
              </li>
              <li class="visited checkout-title"><span>CHECKOUT</span>
              </li>
              <li class="active checkout-title"><span>FINISH</span>
              </li>
          </ul>
      </div>
  </div>
<!-- Content -->
<section class="section order" >
    <div class="d-flex flex-column justify-content-center align-items-center" id="order-heading">
        <div class="text-uppercase">
            <p>Order</p>
        </div>
        <div class="h4">Thursday, July 24, 2017</div>
        <div class="pt-1">
            <p>Order ${order.id} is currently<b class="text-dark"> processing</b></p>
        </div>
    </div>
    <div class="orderdeteil">
        <div class="table-responsive">
            <table class="table table-borderless">
                <thead>
                    <tr class="text-uppercase text-muted">
                        <th scope="col">product</th>
                        <th scope="col" class="text-right">total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">Drinks</th>
                        <td class="text-right"><b>$${order.subTotal}</b></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <jsp:useBean id="productSold" scope="session" type="java.util.List"/>
        <c:forEach items="${productSold}" var="item">
        <div class="d-flex justify-content-start align-items-center list py-1">
            <div><b>${item.quantitySold}</b></div>
            <div class="mx-3"> <img src="${item.image}" alt="apple" class="rounded-circle" width="30" height="30"> </div>
            <div class="order-item">${item.name}</div>
        </div>
        </c:forEach>

        <div class="pt-2 border-bottom mb-3"></div>
        <div class="d-flex justify-content-start align-items-center pl-3">
            <div class="text-muted">Payment Method</div>
            <div class="ml-auto"> <img src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-logok-15.png" alt="" width="30" height="30"> <label>Mastercard ******5342</label> </div>
        </div>
        <div class="d-flex justify-content-start align-items-center py-1 pl-3">
            <div class="text-muted">Shipping</div>
            <div class="ml-auto"> <label>Free</label> </div>
        </div>
        <div class="d-flex justify-content-start align-items-center pb-4 pl-3 border-bottom">
            <div class="text-muted"> <button class="text-white btn">50% Discount</button> </div>
            <div class="ml-auto price"> -$34.94 </div>
        </div>
        <div class="d-flex justify-content-start align-items-center pl-3 py-3 mb-4 border-bottom">
            <div class="text-muted"> Today's Total </div>
            <div class="ml-auto h5"> $${order.grandTotal} </div>
        </div>
        <div class="row border rounded p-1 my-3">
            <div class="col-md-12 py-3">
                <div class="d-flex flex-column align-items start"> <b>Shipping Address</b>
                    <p class="text-justify pt-2">${order.address}</p>

                </div>
            </div>
        </div>
<%--        <div class="pl-3 font-weight-bold">Related Subsriptions</div>--%>
    <%--        <div class="d-sm-flex justify-content-between rounded my-3 subscriptions">--%>
    <%--            <div> <b>#9632</b> </div>--%>
    <%--            <div>May 22, 2017</div>--%>
    <%--            <div>Status: Processing</div>--%>
    <%--            <div> Total: <b> $68.8 for 10 items</b> </div>--%>
    <%--        </div>--%>
        <div class="btnCon d-flex flex-column justify-content-center align-items-center">
            <a href="#" id="btnContinue">Continue</a>
        </div>
    </div>
</section>

  <!-- Footer -->
  <jsp:include page="layout/footer.jsp"/>
  <!-- End Footer -->
  <!-- jquery -->
  <jsp:include page="layout/script.jsp"/>
  <!-- Custom Scripts -->
  <script src="<%= Asset.url("/template/web/js/product.js")%>"></script>
</body>
</html>