<%@ page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>

<script type="text/javascript">


    function logout(){
        location.href='<c:url value="/member/logoutmember/"/>';
    }

</script>


<!---header top---->
<div class="top-header" style="height: 35px;">
    <div  style="float: right;margin-right: 30px;">
        <a  style="color: grey" href="<c:url value="/user/login"/>">系统管理<i class="fa fa-cog"></i></a>
    </div>
</div>

<!--header--->
<header class="header-container">
    <div class="container">
        <div class="top-row">
            <div class="row">
                <div class="col-md-2 col-sm-6 col-xs-6">
                    <div id="logo">
                        <a href="<c:url value="/member/index"/>"><span>温馨 </span>旅馆</a>
                    </div>
                </div>

                <div class="col-md-8 col-sm-12 col-xs-12 remove-padd" style="width: 740px;">
                    <nav class="navbar navbar-default">
                        <div class="collapse navigation navbar-collapse navbar-ex1-collapse remove-space">
                            <ul class="list-unstyled nav1 cl-effect-10">
                                <li><a data-hover="首页" class="active" href="<c:url value="/member/index"/>"><span style="font-size: 18px;">首页</span></a></li>
                                <li><a data-hover="预定"  href="<c:url value="/member/index"/>#yuding"><span  style="font-size: 18px;">预定</span></a></li>
                                <li><a data-hover="关于"  href="<c:url value="/member/about"/>"><span  style="font-size: 18px;">关于</span></a></li>
                            </ul>

                        </div>
                    </nav>
                </div>
                <div class="col-md-2  col-sm-4 col-xs-12 hidden-sm" style="width: 225px;">
                    <div class="text-right" <c:if test="${not empty sessionScope.member}">style="display:none;" </c:if> >
                        <a href="<c:url value="/member/login"/>"><button type="button" class="book-now-btn" >登录</button></a>
                        <a href="<c:url value="/member/register"/>"><button type="button" class="book-now-btn" >注册</button></a>
                    </div>
                    <div class="text-right" <c:if test="${empty sessionScope.member}">style="display:none;font-size: 20px;" </c:if> >
                        <a href="<c:url value=""/>">会员名：${sessionScope.member.membName} &nbsp;&nbsp;</a>
                        <button type="button" class="book-now-btn"  data-toggle="modal" data-target="#exampleModal"  >退出</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- 退出系统提示 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">温馨家庭旅馆</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                尊敬的[ ${sessionScope.member.membName} ]您确认要退出吗?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="logout()">确定退出</button>
            </div>
        </div>
    </div>
</div>
