<jsp:useBean id="slideTitle" scope="request" type="java.util.List"/>
<jsp:useBean id="slideThumbBig" scope="request" type="java.util.List"/>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.model.Account" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<%
  Account account = (Account) session.getAttribute("account");
%>
<head>
  <jsp:include page="layout/css.jsp"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
 <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">

  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- slier-image -->
  <!--custom footer-->
  <link rel="stylesheet" href="<%= Asset.url("/template/web/css/home.css")%>" />
  <title>Home</title>
</head>

<body>
 <jsp:include page="layout/header.jsp"/>
  <div class="hero" id="hero1" style="background: url('${slideTitle[1].image}')">
    <div class="row hero-layout">
      <!-- <div class="circle "></div> -->
      <div class="content">
        <div class="textBox">
          <h2 class="animate__animated animate__fadeInTopLeft" id="title_hero1">${slideTitle[1].greetingH2}<br>It's <span>${slideTitle[1].greetingSpan}</span></h2>
          <p class="animate__animated animate__backInLeft" id="text_hero1">${slideTitle[1].greetingP}</p>
          <a class="animate__animated animate__backInLeft" href="#products">Order Now</a>
        </div>
        <div class="imgBox animate__animated animate__backInRight">
          <img id="starbuckAv" src="${slideThumbBig[1].image}" class="starbucks" />
        </div>
      </div>
      <ul class="thumb ">
          <c:set var="count" value="0" scope="page" />
          <jsp:useBean id="slideThumb" scope="request" type="java.util.List"/>
          <c:forEach items="${slideThumb}" var="item">
              <c:set var="count" value="${count + 1}" scope="page"/>
        <li><img id="thumb${count}" src="${item.image}" class="animate__animated animate__backInUp animate__delay-${count}s"></li>
          </c:forEach>
      </ul>
    </div>
  </div>
  <section class="image-slider">
    <jsp:useBean id="slideMini" scope="request" type="java.util.List"/>
    <c:forEach items="${slideMini}" var="x">
      <div class="image-item">
        <div class="image">
          <img src="${x.image}" alt="" />
        </div>
      </div>
    </c:forEach>
  </section>
  <!-- Products -->
  <section class="section products " id="products">
    <div class="section-title">
      <h2>Product popularity</h2>
    </div>
    <div class="container">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="featured_tab" data-toggle="tab" href="#featured" role="tab"
            aria-controls="featured" aria-selected="true">Featured</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="latest-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest"
            aria-selected="false">Latest</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="bestsellers-tab" data-toggle="tab" href="#bestsellers" role="tab"
            aria-controls="bestsellers" aria-selected="false">Bestsellers</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="featured" role="tabpanel" aria-labelledby="featured_tab">
          <div class=" product-layout">
            <jsp:useBean id="listProductFeatured" scope="request" type="java.util.List"/>
            <c:forEach items="${listProductFeatured}" var="x">
          <div class="product" >
            <div class="img-container">
              <img src="${x.image}" alt="" />
              <div class="addCart">
                <a href="<%=request.getContextPath()%>/add-cart?id=${x.id}">
                  <i class="fas fa-shopping-cart"></i>
                </a>
              </div>
              <div class="sale-text">
                <span class="section-sale">${x.sale}% Off</span>
              </div>

              <ul class="side-icons">
                <span><i class="fas fa-search"></i></span>
                <span><i class="far fa-heart"></i></span>
                <span><i class="fas fa-sliders-h"></i></span>
              </ul>
            </div>
            <div class="bottom">
              <div class="price-rating">
                <div class="rating">
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                </div>
              </div>
              <a href="<%=request.getContextPath()%>/detailProduct?id=${x.id}">${x.name}</a>
              <div class="price">
                <span>$${x.price - x.discount}</span>
                <span class="cancel">$${x.price}</span>
              </div>
            </div>
          </div>
            </c:forEach>
         </div>
        <div class="btn-box">
          <a href="${pageContext.request.contextPath}/products">
            View More
          </a>
        </div>

      </div>
      <div class="tab-pane fade" id="latest" role="tabpanel" aria-labelledby="latest-tab">
        <div class="product-layout">
          <jsp:useBean id="listProductLasest" scope="request" type="java.util.List"/>
          <c:forEach items="${listProductLasest}" var="x">
          <div class="product">
            <div class="img-container">
              <img src="${x.image}" alt="" />
              <div class="addCart">
                <i class="fas fa-shopping-cart"></i>
              </div>
              <div class="sale-text">
                <span class="section-sale">${x.sale}% Off</span>
              </div>

              <ul class="side-icons">
                <span><i class="fas fa-search"></i></span>
                <span><i class="far fa-heart"></i></span>
                <span><i class="fas fa-sliders-h"></i></span>
              </ul>
            </div>
            <div class="bottom">
              <div class="price-rating">
                <div class="rating">
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                </div>
              </div>
              <a href="">${x.name}</a>
              <div class="price">
                <span>$${x.price - x.discount}</span>
                <span class="cancel">$${x.price}</span>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        <div class="btn-box">
          <a href="">
            View More
          </a>
        </div>
      </div>
      <div class="tab-pane fade" id="bestsellers" role="tabpanel" aria-labelledby="bestsellers-tab">

        <div class="product-layout">
          <jsp:useBean id="listProductHot" scope="request" type="java.util.List"/>
          <c:forEach items="${listProductHot}" var="x">
            <div class="product">
              <div class="img-container">
                <img src="${x.image}" alt="" />
                <div class="addCart">
                  <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="sale-text">
                  <span class="section-sale">${x.sale}% Off</span>
                </div>

                <ul class="side-icons">
                  <span><i class="fas fa-search"></i></span>
                  <span><i class="far fa-heart"></i></span>
                  <span><i class="fas fa-sliders-h"></i></span>
                </ul>
              </div>
              <div class="bottom">
                <div class="price-rating">
                  <div class="rating">
                    <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                    <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                    <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                    <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                    <span class="fa fa-stack"><i class="fa fa-star-o"></i><i class="fa fa-star"></i></span>
                  </div>
                </div>
                <a href="">${x.name}</a>
                <div class="price">
                  <span>$${x.price - x.discount}</span>
                  <span class="cancel">$${x.price}</span>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
        <div class="btn-box">
          <a href="">
            View More
          </a>
        </div>

      </div>
    </div>

    </div>
    <!-- /.container -->
  </section>
  <!-- Banner Begin -->
  <section class="banner">
    <jsp:useBean id="slideBanner" scope="request" type="java.util.List"/>
    <c:forEach items="${slideBanner}" var="x">
    <div class="container">
      <div class="col">
        <img class="banner__decor" src="<%= Asset.url("/template/web/image/bell__xmas.png")%>" alt="" srcset="">
        <div class="banner_box">
          <div class="banner_content ">
            <h2>${x.greetingH2}</h2>
            <p>${x.greetingP}</p>
            <a>Find your favorite</a>
          </div>
          <div class="banner__pic">
            <img src="${x.image}" alt="">
          </div>
        </div>
      </div>
    </div>
    </c:forEach>
  </section>
  <!-- Banner End -->
  <!-- about -->
  <section class="section about">
    <div class="about-layout container">
      <div class="wrapper">
        <div class="one item">
          <img src="<%= Asset.url("/template/web/image/about1.png")%>" alt="">
          <img src="<%= Asset.url("/template/web/image/about1_1.png")%>" alt="" class="img-change">
        </div>
        <div class="two item">
          <img src="<%= Asset.url("/template/web/image/about2.png")%>" alt="">
          <img src="<%= Asset.url("/template/web/image/about2_2.png")%>" alt="" class="img-change">
        </div>
        <div class="three item">
          <img src="<%= Asset.url("/template/web/image/about3.png")%>" alt="">
          <img src="<%= Asset.url("/template/web/image/about3_3.png")%>" alt="" class="img-change">
        </div>
        <div class="four item">
          <img src="<%= Asset.url("/template/web/image/about4.png")%>" alt="">
          <img src="<%= Asset.url("/template/web/image/about4_4.png")%>" alt="" class="img-change">
        </div>
        <div class="five">
          <div class="content">
            <h3>Starbucks</h3>
            <h1>About us</h1>
            <p>Besides being proud of delicious - clean - fresh milk tea cups, we are always confident to bring
              customers the best experience in terms of service and space.</p>
          </div>
          <div class="btn-box">
            <a href="">
              View More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Blog Section Begin -->
  <section class="from-blog spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-title from-blog__title">
            <h2>From The Blog</h2>
          </div>
        </div>
      </div>
      <div class="row" id="post-demo">
      </div>
    </div>
  </section>
  <!-- Blog Section End -->
  <!-- ordering -->
  <section class="ordering steps">
    <div class="ordering-layout">
      <h2>Step by step</h2>
      <div class="ordering-stepss">
        <div class="item steps-one">
          <div class="criea">
            <img src="<%= Asset.url("/template/web/image/step_1.png")%>" alt="" width="40px" height="40px">
          </div>
          <h4>Contact</h4>
        </div>
        <div class="item min">
          <img src="<%= Asset.url("/template/web/image/step.png")%>" alt="" width="40px" height="40px">
        </div>
        <div class="item steps-two">
          <div class="criea">
            <img src="<%= Asset.url("/template/web/image/step_2.png")%>" alt="" width="40px" height="40px">
          </div>
          <h4>Create order</h4>
        </div>
        <div class="item min">
          <img src="<%= Asset.url("/template/web/image/step.png")%>" alt="" width="40px" height="40px">
        </div>
        <div class="item steps-three">
          <div class="criea">
            <img src="<%= Asset.url("/template/web/image/step_3.png")%>" alt="" width="40px" height="40px">
          </div>
          <h4>Delivery</h4>
        </div>
        <div class="item min">
          <img src="<%= Asset.url("/template/web/image/step.png")%>" alt="" width="40px" height="40px">
        </div>
        <div class="item steps-four">
          <div class="criea">
            <img src="<%= Asset.url("/template/web/image/step_4.png")%>" alt="" width="40px" height="40px">
          </div>
          <h4>Pay</h4>
        </div>
      </div>
    </div>
  </section>
  <!-- Footer -->
 <jsp:include page="layout/footer.jsp"/>
  <!-- End Footer -->
  <!-- jquery -->
 <jsp:include page="layout/script.jsp"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <!-- jQuery Modal -->
  <script type="text/javascript" src="<%= Asset.url("/template/web/js/index.js")%>"></script>
