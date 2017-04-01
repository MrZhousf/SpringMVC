<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<%@include file="head.jsp" %>
<script type="text/javascript">
function toList(){
	window.location.href = "<%=basePath%>/user/list";
}
function submitForm(){
	//参数校验
	var userName = $("#userName").val();
	var sex=$('input:radio[name="sex"]:checked').val();
	var age = $("#age").val();
	var department = $("#department").val();
	if(userName==""){
		alert("请输入用户姓名！");
		return false;
	}
	if(age==""){
		alert("请输入用户年龄！");
		return false;
	}
	$.ajax({
		url:"<%=basePath%>/user/add",
		type:"post",
		contentType:"application/json", 
		datatype:"json",
		data:JSON.stringify({'userName':userName,'sex':sex,'age':age,'department':department}),
		success:function(data){
			if(data="success"){
				alert("添加用户成功");
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

<div align="center" style="margin: 20px;font-family: 微软雅黑;font-size: xx-large;"> 请准确填写用户信息 </div>

<form action="add" method="post">
<table align="center" style="margin-top: 20px;font-family:微软雅黑;font-size: large; ">
	<tr><td height="50px">用户姓名：</td><td><input type="text" id="userName" name="userName" /></td></tr>
	<tr>
		<td height="50px">性别：</td>
		<td>
		<input type="radio" name="sex" checked="checked" style="margin-right: 10px" value="男">男   
		<input style="margin-left: 20px;margin-right: 10px" type="radio" name="sex" value="女">女
		</td>
	</tr>
	<tr><td height="50px">年龄：</td><td><input type="text" id="age" name="age" onkeyup="this.value=this.value.replace(/\D/g, '')"/></td></tr>
	<tr>
		<td height="50px">所属部门：</td>
		<td>
		<select id="department" name="department">  
		    <option value="市场部">市场部</option>  
		    <option value="客服部">客服部</option>  
		    <option value="财务部">财务部</option> 
			<option value="运营部">运营部</option> 
		    <option value="研发技术部">研发技术部</option>  
		    <option value="移动研发部">移动研发部</option>  
		    <option value="测试运维部">测试运维部</option>  
		    <option value="数据技术部">数据技术部</option>  
		    <option value="信息技术部">信息技术部</option>  
		</select>  
		</td>
	</tr>
	<tr><td height="50px" colspan="2">
	<input type="button" value="添加用户" onclick="submitForm();" />
	<input type="button" value="返回" onclick="toList();" style="margin-left: 20px"/>
	</td></tr>

</table>
</form>

</body>
</html>