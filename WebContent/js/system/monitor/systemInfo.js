$(function() {
	onloadurl();
	/**
	 * 构造实时电流的折线图
	 */
	var electricCurrentChart = echarts.init(document.getElementById('mainElectricCurrent'));
	optionElectricCurrent = {
		title : {
			text : '实时直流电流监控图',
			x : 'center'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend: {
	        data:['直流电流'],
	        x : 'right'
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    dataZoom: {
	        show: false,
	        start: 0,
	        end: 100
	    },
		xAxis : [  {
            type: 'category',
            boundaryGap: true,
            data: (function (){
                var now = new Date();
                var res = [];
                var len = 10;
                while (len--) {
                    res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
                    now = new Date(now - 2000);
                }
                return res;
            })()
        } ],
        yAxis: [
                {
                    type: 'value',
                    scale: true,
                    name: '直流电流',
                    max: 2,
                    min: 0,
                    boundaryGap: [0.2, 0.2],
                    axisLabel : {
        				formatter : '{value}A'
        			}
                },
                {
                    type: 'value',
                    scale: true,
                    name: '直流电流',
                    max: 2,
                    min: 0,
                    boundaryGap: [0.2, 0.2],
                    axisLabel : {
        				formatter : '{value}A'
        			}
                }
            ],
		series : [ {
			 name : '直流电流',
			 type : 'line',
			  data:(function (){
	                var res = [];
	                $.ajax({
	                	type:"POST",
	                	async : false,
	                	url : rootPath + '/system/monitor/realTimeData.shtml',
	                	data:{type:1},
	                	dataType : 'json',
	                	success:function(dat){
	                		res=dat.json;
	                	}
	                }); 
	                return res;
	            })()
		} ]
	};
	electricCurrentChart.setOption(optionElectricCurrent);
	/**
	 * 实时构造电压的折线图
	 */
	var mainVoltageChart = echarts.init(document.getElementById('mainVoltage'));
	optionVoltage = {
		title : {
			text : '实时直流电压监控图',
			x : 'center'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend: {
		        data:['直流电压'],
		        x : 'right'
		},
		toolbox: {
	        show: true,
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    dataZoom: {
	        show: false,
	        start: 0,
	        end: 100
	    },
	    xAxis: [
	            {
	                type: 'category',
	                boundaryGap: true,
	                data: (function (){
	                    var now = new Date();
	                    var res = [];
	                    var len = 10;
	                    while (len--) {
	                        res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
	                        now = new Date(now - 2000);
	                    }
	                    return res;
	                })()
	            }
	    ]
	    
	    ,
		yAxis : [ {
            type: 'value',
            scale: true,
            name: '直流电压',
            max: 24,
            min: 0,
            boundaryGap: [0.2, 0.2],
            axisLabel : {
				formatter : '{value}V'
			}
        },
        {
            type: 'value',
            scale: true,
            name: '直流电压',
            max: 24,
            min: 0,
            boundaryGap: [0.2, 0.2],
            axisLabel : {
				formatter : '{value}V'
			}
        } ],
		series : [ {
			name : '直流电压',
			type : 'line',
			data:(function (){
				 var res = [];
	                $.ajax({
	                	type:"POST",
	                	async : false,
	                	url : rootPath + '/system/monitor/realTimeData.shtml',
	                	data:{type:2},
	                	dataType : 'json',
	                	success:function(dat){
	                		res=dat.json;
	                	}
	                }); 
	                return res;
            })()
		} ]
	};
	mainVoltageChart.setOption(optionVoltage);

	/**
	 * 实时构造功率的折线图
	 */
	var mainPowerChart = echarts.init(document.getElementById('mainPower'));
	optionPower = {
		title : {
			text : '实时功率监控图',
			x : 'center'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '输入功率', '输出功率' ],
			x : 'right'
		},
		toolbox: {
		        show: true,
		        feature: {
		            dataView: {readOnly: false},
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		dataZoom: {
		        show: false,
		        start: 0,
		        end: 100
		 },
		 xAxis: [
		         {
		             type: 'category',
		             boundaryGap: true,
		             data: (function (){
		                 var now = new Date();
		                 var res = [];
		                 var len = 10;
		                 while (len--) {
		                     res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
		                     now = new Date(now - 2000);
		                 }
		                 return res;
		             })()
		         }
		],
		yAxis : [ {
			min : 0,
			max : 100,
			type: 'value',
	       scale: true,
	        name: '功率',
	        boundaryGap: [0.2, 0.2],
			axisLabel : {
				formatter : '{value}W'
			}
		} ,
		 {
			min : 0,
			max : 100,
			type: 'value',
	        scale: true,
	        name: '功率',
	        boundaryGap: [0.2, 0.2],
			axisLabel : {
				formatter : '{value}W'
			}
		} ],
		series : [
				{
					name : '输入功率',
					type : 'line',
					 data:(function (){
						   var res = [];
			                $.ajax({
			                	type:"POST",
			                	async : false,
			                	url : rootPath + '/system/monitor/realTimeData.shtml',
			                	data:{type:3},
			                	dataType : 'json',
			                	success:function(dat){
			                		res=dat.json;
			                	}
			                }); 
			                return res;
			         })()
				},
				{
					name : '输出功率',
					type : 'line',
					 data:(function (){
						 var res = [];
			                $.ajax({
			                	type:"POST",
			                	async : false,
			                	url : rootPath + '/system/monitor/realTimeData.shtml',
			                	data:{type:4},
			                	dataType : 'json',
			                	success:function(dat){
			                		res=dat.json;
			                	}
			                }); 
			                return res;
			            })()
				} ]
	};
	mainPowerChart.setOption(optionPower);
	var main_one = echarts.init(document.getElementById('main_one'));
	var main_two = echarts.init(document.getElementById('main_two'));
	var main_three = echarts.init(document.getElementById('main_three'));
	
	one_option = {
		tooltip : {
			formatter : "{a} <br/>{b} : {c}%"
		},
		series : [ {
			min:0,
            max:120,
			title : {
				show : true,
				offsetCenter : [ 0, "95%" ],
			},
			pointer : {
				color : '#FF0000'
			},
			name : '频率指标',
			radius:[0, '95%'],
			axisLine : { // 坐标轴线
				lineStyle : { // 属性lineStyle控制线条样式
					width : 20
				}
			},
			detail : {
				formatter : '{value}HZ'
			},
			type : 'gauge',
			data : [ {
				value : 50,
				name : '频率'
			} ]
		} ]
	};
	two_option = {
		tooltip : {
			formatter : "{a} <br/>{b} : {c}%"
		},
		series : [ {
			min:-90,
			max:90,
			title : {
				show : true,
				offsetCenter : [ 0, "95%" ],
			},
			pointer : {
				color : '#FF0000'
			},
			name : '相位指标',
			radius:[0, '95%'],
			axisLine : { // 坐标轴线
				lineStyle : { // 属性lineStyle控制线条样式
					width : 20
				}
			},
			detail : {
				formatter : '{value}°'
			},
			type : 'gauge',
			data : [ {
				value : 0,
				name : '相位'
			} ]
		} ]
	};
	three_option = {
			tooltip : {
				formatter : "{a} <br/>{b} : {c}%"
			},
			series : [ {
				title : {
					show : true,
					offsetCenter : [ 0, "95%" ],
				},
				pointer : {
					color : '#FF0000'
				},
				name : '效率指标',
				radius:[0, '95%'],
				axisLine : { // 坐标轴线
					lineStyle : { // 属性lineStyle控制线条样式
						width : 20
					}
				},
				detail : {
					formatter : '{value}%'
				},
				type : 'gauge',
				data : [ {
					value : 92,
					name : '效率'
				} ]
			} ]
		};

	one_option.series[0].data[0].name = '频率';
	two_option.series[0].data[0].name = '相位';
	three_option.series[0].data[0].name = '效率';
	main_one.setOption(one_option);
	main_two.setOption(two_option);
	main_three.setOption(three_option);
   var intervalTask=setInterval(function () {
       $.ajax({
    	   type:"GET",
    	    async:false,
    	    url:rootPath+"/system/monitor/getMonitorStatus.shtml",
    	    dataType:"json",
    	    success:function(res){
    	    	if(res.success){
    	    		 /**************开始监控了*****************/
    	    		 axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
    	    		 /*************第一个chart*************/
    	    		   var data0 = optionElectricCurrent.series[0].data;
    	    		    data0.shift();
    	    		/*****************************/   
    	    	    /*************第二个chart*************/
    	    		    var data1 = optionVoltage.series[0].data;
    	    		    data1.shift();
    	    		/*****************************/
    	    	    /*************第三个chart*************/
    	    		    var data21 = optionPower.series[0].data;
    	    		    data21.shift();
    	    		    var data22 = optionPower.series[1].data;
    	    		    data22.shift();
    	    		/*****************************/    	    	    
    	    			    $.ajax({
    	    			    	type:"POST",
    	    			    	async : false,
    	    			    	url : rootPath + '/system/monitor/realTimeData.shtml',
    	    			    	data:{type:5},
    	    			    	dataType : 'json',
    	    			    	success:function(res){
    	    			    		data0.push(res.nextElectricCurrent);
    	    			    	    optionElectricCurrent.xAxis[0].data.shift();
    	    			    	    optionElectricCurrent.xAxis[0].data.push(axisData);
    	    			    	    electricCurrentChart.setOption(optionElectricCurrent);
    	    			    		
    	    			    		data1.push(res.nextVoltage);
    	    		    		    optionVoltage.xAxis[0].data.shift();
    	    		    		    optionVoltage.xAxis[0].data.push(axisData);
    	    			    		mainVoltageChart.setOption(optionVoltage);
    	    			    		
    	    			    		data21.push(res.nextHasPower);
    	    			    		data22.push(res.nextNoPower);
    	    			    	    optionPower.xAxis[0].data.shift();
    	    			    	    optionPower.xAxis[0].data.push(axisData);
    	    			    	    mainPowerChart.setOption(optionPower);
    	    			    	    
    	    			    	    
    	    			    		
    	    			    		one_option.series[0].data[0].value =res.freQue;
    	    			    		main_one.setOption(one_option, true);
    	    			    		two_option.series[0].data[0].value =0;//res.totalPower;
    	    			    		main_two.setOption(two_option, true);
    	    			    		three_option.series[0].data[0].value =res.efc;
    	    			    		main_three.setOption(three_option, true);
    	    			    		
    	    			    		$("#td_frequency").html(res.freQue);
    	    			    		$("#td_haspower").html(res.nextHasPower);
    	    			    		$("#td_nopower").html(res.nextNoPower);
    	    			    		$("#td_effective").html(res.efc);
    	    			    		$("#td_voltage").html(res.nextVoltage);
    	    			    		$("#td_current").html(res.nextElectricCurrent);
    	    			    		$("#td_phase").html(res.nextPhase);
    	    			    	}
    	    			    });
    	    		
    	    		/****************************************/
    	    	}
    	    }
       });	
	},2100);
});