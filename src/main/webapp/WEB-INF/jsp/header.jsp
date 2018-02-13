<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring4集成MyBatis3</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<style type="text/css">

</style>
<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!-- [if lt IE 9] -->
<script src="<c:url value='/js/html5shiv.js' />"></script>
<script src="<c:url value='/js/respond.min.js' />"></script>
<!-- [endif] -->
</head>
<body>
	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Spring4-MyBatis3</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}/index.jsp"><span
							class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="${pageContext.request.contextPath}/product"><span
							class="glyphicon glyphicon-shopping-cart"></span> Product</a></li>
					<li><a href="${pageContext.request.contextPath}/user"><span
							class="glyphicon glyphicon-headphones"></span> User</a></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							注册</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							登录</a></li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</div>
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="Bootstrap/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>