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

		.form-group > label {
			font-size: 17.5px;
			font-weight: 600;
		}
	</style>
</head>

<body>
<div class="container modal-generate">
	<div class="container-popup">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h2>Generate Pair Key</h2>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form role="form" class="ng-pristine ng-valid ng-submitted">
							<div class="form-group">
								<label for="keySize">Select Key Size</label>
								<select class="form-control input-lg ng-pristine ng-valid ng-touched" id="keySize">
									<option value="512">515 bit</option>
									<option value="1024">1024 bit</option>
									<option value="2048">2048 bit</option>
									<option value="3072">3072 bit</option>
									<option value="4096">4096 bit</option>
								</select>
							</div>
							<div class="form-group">
								<button class="btn btn-primary" name="generateKey" onclick="generatePairKey()">Generate Key Pair
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<h3>Public Key</h3>
				<form role="form" class="ng-pristine ng-valid">
					<div class="form-group">
						<textarea id="publicKey" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="5" placeholder="Public key will appear here." name="publicKey"></textarea>
						<button class="btn btn-primary" name="publicKeyValue" onclick="downloadPublicKey()">Download</button>
					</div>
				</form>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 vertical-line">
				<h3>Private Key</h3>
				<form role="form" class="ng-pristine ng-valid">
					<div class="form-group">
						<textarea id="privateKey" class="form-control input-lg ng-pristine ng-untouched ng-valid" rows="5" placeholder="Private key will appear here." name="privateKey"></textarea>
						<button class="btn btn-primary" name="privateKeyValue" onclick="downloadPrivateKey()">Download</button>
					</div>

				</form>
			</div>
		</div>
		<div class="buttonBottom">
			<button type="button" onclick="closeInvoicePopup()">Close</button>
			<button type="button" onclick="saveKey()">Save Key</button>
		</div>

		</form>
	</div>
</div>

<script>
	let isDownloadPrivateKey = false;
	function downloadPublicKey(){

	}
	function downloadPrivateKey(){
		isDownloadPrivateKey = true;
	}
	function saveKey(){
		let check = confirm("YOU MUST DOWNLOAD PRIVATE KEY! \nSYSTEM IS NOT PERMISSION SAVE YOUR PRIVATE KEY!");
		if(check){
			//save key
		}
	}
	function generatePairKey(){

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