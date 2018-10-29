function delfile(id) {
	$.ajax({
		type : "GET",// 请求类型
		url : path + "/dev/flatform/app/delfile.json",// 请求的url
		data : {
			id : id,
			flag : 'apk'
		},// 请求参数
		dataType : "json",// ajax接口（请求url）返回的数据类型
		success : function(data) {// data：返回数据（json对象）
			if (data.result == "success") {
				alert("删除成功！");
				addFileVerify();
				$("#uploadfile").show();
				$("#apkFile").html('');
			} else if (data.result == "failed") {
				alert("删除失败！");
			}
		},
		error : function(data) {// 当访问时候，404，500 等非200的错误状态码
			alert("请求错误！");
		}
	});
}

$(function() {
	$("#back").on("click", function() {
		window.location.href = "list";
	});

	// 上传APK文件---------------------
	var downloadLink = $("#downloadLink").val();
	var id = $("#id").val();
	var apkFileName = $("#apkFileName").val();
	if (downloadLink == null || downloadLink == "" || downloadLink == path) {
		$("#uploadfile").show();
		addFileVerify();
	} else {
		$("#apkFile").append(
				"<p>" + apkFileName + "&nbsp;&nbsp;<a href=\"" + downloadLink
						+ "?m=" + Math.random() + "\" >下载</a> &nbsp;&nbsp;"
						+ "<a href=\"javascript:;\" onclick=\"delfile('" + id
						+ "');\">删除</a></p>");
	}

});

// 动态添加文件验证
function addFileVerify() {
	$("#modifyForm").bootstrapValidator("addField", "attach", {
		validators : {
			notEmpty : {
				message : 'apk文件不能为空'
			},
			file : {
				extension : 'apk',
				message : '文件格式不正确'
			}
		}
	});
}

$('#modifyForm').bootstrapValidator({
	message : "This value is not valid",
	feedbackIcons : {
		valid : 'glyphicon glyphicon-ok',
		invalid : 'glyphicon glyphicon-remove',
		validating : 'glyphicon glyphicon-refresh'
	},
	fields : {
		versionNo : {
			validators : {
				notEmpty : {
					message : "版本号不能为空"
				}
			}
		},
		versionSize : {
			validators : {
				notEmpty : {
					message : "版本大小不能为空"
				},
				regexp : {
					regexp : /^$|^([0-9]{1}|[1-9]+\d*)(.{0,1}\d{1,2})?$/,
					message : '版本大小格式不正确'
				}
			}
		},
		versionInfo : {
			validators : {
				notEmpty : {
					message : "版本简介不能为空"
				}
			}
		}
	}
})
