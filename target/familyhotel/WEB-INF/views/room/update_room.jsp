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

    <script type="text/javascript">

        function previewImage(file){

            if (file.files && file.files[0])
            {
                var img = document.getElementById('picImg');

                //准备一个文件读取器对象，并告诉它文件读取完毕之后要做什么。
                var reader = new FileReader();
                //成功读取了图片信息后，把读取结果赋予

                //FileReader.readAsDataURL()
                //开始读取指定的Blob中的内容。一旦完成，result属性中将包含一个data: URL格式的字符串以表示所读取文件的内容。
                reader.onload = function(evt){
                    img.src= evt.target.result;
                    console.log("read ok! img yunzhixun get value!"+evt.target.result);
                }

                console.log("start to read!")
                reader.readAsDataURL(file.files[0]);

            }
            else
                alert("no upload file!");

        }


        //jQuery validate 表单验证
        $.validator.setDefaults({
            submitHandler: function(form) {
                form.submit();
            }
        });

        $().ready(function() {
            // 在键盘按下并释放及提交后验证提交表单
            $("#roomForm").validate({
                rules: {
                    roomPrice:{
                        required: true,
                        number:true,
                        digits:true,
                        min:0
                    }
                },
                messages: {
                    roomPrice:{
                        required: "请输入房间价格/1晚！",
                        number:"请输入大于0的整数！",
                        digits:"请输入大于0的整数！",
                        min:"请输入大于0的整数！"
                    }
                }
            });
        });


    </script>

    <style type="text/css">
        .error{
            color:red;
        }
    </style>


</head>

<body>

<jsp:include page="/WEB-INF/fragments/tab.jsp"/>


