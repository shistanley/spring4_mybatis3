<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品更新</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link rel="stylesheet"
	href="<c:url value='/Bootstrap/css/bootstrap.min.css' />">
<script type="text/javascript">
	function p_update() {
		var msg = "确定要修改吗？ \n\n请确认！";
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
	<form
		action="${pageContext.request.contextPath}/product/updateproductsubmit"
		onsubmit="return p_update()" method="post">
		<table>
			<tr>
				<th>产品ID</th>
				<th>产品名</th>
				<th>产品描述</th>
			</tr>
			<tr>
				<td><input type="hidden" name="product_id_hidden"
					value="${product.productId}" /> <input type="text"
					name="product_id" value="${product.productId}" readonly="readonly"
					disabled="disabled" /></td>
				<td><input type="text" name="product_name"
					value="${product.productName}" /></td>
				<td><input type="text" name="product_desc"
					value="${product.productDesc}" /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="确认" />&nbsp; <a
					href="${pageContext.request.contextPath}/product">返回产品列表</a></td>
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