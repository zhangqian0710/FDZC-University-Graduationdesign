<%@ page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
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


</head>
<body>
<div id="page">

    <!--header-->
    <jsp:include page="/WEB-INF/views/front/frontheader.jsp"/>

    <!--隔离条-->
    <div style="width: 100%;height: 30px; background-color: black"></div> <br>

    <!---返回--->
    <div  style="background-color: whitesmoke"><br>
        <div  class="container" style="background-color: whitesmoke">
            <div style="float: left"><h1 style="color: black; ">【单人间-屋内实景】</h1></div>
            <div style="float: right"><button type="button" class="btn btn-dark" onclick="window.history.back();">返回</button></div>
        </div><br>
    </div>

    <!--singleroom-->
    <div class="image-head-wrapper" style="background-image: url('/familyhotel/resources/imgs/roompic/single.jpg');background-size: 75% 100%;background-color: whitesmoke">
    </div>

    <div class="gallery-block gallery-front" style="background-color: whitesmoke">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/s1.jpg'/>">
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/s2.jpg'/>">
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/s3.jpg'/>">
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/s4.jpg'/>">
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!---footer--->
    <footer>
        <div class="copyright">
            <p>&copy; ZhangQian 2019 FUZHOU UNIVERSITY ZHICHENG XUEYUAN . Graduation Design</p>
        </div>
    </footer>

    <!--back to top--->
    <a style="display: none;" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
        <span><i aria-hidden="true" class="fa fa-angle-up fa-lg"></i></span>
        <span>Top</span>
    </a>

</div>
</body>
</html>
