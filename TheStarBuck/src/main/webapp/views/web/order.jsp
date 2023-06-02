
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layout/css.jsp"/>
    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/css/payment.css" />
    <title>Bill</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/css/listorder.css" />

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
<section class="section order" style="margin-top:0;margin-bottom: 6rem;overflow: unset" >
    <div style="text-align: center;">
        <h1 style="color: green">THE STARBUCK</h1>
        <h3>YOUR INVOICE</h3>
        <embed src="${pageContext.request.contextPath}/template/invoice.pdf"
               width="800"
               height="1200">
    </div>
</section>

  <!-- Footer -->
  <jsp:include page="layout/footer.jsp"/>
  <!-- End Footer -->
  <!-- jquery -->
  <jsp:include page="layout/script.jsp"/>
  <!-- Custom Scripts -->
  <script src="${pageContext.request.contextPath}/template/web/js/product.js"></script>
</body>
</html>