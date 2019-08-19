<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>温馨家庭旅馆</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<spring:url value='/resources/template/images/icons/favicon.png'/>"/>


    <!-- Bootstrap core CSS -->
    <link href="<spring:url value='/resources/template/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<spring:url value='/resources/template/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template -->
    <link href="<spring:url value='/resources/template/css/style.css'/>" rel="stylesheet">
    <link href="<spring:url value='/resources/template/fonts/antonio-exotic/stylesheet.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<spring:url value='/resources/template/css/lightbox.min.css'/>">
    <link href="<spring:url value='/resources/template/css/responsive.css'/>" rel="stylesheet">
    <script src="<spring:url value='/resources/template/js/jquery.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/lightbox-plus-jquery.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/instafeed.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/custom.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/My97DatePickers/WdatePicker.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>


    <script>

    </script>
</head>
<body>

<!--header-->
<jsp:include page="/WEB-INF/views/front/frontheader.jsp"/>
<!--隔离条-->
<div style="width: 100%;height: 30px; background-color: black"></div> <br>


<!--信息确认-->


<section class="contact-block" style="background-color: whitesmoke">
    <div class="container">
        <div class="col-md-6 contact-left-block" style="margin-left:27%;">
            <h3><span>温馨 </span>家庭旅馆</h3>
            <P class="text-left">中国 福建省 福州市 </P>
            <p class="text-right">福州大学至诚学院<i class="fa fa-map-marker fa-lg"></i></p>
            <p class="text-right"><a href=""> 2015级 计算机工程系 软件工程 <i class="fa fa-tags fa-lg"></i></a></p>
            <p class="text-right"><a href=""> (C)个人毕设●张乾 <i class="fa fa-phone"></i></a></p>
        </div>


    </div>
</section>




<!---footer--->
<footer>
    <div class="copyright">
        <p>&copy; ZhangQian 2019 FUZHOU UNIVERSITY ZHICHENG XUEYUAN . Graduation Design</p>
    </div>
</footer>

</div>
</body>
</html>