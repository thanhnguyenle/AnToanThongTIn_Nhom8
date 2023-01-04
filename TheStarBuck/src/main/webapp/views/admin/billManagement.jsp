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
    <title>BILL MANAGEMENT</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>

<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Bill Tables</h1>
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
                                    <th>data</th>
                                    <th>timestamp</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                                <tbody>
                            <jsp:useBean id="bills" scope="request" type="java.util.List"/>
                            <c:forEach items="${bills}" var="item">
                                <tr class="odd gradeX">
                                    <td>${item.billID}</td>
                                    <td>${item.accountID}</td>
                                    <td> <a href="<%=request.getContextPath()%>/downloadBill?id=${item.billID}" target="_blank" class="btn btn-info">Download</a></td>
                                    <td>${item.timestamp}</td>
                                    <td class=" text-center">
                                        <a href="<%=request.getContextPath()%>/deleteBill?id=${item.billID}" class="btn btn-danger" data-toggle="modal"
                                           data-target="#deleteObject" >Delete</a>
                                        <a href="#" onclick="viewBillData('${item.billID}')" class="btn btn-info" data-toggle="modal"
                                           data-target="#viewBillObject">View</a>
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
      aria-hidden="true" action="${pageContext.request.contextPath}/deleteAccount">
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
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
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
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
    jQuery(function (){
        url = "http://localhost:8080/TheStarBuck/api/account?action=get";
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
<script src="<%= Asset.url("/template/admin/js/commonHtml.js")%>"></script>
</body>

</html>
