<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 13/2/2022
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) session.getAttribute("account");
%>
<!DOCTYPE html>
<html>

<head>
    <title>Profile</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Profile</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="col-xl col-lg flex-grow-0" style="flex-basis:230px">
                    <div class="img-thumbnail shadow w-100 bg-white position-relative text-center" style="height:310px; width:310px" >
                        <img  src="https://i.pravatar.cc/500?img=" class="center-xy img-fluid" alt="Logo Employee" style="height:300px; width:300px;">
                    </div>
                </div> <!--  col.// -->
                <div class="col-xl col-lg">
                    <h3>${account.fullname}</h3>
                    <p style="font-size:20px"><span>Address description</span>
                    </p>

                </div> <!--  col.// -->
                <div class="col-xl-4 text-md-end">
                    <select class="form-select w-auto d-inline-block" style="padding:10px" name="active">
                        <option value="1" <c:if test="${acc.active == true}"> selected </c:if>>Active</option>
                        <option value="0" <c:if test="${acc.active == false}"> selected </c:if>>Not</option>
                    </select>
                    <a href="#" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-edit" data-whatever="@mdo" style="font-size:20px;color: white; background-color:rgb(7, 124, 22)"> Edit</i> </a>
                    <a href="changepassword.html" class="btn btn-outline-primary"  style="font-size:20px;color: white; background-color:rgb(7, 124, 22)"> ChangePassword</i> </a>
                    <div class="modal fade text-md-start" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="modalEdit"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered  modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Information</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/admin-profile" method="post">
                                        <div class="card-body1">
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <label for="employee_name" class="form-label">Name</label>
                                                    <input type="text" placeholder="Enter your name" value="${account.fullname}" class="form-control" id="employee_name" name="fullNameAccount">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <label for="employee_email" class="form-label">Email</label>
                                                    <input type="email" placeholder="Enter your email" value="${account.email}" class="form-control" id="employee_email" name="emailAccount">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <label for="employee_telephone" class="form-label">SĐT</label>
                                                    <input type="tel"
<%--                                                           pattern="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$"--%>
                                                           placeholder="Enter phone number" value="${account.phoneNumber}" class="form-control" id="employee_telephone" required name="phoneAccount">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4 form-group">
                                                    <label for="employee_date-work" class="form-label"> Date to doing</label>
                                                    <div class="col-12">
                                                        <input type="date"  class="form-control" id="employee_date-work" name="">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4 form-group">
                                                    <label  class="form-label">Service</label>
                                                    <select class="col-12 form-control form-select" name="groupId">
                                                        <option value="0" <c:if test="${acc.groupId.equals('MOD')}"> selected </c:if>>Manager</option>
                                                        <option value="1" <c:if test="${acc.groupId.equals('ADMIN')}"> selected </c:if>>Admin</option>
                                                        <option value="2" <c:if test="${acc.groupId.equals('MEMBER')}"> selected </c:if>>Member</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <label for="employee_address" class="form-label">Address</label>
                                                    <input type="text" placeholder="Enter your address" class="form-control" id="employee_address">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <select class="diem-diem-item col-12 form-control form-select" onChange="clickTinhThanhPho(this)"
                                                            id="tinh-thanh-pho">
                                                        <option value="">Province</option>
                                                    </select>
                                                </div>
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <select class="diem-diem-item col-12 form-control form-select" onchange="clickQuanHuyen(this)"
                                                            id="quan-huyen">
                                                        <option value="">District</option>
                                                    </select>
                                                </div>
                                                <div class="col-xl-4 col-sm-12 mb-4 form-group">
                                                    <select class="diem-diem-item col-12 form-control form-select" id="phuong-xa">
                                                        <option value="">Ward</option>
                                                    </select>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-xl-4 col-sm-12 form-group">
                                                    <label class="form-label">Note</label>
                                                    <textarea placeholder="Enter your note" class="form-control" rows="4"></textarea>
                                                </div>
                                            </div> <!-- card end// -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Save</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div> <!--  col.// -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
</body>

</html>

