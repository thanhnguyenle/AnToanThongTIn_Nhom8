<%--
  Created by IntelliJ IDEA.
  User: DUONGMINHNHU
  Date: 11/12/2021
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<meta property="fb:app_id" content="1106802269902043"/>
<meta property="fb:admins" content="100005868942037"/>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v14.0&appId=1106802269902043&autoLogAppEvents=1"
        nonce="EknEoy7g"></script>
<script src="${pageContext.request.contextPath}/template/web/js/jquery.js"></script>
<%--<div class="fb-livechat" style="margin-bottom: 4rem ;margin-right: 2rem ;overflow: hidden; position: fixed;right: 20px;  bottom: 80px;">--%>
<%--    <div class="ctrlq fb-overlay"></div>--%>
<%--    <div class="fb-widget">--%>
<%--        <div class="ctrlq fb-close"></div>--%>
<%--        <div class="fb-page" data-href="https://www.facebook.com/Thestarbuck-108540498635694" data-tabs="messages"--%>
<%--             data-width="360" data-height="400" data-small-header="true" data-hide-cover="true"--%>
<%--             data-show-facepile="false">--%>
<%--        </div>--%>
<%--        <div class="fb-credit" style="font-weight: bold"><a href="https://www.facebook.com/Thestarbuck-108540498635694" target="_blank">Powered by 3 Con Ca</a></div>--%>
<%--        <div id="fb-root"></div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div title="Send us a message via Facebook"--%>
<%--     class="ctrlq fb-button">--%>
<%--    <img class="messenger" src="<c:url value='https://i.ibb.co/kQJ0hLq/mees.png'/>" alt="" width="70px">--%>
<%--</div>--%>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>--%>
<div class="up">
    <a href="#" class="iconUp"><i class="fa fa-arrow-circle-up"></i></a>
</div>
<!-- Footer -->
<footer id="footer" class="section footer">
    <div class="container">
        <div class="footer-container">

            <div class="footer-center">
                <h3>INFORMATION</h3>
                <a href="<c:url value='/views/web/aboutUs.jsp'/>">About Us</a>
                <a href="<c:url value='/views/web/contact.jsp'/>">Contact Us</a>
                <a href="#">Site Map</a>
            </div>

            <div class="footer-center">
                <h3>SOCIAL MEDIA</h3>
                <div class="social_media">
            <span>
              <i class="fab fa-facebook"></i>
            </span>
                    <a href="<c:url value='https://www.facebook.com/duonhthiminhnhu0109'/>">Facebook</a>
                </div>
                <div class="social_media">
            <span>
              <i class="fab fa-twitter"></i>
            </span>
                    <a href="#">Twitter</a>

                </div>
                <div class="social_media">
            <span>
              <i class="fab fa-instagram"></i>
            </span>
                    <a href="#">Instagram</a>

                </div>


            </div>
            <div class="footer-center">
                <h3>CONTACT US</h3>
                <div>
            <span>
              <i class="fas fa-map-marker-alt"></i>
            </span>
                    42 Dream House, Dreammy street, 7131 Dreamville, USA
                </div>
                <div>
            <span>
              <i class="far fa-envelope"></i>
            </span>
                    company@gmail.com
                </div>
                <div>
            <span>
              <i class="fas fa-phone"></i>
            </span>
                    456-456-4512
                </div>
                <div class="payment-methods">
                    <img src="<c:url value='https://i.ibb.co/Fgzb6RY/payment.png'/>" alt="">
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    $(document).ready(function () {
        let t = {delay: 125, overlay: $(".fb-overlay"), widget: $(".fb-widget"), button: $(".fb-button"),livechat:$('div.fb-livechat')};
        setTimeout(function () {
            t.livechat.fadeIn()
        }, 8 * t.delay), t.button.on("click", function (e) {
             t.overlay.is(":visible") ?
                (t.overlay.fadeOut(t.delay), t.widget.stop().animate({
                bottom: 0,
                opacity: 0
            }, function () {
                t.button.show()
            })) : t.button.fadeIn(
                "medium", function () {
                t.widget.stop().show().animate({bottom: "30px", opacity: 1}, 2 * t.delay), t.overlay.fadeIn(t.delay)
            })
        })
    });


    $(document).ready(function () {
        var f = {delay: 125, overlay: $(".noti-overlay"), widget: $(".noti-widget"), button: $(".noti-button")};
        setTimeout(function () {
            $("div.noti-recieve").fadeIn()
        }, 8 * f.delay), $(".ctrlf").on("click", function (e) {
            e.preventDefault(), f.overlay.is(":visible") ? (f.overlay.fadeOut(f.delay), f.widget.stop().animate({
                bottom: 0,
                opacity: 0
            }, 2 * f.delay, function () {
                $(this).hide("slow"), f.button.show()
            })) : f.button.fadeOut("medium", function () {
                f.widget.stop().show().animate({bottom: "160px", opacity: 1}, 2 * f.delay), f.overlay.fadeIn(f.delay)
            })
        })
    });
</script>
<script>
    var chatbox = document.getElementById('fb-customer-chat');
    chatbox.setAttribute("page_id", "108540498635694");
    chatbox.setAttribute("attribution", "biz_inbox");
</script>

<!-- Your SDK code -->
<script>
    window.fbAsyncInit = function() {
        FB.init({
            xfbml            : true,
            version          : 'v14.0'
        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>


<!-- End Footer -->