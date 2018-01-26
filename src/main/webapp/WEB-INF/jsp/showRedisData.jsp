<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看Redis数据</title>
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
			<td>用户信息</td>
		</tr>
		<tr>
			<td>${message}</td>
		</tr>
		<tr>
			<td><a href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>