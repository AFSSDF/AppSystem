$(function() {
	// 动态加载所属平台列表
	$.ajax({
		type : "GET",// 请求类型
		url : path + "/datadictionary/datadictionarylist.json",// 请求的url
		data : {
			tcode : "APP_FLATFORM"
		},// 请求参数
		dataType : "json",// ajax接口（请求url）返回的数据类型
		success : function(data) {// data：返回数据（json对象）
			$("#flatformId").html("");
			var options = "<option value=\"\">--请选择--</option>";
			for (var i = 0; i < data.length; i++) {
				options += "<option value=\"" + data[i].valueId + "\">"
						+ data[i].valueName + "</option>";
			}
			$("#flatformId").html(options);
		},
		error : function(data) {// 当访问时候，404，500 等非200的错误状态码
			alert("加载平台列表失败！");
		}
	});
	// 动态加载一级分类列表
	$.ajax({
		type : "GET",// 请求类型
		url : path + "/appcategory/firstcategorylevellist.json",// 请求的url
		data : {
			pid : null
		},// 请求参数
		dataType : "json",// ajax接口（请求url）返回的数据类型
		success : function(data) {// data：返回数据（json对象）
			$("#categoryLevel1").html("");
			var options = "<option value=\"\">--请选择--</option>";
			for (var i = 0; i < data.length; i++) {
				options += "<option value=\"" + data[i].id + "\">"
						+ data[i].categoryName + "</option>";
			}
			$("#categoryLevel1").html(options);
		},
		error : function(data) {// 当访问时候，404，500 等非200的错误状态码
			alert("加载一级分类列表失败！");
		}
	});
	// 动态加载二级分类列表
	$("#categoryLevel1")
			.change(
					function() {
						var categoryLevel1 = $("#categoryLevel1").val();
						if (categoryLevel1 != '' && categoryLevel1 != null) {
							$
									.ajax({
										type : "GET",// 请求类型
										url : path
												+ "/appcategory/categorylevellist.json",// 请求的url
										data : {
											pid : categoryLevel1
										},// 请求参数
										dataType : "json",// ajax接口（请求url）返回的数据类型
										success : function(data) {// data：返回数据（json对象）
											$("#categoryLevel2").html("");
											var options = "<option value=\"\">--请选择--</option>";
											for (var i = 0; i < data.length; i++) {
												options += "<option value=\""
														+ data[i].id + "\">"
														+ data[i].categoryName
														+ "</option>";
											}
											$("#categoryLevel2").html(options);
										},
										error : function(data) {// 当访问时候，404，500
											// 等非200的错误状态码
											alert("加载二级分类失败！");
										}
									});
						} else {
							$("#categoryLevel2").html("");
							var options = "<option value=\"\">--请选择--</option>";
							$("#categoryLevel2").html(options);
						}
						$("#categoryLevel3").html("");
						var options = "<option value=\"\">--请选择--</option>";
						$("#categoryLevel3").html(options);
					});
	// 动态加载三级分类列表
	$("#categoryLevel2")
			.change(
					function() {
						var categoryLevel2 = $("#categoryLevel2").val();
						if (categoryLevel2 != '' && categoryLevel2 != null) {
							$
									.ajax({
										type : "GET",// 请求类型
										url : path
												+ "/appcategory/categorylevellist.json",// 请求的url
										data : {
											pid : categoryLevel2
										},// 请求参数
										dataType : "json",// ajax接口（请求url）返回的数据类型
										success : function(data) {// data：返回数据（json对象）
											$("#categoryLevel3").html("");
											var options = "<option value=\"\">--请选择--</option>";
											for (var i = 0; i < data.length; i++) {
												options += "<option value=\""
														+ data[i].id + "\">"
														+ data[i].categoryName
														+ "</option>";
											}
											$("#categoryLevel3").html(options);
										},
										error : function(data) {// 当访问时候，404，500
											// 等非200的错误状态码
											alert("加载三级分类失败！");
										}
									});
						} else {
							$("#categoryLevel3").html("");
							var options = "<option value=\"\">--请选择--</option>";
							$("#categoryLevel3").html(options);
						}
					});

	$("#back").on("click", function() {
		window.location.href = "list";
	});

	// $("#APKName").bind("blur", function() {
	// // ajax后台验证--APKName是否已存在
	// $.ajax({
	// type : "GET",// 请求类型
	// url : "apkexist.json",// 请求的url
	// data : {
	// APKName : $("#APKName").val()
	// },// 请求参数
	// dataType : "json",// ajax接口（请求url）返回的数据类型
	// success : function(data) {// data：返回数据（json对象）
	// if (data.APKName == "empty") {// 参数APKName为空，错误提示
	// alert("APKName为不能为空！");
	// } else if (data.APKName == "exist") {// 账号不可用，错误提示
	// alert("该APKName已存在，不能使用！");
	// } else if (data.APKName == "noexist") {// 账号可用，正确提示
	// alert("该APKName可以使用！");
	// }
	// },
	// error : function(data) {// 当访问时候，404，500 等非200的错误状态码
	// alert("请求错误！");
	// }
	// });
	// });
});

// 添加表单验证
$('#addForm').bootstrapValidator({
	message : "This value is not valid",
	feedbackIcons : {
		valid : 'glyphicon glyphicon-ok',
		invalid : 'glyphicon glyphicon-remove',
		validating : 'glyphicon glyphicon-refresh'
	},
	fields : {
		softwareName : {
			validators : {
				notEmpty : {
					message : '软件名称不能为空'
				}
			}
		},
		APKName : {
			validators : {
				notEmpty : {
					message : 'APK名称不能为空'
				},
				remote : {
					url : path + '/dev/flatform/app/apkexist',
					message : "APK名称已经存在！",
					data : {
						APKName : $('#APKName').val()
					},
					delay : 500,
					type : 'get',
				}
			}
		},
		supportROM : {
			validators : {
				notEmpty : {
					message : '支持ROM不能为空'
				}
			}
		},
		interfaceLanguage : {
			validators : {
				notEmpty : {
					message : '界面语言不能为空'
				}
			}
		},
		softwareSize : {
			validators : {
				notEmpty : {
					message : '软件大小不能为空'
				},regexp:{
					regexp:/^$|^([0-9]{1}|[1-9]+\d*)(.{0,1}\d{1,2})?$/,
					message:'软件大小格式不正确'
				}
			}
		},
		downloads : {
			validators : {
				notEmpty : {
					message : '下载次数不能为空'
				},regexp:{
					regexp:/^\d+$/,
						message:"下载次数格式不正确"
				}
			}
		},
		flatformId : {
			validators : {
				notEmpty : {
					message : '所属平台不能为空'
				}
			}
		},
		categoryLevel1 : {
			validators : {
				notEmpty : {
					message : '一级分类不能为空'
				}
			}
		},
		categoryLevel2 : {
			validators : {
				notEmpty : {
					message : '二级分类不能为空'
				}
			}
		},
		categoryLevel3 : {
			validators : {
				notEmpty : {
					message : '三级分类不能为空'
				}
			}
		},
		appInfo : {
			validators : {
				notEmpty : {
					message : '应用简介不能为空'
				}
			}
		},
		attach : {
			validators : {
				notEmpty : {
					message : 'LOGO图片不能为空'
				},
				file : {
					extension : 'jpg,jpeg,png',
					type : 'image/png,image/jpg,image/jpeg',
					message : '文件格式不正确'
				}
			}
		}
	}
});
