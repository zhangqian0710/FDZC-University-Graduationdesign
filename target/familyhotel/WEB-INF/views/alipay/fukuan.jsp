<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/commons/taglibs.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>温馨家庭旅馆</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="<spring:url value='/resources/template/images/icons/favicon.png'/>"/>


	<!-- Bootstrap core CSS -->
	<link href="<spring:url value='/resources/template/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<spring:url value='/resources/template/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />

	<!-- Custom styles for this template -->
	<link href="<spring:url value='/resources/template/css/style.css'/>" rel="stylesheet">
	<link href="<spring:url value='/resources/template/fonts/antonio-exotic/stylesheet.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<spring:url value='/resources/template/css/lightbox.min.css'/>">
	<link href="<spring:url value='/resources/template/css/responsive.css'/>" rel="stylesheet">
	<script src="<spring:url value='/resources/template/js/jquery.min.js'/>" type="text/javascript"></script>
	<script src="<spring:url value='/resources/template/js/bootstrap.min.js'/>" type="text/javascript"></script>
	<script src="<spring:url value='/resources/template/js/lightbox-plus-jquery.min.js'/>" type="text/javascript"></script>
	<script src="<spring:url value='/resources/template/js/instafeed.min.js'/>" type="text/javascript"></script>
	<script src="<spring:url value='/resources/template/js/custom.js'/>" type="text/javascript"></script>
	<script src="<spring:url value='/resources/My97DatePickers/WdatePicker.js'/>"></script>
	<script src="<spring:url value='/resources/vendor/jquery/jquery-3.3.1.min.js'/>"></script>


	<script>

	</script>
</head>
<body>

<!--header-->
<jsp:include page="/WEB-INF/views/front/frontheader.jsp"/>
<!--隔离条-->
<div style="width: 100%;height: 30px; background-color: black"></div> <br>


<!--信息确认-->


<section class="contact-block" style="background-color: whitesmoke">
	<div class="container">
		<div class="col-md-6 contact-left-block">
			<h3><span>温馨 </span>家庭旅馆</h3>
			<p class="text-left">位于北京市中心繁华地带王府井商业圈有得天独厚的地理位置，距天安门广场咫尺之遥，距离首都国际机场28公里，南邻北京火车站，交通极其便利有二条地铁、十数条公交车及民航班车可换乘。</p>
			<p class="text-right">中国 北京. <i class="fa fa-map-marker fa-lg"></i></p>
			<p class="text-right"><a href=""> +86 188****3997 <i class="fa fa-phone fa-lg"></i></a></p>
			<p class="text-right"><a href=""> 616963127@qq.com <i class="fa fa-envelope"></i></a></p>
		</div>

		<div class="col-md-6 contact-form" >

			<form name=alipayForm action="${path}/order/buy" method="post"  style="margin-left: 150px;">

				<div class="row">
					<p style="font-size: 18px;">商户订单号 ：</p>
					<input id="WIDout_trade_no" name="WIDout_trade_no"  class="form-control" readonly="readonly"/>
				</div>

				<div class="row">
					<p style="font-size: 18px;">订单名称 ：</p>
					<input id="WIDsubject" name="WIDsubject"  class="form-control" readonly="readonly" />
				</div>

				<div class="row">
					<p style="font-size: 18px;">付款金额 ：</p>
					<input id="WIDtotal_amount" name="WIDtotal_amount"  class="form-control" readonly="readonly" />
				</div>

				<div class="row">
					<p style="font-size: 18px;">商品描述 ：</p>
					<input id="WIDbody" name="WIDbody"  class="form-control" readonly="readonly" value="${dir}"/>
				</div>

				<div class="row">
					<button class="btn btn-primary btn-block"  type="submit" >确定付款</button>
				</div>

			</form>
		</div>

	</div>
</section>




		<!---footer--->
		<footer>
			<div class="copyright">
				<p>&copy; ZhangQian 2019 FUZHOU UNIVERSITY ZHICHENG XUEYUAN . Graduation Design</p>
			</div>
		</footer>

	</div>
</body>
<script language="javascript">
	var tabs = document.getElementsByName('tab');
	var contents = document.getElementsByName('divcontent');
	
	(function changeTab(tab) {
	    for(var i = 0, len = tabs.length; i < len; i++) {
	        tabs[i].onmouseover = showTab;
	    }
	})();
	
	function showTab() {
	    for(var i = 0, len = tabs.length; i < len; i++) {
	        if(tabs[i] === this) {
	            tabs[i].className = 'selected';
	            contents[i].className = 'show';
	        } else {
	            tabs[i].className = '';
	            contents[i].className = 'tab-content';
	        }
	    }
	}
	
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value =  sNow;
		document.getElementById("WIDsubject").value = "${msg}";
		document.getElementById("WIDtotal_amount").value = "${price}";
	}
	GetDateNow();
</script>
</html>