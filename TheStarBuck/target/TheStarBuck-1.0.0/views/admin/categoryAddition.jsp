<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/1/2022
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Category" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Add Category</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>



    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Category</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Category
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/createCategory" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>ID Category</label>
                                        <input class="form-control" name="idCategory" placeholder="Enter id">
                                    </div>
                                    <div class="form-group">
                                        <label>Name Category</label>
                                        <input class="form-control" name="nameCategory" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label>Icon Category</label>
                                        <input class="form-control" name="iconCategory" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label>File avatar</label>
                                        <input type="file" name="avatar">
                                    </div>
                                    <div class="form-group">
                                        <label>Active</label>
                                        <select class="form-control" name="active">
                                            <option value="0">NO</option>
                                            <option value="1">YES</option>
                                        </select>
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

<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>

</body>

</html>

