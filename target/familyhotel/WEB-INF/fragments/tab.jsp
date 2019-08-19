<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<jsp:useBean id="time" class="java.util.Date"/>

<script type="text/javascript">

    function showLogoutDialog() {
        $('#logoutMsg').text('尊敬的[ ${sessionScope.user.userName} ]您确认要退出系统吗?');
    }

    function logout(){
        location.href='<c:url value="/user/logoutuser/"/>';
    }

</script>

<div class="container_header" style=" width:100%;height:52px;background-color: #4A89DC">

    <%--左边logo等信息--%>
    <div style="float: left ;width: 60px;">
        <a href="<c:url value="/user/indexHome"/>"> <img src="<c:url value="/resources/imgs/logo.png"/>" width="50px" height="50px;"  class="img-circle"> </a>

    </div>

    <div style="float: left; color:#fff; margin-top:15px;">
        <span>北京时间：<fmt:formatDate pattern="yyyy年MM月dd日 HH:mm:ss"
                                   value="<%=time%>" /></span>
    </div>


    <%--右边登陆信息--%>
    <div style="float: right;margin-right: 20px; color:#fff; margin-top: 10px; ">
            <%
            if(new Date().getHours()>=0 && new Date().getHours()<=12){//看看当前时间是在0点到中午12点之间
            %>
                 <img src="<c:url value="/resources/imgs/morning.png"/>" height="35" width="35"  ><span>上午好!&nbsp;</span>
            <%
            }
            else{
            %>
                 <img src="<c:url value="/resources/imgs/night.png"/>" height="35" width="35"   ><span>下午好!&nbsp;</span>
            <%
            }
            %>
                    <c:if test="${sessionScope.user.userLimit eq 'a'}">超级管理员：</c:if>
                    <c:if test="${sessionScope.user.userLimit eq 'b'}">前台服务员：</c:if>
                    <c:if test="${sessionScope.user.userLimit eq 'c'}">财务管理员：</c:if>
                    <span style="font-size: 18px;">
                        ${sessionScope.user.userName} &nbsp;&nbsp;&nbsp;
                        <button  class="btn btn-outline-warning btn-sm"  data-toggle="modal" data-target="#logoutModal"   onclick="showLogoutDialog()" >退出</button>
                    </span>
    </div>

</div>


<!-- 退出系统提示 -->
<div id="logoutModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">操作提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="logoutMsg"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="logout()">确定退出</button>
            </div>
        </div>
    </div>
</div>