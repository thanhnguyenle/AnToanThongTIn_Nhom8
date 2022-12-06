<jsp:useBean id="account" scope="session" type="vn.edu.hcmuaf.fit.laptrinhweb.model.Account"/>

<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>User Management</title>
    <jsp:include page="layout/css.jsp"/>
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/userManagement.css")%>">
</head>

<body>
<div style="width: 100%;height: 100%">
    <jsp:include page="layout/header.jsp"/>

    <!-- /#page-wrapper -->
    <div class="container emp-profile" style="margin-top: 110px;">
        <form method="post">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img">
                        <img src="${account.avatar}" alt=""/>
                        <div class="file btn btn-lg btn-primary">
                            Change Photo
                            <input type="file" name="file"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                        <h5>
                           ${account.fullname}
                        </h5>
                        <h6>
                           ${account.aboutMe}
                        </h6>
                        <p class="profile-rating">NUMBER OF INVOICE : <span>0</span></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="invoice-tab" data-toggle="tab" href="#invoice" role="tab" aria-controls="invoice" aria-selected="true">Invoice</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="publickey-tab" data-toggle="tab" href="#publickey" role="tab" aria-controls="publickey" aria-selected="false">Public Key</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
<%--                    <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                        <p>USERNAME</p>
                        <a href="">${account.username}</a>
                        <p>EMAIL</p>
                        <a href="">${account.email}</a>
                        <p>PHONE NUMBER</p>
                        <a href="">${account.phoneNumber}</a>
                        <p>LAST LOGIN</p>
                        <a href="">${account.lastLogin}</a>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="invoice" role="tabpanel" aria-labelledby="invoice-tab">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                    <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Invoice ID</th>
                                                        <th>Date</th>
                                                        <th>Address</th>
                                                        <th>Phone number</th>
                                                        <th>PDF</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
<%--                                                    <jsp:useBean id="feedbacks" scope="request" type="java.util.List"/>--%>
<%--                                                    <c:forEach items="${feedbacks}" var="item">--%>
<%--                                                        <tr class="odd gradeX">--%>
<%--                                                            <td>${item.id}</td>--%>
<%--                                                            <td>${item.idAccount}</td>--%>
<%--                                                            <td>${item.idProduct}</td>--%>
<%--                                                            <td>${item.content}</td>--%>
<%--                                                            <td class="center">${item.rate}</td>--%>
<%--                                                            <td class="center">${item.status}</td>--%>
<%--                                                            <td class=" text-center">--%>
<%--                                                                <a href="<%=request.getContextPath()%>/deleteFeedback?id=${item.id}" class="btn btn-danger" data-toggle="modal"--%>
<%--                                                                   data-target="#deleteObject">Delete</a>--%>
<%--                                                                <a href="<%=request.getContextPath()%>/updateFeedback?id=${item.id}" target="_blank" class="btn btn-info">Edit</a>--%>
<%--                                                            </td>--%>
<%--                                                        </tr>--%>
<%--                                                    </c:forEach>--%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                        </div>
                        <div class="tab-pane fade" id="publickey" role="tabpanel" aria-labelledby="publickey-tab">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                    <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Key ID</th>
                                                        <th>Type Cypher</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Text File</th>
                                                        <th>Operation</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
<%--                                                    <jsp:useBean id="feedbacks" scope="request" type="java.util.List"/>--%>
<%--                                                    <c:forEach items="${feedbacks}" var="item">--%>
<%--                                                        <tr class="odd gradeX">--%>
<%--                                                            <td>${item.id}</td>--%>
<%--                                                            <td>${item.idAccount}</td>--%>
<%--                                                            <td>${item.idProduct}</td>--%>
<%--                                                            <td>${item.content}</td>--%>
<%--                                                            <td class="center">${item.rate}</td>--%>
<%--                                                            <td class="center">${item.status}</td>--%>
<%--                                                            <td class=" text-center">--%>
<%--                                                                <a href="<%=request.getContextPath()%>/deleteFeedback?id=${item.id}" class="btn btn-danger" data-toggle="modal"--%>
<%--                                                                   data-target="#deleteObject">Delete</a>--%>
<%--                                                                <a href="<%=request.getContextPath()%>/updateFeedback?id=${item.id}" target="_blank" class="btn btn-info">Edit</a>--%>
<%--                                                            </td>--%>
<%--                                                        </tr>--%>
<%--                                                    </c:forEach>--%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /#wrapper -->
<%--model delete--%>
<form class="modal fade" id="deleteObject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" method="post"
      aria-hidden="true" action="${pageContext.request.contextPath}/deleteFeedback">
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
                <button type="submit" class="btn btn-primary">Delete</button>
            </div>
        </div>
    </div>
</form>
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
<script>
    $(document).ready(function () {
        $('.dataTables-example').dataTable();
    });
</script>

</body>

</html>
