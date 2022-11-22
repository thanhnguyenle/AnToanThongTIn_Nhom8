<%@ page import="vn.edu.hcmuaf.fit.laptrinhweb.controller.web.Asset" %>
<!--Messenger chat-->
<!-- FACEBOOK CHAT WIDGET-->
<!-- //banner -->
<!--facebook live-->
<meta property="fb:app_id" content="1106802269902043"/>
<meta property="fb:admins" content="100005868942037"/>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>--%>
<%--<script async defer crossorigin="anonymous"--%>
<%--        src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v14.0&appId=1106802269902043&autoLogAppEvents=1"--%>
<%--        nonce="EknEoy7g"></script>--%>
<script src="<%= Asset.url("/template/web/js/jquery.js")%>"></script>
<div class="fb-livechat">
    <div class="ctrlq fb-overlay"></div>
    <div class="fb-widget">
        <div class="ctrlq fb-close"></div>
        <div class="fb-page" data-href="https://www.facebook.com/Thestarbuck-108540498635694" data-tabs="messages"
             data-width="360" data-height="400" data-small-header="true" data-hide-cover="true"
             data-show-facepile="false">
        </div>
        <div class="fb-credit"><a href="https://www.facebook.com/Thestarbuck-108540498635694" target="_blank">Powered by 3 Con Ca</a></div>
        <div id="fb-root"></div>
    </div>
    <a href="https://www.facebook.com/Thestarbuck-108540498635694" title="Send us a message via Facebook"
       class="ctrlq fb-button">
        <div class="bubble">1</div>
    </a></div>
<script>
    $(document).ready(function () {
        let t = {delay: 125, overlay: $(".fb-overlay"), widget: $(".fb-widget"), button: $(".fb-button")};
        setTimeout(function () {
            $('div.fb-livechat').fadeIn()
        }, 8 * t.delay), $(".ctrlq").on("click", function (e) {
            e.preventDefault(), t.overlay.is(":visible") ? (t.overlay.fadeOut(t.delay), t.widget.stop().animate({
                bottom: 0,
                opacity: 0
            }, 2 * t.delay, function () {
                $(this).hide("slow"), t.button.show()
            })) : t.button.fadeOut("medium", function () {
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

