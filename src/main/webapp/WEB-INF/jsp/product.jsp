<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表</title>
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
			<td>产品ID</td>
			<td>产品名</td>
			<td>产品描述</td>
		</tr>
		<c:forEach var="product" items="${lstProducts}">
			<tr>
				<td>${product.productID}</td>
				<td>${product.productName}</td>
				<td>${product.userBirthday}</td>
			</tr>
		</c:forEach>
		<c:if test="${not empty messages}">
			<tr>
				<td colspan="3">${messages}</td>
			</tr>
		</c:if>
		<tr>
			<td colspan=3><a
				href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
		</tr>
	</table>
	<form action="addproduct" method="post">
		<table>
			<tr>
				<td>产品名称</td>
				<td><input type="text" name="product_name"
					autofocus="autofocus" /></td>
			</tr>
			<tr>
				<td>产品描述</td>
				<td><textarea rows="6" cols="24" name="product_desc"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="添加" />&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</body>
</html>