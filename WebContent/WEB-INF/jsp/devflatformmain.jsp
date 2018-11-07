<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh" class=" ">
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
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/statics/css/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath }/statics/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath }/statics/css/jqvmap.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath }/statics/css/custom.min.css"
	rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="developer/devheader.jsp" />
			<!-- top navigation -->
			<jsp:include page="developer/devtop.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="min-height: 361px;">
				<h1>欢迎你：${devUserSession.devName}|角色：开发者账户</h1>
				<!-- top tiles -->
					
				<!-- /top tiles -->
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<jsp:include page="developer/devfooter.jsp" />
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/statics/js/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath }/statics/js/nprogress.js"></script>
	<!-- Chart.js -->
	<%-- <script
		src="${pageContext.request.contextPath }/statics/js/Chart.min.js"></script> --%>
	<!-- gauge.js -->
	<%-- <script
		src="${pageContext.request.contextPath }/statics/js/gauge.min.js"></script> --%>
	<!-- bootstrap-progressbar -->
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/bootstrap-progressbar.min.js"></script> --%>
	<!-- iCheck -->
	<%-- <script
		src="${pageContext.request.contextPath }/statics/js/icheck.min.js"></script> --%>
	<!-- Skycons -->
	<%-- <script src="${pageContext.request.contextPath }/statics/js/skycons.js"></script> --%>
	<!-- Flot -->
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.flot.js"></script> --%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.flot.pie.js"></script> --%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.flot.time.js"></script> --%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.flot.stack.js"></script> --%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.flot.resize.js"></script> --%>
	<!-- Flot plugins -->
	<%--<script
		src="${pageContext.request.contextPath }/statics/js.orderbars/js/jquery.flot.orderBars.js"></script> --%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js-spline/js/jquery.flot.spline.min.js"></script> --%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js.curvedlines/curvedLines.js"></script> --%>
	<!-- DateJS -->
	<%--<script src="${pageContext.request.contextPath }/statics/js/date.js"></script>--%>
	<!-- JQVMap -->
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.vmap.js"></script>--%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/maps/jquery.vmap.world.js"></script>--%>
	<%--<script
		src="${pageContext.request.contextPath }/statics/js/jquery.vmap.sampledata.js"></script>--%>
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath }/statics/js/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/datepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
</body>
</html>