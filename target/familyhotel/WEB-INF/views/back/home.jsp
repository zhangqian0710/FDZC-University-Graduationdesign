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


    <script src="<spring:url value='/resources/vendor/ECharts/echarts.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/ECharts/macarons.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/popper.js/popper.min.js'/>"></script>
    <script src="<spring:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-1.11.2.min.js'/>"></script>
    <script src="<spring:url value='/resources/js/jquery-accordion-menu.js'/>"></script>

<script>


    $(function () {

        var myChartRoom = echarts.init(document.getElementById('roomDiv'),'macarons');
        var myChartUser = echarts.init(document.getElementById('userDiv'),'macarons');




        //房间
        var optionRoom = {
            title : {
                text: '房间信息【共${getRoomCount}间】',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                y : 'bottom',
                data:['未预定','已预定','已入住']
            },

            series : [
                {
                    name:'访问来源',
                    type:'pie',
                    radius : '55%',
                    center: ['60%', '60%'],
                    data:[
                        {value:${ncRoomCount}, name:'未预定'},
                        {value:${getOdRoomConut}, name:'已预定'},
                        {value:${getBiRoomConut}, name:'已入住'}
                    ]
                }
            ]
        };

        myChartRoom.setOption(optionRoom, true);
        myChartRoom.on('click', function (param){
            var roomStatus;
            if(param.name=="未预定") roomStatus='a';
            else if(param.name=="已预定") roomStatus='b';
            else roomStatus='c';
            window.location.href="${path}/room/listRoom?roomStatus="+roomStatus;
        })


        //管理员
        var optionUser = {
            title : {
                text: '管理员信息【共${getUserCount}位】',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                y : 'bottom',
                data:['超级管理员','前台服务员','财务管理员']
            },

            series : [
                {
                    name:'访问来源',
                    type:'pie',
                    radius : '55%',
                    center: ['60%', '60%'],
                    data:[
                        {value:${getAdminConut}, name:'超级管理员'},
                        {value:${getQtUserConut}, name:'前台服务员'},
                        {value:${getBillUserConut}, name:'财务管理员'}
                    ]
                }
            ]
        };

        myChartUser.setOption(optionUser, true);
        myChartUser.on('click', function (param){
            var userLimit;
            if(param.name=="超级管理员") userLimit='a';
            else if(param.name=="前台服务员") userLimit='b';
            else userLimit='c';
            window.location.href="${path}/user/listUser?userLimit="+userLimit;
        })



    })


</script>


</head>

<body>

<jsp:include page="/WEB-INF/fragments/tab.jsp"/>

<div  style="width: 100%;height: 660px; ">

    <div style="width: 15%;height: 70%; float: left;">
        <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    </div>

    <div style="width: 85%;height: 91%; float: left;">

        <div class="container" style=" margin-left:7% ;  ">
            <div class="row py-5">
                <div class="jumbotron" style="height: 600px; width: 100%;">
                    <h1 class="display-3">欢 迎 来 到  <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;温 馨 家 庭 旅 馆</h1>
                    <p class="lead">Make a little progress every day</p>
                    <p class="lead">每天进步一点点</p>
                    <hr class="my-4">



                    <%--房间信息--%>
                    <div class="col-xl-6 " style="height: 218px; float: left;">
                        <div class="card mb-4 "  style="height: 100%; width: 100%;" id="roomDiv">
                        </div>
                    </div>

                    <%--管理员信息--%>
                    <div class="col-xl-6 " style="height: 218px; float: left;">
                        <div class="card mb-4 "  style="height: 100%; width: 100%;" id="userDiv">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>



<%--<div style="width: 100%; margin-top: 45px; background-color: #FFFFFF;" >
    <jsp:include page="/WEB-INF/fragments/footer.jsp"/>
</div>--%>

</body>


</html>