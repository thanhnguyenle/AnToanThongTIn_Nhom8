<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/6/2022
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>List Topping</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="https://i.ibb.co/nMxcqW4/logo.png" type="image/png" />
    <!-- Core CSS - Include with every page -->
    <%--    <link href="css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/bootstrap.min.css")%>" />
    <%--    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/font-awesome/css/font-awesome.css")%>" />

    <!-- Page-Level Plugin CSS - Tables -->
    <%--    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/plugins/dataTables/dataTables.bootstrap.css")%>" />

    <!-- SB Admin CSS - Include with every page -->
    <%--    <link href="css/sb-admin.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="<%= Asset.url("/template/admin/css/sb-admin.css")%>" />
    <style>
        .featured-caro{
            display: flex;
            justify-content: space-around;
        }

        .featured-caro-mini{
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            align-content: stretch;
            align-items: center;
        }
        .form-group{
            display: flex;
            justify-content: space-evenly;
        }
        .form-control{
            width: 300px;
        }

        .img-mini{
            background-size: contain;
            background-repeat: no-repeat;
            height: 200px;
            width: 400px;
        }
    </style>
</head>

<body>
<div id="wrapper">
    <jsp:include page="layout/header.jsp"/>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Slide</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Topping
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form id="slide-form" role="form" action="${pageContext.request.contextPath}/updateSlider" method="post">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <h2 class="heading-section mb-5">TITLE</h2>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="featured-caro">
                                            <jsp:useBean id="slidesTitle" scope="request" type="java.util.List"/>
                                            <c:forEach items="${slidesTitle}" var="item">
                                                <input class="form-control" name="${item.id}" id="${item.id}" value="" style="display: none">
                                                <div class="item" style="padding-right: 20px;" onclick="BrowseServer('${item.id}')">
                                                <div class="work">
                                                    <div class="img d-flex align-items-end justify-content-center img-mini" style="background-image: url(${item.image});">
                                                        <div class="text w-100 text-title">
                                                            <h2>${item.greetingH2}</h2>
                                                            <span>${item.greetingSpan}</span>
                                                            <p>${item.greetingP}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                        <div class="form-group">
                                            <label for="titleH2">Greeting H2:
                                            <input class="form-control" name="titleH2" id="titleH2" value="${slidesTitle!=null?slidesTitle.get(0).greetingH2:"ERROR!"}" placeholder="Enter h2 text!">
                                            </label>
                                            <label for="titleSpan">Greeting Span:
                                            <input class="form-control" name="titleSpan" id="titleSpan" value="${slidesTitle!=null?slidesTitle.get(0).greetingSpan:"ERROR!"}" placeholder="Enter span text!">
                                            </label>
                                            <label for="titleP">Greeting P:
                                            <input class="form-control" name="titleP" id="titleP" value="${slidesTitle!=null?slidesTitle.get(0).greetingP:"ERROR!"}" placeholder="Enter p text!">
                                            </label>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="col-md-12 text-center">
                                        <h2 class="heading-section mb-5">MINI SLIDER</h2>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="featured-caro-mini">
                                            <jsp:useBean id="slidesMini" scope="request" type="java.util.List"/>
                                            <c:forEach items="${slidesMini}" var="item">
                                                <input class="form-control" name="${item.id}" id="${item.id}" value="" style="display: none">
                                                <div class="item" style="padding-right: 20px;">
                                                    <div class="work">
                                                        <div id="${item.id}" class="img d-flex align-items-end justify-content-center img-mini" style="background-image: url(${item.image});">
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="col-md-12">
                                        <div class="featured-caro">
                                            <jsp:useBean id="slidesBanner" scope="request" type="java.util.List"/>
                                            <c:forEach items="${slidesBanner}" var="item">
                                                <input class="form-control" name="${item.id}" id="${item.id}" value="" style="display: none">
                                                <div class="item" style="padding-right: 20px;">
                                                    <div class="work">
                                                        <div class="img d-flex align-items-end justify-content-center img-mini" style="background-image: url(${item.image});">
                                                            <h2>${item.greetingH2}</h2>
                                                            <p>${item.greetingP}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <label for="titleH2banner">Greeting H2 banner:
                                        <input class="form-control" name="titleH2banner" id="titleH2banner" value="${slidesBanner!=null?slidesBanner.get(0).greetingH2:"ERROR!"}" placeholder="Enter h2 text!">
                                        </label>
                                        <label for="titleSpanbanner">Greeting Span banner:
                                        <input class="form-control" name="titleSpanbanner" id="titleSpanbanner" value="${slidesBanner!=null?slidesBanner.get(0).greetingSpan:"ERROR!"}" placeholder="Enter span text!">
                                        </label>
                                    </div>
                                    <button type="submit" name="insert" class="btn btn-success">Update</button>
                                    <button type="reset" name="reset" class="btn btn-default">Reset</button>
                                </div>
                    </form>

