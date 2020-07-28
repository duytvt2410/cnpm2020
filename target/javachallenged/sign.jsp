<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="utils.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Đăng nhập - Phone Group 02</title>
    <script src="js/defer_plus.js" type="text/javascript"></script>
    <script>deferscript('js/polyfill.js', 'polyfill-js', 1)</script>
    <meta name="description" content="">
    <meta name="keywords" content="Kiến vàng, Ant Theme"/>
    <link rel="canonical" href="https://ant-mobile.bizwebvietnam.net"/>
    <meta name='revisit-after' content='1 days' />
    <meta name="robots" content="noodp,index,follow" />
    <link rel="icon" href="https://images.cooltext.com/5362564.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--    <link rel="icon" href="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/favicon.png?1559638811340" type="image/x-icon" />-->
    <meta property="og:type" content="website">
    <meta property="og:title" content="Ant Mobile">
    <meta property="og:image" content="https:https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/logo.png?1559638811340">
    <meta property="og:image:secure_url" content="https:https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/logo.png?1559638811340">
    <meta property="og:description" content="">
    <meta property="og:url" content="https://ant-mobile.bizwebvietnam.net">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta property="og:site_name" content="Ant Mobile">
    <link href="css/bootstrap.scss.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin.scss.css" rel="stylesheet" type="text/css" />
    <link href="css/base.scss.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/custom.css">
    <!--    <link rel="stylesheet" href="css/loginstyle.css">-->
</head>
<body >
<jsp:include page="header.jsp"/>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/option-selectors.js" type="text/javascript"></script>
<script src="js/api.jquery.js?4" type="text/javascript"></script>
<script src="js/owl.carousel.min.js" type="text/javascript"></script>
<div class="content-login">
    <div class="left-login">
        <div class="img-left-login">
            <img height="900px" width="350px" src="https://in129.vn/wp-content/uploads/2018/09/mau-to-roi-quang-cao-dep.jpg">
        </div>
        <div class="img-left-login" style="margin-top: 5px">
            <img height="600px" width="350px" src="https://raovat.vn/data/avatars/o/43/43980.jpg?1566539177">
        </div>
    </div>

<div class="form-login-regeter">
<form class="form-login-regeter" action="<%=Utils.fullPath("dangnhap")%>" method="post">
    <div class="imgcontainer ">
        <div class="option">
            <div class="w3-content w3-section" style="max-width:780px">
                <img class="mySlides" src="https://cdn.tgdd.vn/2019/12/banner/800-170-800x170-90.png" style="width:100%">
                <img class="mySlides" src="https://cdn.tgdd.vn/2019/12/banner/800-170-800x170-96.png" style="width:100%">
                <img class="mySlides" src="https://cdn.tgdd.vn/2019/12/banner/800-170-800x170-1.png" style="width:100%">

            </div>

        </div>
    </div>
    <% String mess = (String) request.getAttribute("message");
        String tenDangNhap = (String) request.getAttribute("tenDangNhap");
        if(tenDangNhap == null) tenDangNhap = "";
    %>

    <%--Use case: Đăng nhập.
		B2.1: Hệ thống hiển thị form để người dùng nhập thông tin đăng nhập
		(tên đăng nhập, mật khẩu). và các nút Đăng ký, Quên mật khẩu--%>

    <div class=" login-geter">
        <% if (mess != null) { %>
        <div class="alert-danger padding-20"><%=mess%></div>
        <% } %>

        <label ><b>Tên đăng nhập</b></label>
        <input class=" login-geter1" type="text" placeholder="Tên đăng nhập" name="uname" required value="<%=tenDangNhap%>">

        <label ><b>Mật khẩu</b></label>
        <input class=" login-geter1" type="password" placeholder="Nhập mậu khẩu" name="pwd" required>
        <label>
            <input type="checkbox" checked="checked" name="remember"> Nhớ mật khẩu
        </label>

        <%-- Use case: Đăng nhập
            B3: Người dùng nhập thông tin đăng nhập vào form và nhấn Enter hoặc chọn nút Đăng nhập
        --%>
        <button class="login-buton" type="submit"><a style="color: #fefefe">Đăng nhập</a></button>


        <div class="container-loginadd" >
            <a class="cancelbtn"  href="<%=Utils.fullPath("dangky")%>" >Đăng kí</a> &emsp;
            <span class="adpsw">Quên <a href="#">Mật khẩu?</a></span>

        </div>
    </div>


