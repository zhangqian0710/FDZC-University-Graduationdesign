<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>温馨家庭旅馆</title>

    <meta charset="utf-8">

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


</head>

<script>

    //jQuery validate 表单验证
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });

    $().ready(function() {
    // 在键盘按下并释放及提交后验证提交表单
        $("#userForm").validate({
            rules: {
                userPwd:{
                    required: true,
                    maxlength: 6
                },
                userName: "required"
            },
            messages: {
                userPwd: {
                    required:"请输入账号的密码！",
                    minlength: "密码长度不能大于6位"
                },
                userName: "请输入管理员姓名！"
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
                                <div style="float: left">修改管理员</div>
                                <div  class=" breadcrumb_nav" style="float: right;font-size: 15px;">
                                    <ol class="breadcrumb" style="margin-top: 15px;">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a class="parent-item" href="<c:url value="/user/indexHome"/>">主页</a>
                                            <i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">
                                            修改管理员
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="card-body" style="height: 578px;"><br><br>
                            <form action="${path}/user/updateUser" id="userForm" method="post" Class="right-text-label-form">
                                <input type="hidden" value="${user.userId}" name="userId" />
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员账号:</label>
                                    <div class="col-sm-5">
                                        <input type="text" Class="form-control"  readonly="readonly" value="${user.userNo}" name="userNo" style="width: 350px;"  placeholder="请输入管理员账号"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员密码:</label>
                                    <div class="col-sm-5">
                                        <input type="password" Class="form-control"  id="userPwd" maxlength="6" value="${user.userPwd}" name="userPwd" style="width: 350px;" placeholder="请输入管理员密码"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员姓名:</label>
                                    <div class="col-sm-5">
                                        <input type="text" Class="form-control" id="userName" maxlength="30" name="userName" value="${user.userName}" style="width: 350px;" placeholder="请输入管理员姓名"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员性别:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">男 <i class="fa fa-male fa-lg"></i>
                                        <input type="radio" name="userSex" value="a" name="radio"  <c:if test="${user.userSex=='a'}">checked</c:if> />
                                        <div class="control__indicator"></div> </label>&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-danger control--radio">女 <i class="fa fa-female fa-lg"></i>
                                        <input type="radio" name="userSex" value="b" name="radio"  <c:if test="${user.userSex=='b'}">checked</c:if>/>
                                        <div class="control__indicator"></div> </label>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员类别:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">超级管理员
                                        <input type="radio" name="userLimit" value="a" name="radio" <c:if test="${user.userLimit=='a'}">checked</c:if> />
                                        <div class="control__indicator"></div> </label>&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">前台服务员
                                        <input type="radio" name="userLimit" value="b" name="radio" <c:if test="${user.userLimit=='b'}">checked</c:if> />
                                        <div class="control__indicator"></div> </label>&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">财务管理员
                                        <input type="radio" name="userLimit" value="c" name="radio" <c:if test="${user.userLimit=='c'}">checked</c:if> />
                                        <div class="control__indicator"></div> </label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 ml-auto">
                                        <button type="submit" class="btn btn-secondary" >
                                            更新管理员
                                        </button>
                                    </div>
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