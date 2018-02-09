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
body {
	padding-top: 50px;
	padding-left: 50px;
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
	<div id="footer" class="container">
		<nav class="navbar navbar-default navbar-static-bottom"
			style="width: 100%;">
			<div class="navbar-inner navbar-content-center">
				<p class="text-muted credit" style="padding: 10px;">这里是底部信息的标题</p>
				<div class="row">
					<!-- 部分：一 -->
					<div class="col-md-10">
						<p>联系方式：</p>
						<div class="row">
							<div class="col-md-20">
								<ul>
									<li>办公电话：010-82514868</li>
								</ul>
							</div>
							<div class="col-md-20">
								<ul>
									<li>电子邮件：shi_stanley@163.com</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<footer id="footer">
		<h1 class="sr-only">Footer</h1>
		<p class="copyright text-green">
			© <span id="year">2018</span> - Shi All Rights Reserved. More
			Contents <a href="http://www.stanley.com/" target="_blank"
				title="SSM学习论坛">SSM学习论坛</a> - Collect from <a
				href="http://www.stanley.com/" title="斯坦利大学" target="_blank">斯坦利大学</a>
		</p>
	</footer>
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="Bootstrap/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>