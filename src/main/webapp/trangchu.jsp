<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="utils.Utils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="model.GioHang" %>
<%@ page import="model.SanPham" %>
<%@ page import="connection.ConnectionDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Trang chủ - Phone Group 02</title>
    <script src="js/defer_plus.js" type="text/javascript"></script>
    <script>deferscript('js/polyfill.js', 'polyfill-js', 1)</script>
    <meta name="description" content="">
    <meta name="keywords" content="Kiến vàng, Ant Theme"/>
    <link rel="canonical" href="https://ant-mobile.bizwebvietnam.net"/>
    <meta name='revisit-after' content='1 days'/>
    <meta name="robots" content="noodp,index,follow"/>
    <link rel="icon" href="https://images.cooltext.com/5362564.png"/>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/favicon.png?1559638811340"
          type="image/x-icon"/>
    <meta property="og:type" content="website">
    <meta property="og:title" content="Ant Mobile">
    <meta property="og:image"
          content="https:https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/logo.png?1559638811340">
    <meta property="og:image:secure_url"
          content="https:https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/logo.png?1559638811340">
    <meta property="og:description" content="">
    <meta property="og:url" content="https://ant-mobile.bizwebvietnam.net">
    <meta property="og:site_name" content="Ant Mobile">
    <link href="css/bootstrap.scss.css" rel="stylesheet" type="text/css"/>
    <link href="css/plugin.scss.css" rel="stylesheet" type="text/css"/>
    <link href="css/base.scss.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/option-selectors.js" type="text/javascript"></script>
<script src="js/api.jquery.js?4" type="text/javascript"></script>
<script src="js/owl.carousel.min.js" type="text/javascript"></script>
<h1 class="hidden">Mobile</h1>

    
<script type="text/javascript">
    WebFontConfig = {
        custom: {
            families: ['FontAwesome'],
            urls: ['https://use.fontawesome.com/releases/v5.7.2/css/all.css']
        }
    };
    (function () {
        var wf = document.createElement('script');
        wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
    })();
</script>
<script>
    $(document).ready(function () {
        deferimg('#sync1 img', 10);
        var total_banner = 5;
        var sync1 = $("#sync1");
        var sync2 = $("#sync2");
        var slidesPerPage = (total_banner < 5) ? total_banner : 5;
        var syncedSecondary = true;
        sync1.owlCarousel({
            items: 1,
            slideSpeed: 2000,
            nav: true,
            autoplay: true,
            dots: false,
            loop: true,
            responsiveRefreshRate: 200,
            navText: "",
        }).on('changed.owl.carousel', syncPosition);
        sync2
            .on('initialized.owl.carousel', function () {
                sync2.find(".owl-item").eq(0).addClass("current");
            })
            .owlCarousel({
                items: slidesPerPage,
                dots: false,
                nav: false,
                smartSpeed: 200,
                slideSpeed: 500,
                slideBy: slidesPerPage,
                responsiveRefreshRate: 100
            }).on('changed.owl.carousel', syncPosition2);

        function syncPosition(el) {
            var count = el.item.count - 1;
            var current = Math.round(el.item.index - (el.item.count / 2) - .5);
            if (current < 0) {
                current = count;
            }
            if (current > count) {
                current = 0;
            }
            sync2
                .find(".owl-item")
                .removeClass("current")
                .eq(current)
                .addClass("current");
            var onscreen = sync2.find('.owl-item.active').length - 1;
            var start = sync2.find('.owl-item.active').first().index();
            var end = sync2.find('.owl-item.active').last().index();
            if (current > end) {
                sync2.data('owl.carousel').to(current, 100, true);
            }
            if (current < start) {
                sync2.data('owl.carousel').to(current - onscreen, 100, true);
            }
        }

        function syncPosition2(el) {
            if (syncedSecondary) {
                var number = el.item.index;
                sync1.data('owl.carousel').to(number, 100, true);
            }
        }

        sync2.on("click", ".owl-item", function (e) {
            e.preventDefault();
            var number = $(this).index();
            sync1.data('owl.carousel').to(number, 300, true);
        });
    });
</script>
<div class="support-cart mini-cart hidden-sm hidden-xs" >
    <a class="btn-support-cart" href="<%=Utils.fullPath("CartController")%>" >
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 435.104 435.104" style="enable-background:new 0 0 435.104 435.104;" xml:space="preserve" width="30px" height="30px">
               <g>
                   <circle cx="154.112" cy="377.684" r="52.736" data-original="#000000" class="active-path" data-old_color="#Ffffff" fill="#FFFFFF"/>
                   <path d="M323.072,324.436L323.072,324.436c-29.267-2.88-55.327,18.51-58.207,47.777c-2.88,29.267,18.51,55.327,47.777,58.207     c3.468,0.341,6.962,0.341,10.43,0c29.267-2.88,50.657-28.94,47.777-58.207C368.361,346.928,348.356,326.924,323.072,324.436z" data-original="#000000" class="active-path" data-old_color="#F8F8F8" fill="#FFFFFF"/>
                   <path d="M431.616,123.732c-2.62-3.923-7.059-6.239-11.776-6.144h-58.368v-1.024C361.476,54.637,311.278,4.432,249.351,4.428     C187.425,4.424,137.22,54.622,137.216,116.549c0,0.005,0,0.01,0,0.015v1.024h-43.52L78.848,50.004     C77.199,43.129,71.07,38.268,64,38.228H0v30.72h51.712l47.616,218.624c1.257,7.188,7.552,12.397,14.848,12.288h267.776     c7.07-0.041,13.198-4.901,14.848-11.776l37.888-151.552C435.799,132.019,434.654,127.248,431.616,123.732z M249.344,197.972     c-44.96,0-81.408-36.448-81.408-81.408s36.448-81.408,81.408-81.408s81.408,36.448,81.408,81.408     C330.473,161.408,294.188,197.692,249.344,197.972z" data-original="#000000" class="active-path" data-old_color="#F8F8F8" fill="#FFFFFF"/>
                   <path d="M237.056,118.1l-28.16-28.672l-22.016,21.504l38.912,39.424c2.836,2.894,6.7,4.55,10.752,4.608     c3.999,0.196,7.897-1.289,10.752-4.096l64.512-60.928l-20.992-22.528L237.056,118.1z" data-original="#000000" class="active-path" data-old_color="#F8F8F8" fill="#FFFFFF"/>
               </g>
            </svg>
        <div class="animated infinite zoomIn kenit-alo-circle"></div>
        <div class="animated infinite pulse kenit-alo-circle-fill"></div>
        <% GioHang c =(GioHang) session.getAttribute("Cart");
            int count = c == null ? 0 : c.list().size();
        %>
        <span class="cnt crl-bg count_item_pr"><%=count%></span>

    </a>
    <div class="top-cart-content hidden-md hidden-sm hidden-xs">
        <ul>


        </ul>

    </div>
</div>
<div id="menu-overlay" class=""></div>
</body>
</html>
