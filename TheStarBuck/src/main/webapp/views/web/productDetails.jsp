<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Product product = (Product) request.getAttribute("product");
    Account account = (Account) request.getAttribute("product");;
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="layout/css.jsp"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"><div class="pd-wrap" />
    <!-- animated: Tạo hiệu ứng chuyển động sử dụng @Keyframe mà không cần sử dụng Javascript -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="<%= Asset.url("/template/web/css/productDetails.css")%>" />
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="preload" href="https://source.unsplash.com/ILi48MzhxZA/900x1200" as="image">
    <link rel="stylesheet" href="<c:url value="/template/web/css/productDetails.css"/>">

    <title>Product Details</title>

    </head>

<body>

<!-- Navigation -->
<jsp:include page="layout/header.jsp"/>

<!-- searchBar -->
<section id="sectionSearch" class="ipSearchBox"></section>
<section class="container product-details">
    <div class="row">
        <div class="col-md-6">
            <div id="slider" class="owl-carousel product-slider">
                <div class="item" id="NZoomImg3" data-NZoomscale="2">
                    <img  src="${product.image}" alt="40.png"/>
                </div>
                <div class="item" id="NZoomImg7" data-NZoomscale="2" >
                    <img src="${product.image}" />
                </div>
                <div class="item" id="NZoomImg2" data-NZoomscale="2">
                    <img src="${product.image}" />
                </div>
                <div class="item" id="NZoomImg1" data-NZoomscale="2">
                    <img src="${product.image}" />
                </div>
                <div class="item" id="NZoomImg4" data-NZoomscale="2">
                    <img src="${product.image}" />
                </div>
                <div class="item" id="NZoomImg5" data-NZoomscale="2">
                    <img src="${product.image}" />
                </div>
                <div class="item" id="NZoomImg6" data-NZoomscale="2">
                    <img src="${product.image}" />
                </div>
            </div>
            <div id="thumb" class="owl-carousel product-thumb">
                <div class="item" >
                    <img src="${product.image}" />
                </div>
                <div class="item">
                    <img src="${product.image}" />
                </div>
                <div class="item">
                    <img src="${product.image}" />
                </div>
                <div class="item">
                    <img src="${product.image}" />
                </div>
                <div class="item">
                    <img src="${product.image}" />
                </div>
                <div class="item">
                    <img src="${product.image}" />
                </div>
                <div class="item">
                    <img src="${product.image}" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="product-dtl">
                <div class="product-info">
                    <span>Menu/CoolDrink/${product.name}</span>
                    <h1>${product.name}</h1>
                    <div class="reviews-counter">
                        <div class="rate">
                            <input type="radio" id="star-5" name="rate" value="5" checked />
                            <label for="star5" title="text">5 stars</label>
                            <input type="radio" id="star-4" name="rate" value="4" checked />
                            <label for="star4" title="text">4 stars</label>
                            <input type="radio" id="star-3" name="rate" value="3" checked />
                            <label for="star3" title="text">3 stars</label>
                            <input type="radio" id="star-2" name="rate" value="2" />
                            <label for="star2" title="text">2 stars</label>
                            <input type="radio" id="star-1" name="rate" value="1" />
                            <label for="star1" title="text">1 star</label>
                        </div>
                        <span>3 Reviews</span>
                    </div>
                    <div class="product-price-discount"><span>$${product.price}</span><span class="line-through">$${product.discount}</span></div>
                </div>
                <div class="row choosee">
                    <div class="col-md-8">
                        <form action="#" >
                            <select class="size">
                                <option value="Select Quantity" selected disabled>
                                    Choose size
                                </option>
                                <option value="S">S</option>
                                <option value="M" selected>M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                            </select>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                Custom
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="exampleModalLabel">Choose your favourite</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!--Add Topping-->
                                            <section class="chooseMore">
                                                <div class=" container addTopping">
                                                    <form class="formCustom">
                                                        <div class="selectBox">
                                                            <select class="item sugar" id="sugar"  onchange="showValueSugar()
