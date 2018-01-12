<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--引入JSTL核心标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看单一用户页面</title>
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
		<c:if test="${not empty messages}">
			<tr>
				<td colspan=4>${messages}</td>
			</tr>
		</c:if>
		<tr>
			<td colspan=4><a
				href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>