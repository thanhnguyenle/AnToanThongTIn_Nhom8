<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/1/2022
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">Admin Starbucks</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="<%=request.getContextPath()%>/user-home"><i class="fa fa-home fa-fw"></i> GO TO MY WEB</a>
                <li><a href="<%=request.getContextPath()%>/admin-profile"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li>
                    <a href="changerole.html"><i class="fa fa-gear fa-fw"></i> Setting</a>
                </li>
                <li class="divider"></li>
                <li><a href="<%=request.getContextPath()%>/doLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default navbar-static-side" role="navigation">
        <jsp:include page="menu.jsp"/>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
