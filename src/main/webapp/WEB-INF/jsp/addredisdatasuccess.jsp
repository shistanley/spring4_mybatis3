<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加Redis数据成功</title>
</head>
<body>
	<p>添加信息成功！</p>
	<p>
		<form action="viewData" method="post">
			<table>
				<tr>
					<td>
						<label>用户名：</label>
						<input type="text" name="username" autofocus="autofocus" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="查看数据" />
						<input type="reset" value="重置数据" />
					</td>
				</tr>
			</table>
		</form>
		<a href="${pageContext.request.contextPath}/index.jsp">返回</a>
	</p>
</body>
</html>