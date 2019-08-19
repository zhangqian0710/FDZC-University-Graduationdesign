<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>温馨家庭旅馆</title>

    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<spring:url value='/resources/css/style.css'/>"/>
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/font-awesome.min.css'/> "/>
    <script  type="text/javascript">



    </script>


</head>

<body>

<div class="main" style="height: 460px; margin-top: 50px;">
    <div class="login">
        <h1>温馨家庭旅馆</h1>
        <h2 style="color: white">后台管理系统</h2>
        <div class="inset">
            <!--start-main-->
            <form action="${path}/user/login" method="post" Class="right-text-label-form">
                <div>
                    <h2>登录</h2>
                    <span style="color: royalblue"><label>账号</label></span>
                    <span>
                        <input type="text" class="textbox" name="userNo"  maxlength="6" placeholder="请输入管理员账号" >
                    </span>
                </div>
                <div>
                    <span><label style="color: royalblue">密码</label></span>
                    <span><input type="password" class="password" name="userPwd" placeholder="请输入管理员密码"></span>
                </div>
                <c:if test="${message != null}"><p style="color: red"><i class="fa fa-info-circle"></i>${message}</p></c:if>
                <div class="sign">
                    <input type="submit" value="登录" class="submit" />
                </div>
            </form>
        </div>
    </div>
    <!--//end-main-->
</div>

<div class="copy-right">
    <p>&copy; 2018 FUZHOU UNIVERSITY ZHICHENG XUEYUAN . Graduation Design</p>
</div>


</body>


</html>