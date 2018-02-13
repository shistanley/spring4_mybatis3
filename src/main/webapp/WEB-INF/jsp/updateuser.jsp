<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用戶修改</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link rel="stylesheet"
	href="<c:url value='/Bootstrap/css/bootstrap.min.css' />">
<script type="text/javascript">
	function u_update() {
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
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
	<br>
	<form action="${pageContext.request.contextPath}/user/updateusersubmit"
		onsubmit="return u_update()" method="post">
		<input type="hidden" name="token" value="${token}" />
		<table>
			<tr>
				<th>用户ID</th>
				<th>用户名</th>
				<th>用户生日</th>
				<th>用户余额</th>
			</tr>
			<tr>
				<td><input type="hidden" name="user_id_hidden"
					value="${user.userId}" /> <input type="text" name="user_id"
					value="${user.userId}" readonly="readonly" disabled="disabled" /></td>
				<td><input type="text" name="user_name"
					value="${user.userName}" required="required" /></td>
				<td><input class="Wdate" type="text" name="user_birthday"
					value="<fmt:formatDate value='${user.userBirthday}' type='date' pattern="yyyy-MM-dd" />"
					onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
					required="required" /></td>
				<td><input type="text" name="user_salary"
					value="<fmt:formatNumber type='number' value='${user.userSalary}'
						pattern="#.00" />"
					required="required" /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="确认" />&nbsp; <a
					href="${pageContext.request.contextPath}/user">返回用户列表</a></td>
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