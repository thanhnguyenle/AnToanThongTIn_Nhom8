<%--
  Created by IntelliJ IDEA.
  User: NLTHANH
  Date: 6/6/2022
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link rel="shortcut icon" href="https://i.ibb.co/nMxcqW4/logo.png" type="image/png" />
<!-- Core CSS - Include with every page -->
<link rel="stylesheet" href="<%= Asset.url("/template/admin/css/bootstrap.min.css")%>" />
<link rel="stylesheet" href="<%= Asset.url("/template/admin/font-awesome/css/font-awesome.css")%>" />

<!-- Page-Level Plugin CSS - Tables -->
<link rel="stylesheet" href="<%= Asset.url("/template/admin/css/plugins/dataTables/dataTables.bootstrap.css")%>" />

<!-- SB Admin CSS - Include with every page -->
<link rel="stylesheet" href="<%= Asset.url("/template/admin/css/sb-admin.css")%>" />