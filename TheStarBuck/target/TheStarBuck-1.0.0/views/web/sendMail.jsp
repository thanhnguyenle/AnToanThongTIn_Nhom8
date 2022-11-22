<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm</title>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="shortcut icon" type="images/logo.png" href="https://i.ibb.co/nMxcqW4/logo.png">
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/forgotpass.css")%>">
</head>

<body style="margin-top:100px;margin-bottom: -50px;">
<section class=" container login my-5 bg-light">
    <div class="">
        <div class="row g-0">
            <div class="col-lg-5 thumb-box">
                <img src="<c:url value="/template/web/image/loginTitle2.svg"/>" class="img-fluid" alt="" srcset="">
            </div>
            <div class="col-lg-7 text-center py-4 loginContent">
                <h1>Confirm</h1>
                <form action="${pageContext.request.contextPath}/send_mail" method="post">
                    <div class="form-row py-3">
                        <div class="offset-1 col-lg-10">
                            <input type="text" class="inp px-3" placeholder="name" name="name">
                        </div>
                    </div>
                    <div class="form-row py-3">
                        <div class="offset-1 col-lg-10">
                            <input type="text" class="inp px-3" placeholder="email" name="email">
                        </div>
                    </div>
                    <div class="form-row py-3">
                        <div class="offset-1 col-lg-10">
                            <button type="submit" class="btn1">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
      </div>
</section>
</body>
<script src="js/login.js"></script>

</html>