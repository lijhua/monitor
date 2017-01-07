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
			colkey : "name",
			name : "监控类型",
			width : "85px"
		}, {
			colkey : "value1",
			name : "监控值",
			width : "115px"
		}, {
			colkey : "createTime",
			name : "创建时间",
			width : "200px",
			option:{
				formatter:'date'
			}
		} ],
		data:{FormMap:"DataFormMap"},
		jsonUrl : rootPath + '/report/data/findByPages.shtml',
		checkbox : false
	});
	$("#search").click(function(){
	    	var searchParams = $("#searchForm").serializeJSON();
	    	grid.setOptions({
				data : searchParams
			});
	});
	$("#export").click(function(){
		 $("#searchForm").attr("action",rootPath + '/report/data/exportData.shtml');
		 $("#searchForm").submit();
		 $("#searchForm").removeAtr("action");
	});
});