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


<script type="text/javascript">

    // jQuery validate 表单验证
    $.validator.setDefaults({
        submitHandler: function(form) {
            form.submit();
        }
    });

    $().ready(function() {
    // 在键盘按下并释放及提交后验证提交表单
        $("#userForm").validate({
            rules: {
                userNo: {
                    required: true,
                    maxlength: 6
                },
                userPwd:{
                    required: true,
                    maxlength: 6
                },
                userName: "required"
            },
            messages: {
                userNo: {
                    required: "请输入管理员账号！",
                    minlength: "账号长度不能大于6位"
                },
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
                                <div style="float: left">新增管理员</div>
                                <div  class=" breadcrumb_nav" style="float: right;font-size: 15px;">
                                    <ol class="breadcrumb" style="margin-top: 15px;">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a class="parent-item" href="<c:url value="/user/indexHome"/>">主页</a>
                                            <i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">
                                            新增管理员
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="card-body" style="height: 578px;"><br><br>
                            <form action="${path}/user/create" id="userForm" method="post" Class="right-text-label-form">
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员账号:</label>
                                    <div class="col-sm-5">
                                        <input type="text" id="userNo" Class="form-control"  maxlength="6" name="userNo" style="width: 350px;" placeholder="请输入管理员账号"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员密码:</label>
                                    <div class="col-sm-5">
                                        <input type="password" id="userPwd" Class="form-control" maxlength="6" name="userPwd" style="width: 350px;" placeholder="请输入管理员密码"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员姓名:</label>
                                    <div class="col-sm-5">
                                        <input type="text" Class="form-control"  id="userName" maxlength="30" name="userName" style="width: 350px;" placeholder="请输入管理员姓名"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员性别:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">男 <i class="fa fa-male fa-lg"></i>
                                        <input type="radio" name="userSex" value="a" name="radio" checked />
                                        <div class="control__indicator"></div> </label>&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-danger control--radio">女 <i class="fa fa-female fa-lg"></i>
                                        <input type="radio" name="userSex" value="b" name="radio"  />
                                        <div class="control__indicator"></div> </label>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 control-label" >管理员类别:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">超级管理员
                                        <input type="radio" name="userLimit" value="a" name="radio" checked />
                                        <div class="control__indicator"></div> </label>&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">前台服务员
                                        <input type="radio" name="userLimit" value="b" name="radio"  />
                                        <div class="control__indicator"></div> </label>&nbsp;&nbsp;&nbsp;
                                    <label class="control control-solid control-solid-info control--radio">财务管理员
                                        <input type="radio" name="userLimit" value="c" name="radio"  />
                                        <div class="control__indicator"></div> </label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-8 ml-auto">
                                        <button type="submit" class="btn btn-secondary" >
                                            添加管理员
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

<!-- 提示框1  -->
<div id="Modal1" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">操作提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <p >管理员账号不能为空!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">放弃操作 </button>
            </div>
        </div>
    </div>
</div>

<!-- 提示框2  -->
<div id="Modal2" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">操作提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <p>管理员密码不能为空!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">确定 </button>
            </div>
        </div>
    </div>
</div>

<!-- 提示框3  -->
<div id="Modal3" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">操作提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <p>管理员姓名不能为空!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">确定 </button>
            </div>
        </div>
    </div>
</div>

</body>


</html>