</form>
</div>
    <div class="right-login">
        <div class="img-left-login">
            <img height="600px" width="350px" src="data:image/jpeg;base64,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">
        </div>
    </div>
</div>
<footer class="footer ">
    <div class="site-footer">
        <div class="container">
            <div class="footer-inner">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="footer-widget">
                            <h3><span>Thông tin công ty</span></h3>
                            <ul class="list-menu">
                                <li><a href="index.html">Trang chủ</a></li>
                                <li><a href="gioithieu.html">Giới thiệu</a></li>
                                <li><a href="sanpham.html">Sản phẩm</a></li>
                                <!--                                <li><a href="/tin-tuc">Tin tức</a></li>-->
                                <li><a href="lienhe.html">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="footer-widget">
                            <h3><span>Chính sách</span></h3>
                            <ul class="list-menu">

                                <li><a href="#">Bảo hành</a></li>
                                <li><a href="#">Đổi trả hàng</a></li>
                                <li><a href="tintuc.html">Tin tức</a></li>
                                <li><a href="lienhe.html">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="footer-widget">
                            <h3><span>Chính sách hỗ trợ khách hàng</span></h3>
                            <ul class="list-menu">
                                <li><a >Gọi mua hàng 1800.1060 (7:30 - 22:00)</a></li>
                                <li><a>Gọi khiếu nại   1800.1062 (8:00 - 21:30)</a></li>
                                <li><a>Gọi bảo hành   1800.1064 (8:00 - 21:00)</a></li>
                                <li><a>Kỹ thuật           1800.1763 (7:30 - 22:00)</a></li>
                                <!--                                <li><a href="/lien-he">Liên hệ</a></li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="footer-widget">
                            <h3><span>Liên hệ với chúng tôi</span></h3>
                            <ul class="list-menu">
                                <li><a ><b>Địa chỉ: </b>kp6, P.Linh Trung, Q.Thủ Đưc, HCM</a></li>
                                <li><a ><b>Sđt: </b> 0964024229</a></li>
                                <li><a ><b>Email: </b>Team02@gmail.com</a></li>
                                <!--                                <li><a href="/tin-tuc">Tin tức</a></li>-->
                                <!--                                <li><a href="/lien-he">Liên hệ</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row bottom-footer">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="footer-widget footer-payment">
                            <h3><span>Phương thức thanh toán</span></h3>
                            <ul class="list-menu clearfix">
                                <li class="item">
                                    <img src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/payment_1.png?1559638811340" alt="Phương thức thanh toán" />
                                </li>
                                <li class="item">
                                    <img src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/payment_2.png?1559638811340" alt="Phương thức thanh toán" />
                                </li>
                                <li class="item">
                                    <img src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/payment_3.png?1559638811340" alt="Phương thức thanh toán" />
                                </li>
                                <li class="item">
                                    <img src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/payment_4.png?1559638811340" alt="Phương thức thanh toán" />
                                </li>
                                <li class="item">
                                    <img src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/payment_5.png?1559638811340" alt="Phương thức thanh toán" />
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="footer-widget footer-social">
                            <h3><span>Kết nối với chúng tôi</span></h3>
                            <ul class="list-menu list-inline">
                                <li class="twitter">
                                    <a href="https://www.twitter.com/" target="_blank">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 612 612" style="enable-background:new 0 0 612 612;" xml:space="preserve" width="15px" height="15px">
                                       <g>
                                          <path d="M612,116.258c-22.525,9.981-46.694,16.75-72.088,19.772c25.929-15.527,45.777-40.155,55.184-69.411    c-24.322,14.379-51.169,24.82-79.775,30.48c-22.907-24.437-55.49-39.658-91.63-39.658c-69.334,0-125.551,56.217-125.551,125.513    c0,9.828,1.109,19.427,3.251,28.606C197.065,206.32,104.556,156.337,42.641,80.386c-10.823,18.51-16.98,40.078-16.98,63.101    c0,43.559,22.181,81.993,55.835,104.479c-20.575-0.688-39.926-6.348-56.867-15.756v1.568c0,60.806,43.291,111.554,100.693,123.104    c-10.517,2.83-21.607,4.398-33.08,4.398c-8.107,0-15.947-0.803-23.634-2.333c15.985,49.907,62.336,86.199,117.253,87.194    c-42.947,33.654-97.099,53.655-155.916,53.655c-10.134,0-20.116-0.612-29.944-1.721c55.567,35.681,121.536,56.485,192.438,56.485    c230.948,0,357.188-191.291,357.188-357.188l-0.421-16.253C573.872,163.526,595.211,141.422,612,116.258z" data-original="#010002" class="active-path" data-old_color="#010002" fill="#FFFFFF"/>
                                       </g>
                                    </svg>
                                    </a>
                                </li>
                                <li class="facebook">
                                    <a href="https://www.facebook.com/" target="_blank">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15px" height="15px" viewBox="0 0 430.113 430.114" style="enable-background:new 0 0 430.113 430.114;" xml:space="preserve">
                                       <path id="Facebook" d="M158.081,83.3c0,10.839,0,59.218,0,59.218h-43.385v72.412h43.385v215.183h89.122V214.936h59.805   c0,0,5.601-34.721,8.316-72.685c-7.784,0-67.784,0-67.784,0s0-42.127,0-49.511c0-7.4,9.717-17.354,19.321-17.354   c9.586,0,29.818,0,48.557,0c0-9.859,0-43.924,0-75.385c-25.016,0-53.476,0-66.021,0C155.878-0.004,158.081,72.48,158.081,83.3z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                    </svg>
                                    </a>
                                </li>
                                <li class="pinterest">
                                    <a href="https://www.pinterest.com/" target="_blank">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 310.05 310.05" style="enable-background:new 0 0 310.05 310.05;" xml:space="preserve" width="15px" height="15px">
                                       <path id="XMLID_799_" d="M245.265,31.772C223.923,11.284,194.388,0,162.101,0c-49.32,0-79.654,20.217-96.416,37.176   c-20.658,20.9-32.504,48.651-32.504,76.139c0,34.513,14.436,61.003,38.611,70.858c1.623,0.665,3.256,1,4.857,1   c5.1,0,9.141-3.337,10.541-8.69c0.816-3.071,2.707-10.647,3.529-13.936c1.76-6.495,0.338-9.619-3.5-14.142   c-6.992-8.273-10.248-18.056-10.248-30.788c0-37.818,28.16-78.011,80.352-78.011c41.412,0,67.137,23.537,67.137,61.425   c0,23.909-5.15,46.051-14.504,62.35c-6.5,11.325-17.93,24.825-35.477,24.825c-7.588,0-14.404-3.117-18.705-8.551   c-4.063-5.137-5.402-11.773-3.768-18.689c1.846-7.814,4.363-15.965,6.799-23.845c4.443-14.392,8.643-27.985,8.643-38.83   c0-18.55-11.404-31.014-28.375-31.014c-21.568,0-38.465,21.906-38.465,49.871c0,13.715,3.645,23.973,5.295,27.912   c-2.717,11.512-18.865,79.953-21.928,92.859c-1.771,7.534-12.44,67.039,5.219,71.784c19.841,5.331,37.576-52.623,39.381-59.172   c1.463-5.326,6.582-25.465,9.719-37.845c9.578,9.226,25,15.463,40.006,15.463c28.289,0,53.73-12.73,71.637-35.843   c17.367-22.418,26.932-53.664,26.932-87.978C276.869,77.502,265.349,51.056,245.265,31.772z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                    </svg>
                                    </a>
                                </li>
                                <li class="google">
                                    <a href="https://www.google.com/" target="_blank">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 491.858 491.858" style="enable-background:new 0 0 491.858 491.858;" xml:space="preserve" width="15px" height="15px" class="">
                                       <path d="M377.472,224.957H201.319v58.718H308.79c-16.032,51.048-63.714,88.077-120.055,88.077     c-69.492,0-125.823-56.335-125.823-125.824c0-69.492,56.333-125.823,125.823-125.823c34.994,0,66.645,14.289,89.452,37.346     l42.622-46.328c-34.04-33.355-80.65-53.929-132.074-53.929C84.5,57.193,0,141.693,0,245.928s84.5,188.737,188.736,188.737     c91.307,0,171.248-64.844,188.737-150.989v-58.718L377.472,224.957L377.472,224.957z" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                            <polygon points="491.858,224.857 455.827,224.857 455.827,188.826 424.941,188.826 424.941,224.857 388.91,224.857      388.91,255.74 424.941,255.74 424.941,291.772 455.827,291.772 455.827,255.74 491.858,255.74    " data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                    </svg>
                                    </a>
                                </li>
                                <li class="instagram">
                                    <a href="https://www.instagram.com/" target="_blank">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="15px" height="15px">
                                            <path d="m75 512h362c41.355469 0 75-33.644531 75-75v-362c0-41.355469-33.644531-75-75-75h-362c-41.355469 0-75 33.644531-75 75v362c0 41.355469 33.644531 75 75 75zm-45-437c0-24.8125 20.1875-45 45-45h362c24.8125 0 45 20.1875 45 45v362c0 24.8125-20.1875 45-45 45h-362c-24.8125 0-45-20.1875-45-45zm0 0" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                            <path d="m256 391c74.4375 0 135-60.5625 135-135s-60.5625-135-135-135-135 60.5625-135 135 60.5625 135 135 135zm0-240c57.898438 0 105 47.101562 105 105s-47.101562 105-105 105-105-47.101562-105-105 47.101562-105 105-105zm0 0" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                            <path d="m406 151c24.8125 0 45-20.1875 45-45s-20.1875-45-45-45-45 20.1875-45 45 20.1875 45 45 45zm0-60c8.269531 0 15 6.730469 15 15s-6.730469 15-15 15-15-6.730469-15-15 6.730469-15 15-15zm0 0" data-original="#000000" class="active-path" data-old_color="#000000" fill="#FFFFFF"/>
                                        </svg>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <div class="footer-widget footer-subcrible">
                            <h3><span>Đăng ký nhận tin</span></h3>
                            <p>Nhận thông tin sản phẩm mới nhất, tin khuyến mãi và nhiều hơn nữa.</p>
                            <form action="//facebook.us7.list-manage.com/subscribe/post?u=97ba6d3ba28239250923925a8&id=4ef3a755a8" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" target="_blank">
                                <div class="input-group">
                                    <input type="email" class="form-control" value="" placeholder="Email của bạn" name="EMAIL" id="mail">
                                    <span class="input-group-btn">
                                 <button class="btn btn-default" name="subscribe" id="subscribe" type="submit">Đăng ký</button>
                                 </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright clearfix">
        <div class="container">
            <div class="inner clearfix">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <span>Design by @ <span class="s480-f">|</span> <a href="http://hci2019group13.tk/">Group 02</a></span>
                    </div>
                </div>
            </div>
            <div class="back-to-top"><i class="fa  fa-arrow-circle-up"></i></div>
        </div>
    </div>
