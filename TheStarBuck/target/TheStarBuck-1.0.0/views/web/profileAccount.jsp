<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="layout/css.jsp"/>
	<link rel="stylesheet" href="<%= Asset.url("/template/web/css/profileAccount.css")%>" />
	<!-- Custom StyleSheet -->
	<title>Profile</title>
</head>

<body>
<br />
<br />
<br />
	<div class="container modal">
		<br />
		<form class="bg-white shadow rounded-lg d-block d-sm-flex" method="post" action="${pageContext.request.contextPath}/user-profile" id="form-profile">
			<div class="profile-tab-nav border-right">
				<div class="p-4">
					<div class="img-circle text-center mb-3 file-upload">
						<label for="avatar-input">
							<img src="" id="account_avatar" alt="Image" class="shadow" />
						</label>
						<input type="file" accept="image/*" id="avatar-input">
					</div>
					<h4 class="text-center" id="account_fullname1"></h4>
				</div>
			</div>
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<h3 class="mb-4">Account Settings</h3>
					<div class="row">

						<div class="col-md-6">
							<div class="form-group">
								<label>User name</label>
								<input type="text" class="form-control" name="user-name" value="" id="account_username" disabled>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Full name</label>
								<input type="text" class="form-control" name="full-name" id="account_fullname2" value="">
							</div>
						</div>


						<div class="col-md-6">
							<div class="form-group">
								<label>Email</label>
								<div class="tooltip" id="verified">
									<i class="fas fa-check" ></i>
									<span class="tooltiptext">Verified</span>
								</div>
								<div class="tooltip" id="verify-qa">
									<i class="fa fa-exclamation-triangle" aria-hidden="true"
									   onclick="confirmSendMail()"></i>
									<span class="tooltiptext">Please! Click to verify your gmail</span>
								</div>
								<input type="text" class="form-control" name="email" id="account_email" value="">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Phone number</label>
								<input type="text" class="form-control" name = "phoneNumber" id="account_phonenumber" value="">
							</div>
						</div>


						<div class="col-md-12">
							<div class="form-group">
								<label for="addressList">Address</label>
								<select class="form-control" name="addressList" id="addressList" style="height: 30px;font-size: 15px;">

								</select>
							</div>
						</div>
						<div class="col-md-12">
							<input class="btn btn-outline-success addButtonBtn" type="button" value="Add address"/>
						</div>
						<!--slide-->
						<div class="addButtonSlide">
							<div class="row tab-content p-12 p-md-5" style="margin-left:10px;">
								<!--Country-->
								<div class="col-md-6">
									<div class="form-group">
										<label for="country">Country</label>
										<select class="form-control" name="country" id="country">
											<option value="Vietnam">Vietnam</option>
											<option value="China">China</option>
										</select>
									</div>
								</div>

								<div class="col-md-6">
									<!--Province-->
									<div class="form-group">
										<label for="province">Province</label>
										<select class="form-control" name="province" id="province"></select>
									</div>
								</div>


								<!--District-->
								<div class="col-md-6">
									<div class="form-group">
										<label for="district">District</label>
										<select class="form-control" name="district" id="district"></select>
									</div>
								</div>
								<!--Ward-->
								<div class="col-md-6">
									<div class="form-group">
										<label for="ward">Ward</label>
										<select class="form-control" name="ward" id="ward"></select>
									</div>
								</div>


								<div class="col-md-12">
									<div class="form-group">
										<label for="addressDetail">Address Detail</label>
										<textarea style="width:100%;resize: none;" id="addressDetail"
												  name="addressDetail" class="form-control"></textarea>
									</div>
								</div>
							</div>
						</div>
						<!--slide-->

						<div class="col-md-12">
							<div class="form-group">
								<label for="description">Description</label>
								<textarea class="form-control" name="description" id="description"
										  rows="4">Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore vero enim error similique quia numquam ullam corporis officia odio repellendus aperiam consequatur laudantium porro voluptatibus, itaque laboriosam veritatis voluptatum distinctio!</textarea>
							</div>
						</div>

					</div>
				</div>
				<div>
					<button class="btn btn-primary" type="submit">Update</button>
					<button class="btn btn-light" type="reset">Reset</button>
					<button class="btn btn-light" type="button" id="btn-cancel">Cancel</button>
				</div>
			</div>
		</form>
	</div>
<script src="<%= Asset.url("/template/web/js/profileAccount.js")%>"></script>
<script>
	function ajaxGetAccount() {
		$("#account_fullname1").text("${account.fullname}");
		$("#account_fullname2").val("${account.fullname}");
		$("#account_avatar").prop("src","${account.avatar}");
		$("#account_email").val("${account.email}");
		$("#account_phonenumber").val("${account.phoneNumber}");
		$("#account_username").val("${account.username}");
		let x = "${account.emailVerifiedAt}";
		if(x!=null){
			$("#verified").show();
			$("#verify-qa").hide();
		}else{
			$("#verified").hide();
			$("#verify-qa").show();
		}

	}
	ajaxAddressList("${account.id}")
	ajaxGetAccount();
	saveAccount();

	function confirmSendMail(){
		if (confirm("You want verify your mail right now!") === true) {
			//send mail to user
			let email = "${account.email}";
			let posting = $.post("http://localhost:8080/TheStarBuck/activeAccount",{email:email});
			posting.done(function (data){
				alert("Check email to active!");
			});
		} else {
			//nothing
		}
	}
</script>
</body>
</html>
