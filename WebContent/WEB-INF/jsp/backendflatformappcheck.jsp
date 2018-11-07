<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="${pageContext.request.contextPath }/statics/localcss/appinfoadd.css"
	rel="stylesheet">
</head>

<body class="nav-md">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form
					action="${pageContext.request.contextPath }/backend/flatform/app/checkSaveWithNoAdopt" 
					method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">审核未通过原因：</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id" name="id" value="${appInfo.id}"
							readonly="readonly"> <input type="hidden" id="status"
							name="status" value="3">
						<div class="form-group">
							<textarea rows="4" name="describeText" style="width: 100%"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="提交">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="backend/backendheader.jsp" />
			<!-- top navigation -->
			<jsp:include page="backend/backendtop.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="min-height: 361px;">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									查看APP基础信息&nbsp;<span class="glyphicon glyphicon-user"></span><small>${devUserSession.devName}</small>
								</h2>
								<div class="clearfix"></div>

							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>APP基础信息</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<form id="checkForm" class="form-horizontal form-label-left"
									action="${pageContext.request.contextPath }/backend/flatform/app/checksave"
									method="post">
									<input type="hidden" id="id" name="id" value="${appInfo.id}"
										readonly="readonly"> <input type="hidden" id="status"
										name="status" value="2">
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareName">软件名称 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="softwareName"
												name="softwareName" value="${appInfo.softwareName}"
												disabled="disabled" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="APKName">APK名称 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="APKName"
												name="APKName" value="${appInfo.APKName}"
												disabled="disabled" class="form-control col-md-7 col-xs-12"
												readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="supportROM">支持ROM <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="supportROM"
												name="supportROM" value="${appInfo.supportROM}"
												disabled="disabled" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="interfaceLanguage">界面语言 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="interfaceLanguage"
												name="interfaceLanguage" disabled="disabled"
												value="${appInfo.interfaceLanguage}"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareSize">软件大小 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="softwareSize"
												name="softwareSize" value="${appInfo.softwareSize}"
												disabled="disabled" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="downloads">下载次数 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="downloads"
												name="downloads" disabled="disabled"
												value="${appInfo.downloads}"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="flatformId">所属平台 <span class="required">*</span>
										</label>

										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" name="flatformName"
												id="flatformName" value="${appInfo.flatformName}"
												disabled="disabled" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="categoryLevel1">所属分类 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="categoryName"
												name="categoryName"
												value="${appInfo.categoryName1}-->${appInfo.categoryName2}-->${appInfo.categoryName3}"
												disabled="disabled" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="statusName">APK状态 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="statusName"
												name="statusName" value="${appInfo.statusName}"
												disabled="disabled" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="appInfo">应用简介 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<textarea rows="2" name="appInfo" id="appInfo"
												disabled="disabled" class="form-control col-md-7 col-xs-12">${appInfo.appInfo}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="attach">LOGO图片 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div id="logoFile">
												<p>
													<img
														src="${pageContext.request.contextPath }${appInfo.logoPicPath}"
														width="100px" />
												</p>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
											<input type="submit" class="btn btn-primary"
												value="审核通过" /> <button type="button" class="btn btn-info"
												 data-toggle="modal" data-target="#myModal"
												 >审核不通过</button>
												 <input
												autocomplete="off" type="button"
												onclick="javascript:history.back(-1);"
												class="btn btn-primary" value="返回" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>最新版本信息</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<form class="form-horizontal form-label-left" method="post">
									<input type="hidden" name="APKName" value="${appInfo.APKName}">
									<input autocomplete="off" type="hidden" name="appId"
										value="${appInfo.id}"> <input type="hidden" name="id"
										id="id" value="${newAppVersion.id}">
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="versionNo">版本号 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="versionNo"
												name="versionNo" disabled="disabled"
												value="${newAppVersion.versionNo}"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="versionSize">版本大小 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input autocomplete="off" type="text" id="versionSize"
												name="versionSize" disabled="disabled"
												value="${newAppVersion.versionSize}"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareName">发布状态 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">${newAppVersion.publishStatusName}</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="versionInfo">版本简介 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<textarea id="versionInfo" name="versionInfo"
												disabled="disabled" class="form-control col-md-7 col-xs-12">${newAppVersion.versionInfo}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareName">apk文件 <span class="required">*</span>
										</label>
										<div id="apkFile">
											<p>${newAppVersion.apkFileName}&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}${newAppVersion.downloadLink}">下载</a>
											</p>
										</div>
									</div>
									<h2 class="red text-center">${message}</h2>
									<div class="ln_solid"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<jsp:include page="backend/backendfooter.jsp" />
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
	<script
		src="${pageContext.request.contextPath }/statics/js/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/datepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/validator.js"></script>
	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/js/bootstrapValidator.min.js"></script>
</body>
</html>