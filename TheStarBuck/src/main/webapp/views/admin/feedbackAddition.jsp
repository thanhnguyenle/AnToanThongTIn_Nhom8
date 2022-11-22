<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/1/2022
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Category" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Add Feedback</title>
    <jsp:include page="layout/css.jsp"/>

</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add FeedBack</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data FeedBack
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/createFeedback" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>Id account</label>
                                        <input class="form-control" name="idAccount"  placeholder="Enter id account">
                                    </div>
                                    <div class="form-group">
                                        <label>Id product</label>
                                        <input class="form-control" name="idProduct" placeholder="Enter id product">
                                    </div>
                                    <div class="form-group">
                                        <label>Content</label>
                                        <input class="form-control" name="contentAccount" placeholder="Enter phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Rate</label>
                                        <input class="form-control" type="number" name="rate" min="1" max="5" placeholder="Enter rate">
                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <input class="form-control" type="text" name="status" placeholder="Enter created by">
                                    </div>
                                    <div class="form-group">
                                        <label>Created By</label>
                                        <input class="form-control" type="text" name="createdBy" placeholder="Enter created by">
                                    </div>
                                    <button type="submit" name="update" class="btn btn-success">Update</button>
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

