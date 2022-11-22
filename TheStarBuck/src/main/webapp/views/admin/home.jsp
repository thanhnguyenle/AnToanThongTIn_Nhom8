<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/1/2022
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) request.getAttribute("account");
%>
<!DOCTYPE html>
<html>

<head>
    <title>Home</title>
    <jsp:include page="layout/css.jsp"/>
    <!-- Page-Level Plugin CSS - Dashboard -->
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/plugins/timeline/timeline.css")%>" />

</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard ${sessionScope["account"].fullname}</h1>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card card-body mb-4 revenue">
                            <article class="icontext">
                                <div class="text">
                                    <h3 class="mb-1">Total revenue</h3>  <span><%=request.getAttribute("sumMoney")%>đ</span>
                                </div>
                            </article>

                        </div> <!-- card  end// -->
                    </div> <!-- col end// -->
                    <div class="col-lg-3">
                        <div class="card card-body mb-4 order">
                            <article class="icontext">
                                <div class="text">
                                    <h3 class="mb-1"> Total order</h3> <span><%=request.getAttribute("totalOrder")%></span>
                                </div>
                            </article>
                        </div> <!-- card end// -->
                    </div> <!-- col end// -->
                    <div class="col-lg-3">
                        <div class="card card-body mb-4 product">
                            <article class="icontext">
                                <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-warning material-icons md-shopping_basket"></i></span>
                                <div class="text">
                                    <h3 class="mb-1">Total product  </h3>  <span><%=request.getAttribute("totalPro")%></span>

                                </div>
                            </article>
                        </div> <!--  end// -->
                    </div> <!-- col end// -->
                    <div class="col-lg-3">
                        <div class="card card-body mb-4 customer">
                            <article class="icontext">
                                <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-danger material-icons md-supervised_user_circle"></i></span>
                                <div class="text">
                                    <h3 class="mb-1">Total customer  </h3>  <span><%=request.getAttribute("totalAcc")%> </span>
                                </div>
                            </article>
                        </div> <!--  end// -->
                    </div> <!-- col end// -->
                </div> <!-- row end// -->
            </div>
            <!-- /.col-lg-12 -->

        </div>
        <div class="row">
            <div class="col-xl-6 col-lg-6">
                <div class="card mb-4">
                    <article class="card-body1">
                        <h3 class="card-title">Selling products</h3>
                        <div class="card-body-main">
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.ibb.co/vvRH5vR/13.png" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Hooded Down Jacket</h4>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.ibb.co/vvRH5vR/13.png" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Hooded Down Jacket</h4>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.ibb.co/vvRH5vR/13.png" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Hooded Down Jacket</h4>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.ibb.co/vvRH5vR/13.png" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Hooded Down Jacket</h4>
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-sm-4 col-4 col-price"> <span>1.000.000đ</span> </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                        </div>
                        <!-- <a href="#" class="btn btn-light">Open analytics <i class="material-icons md-open_in_new"></i> </a> -->
                    </article> <!-- card-body end// -->
                </div> <!-- card end// -->
            </div> <!-- col end// -->
            <div class="col-xl-6 col-lg-6">
                <div class="card mb-4">
                    <article class="card-body1">
                        <h3 class="card-title">VIP customers</h3>
                        <div class="card-body-main">
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.pravatar.cc/500?img=" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Duong Minh Nhu</h4>
                                        </a>
                                    </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.pravatar.cc/500?img=" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Duong Minh Nhu</h4>
                                        </a>
                                    </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.pravatar.cc/500?img=" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Duong Minh Nhu</h4>
                                        </a>
                                    </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                            <article class="itemlist">
                                <div class="row align-items-center">
                                    <div class="col-lg-8 col-sm-8 col-8 flex-grow-1 col-name">
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="https://i.pravatar.cc/500?img=" class="img-sm img-thumbnail" alt="Item">
                                            </div>
                                            <h4 class="mb-0">Duong Minh Nhu</h4>
                                        </a>
                                    </div>
                                </div> <!-- row .// -->
                            </article>  <!-- itemlist  .// -->
                        </div>
                        <!-- <a href="#" class="btn btn-light">Open analytics <i class="material-icons md-open_in_new"></i> </a> -->
                    </article> <!-- card-body end// -->
                </div> <!-- card end// -->
            </div> <!-- col end// -->
        </div> <!-- row end// -->

        <div class="card mb-4">
            <div class="card-body1">
                <h5 class="card-title">Latest orders</h5>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <tr>
                            <td>2323</td>
                            <td><b>Devon Lane</b></td>
                            <td>devon@example.com</td>
                            <td>$778.35</td>
                            <td><span class="badge rounded-pill alert-success">Delivered</span></td>
                            <td>07.05.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2323</td>
                            <td><b>Darrell Steward</b></td>
                            <td>stew123@mysite.com</td>
                            <td>$980.90</td>
                            <td><span class="badge rounded-pill alert-warning">Wait</span></td>
                            <td>12.02.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>9053</td>
                            <td><b>Mike Jonatan</b></td>
                            <td>mike@somename.com</td>
                            <td>$778.35</td>
                            <td><span class="badge rounded-pill alert-warning">Wait</span></td>
                            <td>07.05.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1234</td>
                            <td><b>Ahmed Hassan</b></td>
                            <td>devon@example.com</td>
                            <td>1.000.000đ</td>
                            <td><span class="badge rounded-pill alert-danger">Canceled</span></td>
                            <td>02.01.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>7532</td>
                            <td><b>Abdul Mohammad</b></td>
                            <td>abdu@example.com</td>
                            <td>$190.15</td>
                            <td><span class="badge rounded-pill alert-success">
                        Delivered</span></td>
                            <td>17.02.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2323</td>
                            <td><b>Devon Lane</b></td>
                            <td>devon@example.com</td>
                            <td>$778.35</td>
                            <td><span class="badge rounded-pill alert-success">Delivered</span></td>
                            <td>07.05.2020</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td>4521</td>
                            <td><b>Alex Pushkin</b></td>
                            <td>myphkin@company.com</td>
                            <td>$708.35</td>
                            <td><span class="badge rounded-pill alert-success">Delivered</span></td>
                            <td>01.05.2019</td>
                            <td class="text-end">
                                <a href="#" class="btn btn-light">Detail</a>
                            </td>
                        </tr>
                    </table>
                </div> <!-- table-responsive end// -->
            </div> <!-- card-body end// -->
        </div> <!-- card end// -->
    </div>
    <!-- /#page-wrapper -->
    <!-- Modal -->
    <div class="modal fade" id="deleteObject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Notify</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--SCRIPT--%>
<!-- Page-Level Plugin Scripts - Dashboard -->

<jsp:include page="layout/script.jsp"/>
<!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
<script src="<%= Asset.url("/template/admin/js/demo/dashboard-demo.js")%>"></script>
</body>

</html>
