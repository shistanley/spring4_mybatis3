<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width:100%;
	height:100%;
}
</style>
<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!-- [if lt IE 9] -->
<script src="<c:url value='/js/html5shiv.js' />"></script>
<script src="<c:url value='/js/respond.min.js' />"></script>
<!-- [endif] -->
</head>
<body>
	<div id="footer" class="container">
		<nav class="navbar navbar-default navbar-static-bottom"
			style="width: 100%;">
			<div class="navbar-inner navbar-content-center">
				<!-- <p class="text-muted credit" style="padding: 10px;">这里是底部信息的标题</p>  -->
				<div class="row">
					<!-- 部分：一 -->
					<div class="col-md-4">
						<p>联系方式：</p>
						<div class="row">
							<div class="col-md-12">
								<ul>
									<li><span class="glyphicon glyphicon-phone-alt"></span>
										010-82514868</li>
								</ul>
							</div>
							<div class="col-md-12">
								<ul>
									<li><span class="glyphicon glyphicon-envelope"></span>
										shi_stanley@163.com</li>
								</ul>
							</div>
						</div>						
					</div>
					<div class="col-md-4">
						<p>联系方式：</p>
						<div class="row">
							<div class="col-md-12">
								<ul>
									<li><span class="glyphicon glyphicon-phone-alt"></span>
										010-82514868</li>
								</ul>
							</div>
							<div class="col-md-12">
								<ul>
									<li><span class="glyphicon glyphicon-envelope"></span>
										shi_stanley@163.com</li>
								</ul>
							</div>
						</div>						
					</div>
					<div class="col-md-4">
						<p>联系方式：</p>
						<div class="row">
							<div class="col-md-12">
								<ul>
									<li><span class="glyphicon glyphicon-phone-alt"></span>
										010-82514868</li>
								</ul>
							</div>
							<div class="col-md-12">
								<ul>
									<li><span class="glyphicon glyphicon-envelope"></span>
										shi_stanley@163.com</li>
								</ul>
							</div>
						</div>						
					</div>
				</div>
			</div>
		</nav>
	</div>
	<footer id="footer" class="footer nav navbar-default">
		<div class="nav navbar-header">
			<h1 class="sr-only">Footer</h1>
			<p class="navbar-default navbar-text">
				<span class="glyphicon glyphicon-copyright-mark"></span> <span
					id="year">2018</span> - Shi All Rights Reserved. More Contents <a
					href="http://www.stanley.com/" target="_blank" title="SSM学习论坛">SSM学习论坛</a>
				- Collect from <a href="http://www.stanley.com/" title="斯坦利大学"
					target="_blank">斯坦利大学</a>
			</p>
		</div>
	</footer>
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="Bootstrap/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>