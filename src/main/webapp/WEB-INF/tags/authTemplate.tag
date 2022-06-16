<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ attribute name="title" type="java.lang.String" required="true" rtexprvalue="true"%>
<%@ attribute name="content" fragment="true" %>
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
    <link href="${pageContext.request.contextPath }/resources/css/font-face.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath }/resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath }/resources/css/theme.css" rel="stylesheet" media="all">
    <style>
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>

<body class="animsition">
    <div class="page-wrapper">
		
		<jsp:invoke fragment="content" />

    </div>

    <!-- Jquery JS-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="${pageContext.request.contextPath }/resources/vendor/animsition/animsition.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">

    <!-- Main JS-->
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

</body>

</html>
<!-- end document-->