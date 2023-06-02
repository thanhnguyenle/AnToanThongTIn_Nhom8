<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ page import="com.google.gson.Gson" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Account account = (Account) request.getAttribute("account");
%>
<jsp:useBean id="cart" scope="session" type="vn.edu.hcmuaf.fit.laptrinhweb.model.Cart"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layout/css.jsp"/>
    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/css/cart.css" />
    <!-- datatable -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/dt/datatables.min.css" />

  <title>Cart</title>
</head>

<body>

  <!-- Navigation -->
  <jsp:include page="layout/header.jsp"/>
  <header>
      <!--Check-out bar-->
      <div class="row mrCheckout">
          <div class="checkout-wrap col-xcol-md-6 col-sm-11 s-11 pull-right">
              <ul class="checkout-bar">
                  <li class="active checkout-title"><span>CART</span>
                  </li>
                  <li class="checkout-title"><span>CHECKOUT</span>
                  </li>
                  <li class="checkout-title"><span>FINISH</span>
                  </li>
              </ul>
          </div>
      </div>

      <!--End Check-out bar-->
  </header>
  <section class="container" style="margin-top:110px; margin-bottom:80px">
      <div class="row">
          <aside class="col-lg-9">
              <div class="card">
                  <div class="table-responsive">
                      <table class="table table-borderless table-shopping-cart" id="cart">
                          <thead class="text-muted">
                          <tr class="small text-uppercase">
                              <th scope="col">Product</th>
                              <th scope="col" width="120">Quantity</th>
                              <th scope="col" width="20"></th>
                              <th scope="col" width="120">Price</th>
                              <th scope="col" class="text-right d-none d-md-block" width="120"></th>
                          </tr>
                          </thead>
                          <tbody>
                                  <c:set var="products" value="${cart.productList}" />
                                <c:forEach items="${products}" var="product">
                          <tr>
                              <td>
                                  <figure class="itemside align-items-center">
                                      <div class="aside"><img src="${product.image}" class="img-sm"></div>
                                      <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true">${product.name}</a>
                                          <p class="text-muted small">SIZE: L</p>
                                      </figcaption>
                                  </figure>
                              </td>
                              <td>
                                  <div class="number-input">
                                      <button onclick="myStepDown(this.parentNode)" ></button>
                                      <input class="changeQuantity" min="0" name="quantity" type="number" id="${product.id}" value="${product.quantitySold}" max="${product.quantity}" disabled>
                                      <button onclick="myStepUp(this.parentNode)" class="plus"></button>
                                  </div>
<%--                              <input class="changeQuantity" type="number" pid="${product.id}" value="${product.quantitySold}" min="1"  max="${product.quantity}"/>--%>
                              </td>
                              <td>
                              </td>
                              <td>
                                  <div class="price-wrap align-items-center"> <var class="price">$<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${product.price - product.discount}"/></var></div>
                              </td>

                              <td>
                                  <div class="text-right d-none d-md-block">
                                      <a data-original-title="Save to Wishlist" title="" href=""
                                         class="btn btn-light" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a>
                                      <a href="" pid="${product.id}" class="btn btn-light product-remove" data-abc="true"> Remove</a>
                                  </div>
                              </td>
                          </tr>
                                </c:forEach>
                          </tbody>
                      </table>
                  </div>
              </div>
          </aside>
          <aside class="col-lg-3">
              <div class="card">
                  <div class="card-body">
                      <dl class="dlist-align">
                          <dt>Sub Total price:</dt>
                          <dd class="text-right ml-3 sub-total-cart"></dd>
                      </dl>
                      <dl class="dlist-align">
                          <dt>Tax:</dt>
                          <dd class="text-right text-danger ml-3">$0.01</dd>
                      </dl>
                      <dl class="dlist-align">
                          <dt>Total:</dt>
                          <dd class="text-right text-dark b ml-3"><strong class="total-cart"></strong></dd>
                      </dl>
                      <hr> <a href="${pageContext.request.contextPath}/cart-checkout" class="btn btn-out btn-primary btn-square btn-main" data-abc="true"> Make Purchase </a> <a
                          href="${pageContext.request.contextPath}/menu" class="btn btn-out btn-success btn-square btn-main mt-2" data-abc="true">Continue Shopping</a>
                  </div>
              </div>
          </aside>
      </div>
  </section>
  <!-- Footer -->
  <jsp:include page="layout/footer.jsp"/>
  <!-- End Footer -->
  <!-- jquery -->
  <jsp:include page="layout/script.jsp"/>
