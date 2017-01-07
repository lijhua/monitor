var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide:true
		}, {
			colkey : "userName",
			name : "用户名"
		}, {
			colkey : "accountName",
			name : "账号"
		}, {
			colkey : "roleName",
			name : "所属角色",
		}, {
			colkey : "locked",
			name : "是否启用",
			width : '90px',
			renderData : function(rowindex,data, rowdata, column) {
				var ck = "";
				if(data==1){
					ck = "checked='checked'";
				}
				var html ='<label class="inline">';
				html+='<input id="id-button-borders" '+ck+' onclick="checkstate(this,\''+rowdata.id+'\')" type="checkbox" class="ace ace-switch ace-switch-6">';
				html+='<span class="lbl middle"></span></label>';
				return html;
			}
		}, {
			colkey : "description",
			name : "描述"
		}, {
			colkey : "createTime",
			name : "时间",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}/*, {
			name : "操作",
			renderData : function(rowindex,data, rowdata, column) {
				return "<font color='red'>测试渲染函数,自由操作每一列的数据显示!</div>";
			}
		}*/ ],
		data:{FormMap:"UserFormMap",mapper_id:"UserMapper.findUserPage"},
		jsonUrl : rootPath + '/system/user/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addAccount").click("click", function() {
		addAccount();
	});
	$("#editAccount").click("click", function() {
		editAccount();
	});
	$("#delAccount").click("click", function() {
		delAccount();
	});
});
function checkstate(obj,id){
	var d = '0';
	if(obj.checked){
		d = '1';
	}
	var url = rootPath + '/system/user/update.shtml';
	var s = CommonUtil.ajax(url, {
		FormMap:"UserFormMap",
		"id" : id,
		"locked" : d
	}, "json");
	if (s == "success") {
		layer.msg('操作成功');
	} else {
		layer.msg('操作失败');
	}
}
function editAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/system/user/edit.shtml?FormMap=UserFormMap&id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "600px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function addAccount() {
	var url =rootPath + '/system/user/add.shtml';
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "600px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/system/user/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"UserFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}