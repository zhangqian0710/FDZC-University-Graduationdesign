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
    <link rel="stylesheet" href="<spring:url value='/resources/assets/css/responsive.css'/> "/>


    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/popper.js/popper.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-accordion-menu.js'/>"></script>


    <script>
        //removeModal
        function showRemoveDialog(membername,memberId){
            $('#removeMemberId').text(memberId);
            $('#removeMsgMembeer').text('确定要删除【'+membername+'】编号的会员吗？');

        }

        //removeMember
        function removeMember(memberId){
            location.href='<c:url value="/member/removeMember/"/>'+ memberId;
        }



    </script>



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
                            <div style="float: left">会员列表</div>
                            <div  class=" breadcrumb_nav" style="float: right;font-size: 15px;">
                                <ol class="breadcrumb" style="margin-top: 15px;">
                                    <li>
                                        <i class="fa fa-home"></i>
                                        <a class="parent-item" href="<c:url value="/user/indexHome"/>">主页</a>
                                        <i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">
                                        会员列表
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="bs4-table" class="table table-bordered table-striped" cellspacing="0" width="100%">
                            <thead>
                                <th style="width:20%; text-align:center">会员编号</th>
                                <th style="width:20%; text-align:center">会员账号</th>
                                <th style="width:20%;text-align:center">性别</th>
                                <th style="width:20%; text-align:center">手机号</th>
                                <th style="width:20%;text-align:center">操作</th>
                            </thead>

                            <tbody>
                            <c:forEach var="member" items="${pageInfo.list}">
                            <tr>
                                <td style="text-align:center;vertical-align:middle;">${member.membId}</td>
                                <td style="text-align:center;vertical-align:middle;">${member.membName}</td>
                                <td style="text-align:center;vertical-align:middle;">
                                        <c:choose>
                                            <c:when test="${member.membSex eq 'a'}">男  <i class="fa fa-male fa-lg"></i></c:when>
                                            <c:when test="${member.membSex eq 'b'}">女  <i class="fa fa-female fa-lg"></i></c:when>
                                        </c:choose>
                                </td>
                                <td style="text-align:center;vertical-align:middle;">${member.membTel}</td>
                                <td style="text-align:center;vertical-align:middle;">
                                    <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#removeRoomModal" onclick="showRemoveDialog('${member.membName}',${member.membId})"> 删 除 </button>
                                </td>
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
                                        <li><a href="${path}/member/listMember?pn=1"> <button class="btn btn-sm btn-outline-success">首页</button>&nbsp;</a></li>
                                        <c:if test="${pageInfo.hasPreviousPage }">
                                            <li>
                                                <a href="${path}/member/listMember?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                                   <button class="btn btn-sm btn-outline-success">&laquo;</button>&nbsp;
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                            <c:if test="${page_Num == pageInfo.pageNum }">
                                                <li class="active"><a href="#"><button class="btn btn-sm btn-outline-success">${ page_Num}</button>&nbsp;</a></li>
                                            </c:if>
                                            <c:if test="${page_Num != pageInfo.pageNum }">
                                                <li><a href="${path}/member/listMember?pn=${ page_Num}"><button class="btn btn-sm btn-outline-success">${ page_Num}</button>&nbsp;</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${pageInfo.hasNextPage }">
                                            <li>
                                                <a href="${path}/member/listMember?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                                    <button class="btn btn-sm btn-outline-success">&raquo;</button>&nbsp;
                                                </a>
                                            </li>
                                        </c:if>
                                        <li><a href="${path}/member/listMember?pn=${pageInfo.pages}"> <button class="btn btn-sm btn-outline-success">末页</button>&nbsp;</a></li>
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


    <!-- 删除提示框  -->
    <div id="removeRoomModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">操作提示</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="removeMsgMembeer"></p>
                    <span id="removeMemberId" style="display:none"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">放弃操作 </button>
                    <button type="button" class="btn btn-primary" onclick="removeMember($('#removeMemberId').text());">确认删除</button>
                </div>
            </div>
        </div>
    </div>

</body>


</html>