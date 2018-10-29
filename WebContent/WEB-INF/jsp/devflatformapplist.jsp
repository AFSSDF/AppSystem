<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${pageContext.request.contextPath }/statics/localcss/appinfolist.css"
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
				<!-- top tiles -->
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									APP信息管理维护<span class="glyphicon glyphicon-user"></span><small>${devUserSession.devName}-您可以通过搜索或者其他的筛选项对APP信息进行修改、删除等管理操作。^_^</small>
								</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<form
									action="${pageContext.request.contextPath }/dev/flatform/app/list"
									method="get">
									<ul>
										<li style="display: none;"><label for="querySoftwareName">软件名称&nbsp;&nbsp;&nbsp;</label>
											<input type="text" name="pageIndex" id="pageIndex"
											class="form-control" value="${pageBean.pageCur}"></li>
										<li><label for="querySoftwareName">软件名称&nbsp;&nbsp;&nbsp;</label>
											<input type="text" name="querySoftwareName"
											id="querySoftwareName" class="form-control"
											value="${querySoftwareName}"></li>
										<li><label for="queryStatus">APP状态&nbsp;&nbsp;&nbsp;</label>
											<select name="queryStatus" id="queryStatus"
											class="form-control">
												<option value="">--请选择--</option>
												<c:forEach items="${statusList}" var="status">
													<option value="${status.valueId}"
														<c:if test="${queryStatus == status.valueId}">selected </c:if>>${status.valueName}</option>
												</c:forEach>
										</select></li>
										<li><label for="queryFlatformId">所属平台&nbsp;&nbsp;&nbsp;</label>
											<select name="queryFlatformId" id="queryFlatformId"
											class="form-control">
												<option value="">--请选择--</option>
												<c:forEach items="${flatformList}" var="flatform">
													<option value="${flatform.valueId}"
														<c:if test="${queryFlatformId == flatform.valueId}">selected </c:if>>${flatform.valueName}</option>
												</c:forEach>
										</select></li>
										<li><label for="queryCategoryLevel1">一级分类&nbsp;&nbsp;&nbsp;</label>
											<select name="queryCategoryLevel1" id="queryCategoryLevel1"
											class="form-control">
												<option value="">--请选择--</option>
												<c:forEach items="${appCategories1}" var="appCategory">
													<option value="${appCategory.id}"
														<c:if test="${queryCategoryLevel1 == appCategory.id}">selected </c:if>>${appCategory.categoryName}</option>
												</c:forEach>
										</select></li>
										<li><label for="queryCategoryLevel2">二级分类&nbsp;&nbsp;&nbsp;</label>
											<select name="queryCategoryLevel2" id="queryCategoryLevel2"
											class="form-control">
												<option value="">--请选择--</option>
												<c:forEach items="${appCategories2}" var="appCategory">
													<option value="${appCategory.id}"
														<c:if test="${queryCategoryLevel2 == appCategory.id}">selected </c:if>>${appCategory.categoryName}</option>
												</c:forEach>
										</select></li>
										<li><label for="queryCategoryLevel3">三级分类&nbsp;&nbsp;&nbsp;</label>
											<select name="queryCategoryLevel3" id="queryCategoryLevel3"
											class="form-control">
												<option value="">--请选择--</option>
												<c:forEach items="${appCategories3}" var="appCategory">
													<option value="${appCategory.id}"
														<c:if test="${queryCategoryLevel3 == appCategory.id}">selected </c:if>>${appCategory.categoryName}</option>
												</c:forEach>
										</select></li>
										<li><input type="submit" value="查询"
											class="btn btn-primary"></li>
									</ul>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<a class="btn btn-primary"
									href="${pageContext.request.contextPath }/dev/flatform/app/add">新增APP基础信息</a>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th class="column-title">软件名称</th>
												<th class="column-title">APK名称</th>
												<th class="column-title">软件大小(单位:M)</th>
												<th class="column-title">所属平台</th>
												<th class="column-title">所属分类(一级分类、二级分类、三级分类)</th>
												<th class="column-title">状态</th>
												<th class="column-title">下载次数</th>
												<th class="column-title">最新版本号</th>
												<th class="column-title">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${appInfos}" var="appInfo">
												<tr>
													<th class="softwareName">${appInfo.softwareName}</th>
													<th>${appInfo.APKName}</th>
													<th>${appInfo.softwareSize}</th>
													<th>${appInfo.flatformName}</th>
													<th>${appInfo.categoryName1}->${appInfo.categoryName2}->${appInfo.categoryName3 }</th>
													<th>${appInfo.statusName}</th>
													<th>${appInfo.downloads}</th>
													<th>${appInfo.versionNo}</th>
													<th class="btn-group"><button type="button"
															class="btn btn-primary dropdown-toggle"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false">
															点击操作&nbsp;<span class="caret"></span>
														</button>
														<ul class="dropdown-menu" data-id="${appInfo.id}"
															data-statusName="${appInfo.statusName}">
															<li><a href="javascript:void(0);"
																onclick="addVersion(this)">新增版本</a></li>
															<li><a href="javascript:void(0);"
																onclick="modifyVersion(this)" data-toggle="tooltip"
																data-placement="top" title="修改APP最新版本信息">修改版本</a></li>
															<li><a href="javascript:void(0);"
																onclick="modify(this)" data-toggle="tooltip"
																data-placement="top" title="修改APP基础信息">修改</a></li>
															<li><a href="javascript:void(0)"
																onclick="del(this)">删除</a></li>
															<li><a href="javascript:void(0)"
																onclick="view(this)">查看</a></li>
															<c:choose>
																<c:when test="${appInfo.status==2||appInfo.status==5}">
																	<li><a href="javascript:void(0)"
																		onclick="us(this)">上架</a></li>
																</c:when>
																<c:when test="${appInfo.status==2||appInfo.status==4}">
																	<li><a href="javascript:void(0)"
																		onclick="ls(this)">下架</a></li>
																</c:when>
															</c:choose>
														</ul></th>
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
					共${pageBean.dataTotal}条记录&nbsp;${pageBean.pageCur}/${pageBean.pageTotal}
					<div class="btn-group" style="float: right;">
						<a class="btn btn-default "
							href="javascript:jump(${pageBean.pageCur-1})">上一页</a><a
							class="btn btn-default"
							href="javascript:jump(${pageBean.pageCur+1})">下一页</a><a
							class="btn btn-default"
							href="javascript:jump(${pageBean.pageTotal})">最后一页</a>
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
		src="${pageContext.request.contextPath }/statics/localjs/applist.js"></script>

</body>
</html>