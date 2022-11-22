
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layout/css.jsp"/>
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/profileChange.css")%>"/>
    <!-- Custom StyleSheet -->
    <title>ChangePassword</title>
</head>

<body>
<!-- Navigation -->
<jsp:include page="layout/header.jsp"/>
<br/>
<br/>
<br/>
<div class="container">
    <br/>
    <form class="bg-white shadow rounded-lg d-block d-sm-flex" method="post"
          action="${pageContext.request.contextPath}/user-profile-pass">
        <div class="profile-tab-nav border-right">
            <div class="p-4">
                <div class="img-circle text-center mb-3 file-upload">
                    <label for="avatar-input">
                        <img src="${account.avatar}" alt="Image" class="shadow"/>
                    </label>
                    <input type="file" accept="image/*" id="avatar-input">
                </div>
                <h4 class="text-center">${account.fullname}</h4>
            </div>
        </div>
        <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="account" role="tabpanel"
                 aria-labelledby="account-tab">
                <h3 class="mb-4">Account Settings</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>User name</label>
                            <input type="text" class="form-control" name="user-name"
                                   value="${account.username}" disabled>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Password Old</label>
                            <input type="password" class="form-control" name="passwordOld">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Password New</label>
                            <input type="password" class="form-control" name="passwordNew">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Retype Passowrd</label>
                            <input type="password" class="form-control" name="passwordRetype">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <button class="btn btn-primary" type="submit">Update</button>
                    <button class="btn btn-light" type="reset">Reset</button>
                </div>
            </div>
        </div>
</form>
</div>
<br/>
<br/>
<br/>
<jsp:include page="layout/footer.jsp"/>
<!-- End Footer -->
<script src="<%= Asset.url("/template/web/js/profileAccount.js")%>"></script>
</body>
</html>
