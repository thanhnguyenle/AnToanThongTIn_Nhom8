<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/1/2022
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.FeedBack" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    FeedBack feedback = (FeedBack) request.getAttribute("feedback");
%>
<!DOCTYPE html>
<html>

<head>
    <title>Adit Feedback</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Edit FeedBack</h1>
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
                        <form role="form" action="${pageContext.request.contextPath}/updateFeedback" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>Id feedback</label>
                                        <input class="form-control" name="idFeedback" value="${feedback.id}" placeholder="Enter id account">
                                    </div>
                                    <div class="form-group">
                                        <label>Id account</label>
                                        <input class="form-control" name="idAccount" value="${feedback.idAccount}" placeholder="Enter id account">
                                    </div>
                                    <div class="form-group">
                                        <label>Id product</label>
                                        <input class="form-control" name="idProduct" value="${feedback.idProduct}" placeholder="Enter id product">
                                    </div>
                                    <div class="form-group">
                                        <label>Content</label>
                                        <input class="form-control" name="contentAccount" value="${feedback.content}" placeholder="Enter phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Rate</label>
                                        <input class="form-control" type="number" name="rate" min="1" max="5" placeholder="Enter rate" value="${feedback.rate}">
                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <input class="form-control" type="text" name="status" placeholder="Enter date create" value="${feedback.status}">
                                    </div>
                                    <div class="form-group">
                                        <label>Modify By</label>
                                        <input class="form-control" type="text" name="modifiedBy" value="${feedback.modifiedBy}" placeholder="Enter created">
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

