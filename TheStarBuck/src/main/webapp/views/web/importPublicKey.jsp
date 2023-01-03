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
			height: 75%;
			margin: 150px auto auto;
			padding: 28px;
		}

		.container-popup h2 {
			text-align: center;
			font-size: 28px;
		}

		.publicKeyBlock {
			padding: 15px 0;
		}

		.width100 {
			flex: 0 0 100%;
			max-width: 100%;
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
		.modal-import {
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
<div class="container modal-import">
	<div class="container-popup">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h2>Import Your Certificate</h2>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 width100">
				<form role="form" class="ng-pristine ng-valid" enctype="multipart/form-data"  method="POST" id="uploadCertificate">
					<div class="form-group publicKeyBlock">
						<input type="file" style="margin-bottom: 5px" name="data-certificate" id="data-certificate" /> <br/>
						<label for="info">Info Certificate</label><textarea style="margin-bottom: 5px"  id="info" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="6" placeholder="Info Certificate will appear here." name="info" readonly></textarea>
						<label for="publicKey">Public Key (Base64 Format)</label><textarea id="publicKey" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="5" placeholder="Public key will appear here." name="publicKey" readonly></textarea>
						<div class="buttonBottom">
						<button type="button" onclick="importPublicKey()" id="import-cer">Import Certificate</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%--		upload file pdf--%>
		<form method="post" action="${pageContext.request.contextPath}/upload-invoice" enctype="multipart/form-data">
			<div class="buttonBottom">
				<button type="button" onclick="closeInvoicePopup()">Close</button>
				<button type="button" onclick="saveKey()">Save Certificate</button>
			</div>
		</form>
	</div>
</div>

<script>
	let isImportPublicKey = false;

	function importPublicKey(){
		isImportPublicKey = true;
	}
	$('#import-cer').click(function() {
		let form = $('#uploadCertificate')[0];
		let dataForm = new FormData(form);
		$.ajax({
			type : 'POST',
			url : '/TheStarBuck/upload-certificate',
			data : dataForm,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false,
			success : function(json) {
				if (json !== undefined && json != null) {
					let val = json;
					$("#publicKey").text(val.publicKey);
					$("#info").text(val.info);
				}
			},
			error : function() {
				console.log("Fail");
			},
		});
	});
	function saveKey(){
		let form = $('#uploadCertificate')[0];
		let dataForm = new FormData(form);
		$.ajax({
			type : 'POST',
			url : '/TheStarBuck/save-certificate',
			data : dataForm,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false,
			success : function(json) {
				if (json !== undefined && json != null) {
					let val = json;
					alert(val);
				}
			},
			error : function() {
				console.log("Fail");
			},
		});
		closeInvoicePopup();
	}

	function closeInvoicePopup(){
		document.querySelectorAll(".modal-import").forEach(a=>a.style.display = "none");
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
