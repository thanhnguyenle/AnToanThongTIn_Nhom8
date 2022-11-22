<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 18/1/2022
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Orders" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Orders order = (Orders) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>

<head>
  <title>Edit Order</title>
  <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
  <jsp:include page="layout/header.jsp"/>


  <div id="page-wrapper">
    <div class="row">
      <div class="col-lg-12">
        <h1 class="page-header">Edit Order</h1>
      </div>
      <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            Data Order
          </div>
          <div class="panel-body">
            <form role="form">
              <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Id order</label>
                        <input class="form-control" name="idOrder" placeholder="id order" disabled value="${order.id}">
                    </div>
                  <div class="form-group">
                    <label>User order</label>
                      <input class="form-control" name="sessionId" placeholder="Session id" disabled value="${order.idAccount}">
                </div>
                <div class="form-group">
                  <label>Session</label>
                  <input class="form-control" name="sessionId" placeholder="Session id" disabled value="${order.idSession}">
                </div>
                <div class="form-group">
                  <label>Token</label>
                  <input class="form-control" name="token" placeholder="Identify it over multiple sessions" disabled value="${order.token}">
                </div>
                <div class="form-group">
                  <label>Status</label>
                  <select class="form-control" name="status" disabled>
                    <option value="new">New</option>
                    <option value="checkout">Checkout</option>
                    <option value="paid">Paid</option>
                    <option value="failed" selected>Failed</option>
                    <option value="shipped">Shipped</option>
                    <option value="delivered">Delivered</option>
                    <option value="returned">Returned</option>
                    <option value="complete">Complete</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Discount</label>
                  <input class="form-control" type="number" name="discount" placeholder="Enter discount" value="0">
                </div>
                <div class="form-group">
                  <label>Tax</label>
                  <input class="form-control" type="number" name="tax" placeholder="Enter tax" value="${order.tax}">
                </div>

              </div>
              <div class="col-lg-6">
                <div class="form-group">
                  <label>Shipping</label>
                  <input class="form-control" type="text" name="shipping" placeholder="Enter shipping" value="${order.shipping}">
                </div>
                <div class="form-group">
                  <label>Grand total</label>
                  <input class="form-control" type="number" name="grandTotal" placeholder="Enter total" value="${order.grandTotal}">
                </div>
                <div class="form-group">
                  <label>Promo</label>
                  <input class="form-control" type="text" name="promo" placeholder="Enter promo" value="${order.promo}">
                </div>
                <div class="form-group">
                  <label>Note</label>
                  <textarea class="form-control" type="text" name="note" placeholder="Enter note" style="margin: 0px 24.1px 0px 0px; width: 549px; height: 133px;">${order.note}</textarea>
                </div>

              </div>

              <button type="submit" name="update" class="btn btn-success">Update</button>
              <button type="reset"  name="reset" class="btn btn-default">Reset</button>

          </div>

          </form>
        </div>
        <!-- /.row (nested) -->
      </div>
      <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
</body>

</html>