<%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
  <!-- Custom Scripts -->
  <script src="${pageContext.request.contextPath}/template/web/js/cart.js"></script>

  <!-- datatable -->
  <script src="${pageContext.request.contextPath}/vendor/dt/datatables.min.js"></script>
<%--  <script src="/vendor/dt/datatables.min.js"></script>--%>
<script>

  // $(".sub-total-cart").html("123");
  var cart;
  // var sumItem = 0;
  var dt;
  $(document).ready( function () {
    <% String data = session.getAttribute("cart")==null?"{}":new Gson().toJson(session.getAttribute("cart")); %>
    cart = JSON.parse('<%=data%>');
      // loadCart(cart);
    dt = $('#cart').DataTable({
      paging: false,
      searching: false,
    });
    loadCart(cart);
    $('#cart tbody .product-remove').on('click', function (){
        // send ajax to remove product in cart
        var id=$(this).attr('pid');
        thisRow = $(this);
        $.ajax({
            url: '<%=request.getContextPath()%>/cart-remove',
            type: 'POST',
            data: {
                id: id
            },
            success: function (data) {
                delete cart.productList[id];
                dt.row(thisRow.parents('tr')).remove().draw();
            },
            error: function (data) {
                alert('Product is not in cart');
            }
        });
    });

  } );
  function changeQuantity(parentNode){
      let parent =  parentNode.querySelector('input[type=number]');
      // send ajax to remove product in cart
      let id=parent.getAttribute("id");
      let quantity = parent.value * 1;
      console.log(id);
      if(quantity=="0"){
          //delete product in cart
          let confirmBox = confirm("Remove product ?");
          if (confirmBox === true) {
              $.ajax({
                  url: '<%=request.getContextPath()%>/cart-remove',
                  type: 'POST',
                  data: {
                      id: id,
                  },
                  success: function (data) {
                      delete cart.productList[id];
                      dt.row($(parent).parents('tr')).remove().draw();
                      loadCart(cart);
                      console.log("remove product is success!");
                  },
                  error: function (data) {
                      alert('Product is not in cart');
                  }
              });
          }else{
              parent.value = 1;
          }
      }else{
          $.ajax({
              url: '<%=request.getContextPath()%>/cart-updateQuantity',
              type: 'POST',
              data: {
                  id: id,
                  quantity: quantity
              },
              success: function (data) {
                  JSQuantity = JSON.parse(data);
                  parent.value = (JSQuantity.quantity);
                  updateQuantity(cart, id, JSQuantity.quantity);
                  loadCart(cart);
              },
              error: function (data) {
                  alert('Product is not in cart');
              }
          });
      }
  }
  function loadCart(cart){
      var sub_sum = 0;
      var sum = 0;

      for (const x in cart.productList) {
          sub_sum += Math.round(cart.productList[x].quantitySold * (cart.productList[x].price - cart.productList[x].discount)*100)/100.0;
          // sumItem += 1;
      }
      sum = Math.round((sub_sum + sub_sum * 0.01)*100)/100.0;
      $(".sub-total-cart").html("$" + sub_sum) ;
      $(".total-cart").html("$" + sum);
  }
  function updateQuantity(cart, id, quantity){
      cart.productList[id].quantitySold =quantity;
  }
  function myStepDown(parentNode) {
      let selector = parentNode.querySelector('input[type=number]');
      let val = selector.value*1;
      selector.value = val - 1;
      if(val<val.min) selector.value = 1;
      if(val>val.max) selector.value = val.max;

      changeQuantity(parentNode);
      console.log(val);
  }
  function myStepUp(parentNode) {
      let selector = parentNode.querySelector('input[type=number]');
      let val = selector.value*1;
      selector.value = (val + 1);
      if(val<val.min) selector.value = 1;
      if(val>val.max) selector.value = val.max;
      changeQuantity(parentNode);
      console.log(val);
  }
</script>
</body>

</html>