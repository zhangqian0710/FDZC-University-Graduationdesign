<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>温馨家庭旅馆</title>

    <meta charset="utf-8">

    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>

    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<spring:url value='/resources/css/jquery-accordion-menu.css'/>"/>
    <!-- font icon  -->
    <link rel="stylesheet" href="<spring:url value='/resources/css/font-awesome.css'/> "/>
    <!-- google font -->
    <link rel="stylesheet" href="<spring:url value='https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/font-awesome.min.css'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/ionicons.css'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/simple-line-icons.css'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/jquery.mCustomScrollbar.css'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/weather-icons.min.css'/> "/>

    <!--Morris Chart -->
    <link rel="stylesheet" href="<spring:url value='/resources/assets/js/index/morris-chart/morris.css'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/style.css'/> "/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/responsive.css'/> "/>


    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/popper.js/popper.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-accordion-menu.js'/>"></script>

    <!-- 表单验证 validate -->
    <script src="<spring:url value='/resources/jQuery-validation-1.14.0/jquery.js'/>"></script>
    <script src="<spring:url value='/resources/jQuery-validation-1.14.0/jquery.validate.min.js'/>"></script>
    <script src="<spring:url value='/resources/jQuery-validation-1.14.0/messages_zh.js'/>"></script>

    <script src="<spring:url value='/resources/My97DatePickers/WdatePicker.js'/>"></script>

</head>


<script type="text/javascript">



    $(function () {


        $("#pre").click(function () {

            var pram1 = $("#start").val();
            var pram2 = $("#finish").val();
            var pram3 = $("#preTel").val();

            if(pram3.length == 0) $("#errortel").html("请输入手机号");
            else $("#errortel").html("");

            if(pram1.length == 0) $("#errordate").html("请选择开始日期");
            else $("#errortel").html("");

            if(pram2.length == 0) $("#errordate").html("请选择结束日期");
            else $("#errortel").html("");

            if(pram1.length != 0  && pram2.length != 0  && pram3.length != 0 ){

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
        });

    });

</script>

<style>

    .error{
        color:red;
    }

</style>

<body>

<jsp:include page="/WEB-INF/fragments/tab.jsp"/>

<div  style="width: 100%;height: 660px; background-color: #FFFFFF;">

    <div style="width: 15%;height: 70%; float: left;">
        <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    </div>

    <div style="width: 85%;height: 91%; float: left;">
        <div class="container-fluid" style="margin-left: 16px;">
            <!-- state start-->
            <div class="row">
                <div class=" col-md-12">
                    <div class="card card-shadow mb-4">
                        <div class="card-header">
                            <div class="card-title" style="font-size:25px;">
                                <div style="float: left">预定房间</div>
                                <div  class=" breadcrumb_nav" style="float: right;font-size: 15px;">
                                    <ol class="breadcrumb" style="margin-top: 15px;">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a class="parent-item" href="<c:url value="/user/indexHome"/>">主页</a>
                                            <i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">
                                            预定房间
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="card-body" style="height: 578px;"><br><br>
                            <form action="${path}/order/preroom"   Class="right-text-label-form" style="margin-left: 35%;" id="preForm"  method="post"  >
                                <div class="form-group row">
                                    <h6 class="mt-3">预定电话：</h6>
                                    <input type="text" Class="form-control" name="preTel" id="preTel" maxlength="11" style="width: 200px" placeholder="请输入预定手机号"/>
                                    <p id="errortel" class="text" style="color: red"></p>
                                </div>
                                <div class="form-group row">
                                    <h6 class="mt-3">房间类型：</h6>
                                    <select  id="roomType" name="roomType"  style="width:150px;height: 40px;" >
                                        <option value="a">单人间</option>
                                        <option value="b">双人间</option>
                                        <option value="c">家庭房</option>
                                    </select>
                                </div>
                                <div class="form-group row">
                                    <h6 class="mt-3">开始日期：</h6>
                                    <input  id="start" name="start" type="text" style="width:150px;height: 40px;" readonly="readonly" maxlength="20" class="input-medium Wdate"
                                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'%y-%M-%d'});"/> &nbsp;
                                </div>
                                <div class="form-group row">
                                    <h6 class="mt-3">结束日期：</h6>
                                    <input id="finish" name="finish" type="text" style="width:150px;height: 40px;" readonly="readonly" maxlength="20" class="input-medium Wdate"
                                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'#F{$dp.$D(\'start\')}'});"/> &nbsp;
                                </div>
                                <div class="form-group row">
                                    <!--错误提示-->
                                    <p id="errordate" class="text" style="color: red"></p>
                                    <p id="errortype" class="text" style="color: red"></p>
                                </div>
                                <div class="form-group row">
                                    <input id="pre" type="button" class="btn btn-warning " value="下单预定"></input>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>

<%--
<div style="width: 100%; margin-top: 45px; background-color: #FFFFFF;" >
    <jsp:include page="/WEB-INF/fragments/footer.jsp"/>
</div>--%>






</body>


</html>