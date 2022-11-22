<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorUsername = (String) session.getAttribute("errorUsername");
    String errorEmail = (String) session.getAttribute("errorEmail");
    String errorPassword = (String) session.getAttribute("errorPassword");
    String pleaseFill = (String) session.getAttribute("pleaseFill");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Create Account</title>
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
                    <h1>CREATE ACCOUNT</h1>
                    <form action="${pageContext.request.contextPath}/doRegister" method="post">

                        <div class="offset-1 col-lg-10">
                            <div class="form-row py-3 pt-5">
                                <%
                                    if(pleaseFill != null) {
                                %>
                                <p> <%= pleaseFill %> <p>
                                    <%
                                        }
                                        %>
                                    <%
                                        if(errorUsername != null) {
                                    %>
                                    <p> <%= errorUsername %> <p>
                                        <%
                                        }
                                        %>
                                <input type="text" class="inp px-3" placeholder="username" name="username" <% if(request.getParameter("username") != null) { %> value="<%= request.getParameter("username") %>" <% } %>>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <%
                                    if(errorEmail != null) {
                                %>
                                <p> <%= errorEmail %> <p>
                                    <%
                                        }
                                        %>
                                <input type="text" class="inp px-3" placeholder="email" name="email" <% if(request.getParameter("email") != null) { %> value="<%= request.getParameter("email") %>" <% } %>>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <input type="password" class="inp px-3 ipnPassword"  placeholder="password" id="pass" name="password" <% if(request.getParameter("password") != null) { %> value="<%= request.getParameter("password") %>" <% } %>>
                                <button class="btn btn-outline-secondary btnPassword" type="button" id="passeye">
                                    <span class="fas fa-eye"></span>
                                  </button>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <%
                                    if(errorPassword != null) {
                                %>
                                <p> <%= errorPassword %> <p>
                                    <%
                                        }
                                        %>
                                <input type="password" class="inp px-3 ipnPassword" placeholder="retype password" id="retypepass" name="retypepassword">
                                <button class="btn btn-outline-secondary btnPassword" type="button" id="retypeeye">
                                    <span class="fas fa-eye"></span>
                                  </button>
                            </div>
                        </div>
                        <div class="form-row py-3">
                            <div class="offset-1 col-lg-10">
                                <button type="submit" class="btn1">Create</button>
                            </div>
                        </div>
                    </form>                    
                        <a class="my-3 creatAcc" href="${pageContext.request.contextPath}/doLogin">You Have An Account?</a>
                    </div>
                </div>
            </div>
    </section>

<script src="<%= Asset.url("/template/web/js/login.js")%>"></script>
</body>
</html>