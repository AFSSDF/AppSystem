<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" class=" ">
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
	<div class="container body">
		<div class="main_container">
			<jsp:include page="developer/devheader.jsp" />
			<!-- top navigation -->
			<jsp:include page="developer/devtop.jsp" />
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="min-height: 361px;">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									新增APP基础信息<span class="glyphicon glyphicon-user"></span><small>${devUserSession.devName}</small>
								</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br>
								<form id="addForm" class="form-horizontal form-label-left" enctype="multipart/form-data"
									action="${pageContext.request.contextPath }/dev/flatform/app/addsave" method="post">
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareName">软件名称 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="softwareName" name="softwareName"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="APKName">APK名称 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="APKName" name="APKName"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="supportROM">支持ROM <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="supportROM" name="supportROM"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="interfaceLanguage">界面语言 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="interfaceLanguage"
												name="interfaceLanguage" required="required"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="softwareSize">软件大小 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="softwareSize" name="softwareSize"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="downloads">下载次数 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="downloads" name="downloads"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="flatformId">所属平台 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<select name="flatformId" id="flatformId"
												class="form-control col-md-7 col-xs-12">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="categoryLevel1">一级分类 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<select name="categoryLevel1" id="categoryLevel1"
												class="form-control col-md-7 col-xs-12">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="categoryLevel2">二级分类 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<select name="categoryLevel2" id="categoryLevel2"
												class="form-control col-md-7 col-xs-12">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="categoryLevel3">三级分类 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<select name="categoryLevel3" id="categoryLevel3"
												class="form-control col-md-7 col-xs-12">
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="status">APK状态 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">待审核</div>
										<div class="col-md-6 col-sm-6 col-xs-12" style="display: none">
											<input type="text" id="status" name="status" value="1"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="appInfo">应用简介 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<textarea rows="2" name="appInfo" id="appInfo"
												class="form-control col-md-7 col-xs-12">
											</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="attach">LOGO图片 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="file" id="attach" name="attach"
												required="required" class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<h2 class="red text-center">${message}</h2>
									<div class="ln_solid"></div>
									<div class="form-group">
										<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
											<button type="submit" id="ubmitForm" class="btn btn-primary">保存</button>
											<a class="btn btn-success"
												href="javascript:window.history.back()">返回</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
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
	<script
		src="${pageContext.request.contextPath }/statics/localjs/appinfoadd.js"></script>
</body>
</html>