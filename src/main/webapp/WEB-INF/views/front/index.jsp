<%@ page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
    <script src="<spring:url value='/resources/My97DatePickers/WdatePicker.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>



    <script>


        $(function () {

            $("#pre").click(function () {

                var name = "${sessionScope.member.membName}";

                if(name == null || name == ""){
                    alert("请您先登陆再预定房间！");
                    location.href='<c:url value="/member/login/"/>';
                }else{
                    var pram1 = $("#start").val();
                    var pram2 = $("#finish").val();

                    if(pram1.length == 0) $("#errordate").html("请选择开始日期");
                    else if(pram2.length == 0) $("#errordate").html("请选择结束日期");
                    else{

                        var type = $("#roomType").val();

                        $.ajax({
                                type: "post",
                                url: "/familyhotel/order/isExist",
                                data: "type=" + type,
                                success: function (result) {
                                    var flag = result["flag"];
                                    if (flag == "0") {
                                        //已经没有该类型的房间
                                        alert(flag);
                                        $("#errortype").html("已经没有该类型的房间");
                                    } else {
                                        document.getElementById('preForm').submit();
                                    }

                                },
                                error: function () {
                                }
                            }
                        );
                    }
                }
            });

        });

    </script>


</head>
<body>
<div id="page">

    <!--0header-->
    <jsp:include page="/WEB-INF/views/front/frontheader.jsp"/>

    <!--1广告轮播图-->
    <div id="myCarousel1" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators">
            <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel1" data-slide-to="1"></li>
            <li data-target="#myCarousel1" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active"> <img src="<spring:url value='/resources/template/images/banner.png'/>" style="width:100%; height: 500px" alt="First slide">
                <div class="carousel-caption">
                    <h1>温馨<br>家庭旅馆</h1>
                </div>
            </div>
            <div class="item"> <img src="<spring:url value='/resources/template/images/banner2.png'/>" style="width:100%; height: 500px" alt="Second slide">
                <div class="carousel-caption">
                    <h1>温馨<br>家庭旅馆</h1>
                </div>
            </div>
            <div class="item"> <img src="<spring:url value='/resources/template/images/banner3.png'/>" style="width:100%; height: 500px" alt="Third slide">
                <div class="carousel-caption">
                    <h1>温馨<br>家庭旅馆</h1>
                </div>
            </div>
        </div>

        <a class="left carousel-control" href="#myCarousel1" data-slide="prev"> <img src="<spring:url value='/resources/template/images/icons/left-arrow.png'/>"
                                                                                     onmouseover="this.src = '<spring:url value="/resources/template/images/icons/left-arrow-hover.png"/>' "
                                                                                     onmouseout="this.src = ' <spring:url value="/resources/template/images/icons/left-arrow.png"/>" alt="left"></a>
        <a class="right carousel-control" href="#myCarousel1" data-slide="next"><img src="<spring:url value='/resources/template/images/icons/right-arrow.png'/>"
                                                                                     onmouseover="this.src = '<spring:url value="/resources/template/images/icons/right-arrow-hover.png"/>'"
                                                                                     onmouseout="this.src = '<spring:url value="/resources/template/images/icons/right-arrow.png"/>'" alt="left"></a>
    </div>


    <!--2旅馆房间类型--->
    <section class="gallery-block gallery-front" >
        <div class="row">
            <p style="text-align: center; font-size: 22px;font-weight: bold;">旅馆类型</p><br>
        </div><br>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/single.jpg'/>">
                        <div class="overlay">
                            <p><a href="<c:url value="/member/singleroom"/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单人间</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/double.jpg'/>">
                        <div class="overlay">
                            <p><a href="<c:url value="/member/doubleroom"/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;双人间</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                    <div class="gallery-image">
                        <img class="img-responsive" src="<spring:url value='/resources/imgs/roompic/family.jpg'/>">
                        <div class="overlay">
                            <p><a href="<c:url value="/member/familyroom"/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家庭房</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--3旅馆设施--->
    <section class="service-block">
        <div class="container">
            <div class="row">
                <p style="text-align: center; font-size: 22px;font-weight: bold;">旅馆设施</p>
            </div><br>
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-6 width-50">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="<spring:url value='/resources/template/images/icons/wifi.png'/>">
                        </div>
                        <h3><br><a>共享WIFI</a></h3>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 width-50">
                    <div class="service-details text-center">
                        <div class="service-image" >
                            <img alt="image" class="img-responsive" src="<spring:url value='/resources/template/images/icons/tv.png'/>" width="45" height="45">
                        </div>
                        <h3><br><a>液晶电视</a></h3>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="<spring:url value='/resources/template/images/icons/bath.png'/>" width="45" height="45">
                        </div>
                        <h3><br><a>高级卫浴</a></h3>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
                    <div class="service-details text-center">
                        <div class="service-image">
                            <img alt="image" class="img-responsive" src="<spring:url value='/resources/template/images/icons/car.png'/>">
                        </div>
                        <h3><br><a>免费停车</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-4预定房间功能-->
    <section class="vacation-offer-block">
        <div class="vacation-offer-bgbanner" id="yuding">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-6 col-xs-6">
                        <div id="logo">
                            <a style="color: white"><span style="color: red">温馨 </span>旅馆</a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="container" style="color: black">
                <div  style="width: 500px;float: right">
                    <h2>预定房间：</h2><br>

                    <form action="${path}/order/pay" id="preForm"  method="post">
                        <div class="row">
                            <div class="col-lg-4">
                                <label>房间类型：</label>
                                <select  id="roomType" name="roomType"  style="width:150px;height: 40px;" >
                                    <option value="" selected>全部</option>
                                    <option value="a">单人间</option>
                                    <option value="b">双人间</option>
                                    <option value="c">家庭房</option>
                                </select>
                            </div>

                            <div class="col-lg-4">
                                <label>开始日期：</label>
                                <input  id="start" name="start" type="text" style="width:150px;height: 40px;" readonly="readonly" maxlength="20" class="input-medium Wdate"
                                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'%y-%M-%d'});"/> &nbsp;
                            </div>

                            <div class="col-lg-4">
                                <label>结束日期：</label>
                                <input id="finish" name="finish" type="text" style="width:150px;height: 40px;" readonly="readonly" maxlength="20" class="input-medium Wdate"
                                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'#F{$dp.$D(\'start\')}'});"/> &nbsp;
                            </div>
                            <!--错误提示-->
                            <p id="errordate" class="text" style="color: red"></p>
                            <p id="errortype" class="text" style="color: red"></p>
                        </div>
                        <div class="row" style="float: right">
                            <input id="pre" type="button" class="btn btn-warning" value="预定"></input>
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </section>




    <!---5footer--->
    <footer>
        <div class="copyright">
            <p>&copy; ZhangQian 2019 FUZHOU UNIVERSITY ZHICHENG XUEYUAN . Graduation Design</p>
        </div>
    </footer>

    <!--回到顶部-->
    <a style="display: none;" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
        <span><i aria-hidden="true" class="fa fa-angle-up fa-lg"></i></span>
        <span>Top</span>
    </a>

</div>
</body>
</html>
