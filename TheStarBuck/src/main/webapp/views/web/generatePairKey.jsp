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
		.container-popup-pairkey{
			background-color: white;
			width: 60%;
			margin: 150px auto auto;
		}

		.form-group > label {
			font-size: 17.5px;
			font-weight: 600;
		}
		.modal-generate {
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
<div class="container modal-generate">
	<div class="container-popup-pairkey">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h2>Generate Certificate</h2>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form role="form" class="ng-pristine ng-valid ng-submitted">
							<hr/>
							<h4 class="mb-4">User info Settings</h4>
							<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Common Name</label>
									<input type="text" class="form-control" name="CN" value="" id="CN">
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Organization Unit</label>
									<input type="text" class="form-control" name="OU" value="" id="OU">
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Organization Name</label>
									<input type="text" class="form-control" name="O" value="" id="O">
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Locality Name</label>
									<input type="text" class="form-control" name="L" value="" id="L">
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>State Name</label>
									<input type="text" class="form-control" name="S" value="" id="S">
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Country</label>
									<input type="text" class="form-control" name="C" value="" id="C">
								</div>
							</div>
							</div>
							<hr/>
							<h4 class="mb-4">KeyStore Settings</h4>
							<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="form-group">
								<label for="keySize">Select Key Size</label>
								<select class="form-control input-lg ng-pristine ng-valid ng-touched" id="keySize" name="keySize">
									<option value="512">515 bit</option>
									<option value="1024" selected>1024 bit</option>
									<option value="2048">2048 bit</option>
									<option value="3072">3072 bit</option>
									<option value="4096">4096 bit</option>
								</select>
							</div>
							</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Algorithm Generate Key</label>
									<select class="form-control input-lg ng-pristine ng-valid ng-touched" name="algorithmGenKey" id="algorithmGenKey">
										<option value="RSA">RSA</option>
										<option value="DSA" selected>DSA</option>
										<option value="EC">EC</option>
									</select>
								</div>
							</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Algorithm Hashing</label>
									<select  class="form-control input-lg ng-pristine ng-valid ng-touched" name="algorithmHashing" id="algorithmHashing">
										<option value="MD5">MD5</option>
										<option value="SHA1">SHA-1</option>
										<option value="SHA224">SHA-224</option>
										<option value="SHA256" selected>SHA-256</option>
										<option value="SHA384">SHA-384</option>
										<option value="SHA512">SHA-512</option>
									</select>
								</div>
							</div>
							</div>
							<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6">
								<div class="form-group">
									<label>Password KeyStore</label>
									<input type="password" class="form-control" name="passKeyStore" id="passKeyStore">
								</div>
							</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<div class="form-group">
										<label>Re-Password KeyStore</label>
										<input type="password" class="form-control" name="re-passKeyStore" id="re-passKeyStore">
									</div>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-primary" type="button" name="generateKey" onclick="generatePairKey()">Generate Key Pair</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<h3>Public Key</h3>
				<form role="form" class="ng-pristine ng-valid">
					<div class="form-group">
						<textarea id="publicKeyG" class="form-control input-lg ng-pristine ng-valid ng-touched" rows="5" placeholder="Public key will appear here." name="publicKeyG" readonly></textarea>
					</div>
				</form>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12 vertical-line">
				<h3>Private Key</h3>
				<form role="form" class="ng-pristine ng-valid">
					<div class="form-group">
						<textarea id="privateKey" class="form-control input-lg ng-pristine ng-untouched ng-valid" rows="5" placeholder="Private key will appear here." name="privateKey" readonly></textarea>
					</div>
				</form>
			</div>
		</div>
		<div class="buttonBottom">
			<button type="button" onclick="closeInvoicePopup()">Close</button>
			<button type="button" onclick="downloadKey()">Download Key</button>
		</div>
	</div>
</div>

<script>

	function downloadKey(){
		downloadJKS();
	}
	function generatePairKey(){
		let cn = $("#CN").val();
		let ou = $("#OU").val();
		let o = $("#O").val();
		let l = $("#L").val();
		let s = $("#S").val();
		let c = $("#C").val();
		let keySize = $("#keySize :selected").val();
		let algorithmGenKey = $("#algorithmGenKey :selected").val();
		let algorithmHashing = $("#algorithmHashing :selected").val();
		let passKeyStore = $("#passKeyStore").val();
		$.ajax({
			type: "Post",
			url: "/TheStarBuck/generate-cer",
			ContentType: 'json',
			headers: { Accept: "application/json;charset=utf-8" },
			data:{"CN":cn,"OU":ou,"O":o,"L":l,"S":s,"C":c,"keySize":keySize,"algorithmGenKey":algorithmGenKey,"algorithmHashing":algorithmHashing,"passKeyStore":passKeyStore},
			success: async function (json) {
				if (json !== undefined && json != null) {
					let val = json;
					$("#privateKey").text(val.privateKey);
					$("#publicKeyG").text(val.publicKey);
				}
			},
			error: function (){
				alert("GENERATE CERTIFICATE ERROR!");
			}
		});
	}
	function closeInvoicePopup(){
		document.querySelectorAll(".modal-generate").forEach(a=>a.style.display = "none");
	}
	async function screenLoader_Global() {
		$('<div class="loader-mask"><div class="loader"></div></div>').appendTo('body');
	}

	async function remove_screenLoader_Global() {
		$('.loader-mask').remove();
	}

	function downloadJKS() {
		window.location.assign("/TheStarBuck/downloadJKSFile");
	}

</script>
</body>
</html>