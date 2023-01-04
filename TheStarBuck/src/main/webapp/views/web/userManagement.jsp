<jsp:useBean id="account" scope="session" type="vn.edu.hcmuaf.fit.laptrinhweb.model.Account"/>

<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>User Management</title>
    <jsp:include page="layout/css.jsp"/>
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/userManagement.css")%>">
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/bootstrap.min.css")%>" />
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/plugins/dataTables/dataTables.bootstrap.css")%>" />
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/font-awesome/css/font-awesome.css")%>" />
    <!-- SB Admin CSS - Include with every page -->
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/sb-admin.css")%>" />
    <style>
        :root {
            --primary: #017143;
            --white: #fff;
            --black: #222;
            --grey1: #3a3b3c;
            --grey2: #828282;
            --back: #62a78a;
            --grey3: #ebebeb;
            --xmas: #d50032;
        }
        body{
            font-size: 1.7rem;
        }
        .fade {
             opacity: 100%;
            -webkit-transition: opacity .15s linear;
            transition: opacity .15s linear;
        }
        .buttonBottom {
            margin-top: 42px;
            display: flex;
            justify-content: space-between;
        }

        .buttonBottom > * {
            padding: 5px 10px;
            border-radius: 5px !important;
            color: #0e784d;
            border-color: #0e784d;
            background-color: transparent;
            border: 2px solid #0e784d;
        }

        .buttonBottom > *:hover {
            background-color: #0e784d;
            color: white;
        }
    </style>

</head>

<body>
<div style="width: 100%;height: 100%">
    <jsp:include page="layout/header.jsp"/>

    <!-- /#page-wrapper -->
    <div class="container emp-profile" style="margin-top: 110px;">
        <form method="post">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile-img">
                        <img src="${account.avatar}" alt=""/>
                        <div class="file btn btn-lg btn-primary">
                            Change Photo
                            <input type="file" name="file"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-7" style="display: flex;align-items: flex-end;margin-bottom: 15px;">
                    <div class="profile-head">
                        <h5>
                           ${account.fullname}
                        </h5>
                        <h6>
                           ${account.aboutMe}
                        </h6>
                        <p class="profile-rating">NUMBER OF INVOICE : <span>0</span></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="invoice-tab" data-toggle="tab" href="#invoice" role="tab" aria-controls="invoice" aria-selected="true">Invoice</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="publickey-tab" data-toggle="tab" href="#publickey" role="tab" aria-controls="publickey" aria-selected="false">Public Key</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
<%--                    <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="profile-work">
                        <p>USERNAME</p>
                        <a href="">${account.username}</a>
                        <p>EMAIL</p>
                        <a href="">${account.email}</a>
                        <p>PHONE NUMBER</p>
                        <a href="">${account.phoneNumber}</a>
                        <p>LAST LOGIN</p>
                        <a href="">${account.lastLogin}</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="invoice" role="tabpanel" aria-labelledby="invoice-tab">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-invoice">
                                                    <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Invoice ID</th>
                                                        <th>Date</th>
                                                        <th>Address</th>
                                                        <th>Phone number</th>
                                                        <th>PDF</th>
                                                        <th>Operation</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <jsp:useBean id="orders" scope="request" type="java.util.List"/>
                                                    <c:forEach items="${orders}" var="item" varStatus="loop">
                                                        <tr class="odd gradeX">
                                                            <td>${loop.count}</td>
                                                            <td>${item.id}</td>
                                                            <td>${item.createdDate}</td>
                                                            <td>${item.address}</td>
                                                            <td class="center">${item.phone}</td>
                                                            <td class="center">  <a href="<%=request.getContextPath()%>/downloadBill?id=${item.promo}" target="_blank" class="btn btn-info">Download</a></td>
                                                            <td class=" text-center">
                                                                <a href="#" onclick="viewBillData('${item.promo}')" class="btn btn-info" data-toggle="modal" data-target="#viewBillObject">View</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                        </div>
                        <div class="tab-pane fade" id="publickey" role="tabpanel" aria-labelledby="publickey-tab">
                            <div class="row" style="margin-left: 50%; margin-bottom: 1%;">
                                <div class="col-lg-12 buttonBottom">
                                    <button type="button" onclick="createPK()"> Create Public key</button>
                                    <button type="button" onclick="importPK()"> Import Public key</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-publickey">
                                                    <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Key ID</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Data</th>
                                                        <th>Status</th>
                                                        <th>Operation</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <jsp:useBean id="publickey" scope="request" type="java.util.List"/>
                                                    <c:forEach items="${publickey}" var="item">
                                                        <tr class="odd gradeX">
                                                            <td>${item.keyID}</td>
                                                            <td>${item.accountID}</td>
                                                            <td>${item.startDate}</td>
                                                            <td>${item.endDate}</td>
                                                            <td class="center">  <a href="<%=request.getContextPath()%>/downloadCertificate?id=${item.keyID}" target="_blank" class="btn btn-info">Download</a></td>
                                                            <td class="center">${item.status}</td>
                                                            <td class=" text-center">
                                                                <a href="<%=request.getContextPath()%>/deleteCertificateUser?id=${item.keyID}" class="btn btn-danger" data-toggle="modal"
                                                                   data-target="#deleteObject">Delete</a>
                                                                <a href="#" onclick="viewData('${item.keyID}')" class="btn btn-info" data-toggle="modal" data-target="#viewObject">View</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Footer -->
