<%@ page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>温馨家庭旅馆</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<spring:url value='/resources/template/images/icons/favicon.png'/>"/>


    <!-- Bootstrap core CSS -->
    <link href="<spring:url value='/resources/template/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<spring:url value='/resources/template/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />

    <!--template -->
    <link href="<spring:url value='/resources/template/css/style.css'/>" rel="stylesheet">
    <link href="<spring:url value='/resources/template/fonts/antonio-exotic/stylesheet.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<spring:url value='/resources/template/css/lightbox.min.css'/>">
    <link href="<spring:url value='/resources/template/css/responsive.css'/>" rel="stylesheet">
    <script src="<spring:url value='/resources/template/js/jquery.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/bootstrap.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/lightbox-plus-jquery.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/instafeed.min.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/template/js/custom.js'/>" type="text/javascript"></script>
    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>

    <!-- 表单验证 validate -->
    <script src="<spring:url value='/resources/jQuery-validation-1.14.0/jquery.js'/>"></script>
    <script src="<spring:url value='/resources/jQuery-validation-1.14.0/jquery.validate.min.js'/>"></script>
    <script src="<spring:url value='/resources/jQuery-validation-1.14.0/messages_zh.js'/>"></script>

    <script>

        $().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
            $("#mbloginForm").validate({
                rules: {
                    membTel: {
                        required: true,
                        minlength: 11
                    },
                    membPwd: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    }
                },
                messages: {
                    membTel: {
                        required: "请输入手机号",
                        minlength:"请输入11位手机号"
                    },
                    membPwd: {
                        required: "请输入密码",
                        minlength: "密码至少6位",
                        maxlength: "密码不得超过20位"
                    }
                }
            });
        });
    </script>

    <style>

        .error{
            color:red;
        }

    </style>


</head>
<body>

<!--0header-->
<jsp:include page="/WEB-INF/views/front/frontheader.jsp"/>
<!--隔离条-->
<div style="width: 100%;height: 30px; background-color: black"></div> <br>




<section class="contact-block" style="background-color: whitesmoke; height: 385px;" >
    <div class="container">
        <div class="col-md-6 contact-left-block">
            <h3><span>温馨 </span>家庭旅馆</h3>
            <p class="text-left">位于北京市中心繁华地带王府井商业圈有得天独厚的地理位置，距天安门广场咫尺之遥，距离首都国际机场28公里，南邻北京火车站，交通极其便利有二条地铁、十数条公交车及民航班车可换乘。</p>
            <p class="text-right">中国 北京. <i class="fa fa-map-marker fa-lg"></i></p>
            <p class="text-right"><a href=""> +86 188****3997 <i class="fa fa-phone fa-lg"></i></a></p>
            <p class="text-right"><a href=""> 616963127@qq.com <i class="fa fa-envelope"></i></a></p>
        </div>

        <div class="col-md-6 contact-form" >
            <h3 class="">会员<span>登录</span></h3>

            <form  action="${path}/member/login" id="mbloginForm" name="mbloginForm"  method="post" style="margin-left: 150px;">

                <div class="row">
                    <i class="fa fa-mobile-phone fa-3x" style="float: left"></i>
                    <input id="membTel" name="membTel" placeholder="手机号码" type="text" maxlength="11" class="form-control" value="" style="width: 236px;">
                    <!--错误提示-->
                    <p id="errortel" class="text" style="color: red"></p>
                </div>

                <div class="row">
                    <i class="fa fa-lock fa-2x" style="float: left"></i>
                    <input type="password" id="membPwd" Class="form-control" maxlength="20" name="membPwd" style="width: 236px;" placeholder="会员密码"/>
                    <!--错误提示-->
                    <p id="errorpwd" class="text" style="color: red"></p>
                </div>
                <c:if test="${message != null}"><p style="color: red"><i class="fa fa-info-circle"></i>${message}</p><br></c:if>
                <div class="row">
                    <input class="btn btn-success btn-block"  id="login" type="submit" style="width: 255px;" value="登录"></input>
                </div>

            </form>
        </div>


    </div>
</section>



<!---5footer--->
<footer>
    <div class="copyright">
        <p>&copy; ZhangQian 2019 FUZHOU UNIVERSITY ZHICHENG XUEYUAN . Graduation Design</p>
    </div>
</footer>




</body>
</html>