</footer>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js" type="text/javascript"></script>
<div class="ajax-load">
         <span class="loading-icon">
            <svg version="1.1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 width="24px" height="30px" viewBox="0 0 24 30" style="enable-background:new 0 0 50 50;" xml:space="preserve">
               <rect x="0" y="10" width="4" height="10" fill="#333" opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0s" dur="0.6s" repeatCount="indefinite" />
                  <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />
                  <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />
               </rect>
               <rect x="8" y="10" width="4" height="10" fill="#333"  opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                  <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                  <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
               </rect>
               <rect x="16" y="10" width="4" height="10" fill="#333"  opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                  <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                  <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
               </rect>
            </svg>
         </span>
</div>
<div class="loading awe-popup">
    <div class="overlay"></div>
    <div class="loader" title="2">
        <svg version="1.1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
             width="24px" height="30px" viewBox="0 0 24 30" style="enable-background:new 0 0 50 50;" xml:space="preserve">
               <rect x="0" y="10" width="4" height="10" fill="#333" opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0s" dur="0.6s" repeatCount="indefinite" />
                   <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />
                   <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />
               </rect>
            <rect x="8" y="10" width="4" height="10" fill="#333"  opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
               </rect>
            <rect x="16" y="10" width="4" height="10" fill="#333"  opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
               </rect>
            </svg>
    </div>
