<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="top_nav">
		<div class="nav_menu">
			<nav>
				<div class="nav toggle">
					<a id="menu_toggle"><i class="fa fa-bars"></i></a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li class=""><a href="javascript:;"
						class="user-profile dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false"> <img
							src="${pageContext.request.contextPath }/statics/images/img.jpg"
							alt=""><span class=" fa fa-angle-down"></span>
					</a>
						<ul class="dropdown-menu dropdown-usermenu pull-right">
							<li><a
								href="${pageContext.request.contextPath }/backend/flatform/logout"><i
									class="fa fa-sign-out pull-right"></i> Log Out</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>