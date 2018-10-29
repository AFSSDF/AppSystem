<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath }";
</script>
</head>
<body>
	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;">
				<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
					<span>APP BMS</span></a>
			</div>

			<div class="clearfix"></div>

			<!-- menu profile quick info -->
			<div class="profile">
				<div class="profile_pic">
					<img
						src="${pageContext.request.contextPath }/statics/images/img.jpg"
						alt="..." class="img-circle profile_img">
				</div>
				<div class="profile_info">
					<span>Welcome,</span>
					<h2>${devUserSession.devCode}</h2>
				</div>
			</div>
			<!-- /menu profile quick info -->

			<br>

			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section active">
					<h3>${devUserSession.devName}</h3>
					<ul class="nav side-menu" style="">
						<li class=""><a><i class="fa fa-home"></i> APP账户管理<span
								class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none;">
								<li><a href="index.html">Dashboard</a></li>
								<li><a href="index2.html">Dashboard2</a></li>
								<li><a href="index3.html">Dashboard3</a></li>
							</ul></li>
						<li class=""><a><i class="fa fa-edit"></i> APP应用管理<span
								class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none;">
								<li><a
									href="${pageContext.request.contextPath }/dev/flatform/app/list">APP维护</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- /sidebar menu -->

			<!-- /menu footer buttons -->
			<div class="sidebar-footer hidden-small">
				<a data-toggle="tooltip" data-placement="top" title=""
					data-original-title="Settings"> <span
					class="glyphicon glyphicon-cog" aria-hidden="true"></span>
				</a> <a data-toggle="tooltip" data-placement="top" title=""
					data-original-title="FullScreen"> <span
					class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
				</a> <a data-toggle="tooltip" data-placement="top" title=""
					data-original-title="Lock"> <span
					class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
				</a> <a data-toggle="tooltip" data-placement="top" title=""
					data-original-title="Logout"
					href="${pageContext.request.contextPath }/dev/flatform/logout">
					<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
				</a>
			</div>
			<!-- /menu footer buttons -->
		</div>
	</div>
</body>
</html>