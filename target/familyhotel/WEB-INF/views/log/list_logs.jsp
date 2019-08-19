<%@ page language="java"   import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>温馨家庭旅馆</title>

    <meta charset="utf-8">

    <link rel="stylesheet" href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/bootstrap.min.css'/>"/>
    <link rel="stylesheet" href="<spring:url value='/resources/css/jquery-accordion-menu.css'/>"/>
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



    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/popper.js/popper.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-accordion-menu.js'/>"></script>
    <script src="<spring:url value='/resources/My97DatePickers/WdatePicker.js'/>"></script>


    <style type="text/css">
        a {
            text-decoration: none;
            color: lawngreen;
            font-size: 14px;
        }

        h3 {
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: #5BC0DE;
            border-radius: 4px;
        }
    </style>

</head>

<body>

<jsp:include page="/WEB-INF/fragments/tab.jsp"/>

<div  style="width: 100%;height: 660px; ">

    <div style="width: 15%;height: 70%; float: left;">
        <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    </div>

    <div style="width: 85%;height: 91%; float: left;">
        <div class="container-fluid">
        <!-- state start-->
        <div class="row">
            <div class=" col-sm-12" style="margin-left: 16px;">
                <div class="card card-shadow mb-4">
                    <div class="card-header">
                        <div class="card-title" style="font-size:25px;">
                            <div style="float: left">日志列表</div>
                            <div  class=" breadcrumb_nav" style="float: right;font-size: 15px;">
                                <ol class="breadcrumb" style="margin-top: 15px;">
                                    <li>
                                        <i class="fa fa-home"></i>
                                        <a class="parent-item" href="<c:url value="/user/indexHome"/>">主页</a>
                                        <i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">
                                        日志列表
                                    </li>
                                </ol>
                            </div>
                            <%--条件查询--%>
                            <div  style="float: right;height: 15px; margin-right: 10px; margin-top:5px;" >
                                <form action="${path}/log/listLog" method="post" cssClass="col-12" modelAttribute="log" >
                                    <div class="form-row">
                                        <p style="font-size: 18px; margin-top: 1%;">选择日期：</p>

                                        <input name="logString" id="logString" type="text" style="width:150px;height: 40px;" readonly="readonly" maxlength="20" class="input-medium Wdate"
                                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> &nbsp;

                                        <button type="submit" class="btn btn-sm btn-info" style="height: 40px;" > 查询 </button>&nbsp;
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="bs4-table" class="table table-bordered table-striped" cellspacing="0" width="100%">
                            <thead>
                                <th style="width:20%; text-align:center">日志编号</th>
                                <th style="width:25%; text-align:center">操作内容</th>
                                <th style="width:25%;text-align:center">操作人</th>
                                <th style="width:30%; text-align:center">时间</th>
                            </thead>

                            <tbody>
                            <c:forEach var="log" items="${pageInfo.list}">
                            <tr>
                                <td style="text-align:center;vertical-align:middle;">${log.logId}</td>
                                <td style="text-align:center;vertical-align:middle;">${log.logOperation}</td>
                                <td style="text-align:center;vertical-align:middle;">${log.logName}</td>
                                <td style="text-align:center;vertical-align:middle;"><fmt:formatDate pattern="yyyy年MM月dd日 " value="${log.logDate}" /></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- 分页导航栏 -->
                        <div style="height: 15px;"> <hr style="height:0.5px;border:none;border-top:1px solid #ccc;" /> </div>
                        <!-- 分页信息 -->
                        <div class="row" style="height: 37px;">
                            <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
                            <div class="col-md-6" style="float: left; margin-top:5px;width: 300px;">
                                当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
                            </div>

                            <!-- 分页条 -->
                            <div class="col-md-6" style="float: left;width: 300px; ">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" style="float: right; ">
                                        <li><a href="${path}/log/listLog?pn=1"> <button class="btn btn-sm btn-outline-success">首页</button>&nbsp;</a></li>
                                        <c:if test="${pageInfo.hasPreviousPage }">
                                            <li>
                                                <a href="${path}/log/listLog?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                                   <button class="btn btn-sm btn-outline-success">&laquo;</button>&nbsp;
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                            <c:if test="${page_Num == pageInfo.pageNum }">
                                                <li class="active"><a href="#"><button class="btn btn-sm btn-outline-success">${ page_Num}</button>&nbsp;</a></li>
                                            </c:if>
                                            <c:if test="${page_Num != pageInfo.pageNum }">
                                                <li><a href="${path}/log/listLog?pn=${ page_Num}"><button class="btn btn-sm btn-outline-success">${ page_Num}</button>&nbsp;</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${pageInfo.hasNextPage }">
                                            <li>
                                                <a href="${path}/log/listLog?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                                    <button class="btn btn-sm btn-outline-success">&raquo;</button>&nbsp;
                                                </a>
                                            </li>
                                        </c:if>
                                        <li><a href="${path}/log/listLog?pn=${pageInfo.pages}"> <button class="btn btn-sm btn-outline-success">末页</button>&nbsp;</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>

<%--footer--%>
<%--<div style="width: 100%; margin-top: 45px; background-color: #FFFFFF;" >
    <jsp:include page="/WEB-INF/fragments/footer.jsp"/>
</div>--%>

</body>


</html>