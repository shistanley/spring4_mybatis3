<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
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
	<form action="registuser" method="post">
		<table>
			<tr>
				<td>用户ID</td>
				<td><input type="text" name="user_id" readonly="readonly"
					disabled="disabled" /></td>
			</tr>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="user_name" autofocus="autofocus" /></td>
			</tr>
			<tr>
				<td>用户生日</td>
				<td><input class="Wdate" type="text" name="user_birthday"
					onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" /></td>
			</tr>
			<tr>
				<td>工资</td>
				<td><input type="text" name="user_salary" /></td>
			</tr>

			<tr>
				<td colspan=2><input type="submit" value="添加" />&nbsp;<input
					type="reset" value="重置" />&nbsp;<a
					href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
			</tr>
		</table>
	</form>
</body>
</html>