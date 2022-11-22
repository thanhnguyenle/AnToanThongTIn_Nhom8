<jsp:useBean id="totalPage" scope="request" type="java.lang.Integer"/>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="layout/css.jsp"/>
  <!--jquery-ui css-->
  <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
  <!-- Custom StyleSheet -->
  <link rel="stylesheet" href="<%= Asset.url("/template/web/css/product.css")%>" />
  <title>Menu</title>
</head>

<body>

  <!-- Navigation -->
  <jsp:include page="layout/header.jsp"/>
  <!-- Navigation -->
  <!-- serchBar -->
  <section class="ipSearchBox"></section>
  <!-- PRODUCTS -->

  <section class="section products">
    <div class="products-layout container bootdey">
      <div class="col-1-of-5">
        <section class="panel">
          <div class="panel-body">
            <input type="text" placeholder="Keyword Search" class="form-control" value="" id="search-text" />
          </div>
        </section>
        <section class="panel">
          <header class="panel-heading">
            Category
          </header>
          <div class="panel-body">
            <ul class="nav prod-cat">
             <jsp:useBean id="categories" scope="request" type="java.util.List"/>
             <c:forEach items="${categories}" var="item">
              <li  onclick="ajaxRun('${item.id}','','','','','')">
                <a href="#">${item.name}</a>
                <ul class="nav" style="display:none;">
                </ul>
              </li>
             </c:forEach>
            </ul>
          </div>
        </section>
        <section class="panel">
          <header class="panel-heading">
            Price Range
          </header>
          <div class="panel-body sliders">
            <div class="slideblock">
              <div class=block1>
                <label for="from">From: $</label>
                <input type="text" id="from" name="from" style="border:0; color:#b9cd6d; font-weight:bold;">
              </div>
              <div class=block2>
                <label for="to">To: $</label>
                <input type="text" id="to" name="to" style="border:0; color:#b9cd6d; font-weight:bold;">
              </div>
            </div>
            <div id="slider-3"></div>
            <button type="button" name="range" id="range" class="filterbtn" >Range</button>
          </div>
        </section>
      </div>
      <div class="col-3-of-4">
        <form action="">
          <div class="item">
            <label for="sort-by">Sort By</label>
            <select name="sort-by" id="sort-by">
              <option value="title" selected="selected">Name</option>
              <option value="number">Price</option>
            </select>
          </div>
          <div class="item">
            <label for="order-by">Order</label>
            <select name="order-by" id="order-by">
              <option value="ASC" selected="selected">ASC</option>
              <option value="DESC">DESC</option>
            </select>
          </div>
          <input type="button" id="apply" name="apply" value="Apply" class="filterbtn" >
        </form>

        <div class="categoryTitle">
          <h2>List Products</h2>
        </div>
        <div class="product-layout">
          <!-- hien thi nhieu nhat 9 san pham -->

        </div>
        <!-- PAGINATION -->
        <ul class="pagination" id="pagination"></ul>
        <input type="hidden" value="" id="page" name="page">
        <input type="hidden" value="" id="maxPageItem" name="maxPageItem">

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

  <!-- Footer -->
  <jsp:include page="layout/footer.jsp"/>
  <!-- End Footer -->

  <!-- jquery -->
  <jsp:include page="layout/script.jsp"/>
 <!-- jquery UI -->
