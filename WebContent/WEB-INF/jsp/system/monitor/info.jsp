<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en"
	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<%@include file="/common/common.jspf"%>
<script src="${pageContext.request.contextPath}/echarts/esl/esl.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/echarts/echarts-all.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/monitor/systemInfo.js"></script>
<script type="text/javascript">
	function modifySer(key,id){
		$.ajax({
	        async: false,
	        url: "${pageContext.request.contextPath}/system/monitor/modifySer.shtml",
	        data:{"id":id,"value":$("#"+key).val()},
	        dataType: "json",
	        success: function (data) {
	    	    if(data.flag){
	    	    	alert("更新成功！");
	    	    }else{
	    	    	alert("更新失败！");
	    	    }
	        }
		});
	}
	function monitorSwitch(type){
		var url="${pageContext.request.contextPath}/system/monitor/startMonitor.shtml";
		if(type==2){
			url="${pageContext.request.contextPath}/system/monitor/closeMonitor.shtml";
		}
		$.ajax({
	        async: false,
	        url: url,
	        dataType: "json",
	        success: function (data) {
	    	    if(data.flag){
	    	    	alert((type==1?"开启":"关闭")+"成功！");
	    	    }else{
	    	    	alert((type==1?"开启":"关闭")+"失败！");
	    	    }
	        }
		});
	}
</script>
</head>
<body class="" style="">
	<section class="vbox">
		<div class="row" style="padding-right: 8px; padding-left: 8px; padding-top: 8ps; padding-bottom: 30px;">
			<div class="col-md-12 portlet ui-sortable" style="padding-bottom: 15px">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-briefcase"></i> 警告设置
					</header>
					<table class="table table-striped table-bordered table-hover"
						width="100%" style="vertical-align: middle;">
						<thead>
							<tr style="background-color: #faebcc; text-align: center;">
								<td width="100">名称</td>
								<td width="100">参数</td>
								<td width="205">预警设置</td>
								<td width="375">邮箱设置</td>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>频率</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前频率:<span id="td_frequency" style="color: green;">${d1}</span> HZ</td>
								<td align="center">
									<table>
										<tr>
											<td>频率超过</td>
											<td><input class='inputclass' name='frequency' id='frequency' type='text' value='${frequency}' /> HZ,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("frequency","1");'>修改 </a></td>
										</tr>
									</table>
								</td>
								<td rowspan='3' align="center" style="vertical-align: middle;">
								     <input class='inputclass' style='width: 250px; height: 32px;' name='toEmail' id='toEmail' type='text' value='${toEmail}' />
								     <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("toEmail","7");'>修改 </a>
								</td>
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>输入功率</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前输入功率：<span id="td_haspower" style="color: green;">${d5}</span> W</td>
								<td align="center">
									<table>
										<tr>
											<td>输入功率超过</td>
											<td><input class='inputclass' name='haspower' id='haspower' type='text' value='${haspower}' /> W,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("haspower","2");'>修改 </a></td>
										</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>输出功率</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前输出功率：<span id="td_nopower" style="color: green;">${d6}</span> W</td>
								<td align="center">
									<table>
										<tr>
											<td>输出功率超过</td>
											<td><input class='inputclass' name='nopower' id='nopower' type='text' value='${nopower}' /> W,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("nopower","3");'>修改 </a></td>
										</tr>
									</table>
								</td>	
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>效率</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前效率：<span id="td_effective" style="color: green;">${d2}</span> %</td>
								<td align="center">
									<table>
										<tr>
											<td>效率超过</td>
											<td><input class='inputclass' name='effective' id='effective' type='text' value='${effective}' /> %,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("effective","4");'>修改 </a></td>
										</tr>
									</table>
								</td>
								<td  align="center" style="vertical-align: middle;background-color: #faebcc;">
								       系统控制
								</td>	
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>直流电压</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前直流电压：<span id="td_voltage" style="color: green;">${d4}</span>V</td>
								<td align="center">
									<table>
										<tr>
											<td>直流电压超过</td>
											<td><input class='inputclass' name='voltage' id='voltage' type='text' value='${voltage}' /> V,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("voltage","5");'>修改 </a></td>
										</tr>
									</table>
								</td>
								<td align="center" rowspan='3' style="vertical-align: middle;">
								    <a class='btn btn-info' href='javascript:void(0)' onclick="monitorSwitch(1);">开启监控 </a>
								    <a class='btn btn-info' href='javascript:void(0)' onclick="monitorSwitch(2);">关闭监控</a>
								</td>	
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>直流电流</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前直流电流：<span id="td_current" style="color: green;">${d3}</span>A</td>
								<td align="center" >
									<table>
										<tr>
											<td>直流电流超过</td>
											<td><input class='inputclass' name='current' id='current' type='text' value='${current}' /> A,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("current","6");'>修改 </a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>相位</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前相位：<span id="td_phase" style="color: green;">${d7}</span>&deg;</td>
								<td align="center" >
									<table>
										<tr>
											<td>相位超过</td>
											<td><input class='inputclass' name='phase' id='phase' type='text' value='${phase}' /> &deg;,</td>
											<td>发送邮箱提示 <a class='btn btn-info' href='javascript:void(0)' onclick='modifySer("phase","8");'>修改 </a></td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
			<div class="col-md-12">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-fire"></i> 实时直流电流监控
					</header>

					<div class="panel-body">
						<div id="mainElectricCurrent" style="height: 370px;"></div>
					</div>
				</section>
			</div>
			<div class="col-md-12">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-fire"></i> 实时直流电压监控
					</header>

					<div class="panel-body">
						<div id="mainVoltage" style="height: 370px;"></div>
					</div>
				</section>
			</div>
			<div class="col-md-12">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-fire"></i> 实时功率监控
					</header>

					<div class="panel-body">
						<div id="mainPower" style="height: 370px;"></div>
					</div>
				</section>
			</div>
			
			
			<!-- /.span -->
			<div class="col-md-12" style="margin-top: 10px; height: 330px">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-rss-square"></i> 实时监控
					</header>

					<div class="panel-body">
						<table style="width: 100%;">
							<tr>
								<td width="33.3%"><div id="main_one" style="height: 240px;"></div></td>
								<td width="33.3%"><div id="main_two" style="height: 240px;"></div></td>
								<td width="33.3%"><div id="main_three"style="height: 240px;"></div></td>
							</tr>
						</table>
					</div>
				</section>
			</div>
			<!-- /.span -->
		</div>
	</section>
</body>
</html>
