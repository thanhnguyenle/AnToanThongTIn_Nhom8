<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = (String) session.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="427422137099-7af2n9dkd4k6ejnoajc609mtjnlhnoau.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <title>Login</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
          crossorigin="anonymous">
    <link rel="shortcut icon" type="images/logo.png" href="https://i.ibb.co/nMxcqW4/logo.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/css/login.css">
</head>

<body>
<section class="container login my-5 bg-light">
    <div class="">
        <div class="row g-0">
            <div class="col-lg-5 thumb-box">
                <img src="<c:url value="/template/web/image/loginTitle2.svg"/>" class="img-fluid"
                     alt="" srcset="">
            </div>
            <div class="col-lg-7 text-center py-4 loginContent">
                <h1>GET STARTED</h1>
                <div class="logoImg ">
                    <a href="index.jsp"><img src="<c:url value="/template/web/image/logo.png"/>"
                                             alt=""> </a>
                </div>

                <form action="${pageContext.request.contextPath}/doLogin" method="post"
                      class="pt-5">
                    <%
                        if (error != null) {
                    %>
                    <p style="color: red; font-weight: bold" id="error"> <%= error %>
                    <p>
                            <%
                            }
                        %>
                    <div class="form-row py-3 ">
                        <div class="offset-1 col-lg-10">
                            <input type="text" class="inp px-3" placeholder="username"
                                   name="username" <% if(request.getParameter("username") != null) { %>
                                   value="<%= request.getParameter("username") %>" <% } %>>
                        </div>
                    </div>
                    <div class="form-row py-3">
                        <div class="offset-1 col-lg-10">
                            <input type="password" class="inp px-3 ipnPassword"
                                   placeholder="password" id="pass" name="password">
                            <button class="btn btn-outline-secondary btnPassword" type="button"
                                    id="passeye">
                                <span class="fas fa-eye"></span>
                            </button>
                        </div>
                    </div>
                    <div class="form-row py-3">
                        <div class="offset-1 col-lg-10">
                            <button type="submit" class="btn1">Sign Up</button>
                        </div>
                    </div>
                </form>
                <p>Or Login With</p>
                <div id="buttonSo">
                    <fb:login-button scope="public_profile,email" style=" background: #4267b2; border-radius: 1px;  color: white; height: 35px;text-align: center; width: 120px;"
                                     onlogin="checkLoginState();">
                    </fb:login-button>
                    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                </div>
                <div class="pt-3">
                    <a class="creatAcc" href="<c:url value="/views/web/createAcc.jsp" />">Create
                        Account</a>
                </div>
                <div class="pt-3">
                    <a class="forgotPass" href="${pageContext.request.contextPath}/forgotPassword">Forget Password</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- jquery -->
<jsp:include page="layout/script.jsp"/>
<%--    <script src="<c:url value="/template/web/js/login.js"/>"></script>--%>
<script src="${pageContext.request.contextPath}/template/web/js/login.js"></script>

<script>
    var error = document.querySelector('#error');
    if (performance.navigation.type == performance.navigation.TYPE_RELOAD) {
        error.remove();
    } else {
        console.info( "This page is not reloaded");
    }
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        let name =  profile.getName();
        let familyname =  profile.getFamilyName();
       let imgUrl = profile.getImageUrl();
       let email = profile.getEmail();

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        let posting = $.post("${pageContext.request.contextPath}/doLoginGoogle",{name:name,familyname:familyname,imgUrl:imgUrl,email:email});
        posting.done(function (data){
            if (confirm("You want login by current google?") === true) {
                alert("login google success!");
                window.location.replace("${pageContext.request.contextPath}/user-home");
            }
        });
          //facebook
        // Get the modal
        var modal = document.getElementById('id01');
// When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }

    function renderButton() {
        gapi.signin2.render('gSignIn2', {
            'scope': 'profile email',
            'width': 240,
            'height': 50,
            'longtitle': true,
            'theme': 'dark',
            'onsuccess': onSuccess,
            'onfailure': onFailure
        });

    }
    
</script>
<!-- script dang nhap bang facebook -->
<script>
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status === 'connected') {
            // testAPI();
        } else {
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        }
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
        FB.api('/me', {fields: ' name, email'}, function (response) {
            console.log(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '1106802269902043',
            cookie: true,
            xfbml: true,
            version: 'v2.9'
        });


        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // function testAPI() {
    //     console.log('Welcome!  Fetching your information.... ');
    //     FB.api('/me', function (response) {
    //         console.log('Successful login for: ' + response.name);
    //         document.getElementById('status').innerHTML =
    //             'Thanks for logging in, ' + response.name + '!';
    //     });
    // }
</script>

</body>


</html>