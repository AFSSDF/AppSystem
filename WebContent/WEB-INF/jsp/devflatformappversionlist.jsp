<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="${pageContext.request.contextPath }/statics/css/bootstrapValidator.min.css"
	rel="stylesheet">
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="developer/devheader.jsp" />
			<!-- top navigation -->
			<jsp:include page="developer/devtop.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="min-height: 361px;">
				<!-- top tiles -->
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									新增APP版本信息<span class="glyphicon glyphicon-user"></span><small>${devUserSession.devName}</small>
								</h2>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h3>历史版本列表</h3>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th class="column-title">软件名称</th>
												<th class="column-title">版本号</th>
												<th class="column-title">版本大小(单位:M)</th>
												<th class="column-title">发布状态</th>
												<th class="column-title">APK文件下载</th>
												<th class="column-title">最新更新时间</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${appVersions}" var="appVersion">
												<tr>
													<td>${appVersion.softwareName}</td>
													<td>${appVersion.versionNo}</td>
													<td>${appVersion.versionSize}</td>
													<td>${appVersion.publishStatusName}</td>
													<td><a
														href="${pageContext.request.contextPath}${appVersion.downloadLink}">${appVersion.apkFileName}</a></td>
													<td>${appVersion.formateDate(appVersion.modifyDate)}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>新增版本信息</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<form id="addForm" class="form-horizontal form-label-left"
									enctype="multipart/form-data"
									action="${pageContext.request.contextPath }/dev/flatform/app/version/addsave"
									method="post">
									<input autocomplete="off" type="hidden" name="APKName" value="${appInfo.APKName}">
									<input autocomplete="off" type="hidden" name="appId" value="${appInfo.id}">
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="versionNo">版本号 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="versionNo" name="versionNo"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="versionSize">版本大小 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="versionSize" name="versionSize"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareName">发布状态 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">预发布</div>
										<div class="col-md-6 col-sm-6 col-xs-12" style="display: none">
											<input autocomplete="off" type="text" id="publishStatus" name="publishStatus"
												value="3" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="versionInfo">版本简介 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<textarea id="versionInfo" name="versionInfo"
												required="required" class="form-control col-md-7 col-xs-12"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareName">apk文件 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="file" id="attach" name="attach"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<h2 class="red text-center">${message}</h2>
									<div class="ln_solid"></div>
									<div class="form-group">
										<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
											<button type="submit" class="btn btn-primary">保存</button>
											<a class="btn btn-success"
												href="javascript:window.history.back()">返回</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
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
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath }/statics/js/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/datepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/bootstrapValidator.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/localjs/appversionadd.js"></script>

</body>
</html>