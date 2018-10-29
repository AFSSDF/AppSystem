$("#queryCategoryLevel1").change(
		function() {
			var queryCategoryLevel1 = $("#queryCategoryLevel1").val();
			if (queryCategoryLevel1 != '' && queryCategoryLevel1 != null) {
				$.ajax({
					type : "GET",// 请求类型
					url : path + "/appcategory/categorylevellist.json",// 请求的url
					data : {
						pid : queryCategoryLevel1
					},// 请求参数
					dataType : "json",// ajax接口（请求url）返回的数据类型
					success : function(data) {// data：返回数据（json对象）
						$("#queryCategoryLevel2").html("");
						var options = "<option value=\"\">--请选择--</option>";
						for (var i = 0; i < data.length; i++) {
							options += "<option value=\"" + data[i].id + "\">"
									+ data[i].categoryName + "</option>";
						}
						$("#queryCategoryLevel2").html(options);
					},
					error : function(data) {// 当访问时候，404，500 等非200的错误状态码
						alert("加载二级分类失败！");
					}
				});
			} else {
				$("#queryCategoryLevel2").html("");
				var options = "<option value=\"\">--请选择--</option>";
				$("#queryCategoryLevel2").html(options);
			}
			$("#queryCategoryLevel3").html("");
			var options = "<option value=\"\">--请选择--</option>";
			$("#queryCategoryLevel3").html(options);
		});

$("#queryCategoryLevel2").change(
		function() {
			var queryCategoryLevel2 = $("#queryCategoryLevel2").val();
			if (queryCategoryLevel2 != '' && queryCategoryLevel2 != null) {
				$.ajax({
					type : "GET",// 请求类型
					url : path + "/appcategory/categorylevellist.json",// 请求的url
					data : {
						pid : queryCategoryLevel2
					},// 请求参数
					dataType : "json",// ajax接口（请求url）返回的数据类型
					success : function(data) {// data：返回数据（json对象）
						$("#queryCategoryLevel3").html("");
						var options = "<option value=\"\">--请选择--</option>";
						for (var i = 0; i < data.length; i++) {
							// alert(data[i].id);
							// alert(data[i].categoryName);
							options += "<option value=\"" + data[i].id + "\">"
									+ data[i].categoryName + "</option>";
						}
						$("#queryCategoryLevel3").html(options);
					},
					error : function(data) {// 当访问时候，404，500 等非200的错误状态码
						alert("加载三级分类失败！");
					}
				});
			} else {
				$("#queryCategoryLevel3").html("");
				var options = "<option value=\"\">--请选择--</option>";
				$("#queryCategoryLevel3").html(options);
			}
		});

$(".checkApp").on(
		"click",
		function() {
			var obj = $(this);
			var status = obj.attr("status");
			var vid = obj.attr("versionid");
			if (status == "1" && vid != "" && vid != null) {// 待审核状态下才可以进行审核操作
				window.location.href = path+"/backend/flatform/app/check?aid=" + obj.attr("appinfoid")
						+ "&vid=" + obj.attr("versionid");
			} else if (vid != "" || vid != null) {
				alert("该APP应用没有上传最新版本,不能进行审核操作！");
			} else if (status != "1") {
				alert("该APP应用的状态为：【" + obj.attr("statusname") + "】,不能进行审核操作！");
			}
		});

function jump(pageCur) {
	var frm = document.forms[0];
	frm.pageIndex.value = pageCur;
	frm.submit();
}

function addVersion(node) {
	var dataNode = $(node).parent().parent()
	var id = dataNode.attr('data-id')
	window.location.href = path + "/dev/flatform/app/version/list?id=" + id
}
function modifyVersion(node) {
	var dataNode = $(node).parent().parent()
	var id = dataNode.attr('data-id')
	var versionNo = $(node).parent().parent().parent().prev().html()

	var statusName = dataNode.attr('data-statusName')
	if (statusName == '审核通过' || statusName == '已上架' || statusName == '已下架') {
		alert('该APP应用的状态为：【' + statusName + '】，只可进行【新增版本】操作！')
	} else if (versionNo == '' || versionNo == null) {
		alert("该APP应用无版本信息，请先增加版本信息！")
	} else {
		window.location.href = path + "/dev/flatform/app/version/modify?id="
				+ id
	}
}
function modify(node) {
	var dataNode = $(node).parent().parent()
	var statusName = dataNode.attr('data-statusName')
	var id = dataNode.attr('data-id')
	if (statusName == '审核通过' || statusName == '已上架' || statusName == '已下架') {
		alert('该APP应用的状态为：【' + statusName + '】，不能修改')
	} else {
		window.location.href = path + "/dev/flatform/app/modify?id=" + id;
	}
}
function del(node) {
	var dataNode = $(node).parent().parent()
	var id = dataNode.attr('data-id')
	var softwareName = $(node).parent().parent().parent().parent().find(
			'.softwareName').html();
	if (confirm("你确定要删除APP应用【" + softwareName + "】及其所有版本吗？")) {
		window.location.href = path + "/dev/flatform/app/del?id=" + id;
	}
}
function view(node) {
	var dataNode = $(node).parent().parent()
	var id = dataNode.attr('data-id')
	window.location.href = path + "/dev/flatform/app/view/" + id
}
function us(node) {
	var dataNode = $(node).parent().parent()
	var id = dataNode.attr('data-id')
	window.location.href = path + "/dev/flatform/app/us?id=" + id;
}
function ls(node) {
	var dataNode = $(node).parent().parent()
	var id = dataNode.attr('data-id')
	window.location.href = path + "/dev/flatform/app/ls?id=" + id;
}
