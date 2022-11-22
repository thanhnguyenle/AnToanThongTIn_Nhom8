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
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/cart.css")%>" />
    <!-- datatable -->
    <link rel="stylesheet" href="<%= Asset.url("/vendor/dt/datatables.min.css")%>" />

  <title>History</title>
</head>

<body>

  <!-- Navigation -->
  <jsp:include page="layout/header.jsp"/>

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
                              <input class="changeQuantity" type="number" pid="${product.id}" value="${product.quantitySold}" min="1"  max="${product.quantity}"/>
                              </td>
                              <td>
                              </td>
                              <td>
                                  <div class="price-wrap align-items-center"> <var class="price">$${product.price}</var></div>
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
      </div>
  </section>
  <!-- Footer -->
  <jsp:include page="layout/footer.jsp"/>
  <!-- End Footer -->
  <!-- jquery -->
  <jsp:include page="layout/script.jsp"/>
<%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
  <!-- Custom Scripts -->
  <script src="<%= Asset.url("/template/web/js/cart.js")%>"></script>

  <!-- datatable -->
  <script src="<%= Asset.url("/vendor/dt/datatables.min.js")%>"></script>
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
      console.log('abc');
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
      $('#cart tbody .changeQuantity').on('blur', function (){
          // send ajax to remove product in cart
          var id=$(this).attr('pid');
          var quantity=$(this).val();
          thisRow = $(this);
          $.ajax({
              url: '<%=request.getContextPath()%>/cart-updateQuantity',
              type: 'POST',
              data: {
                  id: id,
                  quantity: quantity
              },
              success: function (data) {
                  JSQuantity = JSON.parse(data);
                  thisRow.val(JSQuantity.quantity);
                  updateQuantity(cart, id, JSQuantity.quantity);
                  loadCart(cart);
              },
              error: function (data) {
                  alert('Product is not in cart');
              }
          });
      });
  } );
  function loadCart(cart){
    var sub_sum = 0;
    var sum = 0;

    for (const x in cart.productList) {
      sub_sum += cart.productList[x].quantitySold * (cart.productList[x].price - (cart.productList[x].price * cart.productList[x].discount));
      // sumItem += 1;
    }
    console.log(sum);
    sum = sub_sum + sub_sum * 0.01;
    $(".sub-total-cart").html("$" + sub_sum) ;
    $(".total-cart").html("$" + sum);
  }
  function updateQuantity(cart, id, quantity){
      cart.productList[id].quantitySold =quantity;
  }
</script>
</body>

</html>