<%-- <script src="<%= Asset.url("/template/web/js/profileAccount.js")%>"></script>--%>
<script  type="text/javascript">
  const starbuckAv = document.querySelector("#starbuckAv");
  const title_banner = document.querySelector("#hero1");
  function actionThumb(){
    <c:set var="count3" value="0" scope="page" />
    <c:forEach items="${slideTitle}" var="item">
    <c:set var="count3" value="${count3 + 1}" scope="page"/>
      $("#thumb${count3}").click(function () {
        title_banner.style.background = "#fff url('${item.image}') repeat-x bottom left";
        starbuckAv.src = "${slideThumbBig[count3-1].image}";
      });
    </c:forEach>
  }
  actionThumb();
  function ajaxRunPost(_randomNum) {
    $.ajax({
      type: "Get",
      url: "/TheStarBuck/posts?page-index=" + _randomNum + "&per-page=" + 2,
      ContentType: 'json',
      headers: { Accept: "application/json;charset=utf-8" },
      success: function (json) {
        if (json !== undefined && json != null) {
          let data = "";
          let obj = JSON.parse(json);
          for (let i = 0; i < obj.length; i++) {
            let val = obj[i];
            data += "<div class=\"col-lg-6 col-md-6 col-sm-6\">"
              +"<div class=\"blog__item\">"
               +"<div class=\"blog__item__pic\">"
                  +"<img src=\""+val.image_url+"\" alt=\"\">"
               +"</div>"
               +"<div class=\"blog__item__text\">"
                 +"<ul>"
                    +"<li><i class=\"far fa-calendar\"></i> May 4,2019</li>"
                    +"<li><i class=\"far fa-comment\"></i> 5</li>"
                  +"</ul>"
                    +"<h5><a href=\"<%=request.getContextPath()%>/blog?blogid="+val.id+"\">"+val.title+"</a></h5>"
                  +"<p>"+val.description+"</p>"
               +"</div>"
             +"</div>"
           +"</div>"
          }
          $("#post-demo").html(data);
        }
      }
    });
  }

  let randomNum = Math.floor(Math.random() * 50);
  ajaxRunPost(randomNum);
</script>
</body>
</html>