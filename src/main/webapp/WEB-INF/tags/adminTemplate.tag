<%@ tag display-name="adminTemplate" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ attribute name="title" type="java.lang.String" required="true" rtexprvalue="true"%>
<%@ attribute name="content" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Khoi Nguyen">

    <!-- Title Page-->
    <title>${title}</title>
    <link rel="icon" href="${pageContext.request.contextPath }/static/uploads/icon/favicon.ico" type="image/x-icon"/>
    <!-- Fontfaces CSS-->
    <link href="${pageContext.request.contextPath }/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath }/resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/vendor/tui-pagination/tui-pagination.min.css" rel="stylesheet" />

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath }/resources/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
<div class="page-wrapper">
    <!-- MENU SIDEBAR-->
    <aside class="menu-sidebar d-none d-lg-block">
        <div class="logo">
            <a href="#">
                <img src="${pageContext.request.contextPath }/resources/images/icon/logo.png" alt="Cool Admin" />
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/index">
                            <i class="fa fa-trello"></i>Đơn mới</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/orders">
                            <i class="fa fa-check-square"></i>Tra cứu đơn</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/report">
                            <i class="fa fa-table"></i>Thống kê</a>
                    </li>
                    <hr style="border: 1px solid red;"/>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fa fa-th"></i>Quản lí kho</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="${pageContext.request.contextPath }/admin/product">Về sản phẩm</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/admin/category">Về danh mục</a>
                            </li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fa fa-desktop"></i>Về giao diện</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="${pageContext.request.contextPath }/admin/ads">Dòng thông báo</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/admin/about">Trang giới thiệu</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/admin/contact">Về doanh nghiệp</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- END MENU SIDEBAR-->

    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <!-- HEADER DESKTOP-->
        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">
                        <form class="form-header" action="" method="POST">
                            <input class="au-input au-input--xl" type="text" name="search" placeholder="Search for datas &amp; reports..." />
                            <button class="au-btn--submit" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </form>
                        <div class="header-button">
                            <div class="account-wrap">
                                <div class="account-item clearfix js-item-menu">
                                    <div class="image">
                                        <img src="${pageContext.request.contextPath }/resources/images/icon/photo.gif" alt="Admin" />
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">Admin</a>
                                        <i class="fa fa-angle-down"></i>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="${pageContext.request.contextPath }/resources/images/icon/photo.gif" alt="Admin" />
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">Admin</a>
                                                </h5>
                                                <!-- <span class="email">johndoe@example.com</span> -->
                                            </div>
                                        </div>
                                        <!-- <div class="account-dropdown__body">
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="fa fa-account"></i>Account</a>
                                            </div>
                                        </div> -->
                                        <div class="account-dropdown__footer">
                                            <a href="#">
                                                <i class="fa fa-power"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER DESKTOP-->

        <!-- Jquery JS-->
        <script src="${pageContext.request.contextPath }/resources/vendor/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/vendor/tui-pagination/tui-pagination.min.js"></script>

        <!-- MAIN CONTENT-->
        <jsp:invoke fragment="content" />

    </div>

</div>

<!-- Bootstrap JS-->
<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS -->
<script src="${pageContext.request.contextPath }/resources/vendor/animsition/animsition.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/sweetalert/sweetalert.min.js"></script>
<!-- Main JS-->
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

</body>

</html>
<!-- end document-->