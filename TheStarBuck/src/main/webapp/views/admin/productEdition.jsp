<%
    Product product = (Product) request.getAttribute("product");
%>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/1/2022
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <title>Edit Product</title>
    <jsp:include page="layout/css.jsp"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Edit Product</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Product
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${pageContext.request.contextPath}/updateProduct" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>ID Product</label>
                                        <input class="form-control" name="idProduct" value="${product.id}" placeholder="Enter id">
                                    </div>
                                    <div class="form-group">
                                        <label>Name Product</label>
                                        <input class="form-control" name="nameProduct" value="${product.name}" placeholder="Enter name">
                                    </div>

                                    <div class="form-group">
                                        <label>Type</label>
                                        <select class="form-control" name="type">
                                            <option value="cs0001" <c:if test="${product.idCategory.equals('cs0001')}"> selected </c:if>>Cool drink</option>
                                            <option value="cs0002" <c:if test="${product.idCategory.equals('cs0002')}"> selected </c:if>>Hot drink</option>
                                            <option value="cs0003" <c:if test="${product.idCategory.equals('cs0003')}"> selected </c:if>>Bakery</option>
                                            <option value="cs0004" <c:if test="${product.idCategory.equals('cs0004')}"> selected </c:if>>Bottled water</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Ingredients</label>
                                        <textarea class="form-control" name="Ingredients"
                                                  placeholder="Enter ingredients" rows="3" >${product.ingredients}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input class="form-control" name="price" value="${product.price}" placeholder="Enter price">
                                    </div>
                                    <div class="form-group">
                                        <label>Discount</label>
                                        <input class="form-control" name="discount" placeholder="Enter discount" value="${product.discount}">
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input class="form-control" name="quantity" placeholder="Enter quantity" value="${product.quantity}">
                                    </div>
                                    <div class="form-group">
                                        <label>Active</label>
                                        <select class="form-control" name="active">
                                            <option value="0" <c:if test="${product.active == false}"> selected </c:if>>NO</option>
                                            <option value="1" <c:if test="${product.active == true}"> selected </c:if>>YES</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Hot</label>
                                        <select class="form-control" name="hot">
                                            <option value="0" <c:if test="${product.hot == 0}"> selected </c:if>>NO</option>
                                            <option value="1" <c:if test="${product.hot == 1}"> selected </c:if>>YES</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>View</label>
                                        <input class="form-control" name="view" placeholder="product's view" value="${product.view}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea class="form-control" name="description" placeholder="Description"
                                                  rows="3">${product.description}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>File Image</label>
                                        <input type="button" name="btn_avatar" value="upload" onclick="BrowseServer('${product.id}')">
                                        <input type="text" name="avatar" id="avatar" value="${product.image}">
                                        <img id="img_avatar"  src="${product.image}" style="width: 50px">
                                    </div>
                                    <div class="form-group">
                                        <label>DescriptionSeo</label>
                                        <textarea class="form-control" name="descriptionSeo"
                                                  placeholder="DescriptionSeo" rows="3">${product.descriptionSeo}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>KeywordSeo</label>
                                        <textarea class="form-control" name="keywordSeo" placeholder="KeywordSeo"
                                                  rows="3">${product.keywordSeo}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>TitleSeo</label>
                                        <textarea class="form-control" name="titleSeo" placeholder="TitleSeo"
                                                  rows="3">${product.titleSeo}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Note</label>
                                        <textarea class="form-control" name="Note" placeholder="Enter note"
                                                  rows="3">${product.note}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Date Create</label>
                                        <input class="form-control" name="dateCreated" placeholder="Enter text" value="${product.createdDate}">
                                    </div>
                                    <div class="form-group">
                                        <label>Modified By</label>
                                        <input class="form-control" name="modifiedBy" value="${product.modifiedBy}" placeholder="Enter text">
                                    </div>
                                </div>
                                <button type="submit" name="insert" class="btn btn-success">Update</button>
                                <button type="reset" name="reset" class="btn btn-default">Reset</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<%--SCRIPT--%>
<jsp:include page="layout/script.jsp"/>
<script type="text/javascript" src="<%= Asset.url("/template/lib/ckfinder/ckfinder.js")%>"></script>
<script type="text/javascript">
    function BrowseServer(id)
    {
        var finder = new CKFinder();
        // finder.basePath = '../';
        finder.selectActionFunction = function (fileUrl){
            console.log(document.getElementById(id));
            $("#avatar").val(fileUrl);
            $("#img_avatar").prop('src', fileUrl);
            console.log(fileUrl);
        };
        finder.popup();
    }

</script>

</body>

</html>

