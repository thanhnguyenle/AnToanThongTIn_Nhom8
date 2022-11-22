<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="layout/css.jsp"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
  <link rel="stylesheet" href="<%= Asset.url("/template/web/css/aboutUs.css")%>" />
  <!-- Custom StyleSheet -->
  <title>About Us</title>
</head>

<body>

  <!-- Navigation -->
  <jsp:include page="layout/header.jsp"/>

  <!-- Content -->
  <section class="aboutUs">
    <div class="title">
      <h1 class="animate__animated animate__bounceInDown">Who we are</h1>
    </div>
    <div class="elementor-divider">
      <span class="elementor-divider-separator animate__animated animate__bounceInDown"></span>
    </div>
    <div class="introBox">
      <div class="imIntro">
<%--        <%= Asset.url("/template/web/image/aboutUs_intro_title.png")%>--%>
        <img src="<%=Asset.url("/template/web/image/aboutUs_intro_title.png")%>" class="animate__animated animate__bounceInLeft" alt="" srcset="">
      </div>
      <div class="introText animate__animated animate__bounceInRight">
        <h3>A few words about us</h3>
        <p>The Starbuck is a commercial website. We have done this by understanding your needs and providing you with a
          professional website to grow our coffee shop. Our team is made up of creative minds who are
          always looking for ways to give you guys the best possible website. We are enthusiastic in our woking and
          values
          of bringing you a special flavors and making your feeling better.
          Here is a page which we want to show something about us. After reading, can you tell me everything of your
          love! Thank you for your contribution!
          Loves!</p>
      </div>
    </div>
    <div class="breakbreak">
      <img src="<%=Asset.url("/template/web/image/brbr.webp")%>" alt="" srcset="">
    </div>
    <div class="introProduct">
      <div class="title">
        <h2>OUR FUN FACTS</h2>
      </div>
      <div class="grid-container">
        <div class="item1 item_flex">
          <div class="item_icon">
            <img src="<%=Asset.url("/template/web/image/about_icon_1.png")%>" alt="">
          </div>
          <div class="item_content">
            <p>123</p>
            <h4>Clients</h4>
          </div>
        </div>
        <div class="item1 item_flex">
          <div class="item_icon">
            <img src="<%=Asset.url("/template/web/image/about_icon_2.png")%>" alt="">
          </div>
          <div class="item_content">
            <p>150</p>
            <h4>Products</h4>
          </div>
        </div>
        <div class="item1 item_flex">
          <div class="item_icon">
            <img src="<%=Asset.url("/template/web/image/about_icon_3.png")%>" alt="">
          </div>
          <div class="item_content">
            <p>100</p>
            <h4>Hours</h4>
          </div>
        </div>
      </div>
    </div>
    <div class="breakbreak">
      <img src="images/brbr.webp" alt="" srcset="">
    </div>
    <div class="title">
      <h2>Meet our team</h2>
    </div>
    <div class="aboutUs-layout">
      <div class="item">
        <div class="avt_profile">
          <img src="<%=Asset.url("/template/web/image/KyAnh.png")%>" alt="" width="300" height="300">
          <h1 class="titleName" id="clickKA">KA</h1>
        </div>
        <div class="context_profile">
          <div class="detailPersonInfor clickKA">
            <ul>
              <li>Full Name: <span class="fullName">Nguyen Ky Anh</span></li>
              <li>Student Id: <span class="idStu">19130011</span></li>
              <li>Class: <span class="class">DH19DTB</span></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="item">
        <div class="avt_profile">
          <img src="<%=Asset.url("/template/web/image/Thanh.png")%>" alt="" width="300" height="300">
          <h1 class="titleName" id="clickThanh">Thanh</h1>
        </div>
        <div class="context_profile">
          <div class="detailPersonInfor clickThanh">
            <ul>
              <li>Full Name: <span class="fullName">Nguyen Le Thanh</span></li>
              <li>Student Id: <span class="idStu">19130206</span></li>
              <li>Class: <span class="class">DH19DTA</span></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="item">
        <div class="avt_profile">
          <img src="<%=Asset.url("/template/web/image/Nhu.png")%>" alt="" width="300" height="300">
          <h1 class="titleName" id="clickNhu">Nhu</h1>
        </div>
        <div class="context_profile">
          <div class="detailPersonInfor clickNhu">
            <ul>
              <li>Full Name: <span class="fullName">Duong Thi Minh Nhu</span></li>
              <li>Student Id: <span class="idStu">19130163</span></li>
              <li>Class: <span class="class">DH19DTA</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="about_poster">
      <img src="<%=Asset.url("/template/web/image/about_poster_1.png")%>" alt="" srcset="">
    </div>
  </section>
  <jsp:include page="layout/footer.jsp"/>
  <jsp:include page="layout/script.jsp"/>
  <!-- Custom Scripts -->
  <script src="<%= Asset.url("/template/web/js/aboutUs.js")%>"></script>
</body>

</html>