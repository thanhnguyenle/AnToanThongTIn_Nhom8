<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--JQUERY LIB--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js"></script>
<script>
    let lazyImages = [...document.querySelectorAll('.lazy-image')]
    let inAdvance = 300

    function lazyLoad() {
        lazyImages.forEach(image => {
            if (image.offsetTop < window.innerHeight + window.pageYOffset + inAdvance) {
                image.src = image.dataset.src
                image.onload = () => image.classList.add('loaded')
            }
        })
    }
    lazyLoad()
    window.addEventListener('scroll',_.throttle(lazyLoad,16))
    window.addEventListener('resize', _.throttle(lazyLoad,16))

</script>
<%--Navigation script--%>
<script>
    let openNav = document.querySelector(".open-btn");
    let closeNav = document.querySelector(".close-btn");
    let menu = document.querySelector(".nav-list");
    let searchBt = document.querySelector(".searchBt");
    let ipSearchBox = document.querySelector(".ipSearchBox");
    let iconUp = document.querySelector(".iconUp");

    let flag = 0;
    if (typeof(closeNav) != 'undefined' && closeNav != null
        &&typeof(menu) != 'undefined' && menu != null
        &&typeof(openNav) != 'undefined' && openNav != null)
    {
        closeNav.addEventListener("click", () => {
            menu.classList.remove("show");
        });

        function add1() {
            menu.classList.add("show");
        }

        function remove1() {
            menu.classList.remove("show");
        }

        function onclick1() {
            if (flag === 0) {
                add1();
                flag++;
            } else {
                remove1();
                flag = 0;
            }
        }
        openNav.addEventListener("click", onclick1);

        // Fixed Nav
        const navBar = document.querySelector(".nav");
        const navHeight = navBar.getBoundingClientRect().height;
        window.addEventListener("scroll", () => {
            const scrollHeight = window.pageYOffset;
            if (scrollHeight > navHeight) {
                navBar.classList.add("fix-nav");
            } else {
                navBar.classList.remove("fix-nav");
            }
        });

        // Scroll To
        const links = [...document.querySelectorAll(".scroll-link")];
        links.map((link) => {
            if (!link) return;
            link.addEventListener("click", (e) => {
                e.preventDefault();

                const id = e.target.getAttribute("href").slice(1);

                const element = document.getElementById(id);
                const fixNav = navBar.classList.contains("fix-nav");
                let position = element.offsetTop - navHeight;

                window.scrollTo({
                    top: position,
                    left: 0,
                });

                navBar.classList.remove("show");
                menu.classList.remove("show");
                document.body.classList.remove("show");
            });
        });
    }
    // shadow when scrolling use jquery
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll > 0) {
            $("#header").addClass("active");
        } else {
            $("#header").removeClass("active");
        }
    });

    if (typeof(searchBt) != 'undefined' && searchBt != null
        &&typeof(ipSearchBox) != 'undefined' && ipSearchBox != null) {

        //search
        let countSe = 0;

        function add() {
            ipSearchBox.innerHTML = "<input type='text' id='ipSearch' placeholder='Eg: capuchino' />";
            $(ipSearchBox).append('<div class="search_container">coffee</div>');
            $(document).ready(function() {
                $("#ipSearch").keyup(function () {
                    // alert("jcdsndsnj");
                    console.log($('#ipSearch').val());
                    $.ajax({
                        method: "POST",
                        url: "searchAjax?product_search=" + $('#ipSearch').val(),
                        // data: { name: "John", location: "Boston" }
                        success: function (data) {
                            $('.search_container').empty();
                            let parsedObj =JSON.parse(data);
                            parsedObj.forEach((elements) => $('.search_container').append(
                                "<a class='search_item' href=\"<%=request.getContextPath()%>/detailProduct?id=" + elements['id'] + "\">" + elements['name'] + "</a>"));
                            parsedObj.forEach((elements) => console.log(elements['id']));
                        }
                    })
                });
            });
        }

        function remove() {
            ipSearchBox.innerHTML = "";
        }

        function clickRun() {
            ipSearchBox.classList.toggle("section")
            if (countSe === 0) {
                add();
                countSe++;
            } else {
                remove();
                countSe = 0;
            }
        }
        searchBt.addEventListener("click",function (e){
            clickRun();
            console.log(ipSearchBox);
        });
    }

    if (typeof(iconUp) != 'undefined' && iconUp != null) {
        window.onscroll = function () {
            scrollFunction();
        };

        function scrollFunction() {
            if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
                iconUp.style.display = "block";
                iconUp.style.color = "#00a05d"
            } else {
                iconUp.style.display = "none";
                topFunction();
            }
        }

        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
        iconUp.addEventListener("click", scrollFunction);
    }
</script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script>
    // Open modal in AJAX callback
    let onetime = false;
        $('#manual-ajax').on('click',function (event) {
           event.preventDefault();
            this.blur(); // Manually remove focus from clicked link.
            if (!onetime) {
                $.get("<c:url value='/views/web/profileAccount.jsp'/>", function (html) {
                    $(html).appendTo('body').modal();
                });
                onetime = true;
            }else{
                document.querySelectorAll(".modal").forEach(a=>a.style.display = "block");
            }
        });
</script>