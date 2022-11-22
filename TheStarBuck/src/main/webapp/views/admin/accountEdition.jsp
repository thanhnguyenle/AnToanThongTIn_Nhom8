<%
    Account acc = (Account) request.getAttribute("acc");
%>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/1/2022
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Edit Account</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> Edit Account</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Account
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/updateAccount" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>ID Accounts</label>
                                        <input class="form-control" name="idAccount" value="${acc.id}" placeholder="Enter Id">
                                    </div>
                                    <div class="form-group">
                                        <label>Name Accounts</label>
                                        <input class="form-control" name="nameAccount" value="${acc.username}" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label>FullName Accounts</label>
                                        <input class="form-control" name="fullNameAccount" value="${acc.fullname}" placeholder="Enter full name">
                                    </div>
                                    <div class="form-group">
                                        <label>Active</label>
                                        <select class="form-control" name="active">
                                            <option value="0" <c:if test="${acc.active == false}"> selected </c:if>>Inactive</option>
                                            <option value="1" <c:if test="${acc.active == true}"> selected </c:if>>Still active</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Accounts</label>
                                        <input class="form-control" name="phoneAccount" value="${acc.phoneNumber}" placeholder="Enter phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Accounts</label>
                                        <input class="form-control" name="emailAccount" value="${acc.email}" placeholder="Enter email">
                                    </div>

                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>File Avatar</label>
                                        <input type="button" name="btn_avatar" value="upload" onclick="BrowseServer('${acc.id}')">
                                        <input type="text" name="avatar" id="avatar" value="${acc.avatar}">
                                        <img id="img_avatar"  src="${acc.avatar}" style="width: 50px">
                                    </div>
                                    <div class="form-group">
                                        <label>Password Accounts</label>
                                        <input class="form-control" type="password" value="${acc.password}" name="password" placeholder="Enter password">
                                    </div>
                                    <div class="form-group">
                                        <label>Address Accounts</label>
                                        <input class="form-control" type="text" name="address" value="${acc.addressId}" placeholder="Enter address">
                                    </div>
                                    <div class="form-group">
                                        <label>About Accounts</label>
                                        <input class="form-control" type="text" name="about" value="${acc.aboutMe}" placeholder="Enter about">
                                    </div>
                                    <div class="form-group">
                                        <label>GroupId</label>
                                        <select class="form-control" name="groupId" >
                                            <option value="ADMIN" <c:if test="${acc.groupId.equals('ADMIN')}"> selected </c:if> >ADMIN</option>
                                            <option value="MEMBER" <c:if test="${acc.groupId.equals('MEMBER')}"> selected </c:if>>MEMBER</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Create data Accounts</label>
                                        <input class="form-control" type="text" name="createData" value="${acc.createdDate}" placeholder="Enter createData">
                                    </div>
                                    <div class="form-group">
                                        <label>Created Accounts</label>
                                        <input class="form-control" type="text" name="created" value="${acc.createdBy}" placeholder="Enter created">
                                    </div>
                                </div>
                            </div>
                            <button type="submit" name="insert" class="btn btn-success">Update</button>
                            <button type="reset"  name="reset" class="btn btn-default">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
<script type="text/javascript" src="<%= Asset.url("/template/lib/ckfinder/ckfinder.js")%>"></script>
<script type="text/javascript">
    function BrowseServer(id)
    {
        var finder = new CKFinder();
        // finder.basePath = '../';
        finder.selectActionFunction = function (fileUrl){
            console.log(document.getElementById(id));
            $("#avatar").val(fileUrl);
            $("#img_avatar").prop('src', fileUrl);
            console.log(fileUrl);
        };
        finder.popup();
    }

</script>
</body>

</html>

