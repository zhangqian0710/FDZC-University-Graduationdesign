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

        $(function () {

            $("#membForm").validate({
                rules: {
                    membName: {
                        required: true,
                        minlength: 1
                    },
                    membPwd: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    }
                },
                messages: {
                    membName: {
                        required: "请输入会员名",
                        minlength:"请输入会员名"
                    },
                    membPwd: {
                        required: "请输入密码",
                        minlength: "密码至少6位",
                        maxlength: "密码不得超过20位"
                    }
                }
            });


            $("#sendVcode").click(function () {

                // 获得手机号
                var pvar = $("#membTel").val();

                $.ajax({
                        type: "get",
                        url: "/familyhotel/member/getVcode",
                        data: "phone=" + pvar,
                        success: function (result) {

                            var flag = result["flag"];
                            var tel =/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;

                            if(!tel.test(pvar)){
                                $("#errormsg").html("请输入正确的手机号");
                            }else {

                                if (flag == "0") {
                                    //手机号已被注册
                                   // alert("该号码已被注册");
                                    $("#errormsg").html("手机号已注册");

                                } else {
                                    // 手机接受短信错误
                                   // alert("发送成功");
                                    var yan = result["yan"];
                                    $("#yanzhengma").val(yan);
                                }
                            }

                        },
                        error: function () {
                        }
                    }
                );
            });

            $("#reg").click(function () {

                var vc1=document.getElementById("vercode").value;
                // alert(vc1);
                var vc2=document.getElementById("yanzhengma").value;
                //  alert(vc2);
                var pram1 = $("#membName").val();
                var pram2 = $("#membPwd").val();
                var pram3 = $("#membTel").val();
                var pram4 = $("#vercode").val();

                if(pram1.length == 0) $("#errorname").html("请输入账号");
                if(pram2.length == 0) $("#errorpwd").html("请输入密码");
                if(pram3.length == 0) $("#errormsg").html("请输入手机号");
                if(pram4.length == 0){
                    $("#vercodeErr").html("请点击获取验证码");
                }else{
                    if(vc1 == vc2 && pram1.length >0 && pram2.length >0 && pram3.length >0){
                        document.getElementById('membForm').submit();
                    }else{
                        $("#vercodeErr").html("验证码错误");
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




<section class="contact-block" style="background-color: whitesmoke">
    <div class="container">
        <div class="col-md-6 contact-left-block">
            <h3><span>温馨 </span>家庭旅馆</h3>
            <p class="text-left">位于北京市中心繁华地带王府井商业圈有得天独厚的地理位置，距天安门广场咫尺之遥，距离首都国际机场28公里，南邻北京火车站，交通极其便利有二条地铁、十数条公交车及民航班车可换乘。</p>
            <p class="text-right">中国 北京. <i class="fa fa-map-marker fa-lg"></i></p>
            <p class="text-right"><a href=""> +86 188****3997 <i class="fa fa-phone fa-lg"></i></a></p>
            <p class="text-right"><a href=""> 616963127@qq.com <i class="fa fa-envelope"></i></a></p>
        </div>

        <div class="col-md-6 contact-form" >
            <h3 class="">会员<span>注册</span></h3>

            <form action="${path}/member/register" id="membForm" method="post"  style="margin-left: 150px;">
                <div class="row">
                    <i class="fa fa-user fa-2x" style="float: left"></i>
                    <input type="text" id="membName" Class="form-control"  maxlength="20" name="membName" style="width: 236px;" placeholder="会员账号" />
                    <!--错误提示-->
                    <p id="errorname" class="text" style="color: red"></p>
                </div>

                <div class="row">
                    <i class="fa fa-lock fa-2x" style="float: left"></i>
                    <input type="password" id="membPwd" Class="form-control" minlength="6" maxlength="20" name="membPwd" style="width: 236px;" placeholder="会员密码(6-20位)"/>
                    <!--错误提示-->
                    <p id="errorpwd" class="text" style="color: red"></p>
                </div>

                <div class="row">
                    <i class="fa fa-male fa-2x"></i>
                    <input type="radio" name="membSex" value="a" name="radio" checked />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <i class="fa fa-female fa-2x"></i>
                    <input type="radio" name="membSex" value="b" name="radio"  />
                </div> <br>

                <div class="row">
                    <i class="fa fa-mobile-phone fa-3x" style="float: left"></i>
                    <input id="membTel" name="membTel" placeholder="手机号码" type="text" maxlength="11" class="form-control" value="" style="width: 236px;">
                    <!--错误提示-->
                    <p id="errormsg" class="text" style="color: red"></p>
                </div>

                <div class="row">
                    <i class="fa fa-question-circle fa-2x" style="float: left"></i>
                    <div style="float: left">
                        <input id="vercode" name="vercode" placeholder="六位数字验证码" type="text" class="form-control" style="width: 150px;"  value="">
                        <!--错误提示-->
                        <p id="vercodeErr" class="errMsg" style="color: red"></p>
                        <input id="yanzhengma" name="yanzhengma" type="hidden"/>
                        <div id="popup-captcha" style="display: none"></div>
                    </div>
                    <div>
                        <button id="sendVcode" class="btn btn-dark btn-sm" type="button">获取验证码</button>
                    </div>
                </div>

                <div class="row">
                    <input id="reg" class="btn btn-success  btn-block" type="button" style="width: 255px;" value="注册"></input>
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
