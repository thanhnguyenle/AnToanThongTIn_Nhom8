<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="<%= Asset.url("/template/web/css/profileAccount.css")%>" />
	<!-- Custom StyleSheet -->
	<title>Invoice</title>
	<style>
		.container-popup{
			background-color: white;
			width: 65%;
			height: 50%;
			margin: 150px auto auto;
			padding: 32px 40px;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		}

		.container-popup h1 {
			text-align: center;
		}

		#downloadBtn {
			border: none;
			padding: 5px 10px;
			border-radius: 10px;
			background-color: #0e784d;
			color: white;
			margin-bottom: 25px;
		}

		input[type=file] {
			padding: 10px 0px;
			border-radius: 0px !important;
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

		form {
			font-weight: bold;
		}
		.modal-invoice {
			display: block;
			position: fixed;
			max-width: 100%;
			width: 100%;
			z-index: 1050;
			background-color: rgba(0, 0, 0, 0.4);
			margin: auto;
			padding-top: 6%;
			overflow: auto;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			outline: 0;
		}

	</style>
</head>

<body>
<div class="container modal-invoice">
	<div class="container-popup">
		<h1>VERIFY INVOICE</h1>
		<br />
		<br />
		<%--		download file pdf--%>
		<button id="downloadBtn" onclick="return downloadInvoice()">Download Invoice PDF</button>
		<%--		upload file pdf--%>
		<form method="post" action="${pageContext.request.contextPath}/upload-invoice" enctype="multipart/form-data">
			Choose a file: <br />
			<input type="file" name="file" />
			<div class="buttonBottom">
				<button class="closeBtn" type="button" onclick="closeInvoicePopup()">Close</button>
				<input type="submit" value="Verify" />
			</div>

		</form>
	</div>
</div>

<script>
	function closeInvoicePopup(){
		document.querySelectorAll(".modal-invoice").forEach(a=>a.style.display = "none");
	}
	async function screenLoader_Global() {
		$('<div class="loader-mask"><div class="loader"></div></div>').appendTo('body');
	}

	async function remove_screenLoader_Global() {
		$('.loader-mask').remove();
	}
	function downloadInvoice() {
		screenLoader_Global();
		sendRequestGeneratePDF().then(async function () {
			await remove_screenLoader_Global();
			window.location.assign("/TheStarBuck/download-invoice");
		});

	}
</script>
</body>
</html>
