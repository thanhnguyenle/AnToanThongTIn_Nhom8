<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select</title>
    <style>
        .image-management {
            background-image: url('https://cdn-icons-png.flaticon.com/512/2139/2139551.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            color: #FFFFFF;
            width: 300px;
            height: 300px;
        }
        .image-home {
            background-image: url('https://i.ibb.co/nMxcqW4/logo.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            color: #FFFFFF;
            width: 300px;
            height: 300px;
        }
        .select-div{
            display: flex;
            margin-top: 250px;
            justify-content: space-evenly;
        }
         .cursor-pointer {
             cursor: pointer;
         }

    </style>
</head>

<body>
<div  class="select-div">
    <div onclick="redirectManagement()" class="cursor-pointer">
        <div class="image-management"></div>
       <div style="margin-top: 30px;text-align: center;font-weight: bold;">MANAGEMENT</div>
    </div>
    <div onclick="redirectHome()" class="cursor-pointer">
        <div class="image-home"></div>
        <div style="margin-top: 30px;text-align: center;font-weight: bold;">HOME</div>
    </div>

</div>
<script>
    function redirectHome(){
        window.location.href = "${pageContext.request.contextPath}/user-home";
        window.location.assign("${pageContext.request.contextPath}/user-home");
    }
    function redirectManagement(){
        window.location.href = "${pageContext.request.contextPath}/admin-home";
        window.location.assign("${pageContext.request.contextPath}/admin-home");
    }
</script>
</body>

</html>