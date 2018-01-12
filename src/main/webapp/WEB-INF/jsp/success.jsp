<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户成功页面</title>
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
		<tr>
			<td>${adduser.userId}</td>
			<td>${adduser.userName}</td>
			<td><fmt:formatDate value="${adduser.userBirthday}"
					pattern="yyyy-MM-dd" /></td>
			<td><fmt:formatNumber type="number"
					value="${adduser.userSalary}" pattern="#.00" /></td>
		</tr>
		<tr>
			<td colspan=4><a
				href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>