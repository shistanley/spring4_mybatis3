<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring4集成MyBatis3 - 登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 50px;
	padding-left: 50px;
}

table, th, td {
	border: 1px solid;
	border-collapse: collapse;
}

.align-center {
	margin: 0 auto; /* 居中 这个是必须的，，其它的属性非必须 */
	width: 100%; /* 给个宽度 顶到浏览器的两边就看不出居中效果了 */
}
</style>
<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]-->
<script src="<c:url value='/js/html5shiv.js' />"></script>
<script src="<c:url value='/js/respond.min.js' />"></script>
<!--[endif]-->
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
	<br>
	<form action="${pageContext.request.contextPath}/user/loginuser"
		method="post">
		<table>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="user_name" autofocus="autofocus" />
				</td>
			</tr>
			<tr>
				<td>用户密码</td>
				<td><input type="password" name="user_pwd" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="登录" />&nbsp;<input
					type="reset" value="重置" />&nbsp;<a
					href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
			</tr>
		</table>
	</form>
	<br>
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="<c:url value='/Bootstrap/js/jquery.min.js' />"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="<c:url value='/Bootstrap/js/bootstrap.min.js' />"></script>
</body>
</html>