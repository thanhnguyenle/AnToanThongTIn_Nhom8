<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Cart" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Account account = (Account) request.getAttribute("account");
    Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>

<head>
    <jsp:include page="layout/css.jsp"/>
    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/payment.css")%>"/>
    <title>Payment</title>
    <style>
        .cursor-pointer {
            cursor: pointer;
        }
    </style>
</head>

<body>

<!-- Navigation -->
<jsp:include page="layout/header.jsp"/>

<header>
    <!--Check-out bar-->
    <div class="row mrCheckout">
        <div class="checkout-wrap col-xcol-md-6 col-sm-11 s-11 pull-right">
            <ul class="checkout-bar">
                <li class="visited checkout-title"><span>CART</span>
                </li>
                <li class="active checkout-title"><span>CHECKOUT</span>
                </li>
                <li class="checkout-title"><span>FINISH</span>
                </li>
            </ul>
        </div>
    </div>
</header>
<div class="wrapper">
    <div class="h5 large blockInfo text-center">Billing Address</div>
    <div class="row payment">
        <div class="col-lg-2 col-md-0 col-sm-0"></div>
        <div class="col-lg-8 col-md-8 col-sm-12 offset-lg-0 offset-md-2 offset-sm-1 blockInfo">
            <div class="mobile h5">Billing Address</div>
            <div id="details" class="bg-white rounded pb-5">
                <form>
                    <!--Name-->
                    <div class="form-group"><label class="" for="name">Name</label>
                        <div class="d-flex jusify-content-start align-items-center rounded p-2">
                            <input
                                    type="text"
                                    id="name" name="name" value="${account.fullname}" required>
                            <span
                                    class="fas fa-check text-success pr-sm-2 pr-0"></span></div>
                    </div>
                    <!--phone number-->
                    <div class="form-group"><label class="" for="phone">Phone number</label>
                        <div class="d-flex jusify-content-start align-items-center rounded p-2">
                            <input
                                    type="tel"
                                    id="phone" name="phone" value="${account.phoneNumber}" required>
                            <span
                                    class="fas fa-check text-success pr-sm-2 pr-0"></span></div>
                    </div>
                    <!--mail-->
                    <div class="form-group"><label class="" for="email">Email</label>
                        <div class="d-flex jusify-content-start align-items-center rounded p-2">
                            <input
                                    type="email"
                                    id="email" name="email" value="${account.email}">
                            <span class="fas fa-check text-success pr-sm-2 pr-0"></span></div>
                    </div>
<%--                    <div class="row">--%>
<%--                        <!--Country-->--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="country">Country</label>--%>
<%--                                <select class="d-flex jusify-content-start align-items-center rounded p-2"--%>
<%--                                        name="country" id="country">--%>
<%--                                    <option value="Vietnam">Vietnam</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <!--Province-->--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="province">Province</label>--%>
<%--                                <select class="d-flex jusify-content-start align-items-center rounded p-2"--%>
<%--                                        name="province" id="province">--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row">--%>
<%--                        <!--District-->--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="district">District</label>--%>
<%--                                <select class="d-flex jusify-content-start align-items-center rounded p-2"--%>
<%--                                        name="district" id="district">--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!--Ward-->--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="ward">Ward</label>--%>
<%--                                <select class="d-flex jusify-content-start align-items-center rounded p-2"--%>
<%--                                        name="ward" id="ward">--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-12">--%>

