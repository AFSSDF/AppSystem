$(function() {
	$("#back").on("click", function() {
		window.location.href = "list";
	});
});

$('#addForm').bootstrapValidator({
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
		},
		attach : {
			validators : {
				notEmpty : {
					message : 'apk文件不能为空'
				},
				file : {
					extension : 'apk',
					message : '文件格式不正确'
				}
			}
		}
	}
})