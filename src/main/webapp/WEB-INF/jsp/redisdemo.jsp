<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redis Demo</title>
</head>
<body>
	<form action="regist" method="post">
		<table>
			<tr>
				<td>name</td>
				<td><input type="text" name="username" autofocus="autofocus" /></td>
			</tr>
			<tr>
				<td>message</td>
				<td><input type="text" name="message" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="submit" />&nbsp; <input
					type="reset" value="reset" />&nbsp; <a th:href="@{/index.jsp}">返回</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>