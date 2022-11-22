<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>ForgetPassword</title>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="shortcut icon" type="images/logo.png" href="https://i.ibb.co/nMxcqW4/logo.png">
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/createAcc.css")%>">
</head>

<body>
    <section class=" container login my-5 bg-light">
        <div class="">
            <div class="row g-0">
                <div class="col-lg-5 thumb-box">
                    <img src="<c:url value="/template/web/image/loginTitle2.svg"/>" class="img-fluid" alt="" srcset="">
                </div>
                <div class="col-lg-7 text-center py-4 loginContent">
                    <h1>FORGOT PASSWORD</h1>
                    <form>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                    <input type="text" class="inp px-3" placeholder="email" name="email" id="email">
                            </div>
                        </div>
                            <div class="offset-1 col-lg-10">
                                <button type="button" class="btn1" onclick="sendMail()">Submit</button>
                            </div>
                    </form>                    
                    </div>
                </div>
            </div>
    </section>

<%--<script src="<%= Asset.url("/template/web/js/login.js")%>"></script>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>--%>
<script>

  function sendMail(){
      let email = document.getElementById("email").value;
      console.log(email);
      let xhr = new XMLHttpRequest();
      xhr.open("POST", "${pageContext.request.contextPath}/send_mail");
      xhr.setRequestHeader("Accept", "application/json");
      xhr.setRequestHeader("Content-Type", "application/json");

      xhr.onreadystatechange = function () {
          if (xhr.readyState === 4) {
              console.log(xhr.status);
              console.log(xhr.responseText);
          }};
      let data = `{"hello":\"`+email+`\"}`;
      console.log(data);
      xhr.send(data);
  }
</script>
</body>
</html>