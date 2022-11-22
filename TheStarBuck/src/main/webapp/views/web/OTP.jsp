<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>OTP</title>
    <jsp:include page="layout/css.jsp"/>
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/forgotpass.css")%>" />
</head>

<body>
    <section class=" container login my-5 bg-light">
        <div class="">
            <div class="row g-0">
                <div class="col-lg-5 thumb-box">
                    <img src="images/otp.png" class="img-fluid" alt="" srcset="">
                </div>
                <div class="col-lg-7 text-center py-4 loginContent">
                    <h1 class="title">SMART OTP</h1>
                    <form>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="text" class="inp px-3" name="authcode" placeholder="OTP code">
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="password" class="inp px-3 ipnPassword" name="newpassword"  placeholder="password" id="pass" >
                                <button class="btn btn-outline-secondary btnPassword" type="button" id="passeye">
                                    <span class="fas fa-eye"></span>
                                  </button>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="password" class="inp px-3 ipnPassword" name="retypepassword"  placeholder="retype password" id="retypepass" >
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
<script src="<%= Asset.url("/template/web/js/login.js")%>"></script>

</html>