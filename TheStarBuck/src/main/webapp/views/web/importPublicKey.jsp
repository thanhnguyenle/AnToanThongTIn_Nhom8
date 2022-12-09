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
			width: 70%;
			height: 50%;
			margin: 150px auto auto;
		}
	</style>
</head>

<body>
	<div class="container modal-import">
		<div class="container-popup">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<h2>Import Your Public Key</h2>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<form role="form" class="ng-pristine ng-valid">
						<div class="form-group">
							<textarea id="publicKey" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="5" placeholder="Public key will appear here." name="publicKey"></textarea>
						<button type="button" onclick="importPublicKey()">Import</button>
						</div>
					</form>
				</div>
			</div>
<%--		upload file pdf--%>
		<form method="post" action="${pageContext.request.contextPath}/upload-invoice" enctype="multipart/form-data">
			Choose a file: <input type="file" name="file" />
			<div class="buttonBottom">
				<button type="button" onclick="closeInvoicePopup()">Close</button>
				<button type="button" onclick="saveKey()">Save Public Key</button>
			</div>

		</form>Key
		</div>
	</div>

<script>
	let isImportPublicKey = false;

	function importPublicKey(){
		isImportPublicKey = true;
	}
	function saveKey(){
		let check = confirm("YOU MUST DOWNLOAD PRIVATE KEY! SYSTEM IS NOT PERMISSION SAVE YOUR PRIVATE KEY!");
		if(check){
			//save key
		}
	}

	function closeInvoicePopup(){
		document.querySelectorAll(".modal").forEach(a=>a.style.display = "none");
	}
	async function screenLoader_Global() {
		$('<div class="loader-mask"><div class="loader"></div></div>').appendTo('body');
	}

	async function remove_screenLoader_Global() {
		$('.loader-mask').remove();
	}

</script>
</body>
</html>