">
                                                                <option value="50" selected disabled>
                                                                    Choose measure of sugar (%)
                                                                </option>
                                                                <option value="10">10</option>
                                                                <option value="20">20</option>
                                                                <option value="30">30</option>
                                                                <option value="40">40</option>
                                                            </select>
                                                            <select class="item ice" id="ice" onchange="showValueIce()">
                                                                <option value="50" selected disabled>
                                                                    Choose measure of ice (%)
                                                                </option>
                                                                <option value="10">10</option>
                                                                <option value="20">20</option>
                                                                <option value="30">30</option>
                                                                <option value="40">40</option>
                                                            </select>
                                                            <fieldset id="topp">
                                                                <legend style="font-size: 20px">Choose your toppings</legend>
                                                                <div style="margin-left: 20px">
                                                                    <input type="checkbox" id="black" name="interest" value="Black" onchange="myShowToppings()">
                                                                    <label for="black" style="font-size: 17px">Black bubble</label>
                                                                </div>
                                                                <div style="margin-left: 20px">
                                                                    <input type="checkbox" id="white" name="interest" value="White" onchange="myShowToppings()">
                                                                    <label for="white" style="font-size: 17px">White bubble</label>
                                                                </div>
                                                                <div style="margin-left: 20px">
                                                                    <input type="checkbox" id="yarns" name="interest" value="Yarns" onchange="myShowToppings()">
                                                                    <label for="yarns" style="font-size: 17px">Yarns bubble</label>
                                                                </div>
                                                                <div style="margin-left: 20px">
                                                                    <input type="checkbox" id="cheese" name="interest" value="CheeseJelly" onchange="myShowToppings()">
                                                                    <label for="cheese" style="font-size: 17px">Yarns bubble</label>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </form>
                                                    <form class="formBill">
                                                        <fieldset>
                                                            <legend>Custom Board</legend>
                                                            <div class="billContentBox">
                                                                <div class="nameDrinkBox colSpaceBet">
                                                                    <h4>Name drink:</h4>
                                                                    <span>${product.name}</span>
                                                                </div>
                                                                <div class="colSpaceBet">
                                                                    <h4>Sugar(%):</h4>
                                                                    <span id="resultSugar">10</span>
                                                                </div>
                                                                <div class="colSpaceBet">
                                                                    <h4>Ice(%):</h4>
                                                                    <span id="resultIce">10</span>
                                                                </div>
                                                                <div class="colSpaceBet">
                                                                    <h4>Toppings:</h4>
                                                                    <span id="resultToppings">Full</span>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                    </form>
                                                </div>
                                            </section>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" id="save">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="product-count">
                    <form action="#" class="display-flex">
                        <div class="qtyminus">-</div>
                        <input type="text" name="quantity" value="1" class="qty" min="1" max="${product.quantity}">
                        <div class="qtyplus">+</div>
                    </form>
                    <a href="<%=request.getContextPath()%>/add-cart?id=${product.id}" class="round-black-btn">Add to Cart</a>
                    <h3>About It</h3>
                    <p>
                        ${product.ingredients}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="product-info-tabs">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">Reviews (0)</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                ${product.description}
            </div>
            <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                <div class="review-heading">REVIEWS</div>
                <p class="mb-20">There are no reviews yet.</p>
                <form class="review-form">
                    <div class="form-group">
                        <label>Your rating</label>
                        <div class="reviews-counter">
                            <div class="rate">
                                <input type="radio" id="star5" name="rate" value="5" />
                                <label for="star5" title="text">5 stars</label>
                                <input type="radio" id="star4" name="rate" value="4" />
                                <label for="star4" title="text">4 stars</label>
                                <input type="radio" id="star3" name="rate" value="3" />
                                <label for="star3" title="text">3 stars</label>
                                <input type="radio" id="star2" name="rate" value="2" />
                                <label for="star2" title="text">2 stars</label>
                                <input type="radio" id="star1" name="rate" value="1" />
                                <label for="star1" title="text">1 star</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Your message</label>
                        <textarea class="form-control" rows="10"></textarea>
                    </div>
                    <button class="round-black-btn">Submit Review</button>
                </form>

            </div>
        </div>
    </div>


</section>


<!-- messenger -->
<div class="messenger">
    <a href=""><img src="images/mees.png" alt="" width="70px"></a>
</div>
<div class="up">
    <a href="#" class="iconUp"><i class="fa fa-arrow-circle-up"></i></a>
</div>


<script>
    function showValueSugar(){
        var ele = document.getElementById('sugar').value;
        document.getElementById('resultSugar').innerHTML = ele;
    }
    showValueSugar();
    function showValueIce(){
        var ele1 = document.getElementById('ice').value;
        document.getElementById('resultIce').innerHTML = ele1;
    }
    showValueIce();
    function myShowToppings(){
        var toppings= [];
        $.each($("input[name='interest']:checked"),function() {
            toppings.push($(this).val());
        });
        document.getElementById('resultToppings').innerHTML = toppings;
    }
    myShowToppings();
</script>

<jsp:include page="layout/footer.jsp"/>
<jsp:include page="layout/script.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="<%= Asset.url("/template/web/js/productDetails.js")%>"></script>
</body>

</html>