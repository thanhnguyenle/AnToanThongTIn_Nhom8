<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/1/2022
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Shipper" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Add Shipper</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Shipper</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Shipper
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/createShipper" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input class="form-control" name="idShipper" placeholder="Enter id">
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input class="form-control" name="nameShipper" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input class="form-control" name="mobile" placeholder="Enter phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input class="form-control" type="text" name="address" placeholder="Enter address">
                                    </div>
                                    <div class="form-group">
                                        <label>Create by</label>
                                        <input class="form-control" type="text" name="createdBy" placeholder="Enter create by ">
                                    </div>
                                    <button type="submit" name="insert" class="btn btn-success">Insert</button>
                                    <button type="reset"  name="reset" class="btn btn-default">Reset</button>
                                </div>
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
