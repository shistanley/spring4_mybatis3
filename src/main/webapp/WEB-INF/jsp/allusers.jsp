<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有用户</title>
<style type="text/css">
table, td {
	border: 1px solid;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>用户ID</td>
			<td>用户名</td>
			<td>用户生日</td>
			<td>工资</td>
		</tr>
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
			<td colspan=4><a href="user/regist">注册</a>&nbsp;<a
				href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>