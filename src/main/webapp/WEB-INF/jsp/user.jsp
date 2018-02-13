<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link rel="stylesheet"
	href="<c:url value='/Bootstrap/css/bootstrap.min.css' />">
<script type="text/javascript">
	function u_add() {
		var msg = "确定要添加吗？ \n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}

	function u_del() {
		var msg = "确定要删除吗？ \n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<style type="text/css">
body {
	padding-top: 50px;
	padding-left: 50px;
}

table, th, td {
	border: 1px solid;
	border-collapse: collapse;
}
</style>
<script type="text/javascript"
	src="<c:url value='/js/My97DatePicker/WdatePicker.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/money.js' />"></script>
<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]-->
<script src="<c:url value='/js/html5shiv.js' />"></script>
<script src="<c:url value='/js/respond.min.js' />"></script>
<!--[endif]-->
</head>
<body>
	<c:if test="${not empty user_message}">
		<div class="alert alert-info alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			${user_message}
		</div>
	</c:if>
	<c:if test="${not empty user_success}">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			${user_success}
		</div>
	</c:if>
	<c:if test="${not empty user_fail}">
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			${user_fail}
		</div>
	</c:if>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
	<br>
	<table>
		<tr>
			<th>用户ID</th>
			<th>用户名</th>
			<th>用户生日</th>
			<th>用户余额</th>
			<th>修改</th>
			<th>删除</th>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.userId}</td>
				<td>${user.userName}</td>
				<td><fmt:formatDate value="${user.userBirthday}" type='date'
						pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatNumber type="number" value="${user.userSalary}"
						pattern="#.00" /></td>
				<td><a
					href="${pageContext.request.contextPath}/user/updateuser/${user.userId}">修改</a></td>
				<td><a
					href="${pageContext.request.contextPath}/user/deleteuser/${user.userId}"
					onclick="return u_del()">删除</a></td>
			</tr>
		</c:forEach>
		<c:if test="${not empty user_message}">
			<script>
				alert("${user_message}");
			</script>
		</c:if>
		<c:if test="${not empty user_success}">
			<script>
				alert("${user_success}");
			</script>
		</c:if>
		<c:if test="${not empty user_fail}">
			<script>
				alert("${user_fail}");
			</script>
		</c:if>
		<tr>
			<td colspan="6"><a
				href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
		</tr>
	</table>
	<ul class="pagination">
		<li><a href="#">&laquo;</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">&raquo;</a></li>
	</ul>
	<br />
	<!-- <div class="mui-input-row"> -->
	<form action="${pageContext.request.contextPath}/user/adduser"
		onsubmit="return u_add()" method="post">
		<input type="hidden" name="token" value="${token}" />
		<table>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="user_name" required="required"
					autofocus="autofocus" required="required" /></td>
			</tr>
			<tr>
				<td>用户生日</td>
				<td><input class="Wdate" type="text" name="user_birthday"
					onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
					required="required" /></td>
			</tr>
			<tr>
				<td>用户余额</td>
				<td><input type="text" name="user_salary" value="0.00"
					required="required" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="添加" />&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	<!-- </div> -->
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="<c:url value='/Bootstrap/js/jquery.min.js' />"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="<c:url value='/Bootstrap/js/bootstrap.min.js' />"></script>
</body>
</html>