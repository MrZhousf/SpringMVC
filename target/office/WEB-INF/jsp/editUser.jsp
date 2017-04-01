<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户</title>
<%@include file="head.jsp" %>
<script type="text/javascript">
//显示用户列表页面
function toList(){
	window.location.href = "<%=basePath%>/user/list";
}
//提交表单
function submitForm(){
	//参数校验
	var userId = $("#userId").val();
	var userName = $("#userName").val();
	var sex=$('input:radio[name="sex"]:checked').val();
	var age = $("#age").val();
	var department = $("#department").val();
	if(userId==""){
		alert("用户信息有误！");
		toList();
		return false;
	}
	if(userName==""){
		alert("请输入用户姓名！");
		return false;
	}
	if(age==""){
		alert("请输入用户年龄！");
		return false;
	}
	$.ajax({
		url:"<%=basePath%>/user/edit",
		type:"post",
		contentType:"application/json", 
		datatype:"json",
		data:JSON.stringify({'userId':userId,'userName':userName,'sex':sex,'age':age,'department':department}),
		success:function(data){
			if(data="success"){
				alert("修改用户信息成功");
				window.location.href = "<%=basePath%>/user/list";
			}else{
				alert(data);
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.status+","+textStatus);
		},
	});
}


</script>
</head>
<body>

<div align="center" style="margin: 20px;font-family: 微软雅黑;font-size: xx-large;">编辑用户信息 </div>

<form action="add" method="post">
<table align="center" style="margin-top: 20px;font-family:微软雅黑;font-size: large; ">
	<tr><td height="50px">用户姓名：</td><td><input type="text" id="userName" name="userName" value="${user.userName}"/></td></tr>
	<tr>
		<td height="50px">性别：</td>
		<td>
		<input type="radio" name="sex" <c:if test="${user.sex=='男'}">checked="checked"</c:if> value="男"  style="margin-right: 10px">男   
		<input type="radio" name="sex" <c:if test="${user.sex=='女'}">checked="checked"</c:if> value="女" style="margin-left: 20px;margin-right: 10px" >女
		</td>
	</tr>
	<tr><td height="50px">年龄：</td><td><input type="text" id="age" name="age" value="${user.age}" onkeyup="this.value=this.value.replace(/\D/g, '')"/></td></tr>
	<tr>
		<td height="50px">所属部门：</td>
		<td>
		<select id="department" name="department">  
		    <option value="市场部" <c:if test="${user.department=='市场部'}">selected="selected"</c:if>>市场部</option>  
		    <option value="客服部" <c:if test="${user.department=='客服部'}">selected="selected"</c:if>>客服部</option>  
		    <option value="财务部" <c:if test="${user.department=='财务部'}">selected="selected"</c:if>>财务部</option> 
			<option value="运营部" <c:if test="${user.department=='运营部'}">selected="selected"</c:if>>运营部</option> 
		    <option value="研发技术部" <c:if test="${user.department=='研发技术部'}">selected="selected"</c:if>>研发技术部</option>  
		    <option value="移动研发部" <c:if test="${user.department=='移动研发部'}">selected="selected"</c:if>>移动研发部</option>  
		    <option value="测试运维部" <c:if test="${user.department=='测试运维部'}">selected="selected"</c:if>>测试运维部</option>  
		    <option value="数据技术部" <c:if test="${user.department=='数据技术部'}">selected="selected"</c:if>>数据技术部</option>  
		    <option value="信息技术部" <c:if test="${user.department=='信息技术部'}">selected="selected"</c:if>>信息技术部</option>  
		</select>  
		</td>
	</tr>
	<tr><td height="50px" colspan="2">
	<input type="hidden" value="${user.userId}" id="userId"/>
	<input type="button" value="确定修改" onclick="submitForm();" />
	<input type="button" value="返回" onclick="toList();" style="margin-left: 20px"/>
	</td></tr>

</table>
</form>

</body>
</html>