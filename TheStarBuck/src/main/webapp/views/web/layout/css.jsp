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
<style>
    /*-----------------------------------------------
	css loader (slack style)
-----------------------------------------------*/

    .loader {
        position: relative;
        width: 5em;
        height: 5em;
        transform: rotate(165deg);
    }

    .loader:before,
    .loader:after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        display: block;
        width: 1em;
        height: 1em;
        border-radius: 0.5em;
        transform: translate(-50%, -50%);
    }

    .loader:before {
        animation: slackbefore 2s infinite;
    }

    .loader:after {
        animation: slackafter 2s infinite;
    }

    @keyframes slackbefore {
        0% {
            width: 1em;
            box-shadow: 2em -1em rgba(225, 20, 98, 0.75), -2em 1em rgba(111, 202, 220, 0.75);
        }
        35% {
            width: 5em;
            box-shadow: 0 -1em rgba(225, 20, 98, 0.75), 0 1em rgba(111, 202, 220, 0.75);
        }
        70% {
            width: 1em;
            box-shadow: -2em -1em rgba(225, 20, 98, 0.75), 2em 1em rgba(111, 202, 220, 0.75);
        }
        100% {
            box-shadow: 2em -1em rgba(225, 20, 98, 0.75), -2em 1em rgba(111, 202, 220, 0.75);
        }
    }

    @keyframes slackafter {
        0% {
            height: 1em;
            box-shadow: 1em 2em rgba(61, 184, 143, 0.75), -1em -2em rgba(233, 169, 32, 0.75);
        }
        35% {
            height: 5em;
            box-shadow: 1em 0 rgba(61, 184, 143, 0.75), -1em 0 rgba(233, 169, 32, 0.75);
        }
        70% {
            height: 1em;
            box-shadow: 1em -2em rgba(61, 184, 143, 0.75), -1em 2em rgba(233, 169, 32, 0.75);
        }
        100% {
            box-shadow: 1em 2em rgba(61, 184, 143, 0.75), -1em -2em rgba(233, 169, 32, 0.75);
        }
    }


    /* position to center */

    .loader {
        position: absolute;
        top: calc(50% - 2.5em);
        left: calc(50% - 2.5em);
    }


    /**
     * disable background
     */

    .loader-mask {
        position: fixed;
        z-index: 9998;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, .5);
        display: table;
        transition: opacity .3s ease;
    }
</style>