<%--                        </div>--%>
<%--                    </div>--%>

                        <div class="form-group">
                            <label for="addresses">Address</label>
                            <select class="d-flex jusify-content-start align-items-center rounded p-2"
                                    name="addresses" id="addresses">


                            </select>
                        </div>
                    <div class="form-group">
                        <label for="addressDetail">Address Detail</label>
                        <div class="d-flex jusify-content-start align-items-center rounded p-2">
                                        <textarea style="width:100%;resize: none;border: none;"
                                                  id="addressDetail"
                                                  name="addressDetail"></textarea>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="payment">Payment</label>
                            <select class="d-flex jusify-content-start align-items-center rounded p-2"
                                    name="payment" id="payment">
                                <option value="master-card">Master Card</option>
                                <option value="visa-card">Visa</option>
                                <option value="cash">Cash</option>
                            </select>
                    </div>
                </form>
            </div>
            <div class="row pt-lg-3 buttons mb-sm-0 mb-2">
                <div class="col-md-6 pt-md-0 pt-3">
                    <div class="btnNav text-uppercase btnBack"><a
                            href="<%=request.getContextPath()%>/menu">Back to shopping</a>
                    </div>
                </div>
                <div class="col-md-6 pt-md-0 pt-3" onclick="return sendRequestToCheckOut()">
                    <div class="btnNav ml-auto text-uppercase btnContinue"><span
                            class="fas fa-lock"></span>
                        <a href="<%=request.getContextPath()%>/payment-checkout">Continue</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-2 col-md-0 col-sm-0"></div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="layout/footer.jsp"/>
<!-- End Footer -->
<!-- jquery -->
<jsp:include page="layout/script.jsp"/>
<!-- Custom Scripts -->
<script src="<%= Asset.url("/template/web/js/payment.js")%>"></script>
<script>
<<<<<<< Updated upstream

=======
    $("#addresses").change(function (){
        getAddressDetail();
    });
    function openVerify(){
        let onetime = false;
        $('#verify-invoice').on('click',function (event) {
            event.preventDefault();
            this.blur(); // Manually remove focus from clicked link.
            if (!onetime) {
                $.get("<c:url value='/views/web/popupInvoiceVerify.jsp'/>", function (html) {
                    $(html).appendTo('body').modal();
                });
                onetime = true;
            }else{
                document.querySelectorAll(".modal").forEach(a=>a.style.display = "block");
            }
        });
    }
    function sendRequestToCheckOut(){
        let fullname = $("#name").val();
        let phonenumber = $("#phone").val();
        let email = $("#email").val();
        let addresses = $("#addresses :selected").text();
        let addressDetails = $("#addressDetail :selected").val();
        let payment = $("#payment :selected").val();

        $.ajax({
            type: "Post",
            url: "/TheStarBuck/payment-checkout",
            ContentType: 'json',
            headers: {Accept: "application/json;charset=utf-8"},
            data:{"name":fullname,"phone":phonenumber,"email":email,"addresses":addresses,"payment":payment,"addressDetail":addressDetails},
            success: function (json) {
                let tab = window.open('/TheStarBuck/payment-checkout', '_blank');
                tab.document.write(json);
                tab.document.close();
            }
        });
    }
    function ajaxRun() {
        let id = "${account.id}";
        $.ajax({
            type: "Post",
            url: "/TheStarBuck/getAddressJson?id="+id,
            ContentType: 'json',
            headers: {Accept: "application/json;charset=utf-8"},
            success: function (json) {
                let obj = JSON.parse(json);
                let data = "";
                for (let i = 0; i < obj.length; i++) {
                  let o = obj[i];
                  data="<option value=\""+o.id+"\">"+o.wardCode+" - "+o.districtCode+" - "+o.provinceCode+"</option>";
                  $("#addresses").append(data);
                }
                // $("div.products-layout div.product-layout").html(data);
            }
        });
    }
    function getAddressDetail() {
        let id = "${account.id}";
        let addresses = $("#addresses :selected").val();
        $.ajax({
            type: "Post",
            url: "/TheStarBuck/getAddressJson?id="+id,
            ContentType: 'json',
            headers: {Accept: "application/json;charset=utf-8"},
            success: function (json) {
                let obj = JSON.parse(json);
                let data = "";
                for (let i = 0; i < obj.length; i++) {
                    let o = obj[i];
                    if(o.id==addresses){
                        $("addressDetail").text(o.addressDetail);
                    }
                }
                // $("div.products-layout div.product-layout").html(data);
            }
        });
    }
    ajaxRun();
</script>
</body>

</html>