<%--  jQuery UI là một thư viện miễn phí, xây dựng dựa trên jQuery, giúp bạn tạo các thành phần giao diện trong trang như datepicker, accordion, autocomplete, tab, menu, select…--%>
  <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <!-- Custom Scripts -->
  <script src="<%= Asset.url("/template/web/js/product.js")%>"></script>

  <!--paging lib-->
  <script src="<%= Asset.url("/template/lib/paging/jquery.twbsPagination.js")%>" type="text/javascript"></script>
  <script type="text/javascript">

    let totalPages = ${totalPage};
      let currentPage = 1;
      const limit = 9;
      let category_id = "";
      let sort_by = "";
      let from_price = 0;
      let to_price = 100;
      let order_by = "ASC";
      let text = "";
      $(function () {
          window.pagObj = $('#pagination').twbsPagination({
              totalPages: totalPages,
              visiblePages: 5,
              startPage: currentPage,
              onPageClick: function (event, page) {
                if(currentPage!=page){
                  currentPage = page;
                  ajaxRun(category_id,sort_by,from_price,to_price,order_by,text);
                }
              }
          });
      });
      $("#search-text").on('keyup',function (){
        text = $(this).val();
        ajaxRun('','','','','',text);
      });
      $("#range").click(function (){
          from_price=$("#from").val();
          to_price=$("#to").val();
          ajaxRun('','',from_price,to_price,'','');
      });
    $("#apply").click(function (){
        sort_by = $('#sort-by :selected').text();
        if(sort_by=="Name"){
          sort_by = "pr_name";
        }else if(sort_by=="Price"){
          sort_by = "pr_price";
        }
        order_by =$('#order-by :selected').val();

      ajaxRun('',sort_by,'','',order_by,'','');
    });

      function ajaxRun(categoryID,sortBy,fromPrice,toPrice,orderBy,textSearch) {
        if(categoryID!=''&&categoryID!=undefined)
        category_id = categoryID;
        if(sortBy!=''&&sortBy!=undefined)
        sort_by = sortBy;
        if(fromPrice!=''&&fromPrice!=undefined)
        from_price = fromPrice;
        if(toPrice!=''&&toPrice!=undefined)
        to_price = toPrice;
        if(orderBy!=''&&orderBy!=undefined)
          order_by = orderBy;
        if(textSearch!=''&&textSearch!=undefined)
          text = textSearch;
        $.ajax({
          type: "Post",
          url: "/TheStarBuck/products?page-index=" + currentPage + "&per-page=" + limit+"&category_id="+category_id+"&sort_by="+sort_by+"&from_price="+from_price+"&to_price="+to_price+"&order_by="+order_by+"&text_search="+text,
          ContentType: 'json',
          headers: {Accept: "application/json;charset=utf-8"},
          success: function (json) {
            let data = "";
            let obj = json;
            for (let i = 0; i < obj.length; i++) {
              let val = obj[i];
              data += "<div class=\"product\">"
                      + "<div class=\"img-container\">"
                      + "<img class=\"lazy-image\" src=\"" + val.image + "\" />"
                      + "<div class=\"addCart\">"
                      + "<a href=\"<%=request.getContextPath()%>/add-cart?id=" + val.id + "\"><i class=\"fas fa-shopping-cart\"></i></a>"
                      + "</div>"
                      + "<div class=\"sale-text\">"
                      + "<span class=\"section-sale\">20% Off</span>"
                      + "</div>"
                      + "<ul class=\"side-icons\">"
                      + "<span><i class=\"fas fa-search\"></i></span>"
                      + "<span><i class=\"far fa-heart\"></i></span>"
                      + "<span><a href=\"<%=request.getContextPath()%>/detailProduct?id=" + val.id + "\"><i class=\"fas fa-sliders-h\"></i></a></span>"
                      + "</ul>"
                      + "</div>"
                      + "<div class=\"bottom\">"
                      + "<div class=\"price-rating\">"
                      + "<div class=\"rating\">"
                      + "<span class=\"fa fa-stack\"><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star\"></i></span>"
                      + "<span class=\"fa fa-stack\"><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star\"></i></span>"
                      + "<span class=\"fa fa-stack\"><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star\"></i></span>"
                      + "<span class=\"fa fa-stack\"><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star\"></i></span>"
                      + "<span class=\"fa fa-stack\"><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star\"></i></span>"
                      + "</div>"
                      + "</div>"
                      + "<a href=\"<%=request.getContextPath()%>/detailProduct?id=" + val.id + "\">" + val.name + "</a>"
                      + "<div class=\"price\">"
                      + "<span>$" + val.price + "</span>"
                      + "<span class=\"cancel\">$" + val.discount + "</span>"
                      + "</div>"
                      + "</div>"
                      + "</div>";
            }
            $("div.products-layout div.product-layout").html(data);
          }
        });
      }
      ajaxRun(category_id,sort_by,from_price,to_price,order_by,text);

  </script>
</body>

</html>