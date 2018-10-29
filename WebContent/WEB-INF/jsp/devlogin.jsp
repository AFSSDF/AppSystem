<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>APP开发者平台</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath }/statics/css/nprogress.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath }/statics/css/custom.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/statics/localcss/devlogin.css"
	rel="stylesheet">
</head>
<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form action="${pageContext.request.contextPath }/dev/loginflatform.html" method="post">
						<h1>APP开发者平台</h1>
						<div>
							<input type="text" class="form-control"  name="devName" placeholder="请输入用户名"
								required="">
						</div>
						<div>
							<input type="password" class="form-control" name="devPassword" placeholder="请输入密码"
								required="">
						</div>
						<div id="message">${message}</div>
						<div>
							<input class="btn btn-primary" type="submit" value="登&nbsp;陆"> <input
								class="btn btn-default" type="reset" value="重&nbsp;填">
						</div>
						<div class="clearfix"></div>
						<div class="separator">
							<div class="clearfix"></div>
							<br>
							<div>
								<p>©2016 All Rights Reserved.</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>