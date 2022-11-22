<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/1/2022
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <title>Add Account</title>
    <jsp:include page="layout/css.jsp"/>
    <script type="text/javascript" src="<%= Asset.url("/template/lib/ckeditor/ckeditor.js")%>"></script>
    <script type="text/javascript" src="<%= Asset.url("/template/lib/ckfinder/ckfinder.js")%>"></script>
</head>
<body>
<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Accounts</h1>
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
                        <form role="form" action="${pageContext.request.contextPath}/createAccount" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>ID Accounts</label>
                                        <input class="form-control" name="idAccount" placeholder="Enter Id">
                                    </div>
                                    <div class="form-group">
                                        <label>Name Accounts</label>
                                        <input class="form-control"  name="nameAccount" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label>FullName Accounts</label>
                                        <input class="form-control" name="fullNameAccount" placeholder="Enter full name">
                                    </div>

                                    <div class="form-group">
                                        <label>Active</label>
                                        <select class="form-control" name="active">
                                            <option value="0">Inactive</option>
                                            <option value="1">Still active</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Accounts</label>
                                        <input class="form-control" name="phoneAccount" placeholder="Enter phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Accounts</label>
                                        <input class="form-control" type="email" name="emailAccount" placeholder="Enter email" >
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>File Avatar</label>
                                        <input type="button" name="btn_avatar" value="upload" onclick="BrowseServer('')">
                                        <input type="text" name="avatar" id="avatar" value="">
                                        <img id="img_avatar"  src="" style="width: 50px">
                                    </div>
                                    <div class="form-group">
                                        <label>Password Accounts</label>
                                        <input class="form-control" type="password" name="password" placeholder="Enter password">
                                    </div>
                                    <div class="form-group">
                                        <label>Address Accounts</label>
                                        <input class="form-control" type="text" name="address" placeholder="Enter address">
                                    </div>
                                    <div class="form-group">
                                        <label>About Accounts</label>
                                        <input class="form-control" type="text" name="about" placeholder="Enter about">
                                    </div>
                                    <div class="form-group">
                                        <label>GroupId</label>
                                        <select class="form-control" name="groupId">
                                            <option value="ADMIN">ADMIN</option>
                                            <option value="MEMBER">MEMBER</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Created Accounts</label>
<%--                                        <input class="form-control" type="text" name="createdBy" placeholder="Enter created">--%>
                                        <br/>
                                        <textarea id="content" name="createdBy" cols="80" rows="10"></textarea>
                                        <script>
                                            var editor = CKEDITOR.replace( 'content',
                                                {
                                                    filebrowserBrowseUrl : '<%= Asset.url("/template/lib/ckfinder/ckfinder.html")%>',
                                                    filebrowserImageBrowseUrl : '<%= Asset.url("/template/lib/ckfinder/ckfinder.html?type=Images")%>',
                                                    filebrowserFlashBrowseUrl : '<%= Asset.url("/template/lib/ckfinder/ckfinder.html?type=Flash")%>',
                                                    filebrowserUploadUrl :
                                                        '<%= Asset.url("/template/lib/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files&currentFolder=/archive/")%>',
                                                    filebrowserImageUploadUrl :
                                                        '<%= Asset.url("/template/lib/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images&currentFolder=/cars/")%>',
                                                    filebrowserFlashUploadUrl : '<%= Asset.url("/template/lib/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash")%>'
                                                });
                                            CKFinder.setupFCKeditor(editor ,"<%= Asset.url("/template/lib/ckfinder/")%>");
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" name="insert" class="btn btn-success">Insert</button>
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

