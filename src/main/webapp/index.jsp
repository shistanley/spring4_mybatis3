<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--引入JSTL核心标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring4集成MyBatis3</title>
<style type="text/css">
table, td {
	border: 1px solid;
	border-collapse: collapse;
}
</style>
<script type="text/javascript"
	src="<c:url value='/js/My97DatePicker/WdatePicker.js' />"></script>
</head>
<body>
	<form action="user/getusername" method="post">
		<table>
			<tr>
				<td>用户ID</td>
				<td>用户名</td>
				<td>用户生日</td>
				<td>工资</td>
			</tr>
			<%--遍历lstUsers集合中的User对象 --%>
			<c:forEach var="user" items="${lstUsers}">
				<tr>
					<td>${user.userId}</td>
					<td>${user.userName}</td>
					<td><fmt:formatDate value="${user.userBirthday}"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatNumber type="number" value="${user.userSalary}"
							pattern="#.00" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=4><input type="text" name="username"
					placeholder="请输入需要查询的用户名" autofocus /> <!-- <a href="user/getusername">获取用户</a> -->
				</td>
			</tr>
			<tr>
				<td colspan=4><input type="submit" value="获取用户信息" />&nbsp; <!-- <input type="button" value="也可以点我" onclick="UserServlet" /> -->
					<a href="UserServlet">显示所有用户</a>&nbsp;<a href="user/regist">注册</a></td>
			</tr>
			<tr>
				<td colspan=4><a href="hello">Hello World</a>&nbsp;<a
					href="templates/demo">Thymeleaf Demo</a></td>
			</tr>
		</table>
	</form>
</body>
</html>