<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Orders" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div style="text-align: center;">
        <h1 style="color: green">THE STARBUCK</h1>
        <h3>YOUR INVOICE</h3>
        <embed src="<%= Asset.url("/template/invoice.pdf")%>"
               width="800"
               height="1200">
    </div>
    <div class="row pt-lg-3 buttons mb-sm-0 mb-2">
        <div class="col-md-6 pt-md-0 pt-3">
            <div class="btnNav text-uppercase btnBack">Print</div>
        </div>
        <div class="col-md-6 pt-md-0 pt-3" onclick="">
            <div class="btnNav ml-auto text-uppercase btnContinue">Download</div>
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