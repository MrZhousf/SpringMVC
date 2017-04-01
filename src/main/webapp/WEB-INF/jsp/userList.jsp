<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<%@include file="head.jsp" %>
<script type="text/javascript">
//显示添加用户界面
function add(){
	window.location.href = "<%=basePath%>/user/showAddUser";
}
//显示编辑用户界面
function edit(userId){
	window.location.href = "<%=basePath%>/user/showEditUser?userId="+userId;
}
//删除用户
function deleteUser(userId,userName,index){
	$.ajax({
		url:"<%=basePath%>/user/deleteUser",
		type:"post",
		contentType:"application/json", 
		datatype:"json",
		data:JSON.stringify({'userId':userId,'userName':userName}),
		success:function(data){
			if(data="success"){
				alert("删除用户["+userName+"]成功");
				$("#user"+index).hide();
			}else{
				alert(data);
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.status+","+textStatus);
		},
	}); 
}
//搜索用户
function find(){
	var findKey = $("#findKey").val();
	if (isNull(findKey)) {
		alert("请正确输入用户姓名");
		return false;
	}
	window.location.href = "<%=basePath%>/user/find?userName="+findKey;
}

function isNull( str ){
	if ( str == "" ) return true;
	var regu = "^[ ]+$";
	var re = new RegExp(regu);
	return re.test(str);
}
</script>
</head>
<body>

<div align="left" style="margin: 20px;font-family: 微软雅黑;font-size: xx-large;"> 用户管理 </div>
<div style="margin-left: 20px;margin-bottom: 20px">
<input type="text" id="findKey" title="请输入用户姓名" value="${findKey }"/>
<input type="button" id="add" value="搜索" onclick="find();" /> 
<input type="button" id="add" value="添加用户" onclick="add();" style="margin-left: 20px"/>
</div>


<table width="80%" align="left" border="1" bordercolor="#F0F0F0" style="text-align: center;font-family: 微软雅黑;margin-left: 20px">
	<tr height="40px" style="font-size: large;background-color:#20B2AA;color: white ">
		<td>姓名</td><td>性别</td><td>年龄</td><td>所属部门</td><td>操作</td>
	</tr>
	<c:forEach items="${list }" var="u"  varStatus="status">
	    <tr height="40px" id="user${status.index }"><td>${u.userName }</td>
		    <c:if test="${u.sex=='男' || empty u.sex}"> <td style="color:blue">${u.sex }</td></c:if>
		    <c:if test="${u.sex=='女'}"> <td style="color:red">${u.sex }</td></c:if>   
		    <td>${u.age }</td>
		    <td>${u.department }</td>
		    <td width="25%">
		    <input type="button" value="编辑" onclick="edit(${u.userId});" style="margin-right: 20px"/>
		    <input type="button" value="删除" onclick="deleteUser('${u.userId}','${u.userName}','${status.index}');" />
		    </td>
	    </tr>
	</c:forEach>
</table>



</body>
</html>