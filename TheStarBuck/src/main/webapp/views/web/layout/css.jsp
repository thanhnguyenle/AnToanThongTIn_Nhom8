<%--
  Created by IntelliJ IDEA.
  User: NLTHANH
  Date: 6/6/2022
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- font-link -->
<%--Resource hint là một tính năng được hỗ trợ trên các trình duyệt mới, để cải thiện hiệu năng website gồm DNS Prefetching và Preconnect--%>
<%--Preconnect là 1 phiên bản nâng cấp của prefetch: Kết nối đồng thời với request ban đầu, thay vì đợi request đó hoàn thành xong trước = > Giảm thời gian tải trang 100ms--%>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet" />
<!--custom navigation-->
<link rel="stylesheet" href="<%= Asset.url("/template/web/css/navigation.css")%>" />

<!--custom footer-->
<link rel="stylesheet" href="<%= Asset.url("/template/web/css/footer.css")%>" />

<!-- Favicon -->
<link rel="shortcut icon" href="https://i.ibb.co/nMxcqW4/logo.png" type="image/png" />

<!-- Font Awesome 2 VERSION -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<%--<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>--%>

<!-- Boxicons -->
<%--<link href='https://unpkg.com/boxicons@2.0.8/css/boxicons.min.css' rel='stylesheet'>--%>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>

<!--modal-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />