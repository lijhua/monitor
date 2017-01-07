<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer-v2.2/laydate/laydate.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/system/report/list.js"></script>
</head>
<body>
	<div class="page-content">
<div class="m-b-md">
	<form class="form-inline" id="searchForm" name="searchForm" method="post">
		<div class="form-group">
			  <label class="control-label">
			      <span class="h4 font-thin v-middle">数据类型:</span>
			  </label>
			  <select class="select.input-sm" id="type" name="type">
			     <option value="0">全部</option>
			     <option value="3">直流电流</option>
			     <option value="4">直流电压</option>
			     <option value="1">频率</option>
			     <option value="2">效率</option>
			     <option value="5">功率</option>
			     <option value="6">相位</option>
			  </select>
		</div>
		<div class="form-group">
			     开始日：<input class="laydate-icon" id="start" name="startDate" style="width:200px; margin-right:10px;"/>
                           结束日：<input class="laydate-icon" id="end"  name="endDate" style="width:200px;"/>
	   </div>		  
		<a href="javascript:void(0)" class="btn btn-primary" id="search">查询</a>
		<a href="javascript:void(0)" class="btn btn-primary" id="export">导出</a>
	</form>
</div><br/>
<div id="paging" class="pagclass"></div>
</div>
</body>
<script>
var start = {
  elem: '#start',
  format: 'YYYY-MM-DD hh:mm:ss',
  min: '1990-01-01 00:00:00', //设定最小日期为当前日期
  max: '2099-06-16 23:59:59', //最大日期
  istime: true,
  istoday: false,
  choose: function(datas){
     end.min = datas; //开始日选好后，重置结束日的最小日期
     end.start = datas //将结束日的初始值设定为开始日
  }
};
var end = {
  elem: '#end',
  format: 'YYYY-MM-DD hh:mm:ss',
  min: '1990-01-01 00:00:00',
  max: '2099-06-16 23:59:59',
  istime: true,
  istoday: false,
  choose: function(datas){
    start.max = datas; //结束日选好后，重置开始日的最大日期
  }
};
laydate(start);
laydate(end);
</script>
</html>