<div  style="width: 100%;height: 660px; background-color: #FFFFFF; ">

    <div style="width: 15%;height: 70%; float: left;">
        <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    </div>

    <div style="width: 85%;height: 91%; float: left;">
        <div class="container-fluid" style="margin-left: 16px;">
            <div class="row">
                <div class=" col-md-12">
                    <div class="card card-shadow mb-4">
                        <div class="card-header">
                            <div class="card-title" style="font-size:25px;">
                                <div style="float: left">更新房间</div>
                                <div  class=" breadcrumb_nav" style="float: right;font-size: 15px;">
                                    <ol class="breadcrumb" style="margin-top: 15px;">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a class="parent-item" href="<c:url value="/user/indexHome"/>">主页</a>
                                            <i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">
                                            更新房间
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="card-body" style="height: 577px;">
                            <form action="${path}/room/updateRoom" Class="right-text-label-form" id="roomForm"  method="post" enctype="multipart/form-data" modelAttribute="room"  >
                            <input type="hidden" name="roomId" value="${room.roomId}"/>
                            <div style="margin-left: 200px;">
                                <div style="float: left">
                                    <div class="form-group row" style="width: 450px;height: 140px;">
                                        <h6 class="mt-3">房间图片：</h6>
                                        <img id="picImg" src="<c:url value="/room/${room.roomId}/getPic"/>" width="200" height="130" class="py-1"><br>
                                        <label class="custom-file">
                                            <input type="file" id="file2" class="custom-file-input" name="pic" onchange="previewImage(this)">
                                            <span class="custom-file-control" style="width: 400px;">...</span>
                                        </label>
                                    </div>
                                </div>
                                <div style="float: left;margin-left: 50px;">
                                    <div class="form-group row" style="width: 450px;height: 70px;">
                                        <h6 class="mt-3">房间编号：</h6>
                                        <input type="text" Class="form-control" name="roomNo" id="roomNo" readonly="readonly" value="${room.roomNo}" style="width: 400px;" placeholder="请输入房间编号"/>
                                    </div>

                                    <div class="form-group row" style="width: 450px;height: 70px;">
                                        <h6 class="mt-3">房间价格：(1晚)</h6>
                                        <input type="text" Class="form-control" name="roomPrice" id="roomPirce"  maxlength="10" value="${room.roomPrice}" style="width: 400px" placeholder="请输入房间价格"/>
                                    </div>
                                </div>


                                <div style="float: left; margin-top: 10px; height: 150px;" >
                                    <div class="form-group row" style="width: 450px;height: 40px;">
                                        <h6 class="mt-3">房间类型：</h6>
                                        <div style="margin-top: 13px;">
                                        <label class="control control-solid control-solid-info control--radio">单人间：<i class="fa fa-male fa-lg"></i>
                                            <input type="radio" name="roomType" value="a" name="radio" <c:if test="${room.roomType=='a'}">checked</c:if> />
                                            <div class="control__indicator"></div> </label>
                                        </div>&nbsp;&nbsp;
                                        <div style="margin-top: 13px;">
                                        <label class="control control-solid control-solid-info control--radio">双人间：<i class="fa fa-male fa-lg"></i><i class="fa fa-female fa-lg"></i>
                                            <input type="radio" name="roomType" value="b" name="radio" <c:if test="${room.roomType=='b'}">checked</c:if>  />
                                            <div class="control__indicator"></div> </label>
                                        </div>&nbsp;&nbsp;
                                        <div style="margin-top: 13px;">
                                        <label class="control control-solid control-solid-info control--radio">家庭套房：<i class="fa fa-male fa-lg"></i><i class="fa fa-child fa-lg"></i><i class="fa fa-female fa-lg"></i>
                                            <input type="radio" name="roomType" value="c" name="radio" <c:if test="${room.roomType=='c'}">checked</c:if>  />
                                            <div class="control__indicator"></div> </label>
                                        </div>
                                    </div>

                                    <div class="form-group row" style="width: 450px;height: 40px;">
                                        <h6 class="mt-3">房间设施：</h6>
                                        <div style="margin-top: 13px;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"  name="roomEquip" value="a"
                                            <c:forEach var="equip" items="${room.roomEquip}"> <c:if test="${equip=='a'}">checked</c:if> </c:forEach>	>
                                            <span class="custom-control-indicator"></span> <span class="custom-control-description">液晶电视 <i class="fa fa-male fa-tv"></i></span> </label>
                                        </div>
                                        <div style="margin-top: 13px;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="roomEquip" value="b"
                                            <c:forEach var="equip" items="${room.roomEquip}"> <c:if test="${equip=='b'}">checked</c:if> </c:forEach>>
                                            <span class="custom-control-indicator"></span> <span class="custom-control-description">光纤WIFI <i class="fa fa-male fa-wifi"></i></span> </label>
                                        </div>
                                        <div style="margin-top: 13px;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="roomEquip" value="c"
                                            <c:forEach var="equip" items="${room.roomEquip}"> <c:if test="${equip=='c'}">checked</c:if> </c:forEach>>
                                            <span class="custom-control-indicator"></span> <span class="custom-control-description">高级洗浴 <i class="fa fa-male fa-s15"></i></span> </label>
                                        </div>
                                    </div>

                                    <div class="form-group row" style="width: 450px;height: 40px;">
                                        <h6 class="mt-3">房间状态：</h6>
                                        <div style="margin-top: 13px;">
                                            <label class="control control-solid control-solid-info control--radio">未预定
                                                <input type="radio" name="roomStatus" value="a" name="radio" <c:if test="${room.roomStatus=='a'}">checked</c:if> />
                                                <div class="control__indicator"></div> </label>
                                        </div>&nbsp;&nbsp;
                                        <div style="margin-top: 13px;">
                                            <label class="control control-solid control-solid-danger control--radio">已预定
                                                <input type="radio" name="roomStatus" value="b" name="radio" <c:if test="${room.roomStatus=='b'}">checked</c:if> />
                                                <div class="control__indicator"></div> </label>
                                        </div>&nbsp;&nbsp;
                                        <div style="margin-top: 13px;">
                                            <label class="control control-solid control-solid-success control--radio">已入住
                                                <input type="radio" name="roomStatus" value="c" name="radio" <c:if test="${room.roomStatus=='c'}">checked</c:if> />
                                                <div class="control__indicator"></div> </label>
                                        </div>
                                    </div>
                                </div>

                                <div style="float: left;margin-left: 50px; margin-top: 10px;">
                                    <div class="form-group row" style="width: 400px;height: 140px;">
                                        <h6 class="mt-3">房间描述：</h6>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" maxlength="200" name="roomMemo" rows="3">${room.roomMemo}</textarea>
                                    </div>
                                    <div class="form-group row" style="margin-left: 82%" >
                                        <button type="submit" class="btn btn-secondary">
                                            更新房间
                                        </button>
                                    </div>
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