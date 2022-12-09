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
			width: 40%;
			height: 50%;
			margin: 150px auto auto;
		}
	</style>
</head>

<body>
	<div class="container modal-invoice">
		<div class="container-popup">
			<h1>VERIFY INVOICE</h1>
			<br />
			<br />
			<br />
<%--		download file pdf--%>
		<button onclick="return downloadInvoice()">Download Invoice PDF</button>
<%--		upload file pdf--%>
		<form method="post" action="${pageContext.request.contextPath}/upload-invoice" enctype="multipart/form-data">
			Choose a file: <input type="file" name="file" />
			<div class="buttonBottom">
				<button type="button" onclick="closeInvoicePopup()">Close</button>
				<input type="submit" value="Verify" />
			</div>

		</form>
		</div>
	</div>

<script>
	function closeInvoicePopup(){
		document.querySelectorAll(".modal").forEach(a=>a.style.display = "none");
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
