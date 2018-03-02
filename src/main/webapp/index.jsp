<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--引入JSTL核心标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring4集成MyBatis3</title>
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
<script type="text/javascript"
	src="<c:url value='/js/My97DatePicker/WdatePicker.js' />"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
	<div id="myCarousel" class="carousel slide align-center"
		data-ride="carousel">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner align-center">
			<div class="item active"
				style="background:url(<c:url value='/image/Carousel/1.jpg' />); background-size:cover; background-position: center,center; background-repeat: no-repeat; height: 200px;">
				<img class="controlsize"
					src="<c:url value='/image/Carousel/1.jpg' />" width="100%"
					alt="First slide">
				<div class="carousel-caption">标题 1</div>
			</div>
			<div class="item"
				style="background:url(<c:url value='/image/Carousel/2.jpg' />); background-size:cover; background-position: center,center; background-repeat: no-repeat; height: 200px;">
				<img class="controlsize"
					src="<c:url value='/image/Carousel/2.jpg' />" width="100%"
					alt="Second slide">
				<div class="carousel-caption">标题 2</div>
			</div>
			<div class="item"
				style="background:url(<c:url value='/image/Carousel/5.jpg' />); background-size:cover; background-position: center,center; background-repeat: no-repeat; height: 200px;">
				<img class="controlsize"
					src="<c:url value='/image/Carousel/5.jpg' />" width="100%"
					alt="Third slide">
				<div class="carousel-caption">标题5</div>
			</div>
			<div class="item"
				style="background:url(<c:url value='/image/Carousel/7.jpg' />); background-size:cover; background-position: center,center; background-repeat: no-repeat; height: 200px;">
				<img class="controlsize"
					src="<c:url value='/image/Carousel/7.jpg' />" width="100%"
					alt="Fourth slide">
				<div class="carousel-caption">标题 7</div>
			</div>
			<div class="item"
				style="background:url(<c:url value='/image/Carousel/carousel_1.png' />); background-size:cover; background-position: center,center; background-repeat: no-repeat; height: 200px;">
				<img class="controlsize"
					src="<c:url value='/image/Carousel/carousel_1.png' />" width="100%"
					alt="Fifth slide">
				<div class="carousel-caption">标题9</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="carousel-control right" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<br>
	<div class="align-center">
		<form action="user/getusername" method="post">
			<table>
				<tr>
					<th>用户ID</th>
					<th>用户名</th>
					<th>用户生日</th>
					<th>工资</th>
				</tr>
				<%--遍历lstUsers集合中的User对象 --%>
				<c:forEach var="user" items="${lstUsers}">
					<tr>
						<td>${user.userId}</td>
						<td>${user.userName}</td>
						<td><fmt:formatDate value="${user.userBirthday}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatNumber type="number"
								value="${user.userSalary}" pattern="#.00" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan=4><input type="text" name="username"
						placeholder="请输入需要查询的用户名" autofocus /> <!-- <a href="user/getusername">获取用户</a> -->
					</td>
				</tr>
				<tr>
					<td colspan=4><input type="submit" value="获取用户信息" />&nbsp; <!-- <input type="button" value="也可以点我" onclick="UserServlet" /> -->
						<a href="UserServlet">显示所有用户</a>&nbsp;<a href="user/regist">注册</a></td>
				</tr>
				<tr>
					<td colspan=4><a href="hello">Hello World</a>&nbsp;<a
						href="templates/demo">Thymeleaf Demo</a>&nbsp;<a
						href="hellomessage">I18N</a></td>
				</tr>
				<tr>
					<td colspan=4><a href="api/redis">Redis Demo</a></td>
				</tr>
				<tr>
					<td colspan=4><a href="product">产品注册</a></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="Bootstrap/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>