<jsp:useBean id="blogid" scope="request" type="java.lang.String"/>
<jsp:useBean id="totalPage" scope="request" type="java.lang.Integer"/>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <jsp:include page="layout/css.jsp"/>
  <!-- Custom StyleSheet -->
  <link rel="stylesheet" href="<%= Asset.url("/template/web/css/post.css")%>" />
  <title>Blog</title>
</head>

<body>

<jsp:include page="layout/header.jsp"/>
  <!-- Page content-->
  <section class="post">
    <div class="post-layout">
      <div class="row wrapper">
        <div class="left">
          <div class="title-context">
          </div>
        </div>
        <div class="right">
          <div class="input-group rounded">
            <input type="search" class="form-control rounded" placeholder="Search poster" aria-label="Search"
              aria-describedby="search-addon" id="search-text" />
            <span class="input-group-text border-0" id="search-addon">
              <i class="fas fa-search"></i>
            </span>
          </div>
          <div class="poster-near">
            <div class="title">
              <h4>List Post</h4>
            </div>
            <ul class="poster-list">
            </ul>
            <!-- PAGINATION -->
            <ul class="pagination" id="pagination" style="
                        justify-content: flex-end;
                        margin-right: -20px;">
            </ul>
            <input type="hidden" value="" id="page" name="page">
            <input type="hidden" value="" id="maxPageItem" name="maxPageItem">
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Page content-->
<!-- Footer -->
<jsp:include page="layout/footer.jsp"/>
<!-- End Footer -->
<!-- jquery -->
<jsp:include page="layout/script.jsp"/>

  <!-- Custom Scripts -->
  <script src="<%= Asset.url("/template/web/js/product.js")%>"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!--paging lib-->
<script src="<%= Asset.url("/template/lib/paging/jquery.twbsPagination.js")%>" type="text/javascript"></script>
<script type="text/javascript">

  $(document).ready(function () {
      let totalPages = ${totalPage};
      let currentPage = 1;
      let limit = 5;
      let textSearch = '';
    $(function () {
      if (totalPages > 0) {
        window.pagObj = $('#pagination').twbsPagination({
          totalPages: totalPages,
          visiblePages: 3,
          startPage: currentPage,
          onPageClick: function (event, page) {
            if (currentPage !== page) {
              currentPage = page;
              ajaxRun();
            }
          }
        });
      }
    });
    $("#search-text").on('keyup',function (){
      textSearch = $(this).val();
      ajaxRun(textSearch);
    });
    function ajaxRun(mytext) {
      if(mytext!=''&&mytext!=undefined)
        textSearch = mytext;
      $.ajax({
        type: "Get",
        url: "/TheStarBuck/posts?page-index=" + currentPage + "&per-page=" + limit+"&text-search="+textSearch,
        ContentType: 'json',
        headers: { Accept: "application/json;charset=utf-8" },
        success: function (json) {
          if (json !== undefined && json != null) {
            let data = "";
            let obj = JSON.parse(json);
            for (let i = 0; i < obj.length; i++) {
              let val = obj[i];
              data +=
                      "<li class=\"top1\">"
                      + " <a href=\"#\" onclick=\"ajaxBlog(\'"+val.id+"\')\">"
                      + "<img class=\"imgV1\" src=\""+val.image_url+"\" alt=\"\">"
                      + "<div class=\"left_V1\">"
                      +"<h5>"+val.title+"</h5>"
                      +"<p>"+val.description+"</p>"
                      +" </div>"
                      +"</a>"
                      +"</li>" ;
            }
            $(".poster-list").html(data);
          }
        }
      });
    }
    ajaxRun("");
  });

  function ajaxBlog(id) {
    $.ajax({
      type: "Get",
      url: "/TheStarBuck/post?post_id=" + id,
      ContentType: 'json',
      headers: { Accept: "application/json;charset=utf-8" },
      success: function (json) {
        if (json !== undefined && json != null) {
          let data = "";
          let val = json;
          data +=
                  " <h1>"+val.title+"</h1>"
                  + "<ul class=\"nav-title\">"
                  + "<li><i class=\"fa fa-user\" aria-hidden=\"true\"></i><span style=\"margin-left: 10px;\">"+val.author+"</span></li>"
                  + "<li><i class=\"fa fa-calendar\" aria-hidden=\"true\"></i><span style=\"margin-left: 10px;\">" + val.date + "</span></li>"
                  + "<li><i class=\"fa fa-comments\" aria-hidden=\"true\"></i><span style=\"margin-left: 10px;\">" + val.author +"</span></li>"
                  + "</ul>"
                  + "<div class=\"context\">"
                  + "<div class=\"img_blog_shop\">"
                  + "<img src=\"" + val.image_url + "\" alt=\"\" srcset=\"\">"
                  + "<p>" + val.title + "</p>"
                  + "</div>"
                  + "<p>" + val.post_content + "</p>"
                  + "</div>";
          $(".title-context").html(data);
            $(".tags").remove();
            $(".lead-capture__article-footer__row").remove();
            $(".related-article").remove();
            $("#rc-anchor-container").remove();
        }
      }
    });
  }
  let idOfBlog = "${blogid}";
  if(idOfBlog !=""&&idOfBlog!=undefined){
    ajaxBlog(idOfBlog);
  }else{
    ajaxBlog("po0001");
  }

</script>
</body>

</html>