</div>
<div class="addcart-popup product-popup awe-popup">
    <div class="overlay no-background"></div>
    <div class="content">
        <div class="row row-noGutter">
            <div class="col-xl-6 col-xs-12">
                <div class="btn btn-full btn-primary a-left popup-title"><i class="fa fa-check"></i>Thêm vào giỏ hàng thành công
                </div>
                <a href="javascript:void(0)" class="close-window close-popup"><i class="fa fa-close"></i></a>
                <div class="info clearfix">
                    <div class="product-image margin-top-5"><img alt="popup" src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/logo.png?1559638811340" style="max-width:150px; height:auto"/></div>
                    <div class="product-info">
                        <p class="product-name"></p>
                        <p class="quantity color-main"><span>Số lượng: </span></p>
                        <p class="total-money color-main"><span>Tổng tiền: </span></p>
                    </div>
                    <div class="actions"><button class="btn  btn-primary  margin-top-5 btn-continue">Tiếp tục mua hàng</button><button class="btn btn-gray margin-top-5" onclick="window.location='/cart'">Kiểm tra giỏ hàng</button></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="error-popup awe-popup">
    <div class="overlay no-background"></div>
    <div class="popup-inner content">
        <div class="error-message"></div>
    </div>
</div>
<!--<div id="popup-cart" class="modal fade" role="dialog">-->
<!--    <div id="popup-cart-desktop" class="clearfix">-->
<!--        <div class="title-popup-cart"><i class="ion ion-md-notifications-outline" aria-hidden="true"></i> Bạn đã thêm <span class="cart-popup-name"></span> vào giỏ hàng</div>-->
<!--        <div class="title-quantity-popup"><a href="giohang.html" title="Giỏ hàng của bạn">Giỏ hàng của bạn có <span class="cart-popup-count"></span> sản phẩm</a></div>-->
<!--        <div class="content-popup-cart clearfix">-->
<!--            <div class="thead-popup">-->
<!--                <div style="width: 55%;" class="text-left">Sản phẩm</div>-->
<!--                <div style="width: 15%;" class="text-center">Đơn giá</div>-->
<!--                <div style="width: 15%;" class="text-center">Số lượng</div>-->
<!--                <div style="width: 15%;" class="text-center">Thành tiền</div>-->
<!--            </div>-->
<!--            <div class="tbody-popup"></div>-->
<!--            <div class="tfoot-popup">-->
<!--                <div class="tfoot-popup-1 clearfix">-->
<!--                    <div class="pull-left popupcon"><a class="button btn-continue" title="Tiếp tục mua hàng" onclick="$('#popup-cart').modal('hide');"><span><span><i class="fa fa-caret-left" aria-hidden="true"></i> Tiếp tục mua hàng</span></span></a></div>-->
<!--                    <div class="pull-right popup-total">-->
<!--                        <p>Thành tiền: <span class="total-price"></span></p>-->
<!--                    </div>-->
<!--                </div>-->
<!--                <div class="tfoot-popup-2 clearfix"><a class="button btn-proceed-checkout" title="Thanh toán đơn hàng" href="/checkout"><span>Thanh toán đơn hàng</span></a></div>-->
<!--            </div>-->
<!--        </div>-->
<!--        <a class="quickview-close close-window" href="javascript:" onclick="$('#popup-cart').modal('hide');" title="Đóng"><i class="fa fa-times"></i></a>-->
<!--    </div>-->
<!--</div>-->
<div id="myModal" class="modal fade" role="dialog"></div>
<script src="js/appear.js" type="text/javascript"></script>
<script src="js/cs.script.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>
<div class="backdrop__body-backdrop___1rvky"></div>
<div class="mobile-main-menu">
    <div class="drawer-header">
        <a href="account/login">
            <div class="drawer-header--auth">
                <div class="_object"><img src="https://bizweb.dktcdn.net/100/348/133/themes/709285/assets/user.svg?1559638811340" alt="Ant Mobile" /></div>
                <div class="_body">ĐĂNG NHẬP<br>Nhận nhiều ưu đãi hơn</div>
            </div>
        </a>
    </div>
    <ul class="ul-first-menu">
        <li><a href="/account/login" title="Đăng nhập">Đăng nhập</a></li>
        <li><a href="/account/register" title="Đăng ký">Đăng ký</a></li>
    </ul>
    <div class="la-scroll-fix-infor-user">
        <div class="la-nav-menu-items">
            <div class="la-title-nav-items"><strong>Danh mục</strong></div>
            <ul class="la-nav-list-items">
                <li class="ng-scope"><a href="/" title="Trang chủ">Trang chủ</a></li>
                <li class="ng-scope"><a href="/gioi-thieu" title="Giới thiệu">Giới thiệu</a></li>
                <li class="ng-scope ng-has-child1">
                    <a href="product.html" title="Sản phẩm">Sản phẩm <i class="fa fa-plus fa1" aria-hidden="true"></i></a>
                    <ul class="ul-has-child1">
                        <li class="ng-scope ng-has-child2">
                            <a href="/dien-thoai" title="Điện thoại">Điện thoại <i class="fa fa-plus fa2" aria-hidden="true"></i></a>
                            <ul class="ul-has-child2">
                                <li class="ng-scope"><a href="/samsung" title="Samsung">Samsung</a></li>
                                <li class="ng-scope"><a href="/apple" title="Apple">Apple</a></li>
                                <li class="ng-scope"><a href="/sony" title="Sony">Sony</a></li>
                                <li class="ng-scope"><a href="/oppo" title="Oppo">Oppo</a></li>
                                <li class="ng-scope"><a href="/huawei" title="Huawei">Huawei</a></li>
                                <li class="ng-scope"><a href="/xiaomi" title="Xiaomi">Xiaomi</a></li>
                                <li class="ng-scope"><a href="/vivo" title="Vivo">Vivo</a></li>
                            </ul>
                        </li>
                        <li class="ng-scope ng-has-child2">
                            <a href="/tablet" title="Tablet">Tablet <i class="fa fa-plus fa2" aria-hidden="true"></i></a>
                            <ul class="ul-has-child2">
                                <li class="ng-scope"><a href="/apple-ipad" title="Apple (iPad)">Apple (iPad)</a></li>
                                <li class="ng-scope"><a href="/samsung-1" title="Samsung">Samsung</a></li>
                                <li class="ng-scope"><a href="/lenovo-1" title="Lenovo">Lenovo</a></li>
                                <li class="ng-scope"><a href="/masstel" title="Masstel">Masstel</a></li>
                                <li class="ng-scope"><a href="/huawei-1" title="Huawei">Huawei</a></li>
                                <li class="ng-scope"><a href="/itel" title="Itel">Itel</a></li>
                            </ul>
                        </li>
                        <li class="ng-scope ng-has-child2">
                            <a href="/laptop" title="Laptop">Laptop <i class="fa fa-plus fa2" aria-hidden="true"></i></a>
                            <ul class="ul-has-child2">
                                <li class="ng-scope"><a href="/apple-macbook" title="Apple (Macbook)">Apple (Macbook)</a></li>
                                <li class="ng-scope"><a href="/asus" title="Asus">Asus</a></li>
                                <li class="ng-scope"><a href="/acer" title="Acer">Acer</a></li>
                                <li class="ng-scope"><a href="/dell" title="Dell">Dell</a></li>
                                <li class="ng-scope"><a href="/hp" title="HP">HP</a></li>
                                <li class="ng-scope"><a href="/lenovo" title="Lenovo">Lenovo</a></li>
                                <li class="ng-scope"><a href="/msi" title="MSI">MSI</a></li>
                            </ul>
                        </li>
                        <li class="ng-scope"><a href="/phu-kien" title="Phụ kiện">Phụ kiện</a></li>
                        <li class="ng-scope"><a href="/dong-ho" title="Đồng hồ">Đồng hồ</a></li>
                        <li class="ng-scope"><a href="/may-cu" title="Máy cũ">Máy cũ</a></li>
                    </ul>
                </li>
                <li class="ng-scope ng-has-child1">
                    <a href="/tin-tuc" title="Tin tức">Tin tức <i class="fa fa-plus fa1" aria-hidden="true"></i></a>
                    <ul class="ul-has-child1">
                        <li class="ng-scope ng-has-child2">
                            <a href="/" title="Sản phẩm">Sản phẩm <i class="fa fa-plus fa2" aria-hidden="true"></i></a>
                            <ul class="ul-has-child2">
                                <li class="ng-scope"><a href="/dien-thoai" title="Điện thoại">Điện thoại</a></li>
                                <li class="ng-scope"><a href="/tablet" title="Tablet">Tablet</a></li>
                                <li class="ng-scope"><a href="/laptop" title="Laptop">Laptop</a></li>
                                <li class="ng-scope"><a href="/phu-kien" title="Phụ kiện">Phụ kiện</a></li>
                                <li class="ng-scope"><a href="/dong-ho" title="Đồng hồ">Đồng hồ</a></li>
                                <li class="ng-scope"><a href="/may-cu" title="Máy cũ">Máy cũ</a></li>
                            </ul>
                        </li>
                        <li class="ng-scope"><a href="/" title="Liên hệ">Liên hệ</a></li>
                        <li class="ng-scope ng-has-child2">
                            <a href="/" title="Tin tức">Tin tức <i class="fa fa-plus fa2" aria-hidden="true"></i></a>
                            <ul class="ul-has-child2">
                                <li class="ng-scope"><a href="/" title="Sản phẩm">Sản phẩm</a></li>
                                <li class="ng-scope"><a href="/" title="Liên hệ">Liên hệ</a></li>
                                <li class="ng-scope"><a href="/" title="Tin tức">Tin tức</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="ng-scope"><a href="/lien-he" title="Liên hệ">Liên hệ</a></li>
            </ul>
        </div>
    </div>
    <ul class="mobile-support">
        <li>
            <div class="drawer-text-support">HỖ TRỢ</div>
        </li>
        <li><i class="fa fa-phone" aria-hidden="true"></i> HOTLINE: <a href="tel:18006750" title="18006750">1800 6750</a></li>
        <li><i class="fa fa-envelope" aria-hidden="true"></i> EMAIL: <a href="mailto:baotrung304@gmail.com" title="baotrung304@gmail.com">baotrung304@gmail.com</a></li>
    </ul>
