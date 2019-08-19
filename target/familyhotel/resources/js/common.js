function showTime(container)
{
   //window.alert(container.tagName);
   var output="";
   var nowTime=new Date();
   
   var datePart=nowTime.getYear()+"年"+(nowTime.getMonth()+1)+"月"+nowTime.getDate()+"日";
   var weekPart="星期"+"日一二三四五六".charAt(nowTime.getDay());
   var timePart=covertDbl(nowTime.getHours())+"时"
                   +covertDbl(nowTime.getMinutes())+"分"
                   +covertDbl(nowTime.getSeconds())+"秒";   
   output=datePart+" "+weekPart+" "+timePart;
   
   container.innerText=output;
}

function covertDbl(value)
{
   return (value+"").length!=2?"0"+value:value;  	
} 

function hide(_sId)
{
   $(_sId).style.display=$(_sId).style.display=="none"?"block":"none"; 
}
function isEmpty(element)
{
    return element!=null&&element.value.length>0?false:true;
}
function checkValidate()
{
	if(isEmpty($("accId")))
    {
        alert("帐户编号必须填写！");
        return false;
    }
    
    if(isNaN($("accId").value))
    {
    	alert("帐户编号必须为数字！");
        return false;
    }
    
    if(isEmpty($("accName")))
    {
        alert("帐户名称要填写！");
        return false;
    }
    
    if(isEmpty($("accPwd")))
    {
    	alert("帐户密码必须填写！");
    	return false;
    }
}
//字符串的值是否为空
function isStrNull(str){
	if(str.length == 0){
		return true;
	}
	return  false;
}
//字符串是否为实数
function isStrFloatNum(numStr){
	if (isNaN(numStr) == true) {
		//window.alert("isNaN(num)==true");
		return false;
	}
	else {
		if (numStr.indexOf(".") == -1) {
			//window.alert("num.indexOf('.') == -1");
			return false;
		}
		else 
			if (numStr.indexOf("-") != -1) {
				return false;
			}
			else {
				var length = numStr.substr(numStr.indexOf(".")+1,numStr.length).length;
				if (length != 1) {
					//window.alert("lgth != 1");
					return false;
				}
			}
	}
	return true;
}

//判断字符串是否为正整数
function isStrInt(numStr){

	if (isNaN(numStr) == true) {
		return false;
	}else{
		if (numStr.indexOf(".") != -1) {
			return false;
		}
	}
	
	return true;
}

//验证用户名
function checkUserName(userName){
	var pattern = "^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[_\a-zA-Z0-9]|[\s])*$";
    var objRegExp = new RegExp(pattern,"ig");
	
	if (isStrNull(userName) == true) {
		return false;
	}
	else 
		if (objRegExp.test(userName) == false) {
			return false;
		}
	
	return true;
	
}

//验证密码
function checkPassword(password){
	var pattern = "^([\u4E00-\u9FA5]|[\uFE30-\uFFA0]|[_\a-zA-Z0-9]|[\s])*$";
	var objRegExp = new RegExp(pattern,"ig");
	if(isStrNull(password)==true) return false;
	else if(objRegExp.test(password)==false){
		return false;
	}
}
//验证下拉框
function checkSelect(stObj){
	if(stObj.selectedIndex==0){
		return false;
	}
	
	return true;
}
//只输入数字
function onlynumber()
	{
		if(event.keyCode==13)
			return true;
		if(event.keyCode<48||event.keyCode>57)
		{
			event.keyCode=0;
			event.returnValue=false;
		}
		event.returnValue=true;
	}