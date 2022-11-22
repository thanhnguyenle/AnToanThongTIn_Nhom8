<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/1/2022
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Topping" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Add Toppings</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Topping</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Topping</a>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/createTopping" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Id Topping</label>
                                        <input class="form-control" name="idTopping"
                                               placeholder="Enter id">
                                    </div>
                                    <div class="form-group">
                                        <label>Name Topping</label>
                                        <input class="form-control" name="nameTopping" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input class="form-control" name="price" placeholder="Enter price">
                                    </div>

                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input class="form-control" name="quantity" placeholder="Enter quantity">
                                    </div>

                                    <div class="form-group">
                                        <label>Created By</label>
                                        <input class="form-control" name="createdBy" placeholder="Enter text">
                                    </div>
                                </div>
                                <button type="submit" name="insert" class="btn btn-success">Insert</button>
                                <button type="reset" name="reset" class="btn btn-default">Reset</button>
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

