var dialog;
var grid;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide:true
		}, {
			colkey : "ramUsage",
			name : "告警类型",
			width : "85px"
		},{
			colkey : "setCpuUsage",
			name : "预设值",
			width : "85px"
		},{
			colkey : "cpuUsage",
			name : "实测值",
			width : "85px"
		}, {
			colkey : "jvmUsage",
			name : "邮件内容",
			width : "300px"
		}, {
			colkey : "email",
			name : "发送的邮箱",
			width : "100px"
		} ,{
			colkey : "setJvmUsage",
			name : "发送时间"
		} ,{
			colkey : "mark",
			name : "备注"
		} ],
		data:{FormMap:"ServerInfoFormMap"},
		jsonUrl : rootPath + '/system/monitor/findByPage.shtml',
		checkbox : false
	});
	$("#searchForm").click("click", function() {//绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();
		grid.setOptions({
			data : searchParams
		});
	});
});