<%--                        <div class="table-responsive">--%>
<%--                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>id</th>--%>
<%--                                    <th>image</th>--%>
<%--                                    <th>note</th>--%>
<%--                                    <th>greetingH2</th>--%>
<%--                                    <th>greetingSpan</th>--%>
<%--&lt;%&ndash;                                    <th>greetingP</th>&ndash;%&gt;--%>
<%--                                    <th>Operation</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <jsp:useBean id="slides" scope="request" type="java.util.List"/>--%>
<%--                                <c:forEach items="${slides}" var="item">--%>
<%--                                    <tr class="odd gradeX">--%>
<%--                                        <td>${item.id}</td>--%>
<%--                                        <td class="center"><img style="width: 60px "--%>
<%--                                                                src="${item.image}" alt="">--%>
<%--                                        </td>--%>
<%--                                        <td class="center">${item.note}</td>--%>
<%--                                        <td class="center">${item.greetingH2}</td>--%>
<%--                                        <td class="center">${item.greetingSpan}</td>--%>
<%--&lt;%&ndash;                                        <td class="center">${item.greetingP}</td>&ndash;%&gt;--%>
<%--                                        <td class=" text-center">--%>
<%--                                            <a href="<%=request.getContextPath()%>/deleteSlide?id=${item.id}" class="btn btn-danger" data-toggle="modal"--%>
<%--                                               data-target="#deleteObject">Delete</a>--%>
<%--                                            <a href="<%=request.getContextPath()%>/updateSlide?id=${item.id}" target="_blank" class="btn btn-info">Edit</a>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>


<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /#page-wrapper -->

</div>
<%--<!-- /#wrapper -->--%>
<%--&lt;%&ndash;model delete&ndash;%&gt;--%>
<%--<form class="modal fade" id="deleteObject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" method="post"--%>
<%--      aria-hidden="true" action="${pageContext.request.contextPath}/deleteTopping">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h3 class="modal-title" id="exampleModalLabel">Notify</h3>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                Are you sure?--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                <button type="submit" class="btn btn-primary">Delete</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</form>--%>
<%--&lt;%&ndash;model delete&ndash;%&gt;--%>

<!-- Core Scripts - Include with every page -->
<%--<script src="js/jquery-1.10.2.js"></script>--%>
<script src="<%= Asset.url("/template/admin/js/jquery-1.10.2.js")%>"></script>
<%--<script src="js/bootstrap.min.js"></script>--%>
<script src="<%= Asset.url("/template/admin/js/bootstrap.min.js")%>"></script>
<%--<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>--%>
<<script src="<%= Asset.url("/template/admin/js/plugins/metisMenu/jquery.metisMenu.js")%>"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<%--<script src="js/plugins/dataTables/jquery.dataTables.js"></script>--%>
<script src="<%= Asset.url("/template/admin/js/plugins/dataTables/jquery.dataTables.js")%>"></script>
<%--<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>--%>
<script src="<%= Asset.url("/template/admin/js/plugins/dataTables/dataTables.bootstrap.js")%>"></script>
<!-- SB Admin Scripts - Include with every page -->
<%--<script src="js/sb-admin.js"></script>--%>
<script src="<%= Asset.url("/template/admin/js/sb-admin.js")%>"></script>
<script>
    $("#titleH2").on("input",function (){
        $(".text-title h2").text($(this).val());
    });
    $("#titleSpan").on("input",function (){
        $(".text-title span").text($(this).val());
    });
    $("#titleP").on("input",function (){
        $(".text-title p").text($(this).val());
    });
    $("#titleH2banner").on("input",function (){
        $(".text-title p").text($(this).val());
    });
    $("#titleSpanbanner").on("input",function (){
        $(".text-title p").text($(this).val());
    });
    // $(".featured-caro ")

</script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" src="<%= Asset.url("/template/lib/ckeditor/ckeditor.js")%>"></script>
<script type="text/javascript" src="<%= Asset.url("/template/lib/ckfinder/ckfinder.js")%>"></script>
<script type="text/javascript">
    function BrowseServer(id)
    {
        var finder = new CKFinder();
        // finder.basePath = '../';
        finder.selectActionFunction = function (fileUrl){
            console.log(document.getElementById(id));
            $("input[name=\'"+id+"\']").val(fileUrl);
        };
        finder.popup();
    }

</script>
<script>
    // Attach a submit handler to the form
    $( "#slide-form" ).submit(function( event ) {

        // Stop form from submitting normally
        event.preventDefault();

        // Get some values from elements on the page:
        var $form = $( this ),
            titleH2 = $form.find( "input[name='titleH2']" ).val(),
            titleSpan = $form.find( "input[name='titleSpan']" ).val(),
            titleP = $form.find( "input[name='titleP']" ).val(),
            titleH2banner = $form.find( "input[name='titleH2banner']" ).val(),
            titleSpanbanner = $form.find( "input[name='titleSpanbanner']" ).val(),
            url = $form.attr( "action" );
        const titles = {},
            banners = {},
            minis = {};
        let i = 0;
        <c:forEach items="${slidesTitle}" var="item">
        console.log(${item.id});
            titles["${item.id}"] = $form.find( "input[name='${item.id}']" ).val()
        </c:forEach>
        <c:forEach items="${slidesMini}" var="item">
            minis["${item.id}"] = $form.find( "input[name='${item.id}']" ).val()
        </c:forEach>
        <c:forEach items="${slidesBanner}" var="item">
            banners["${item.id}"] = $form.find( "input[name='${item.id}']" ).val()
        </c:forEach>
        // Send the data using post
        var posting = $.post( url, { titleH2:titleH2,titleSpan:titleSpan,titleP:titleP,titleH2banner:titleH2banner,
            titleSpanbanner:titleSpanbanner,titles:JSON.stringify(titles),minis:JSON.stringify(minis),banners:JSON.stringify(banners)} );

        // Put the results in a div
        posting.done(function( data ) {
          alert(data);
        });
    });
</script>
</body>

</html>