<jsp:include page="layout/footer.jsp"/>
<!-- End Footer -->

<!-- /#wrapper -->
<%--model delete--%>
<form class="modal fade" id="deleteObject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" method="post"
      aria-hidden="true" action="${pageContext.request.contextPath}/deleteCertificateUser">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Notify</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Delete</button>
            </div>
        </div>
    </div>
</form>
<%--view--%>
<form class="modal fade" id="viewObject" tabindex="-1" role="presentation" aria-labelledby="exampleModalLabel" method="post"
      aria-hidden="true" action="${pageContext.request.contextPath}/viewCertificate" style="background-color: rgba(0,0,0,-0.5);max-width: 100%;width: 100%;">
    <div class="modal-dialog" role="document" style="margin-top: 245px;">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="view-exampleModalLabel">Information Certificate</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label for="view-info">Info Certificate</label><textarea style="margin-bottom: 5px"  id="view-info" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="6" placeholder="Info Certificate will appear here." name="view-info" readonly></textarea>
                <label for="view-publicKey">Public Key (Base64 Format)</label><textarea id="view-publicKey" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="5" placeholder="Public key will appear here." name="view-publicKey" readonly></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</form>
<%--view bill--%>
<form class="modal fade" id="viewBillObject" tabindex="-1" role="presentation" aria-labelledby="exampleModalLabel" method="post"
      aria-hidden="true" action="${pageContext.request.contextPath}/viewBill" style="background-color: rgba(0,0,0,-0.5);max-width: 100%;width: 100%;">
    <div class="modal-dialog" role="document" style="margin-top: 245px;">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="view-billModalLabel">Information Digital Signing</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="view-body">
                <label for="view-billinfo">Info Certificate</label><textarea style="margin-bottom: 5px"  id="view-billinfo" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="17" placeholder="Info Certificate will appear here." name="view-info" readonly></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</form>
<jsp:include page="layout/script.jsp"/>
<script>
    function  viewBillData(id){
        $.ajax({
            type: "Get",
            url: "/TheStarBuck/viewBill?id="+id,
            ContentType: 'json',
            headers: { Accept: "application/json;charset=utf-8" },
            success: function (json) {
                if (json !== undefined && json != null) {
                    let obj = json;
                    $("#view-billinfo").text(obj.info);
                }
            }
        });
    }
    function viewData(id){
            $.ajax({
                type: "Get",
                url: "/TheStarBuck/viewCertificate?id="+id,
                ContentType: 'json',
                headers: { Accept: "application/json;charset=utf-8" },
                success: function (json) {
                    if (json !== undefined && json != null) {
                        let obj = json;
                        $("#view-info").text(obj.info);
                        $("#view-publicKey").text(obj.publicKey);
                    }
                }
            });
    }
    let onetimeCreate = false;
    let onetimeImport = false;
    function createPK(){

        this.blur(); // Manually remove focus from clicked link.
        if (!onetimeCreate) {
            $.get("/TheStarBuck/views/web/importPublicKey.jsp", function (html) {
                // console.log(html);
               $(html).appendTo('body').modal();
            });
            onetimeCreate = true;
        }else{
            document.querySelectorAll(".modal-import").forEach(a=>a.style.display = "block");
        }
    }
    function importPK(){
        this.blur(); // Manually remove focus from clicked link.
        if (!onetimeImport) {
            $.get("/TheStarBuck/views/web/generatePairKey.jsp", function (html) {
                // console.log(html);
               $(html).appendTo('body').modal();
            });
            onetimeImport = true;
        }else{
            document.querySelectorAll(".modal-generate").forEach(a=>a.style.display = "block");
        }
    }
    $(document).ready(function () {
        $('#dataTables-invoice').dataTable();
        $('#dataTables-publickey').dataTable();
    });

</script>
<script src="<%= Asset.url("/template/admin/js/plugins/dataTables/jquery.dataTables.js")%>"></script>
<script src="<%= Asset.url("/template/admin/js/plugins/dataTables/dataTables.bootstrap.js")%>"></script>
</body>

</html>
