<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/1/2022
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>List Certificate</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Certificate Tables</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data User
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>owner</th>
                                    <th>start date</th>
                                    <th>end date</th>
                                    <th>data</th>
                                    <th>status</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                                <tbody>
                            <jsp:useBean id="cers" scope="request" type="java.util.List"/>
                            <c:forEach items="${cers}" var="item">
                                <tr class="odd gradeX">
                                    <td>${item.keyID}</td>
                                    <td>${item.accountID}</td>
                                    <td>${item.startDate}</td>
                                    <td>${item.endDate}</td>
                                    <td> <a href="<%=request.getContextPath()%>/downloadCertificate?id=${item.keyID}" target="_blank" class="btn btn-info">Download</a></td>
                                    <td class="center">${item.status}</td>
                                    <td class=" text-center">
                                        <a href="<%=request.getContextPath()%>/deleteCertificate?id=${item.keyID}" class="btn btn-danger" data-toggle="modal"
                                           data-target="#deleteObject" >Delete</a>
                                        <a href="#" onclick="viewData('${item.keyID}')" class="btn btn-info" data-toggle="modal"
                                           data-target="#viewObject">View</a>
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
        <!-- /.row -->
        <p id="commonModal"></p>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<%--model delete--%>
<form class="modal fade" id="deleteObject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" method="post"
      aria-hidden="true" action="${pageContext.request.contextPath}/deleteCertificate">
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
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    function viewData(id){
        $.ajax({
            type: "Get",
            url: "${pageContext.request.contextPath}/viewCertificate?id="+id,
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
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
    jQuery(function (){
        url = "${pageContext.request.contextPath}/api/account?action=get";
        $.ajax({
            type: "GET",
            url: url,
            data: {},
            dataType: "json",
            contentType: "application/json",
            success: function (data){
                console.log(data);
            }
        })
    })
</script>
<script src="${pageContext.request.contextPath}/template/admin/js/commonHtml.js"></script>
</body>

</html>