</div>
<script type="text/javascript">
    WebFontConfig = {
        custom: {
            families: ['FontAwesome'],
            urls: ['https://use.fontawesome.com/releases/v5.7.2/css/all.css']
        }
    };
    (function() {
        var wf = document.createElement('script');
        wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
    })();
</script>
<script>
    $(document).ready(function() {
        deferimg('#sync1 img', 10);
        var total_banner = 5;
        var sync1 = $("#sync1");
        var sync2 = $("#sync2");
        var slidesPerPage = (total_banner < 5) ? total_banner : 5;
        var syncedSecondary = true;
        sync1.owlCarousel({
            items : 1,
            slideSpeed : 2000,
            nav: true,
            autoplay: true,
            dots: false,
            loop: true,
            responsiveRefreshRate : 200,
            navText: "",
        }).on('changed.owl.carousel', syncPosition);
        sync2
            .on('initialized.owl.carousel', function () {
                sync2.find(".owl-item").eq(0).addClass("current");
            })
            .owlCarousel({
                items : slidesPerPage,
                dots: false,
                nav: false,
                smartSpeed: 200,
                slideSpeed : 500,
                slideBy: slidesPerPage,
                responsiveRefreshRate : 100
            }).on('changed.owl.carousel', syncPosition2);
        function syncPosition(el) {
            var count = el.item.count-1;
            var current = Math.round(el.item.index - (el.item.count/2) - .5);
            if(current < 0) {
                current = count;
            }
            if(current > count){
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
            if(syncedSecondary) {
                var number = el.item.index;
                sync1.data('owl.carousel').to(number, 100, true);
            }
        }
        sync2.on("click", ".owl-item", function(e){
            e.preventDefault();
            var number = $(this).index();
            sync1.data('owl.carousel').to(number, 300, true);
        });
    });
</script>
<!--<div class="support-cart mini-cart hidden-sm hidden-xs">-->
<!--    <a class="btn-support-cart" href="giohang.html">-->
<!--        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 435.104 435.104" style="enable-background:new 0 0 435.104 435.104;" xml:space="preserve" width="30px" height="30px">-->
<!--               <g>-->
<!--                  <circle cx="154.112" cy="377.684" r="52.736" data-original="#000000" class="active-path" data-old_color="#Ffffff" fill="#FFFFFF"/>-->
<!--                   <path d="M323.072,324.436L323.072,324.436c-29.267-2.88-55.327,18.51-58.207,47.777c-2.88,29.267,18.51,55.327,47.777,58.207     c3.468,0.341,6.962,0.341,10.43,0c29.267-2.88,50.657-28.94,47.777-58.207C368.361,346.928,348.356,326.924,323.072,324.436z" data-original="#000000" class="active-path" data-old_color="#F8F8F8" fill="#FFFFFF"/>-->
<!--                   <path d="M431.616,123.732c-2.62-3.923-7.059-6.239-11.776-6.144h-58.368v-1.024C361.476,54.637,311.278,4.432,249.351,4.428     C187.425,4.424,137.22,54.622,137.216,116.549c0,0.005,0,0.01,0,0.015v1.024h-43.52L78.848,50.004     C77.199,43.129,71.07,38.268,64,38.228H0v30.72h51.712l47.616,218.624c1.257,7.188,7.552,12.397,14.848,12.288h267.776     c7.07-0.041,13.198-4.901,14.848-11.776l37.888-151.552C435.799,132.019,434.654,127.248,431.616,123.732z M249.344,197.972     c-44.96,0-81.408-36.448-81.408-81.408s36.448-81.408,81.408-81.408s81.408,36.448,81.408,81.408     C330.473,161.408,294.188,197.692,249.344,197.972z" data-original="#000000" class="active-path" data-old_color="#F8F8F8" fill="#FFFFFF"/>-->
<!--                   <path d="M237.056,118.1l-28.16-28.672l-22.016,21.504l38.912,39.424c2.836,2.894,6.7,4.55,10.752,4.608     c3.999,0.196,7.897-1.289,10.752-4.096l64.512-60.928l-20.992-22.528L237.056,118.1z" data-original="#000000" class="active-path" data-old_color="#F8F8F8" fill="#FFFFFF"/>-->
<!--               </g>-->
<!--            </svg>-->
<!--        <div class="animated infinite zoomIn kenit-alo-circle"></div>-->
<!--        <div class="animated infinite pulse kenit-alo-circle-fill"></div>-->
<!--        <span class="cnt crl-bg count_item_pr">1</span>-->
<!--    </a>-->

<!--    <div class="top-cart-content hidden-md hidden-sm hidden-xs">-->
<!--        <ul>-->
<!--            <div id="popup-cart">-->
<!--                <div id="popup-cart-desktop" class="clearfix">-->
<!--                    <div class="title-popup-cart"><i class="ion ion-md-notifications-outline" aria-hidden="true"></i> Bạn đã thêm <span class="cart-popup-name"></span> vào giỏ hàng</div>-->
<!--                    <div class="title-quantity-popup"><a href="giohang.html" title="Giỏ hàng của bạn">Giỏ hàng của bạn có <span class="cart-popup-count"></span> sản phẩm</a></div>-->
<!--                    <div class="content-popup-cart clearfix">-->
<!--                        <div class="thead-popup">-->
<!--                            <div style="width: 55%;" class="text-left">Sản phẩm</div>-->
<!--                            <div style="width: 15%;" class="text-center">Đơn giá</div>-->
<!--                            <div style="width: 15%;" class="text-center">Số lượng</div>-->
<!--                            <div style="width: 15%;" class="text-center">Thành tiền</div>-->
<!--                            <div style="width: 55%;" class="text-left">Laptop Dell Inspiron</div>-->
<!--                            <div style="width: 15%;" class="text-center">17.390.000đ</div>-->
<!--                            <div style="width: 15%;" class="text-center">1</div>-->
<!--                            <div style="width: 15%;" class="text-center">17.390.000đ</div>-->
<!--                        </div>-->
<!--                        <div class="tbody-popup"></div>-->
<!--                        <div class="tfoot-popup">-->
<!--                            <div class="tfoot-popup-1 clearfix">-->
<!--                                <div class="pull-left popupcon"><a href="index.html" class="button btn-continue" title="Tiếp tục mua hàng" onclick="$('#popup-cart').modal('hide');"><span><span><i class="fa fa-caret-left" aria-hidden="true"></i> Tiếp tục mua hàng</span></span></a></div>-->
<!--                                <div class="pull-right popup-total">-->
<!--                                    <p>Thành tiền: <span class="total-price"></span> 17.390.000đ</p>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                            <div class="tfoot-popup-2 clearfix"><a class="button btn-proceed-checkout" title="Thanh toán đơn hàng" href="giohang.html"><span>Thanh toán đơn hàng</span></a></div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <a class="quickview-close close-window" href="javascript:" onclick="$('#popup-cart').modal('hide');" title="Đóng"><i class="fa fa-times"></i></a>-->
<!--                </div>-->
<!--            </div>-->
<!--        </ul>-->
<!--    </div>-->

<!--</div>-->
<div id="menu-overlay" class=""></div>
<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 3000); // Change image every 2 seconds
    }
</script>
</body>
</html>
