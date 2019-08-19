<%@ page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <style type="text/css">
        *{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
    </style>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

        });

        $(function(){
            //顶部导航切换
            $("#demo-list li").click(function(){
                $("#demo-list li.active").removeClass("active")
                $(this).addClass("active");
            })
        })


    </script>
<div class="content">
    <div id="jquery-accordion-menu" class="jquery-accordion-menu blue" >
        <div class="jquery-accordion-menu-header" ></div>
        <ul id="demo-list">
            <li class="active"><a href="<c:url value="/user/indexHome"/>"><i class="fa fa-tree"></i>主页 </a></li>
            <c:if test="${sessionScope.user.userLimit ne 'c'}">
            <li><a href="#"><i class="fa fa-home"></i>房间管理</a>
                <ul class="submenu">
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/room/create"/>">新增房间 </a></li>
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/room/listRoom"/>">房间列表 </a></li>

                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.user.userLimit ne 'c'}">
            <li><a href="#"><i class="fa fa-user"></i>会员管理 </a>
                <ul class="submenu">
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/member/listMember"/>">会员列表 </a></li>
                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.user.userLimit eq 'a'}">
            <li><a href="#"><i class="fa fa-cog"></i>管理员管理</a>
                <ul class="submenu" >
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/user/create"/>">添加管理员 </a></li>
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/user/listUser"/>">管理员列表 </a></li>

                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.user.userLimit ne 'c'}">
            <li><a href="#"><i class="fa fa-dollar"></i>订单管理 </a>
                <ul class="submenu">
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/order/preroom"/>">预定房间 </a></li>
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/order/listOrder"/>">订单列表 </a></li>
                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.user.userLimit eq 'a'}">
            <li><a href="#"><i class="fa fa-fa"></i>日志管理 </a>
                <ul class="submenu">
                    <li><a style="background-color: rgb(51,111,190)" href="<c:url value="/log/listLog"/>">日志列表 </a></li>
                </ul>
            </li>
            </c:if>
            <li><a href="tencent://message/?uin=616963127&Site=400301.com&Menu=yes"><i class="fa fa-qq"></i>联系超管 </a></li>

        </ul>
        <div class="jquery-accordion-menu-footer">
            SweetFamilyHotel
        </div>
        <div class="jquery-accordion-menu-header"></div>
        <div class="jquery-accordion-menu-header"></div>
        <div class="jquery-accordion-menu-header"></div>
        <div class="jquery-accordion-menu-header"></div>
        <div class="jquery-accordion-menu-header"></div>
    </div>
</div>



