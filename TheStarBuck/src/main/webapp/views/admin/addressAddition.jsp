<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 22/6/2022
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Category" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Add Address</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Address</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Address
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/createAddress" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>AccountId</label>
                                        <input class="form-control" name="accountId" disabled value="${sessionScope["account"].id}">
                                    </div>
                                    <div class="form-group">
                                        <label for="province">ProvinceCode</label>
                                        <select class="form-control" name="province" id="province" value></select>
                                    </div>
                                    <div class="form-group">
                                        <label for="district">DistrictCode</label>
                                        <select class="form-control" name="district" id="district"></select>
                                    </div>
                                    <div class="form-group">
                                        <label for="ward">WardCode</label>
                                        <select class="form-control" name="ward" id ="ward"></select>
                                    </div>
                                    <div class="form-group">
                                        <label>AddressDetail</label>
                                        <input class="form-control" type="text" name="addressDetail" placeholder="Enter addressDetail" >
                                    </div>
                                    <div class="form-group">
                                        <label>Created by</label>
                                        <input class="form-control" name="createdBy" placeholder="Enter create by">
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
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>

<!-- Page-Level Demo Scripts - Blank - Use for reference -->
<script src="js/addressAjax.js"></script>
</body>

</html>
