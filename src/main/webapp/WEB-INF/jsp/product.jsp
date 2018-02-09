<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link rel="stylesheet"
	href="<c:url value='/Bootstrap/css/bootstrap.min.css' />">
<script type="text/javascript">
	function p_add() {
		var msg = "确定要添加吗？ \n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}

	function p_del() {
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
<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
	<br>
	<table>
		<tr>
			<th>产品ID</th>
			<th>产品名</th>
			<th>产品描述</th>
			<th>修改</th>
			<th>删除</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr>
				<td>${product.productId}</td>
				<td>${product.productName}</td>
				<td>${product.productDesc}</td>
				<td><a
					href="${pageContext.request.contextPath}/product/updateproduct/${product.productId}">修改</a></td>
				<td><a
					href="${pageContext.request.contextPath}/product/deleteproduct/${product.productId}"
					onclick="return p_del()">删除</a></td>
			</tr>
		</c:forEach>
		<c:if test="${not empty add_product_fail}">
			<tr>
				<td colspan="5">${add_product_fail}</td>
			</tr>
		</c:if>
		<c:if test="${not empty update_product_fail}">
			<tr>
				<td colspan="5">${update_product_fail}</td>
			</tr>
		</c:if>
		<c:if test="${not empty delete_product_fail}">
			<tr>
				<td colspan="5">${delete_product_fail}</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5"><a
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
	<form action="${pageContext.request.contextPath}/product/addproduct"
		onsubmit="return p_add()" method="post">
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
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="<c:url value='/Bootstrap/js/jquery.min.js' />"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="<c:url value='/Bootstrap/js/bootstrap.min.js' />"></script>
</body>
</html>