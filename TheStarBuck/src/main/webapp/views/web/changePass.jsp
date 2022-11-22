<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layout/css.jsp"/>
    <title>Change Password</title>
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/forgotpass.css")%>" />
</head>

<body>
    <section class="container login my-5 bg-light">
        <div class="">
            <div class="row g-0">
                <div class="col-lg-5 thumb-box">
                    <img src="images/change.png" class="img-fluid" alt="" srcset="">
                </div>
                <div class="col-lg-7 text-center py-4 loginContent">
                    <h1>CHANGE PASSWORD</h1>
                    <form>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="password" class="inp px-3 ipnPassword" placeholder="old password" id="passold">
                                <button class="btn btn-outline-secondary btnPassword" type="button" id="passeyeold">
                                    <span class="fas fa-eye"></span>
                                  </button>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="password" class="inp px-3 ipnPassword" placeholder="password" id="pass">
                                <button class="btn btn-outline-secondary btnPassword" type="button" id="passeye">
                                    <span class="fas fa-eye"></span>
                                  </button>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="password" class="inp px-3 ipnPassword" placeholder="retype password" id="retypepass">
                                <button class="btn btn-outline-secondary btnPassword" type="button" id="retypeeye">
                                    <span class="fas fa-eye"></span>
                                  </button>
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
<jsp:include page="/template/web/js/login.js"/>
<%--<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg></script>--%>

</html>