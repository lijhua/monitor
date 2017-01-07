package com.lanyuan.controller.system;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DataFormMap;
import com.lanyuan.entity.ExcelDataBean;
import com.lanyuan.entity.LogFormMap;
import com.lanyuan.entity.UserLoginFormMap;
import com.lanyuan.plugin.PageView;

import mtime.kits.excel.ExportExcel;
import mtime.kits.excel.bean.XBeanExport;

@Controller
@RequestMapping("/report/data")
public class DataReportController extends BaseController{
	
	private static final SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   
	@RequestMapping("/findByPages")
	@ResponseBody
	public PageView findByPages() throws Exception {
		DataFormMap formMap=findHasHMap(DataFormMap.class);
		PageView pageView = getPageView(formMap);
		List<DataFormMap> list=this.getFormatData(formMap,pageView);
		pageView.setRecords(list);
//		pageView.setRowCount(formMap.fin);
		return pageView;
	}
	
	@RequestMapping("/loginLogs/findByPages")
	@ResponseBody
	public PageView loginLogsFindByPages(){
		UserLoginFormMap logMap=findHasHMap(UserLoginFormMap.class);
		PageView pageView = getPageView(logMap);
		logMap.put("$orderby","order by loginTime desc"); 
		List<UserLoginFormMap> list=logMap.findByPage();
		pageView.setRecords(list);
		return pageView;
	}
	@RequestMapping("/optLogs/findOptLogsByPage")
	@ResponseBody
	public PageView findOptLogsByPage(){
		LogFormMap logMap=findHasHMap(LogFormMap.class);
		PageView pageView = getPageView(logMap);
		logMap.put("$orderby","order by operTime desc");
		List<LogFormMap> list=logMap.findByPage();
		pageView.setRecords(list);
		return pageView;
	}
	
	@RequestMapping("/exportData")
	public void export(HttpServletResponse response) throws Exception{
		DataFormMap formMap=findHasHMap(DataFormMap.class);
		PageView pageView = getPageView(formMap);
		pageView.setPageSize(10000000);
		List<DataFormMap> dataList=this.getFormatData(formMap, pageView);
		List<ExcelDataBean> exportList=new ArrayList<ExcelDataBean>();
		for(int i=0;i<dataList.size();i++){
			ExcelDataBean bean=new ExcelDataBean();
			bean.setType(dataList.get(i).getStr("name"));
			bean.setValue(dataList.get(i).getStr("value1"));
			bean.setCreateTime(dataList.get(i).getStr("createTime"));
			exportList.add(bean);
		}
		XBeanExport xbean = ExportExcel.BeanExport(ExcelDataBean.class);
		xbean.createBeanSheet("监控数据", null,ExcelDataBean.class).addData(exportList);
		xbean.write("监控数据报表-"+System.currentTimeMillis(), response);
	}
	
	private List<DataFormMap> getFormatData(DataFormMap formMap,PageView pageView){
		
		if(null!=formMap.get("type")&&formMap.getInt("type")!=0){
			formMap.put("type", formMap.getInt("type"));
		}else{
			formMap.remove("type");
		}
		if(null!=formMap.get("startDate")){
			formMap.put("startTime", formMap.getStr("startDate"));
		}
		if(null!=formMap.get("endDate")){
			formMap.put("endTime", formMap.getStr("endDate"));
		}
		formMap.put("pageIndex",pageView.getStartPage());
		formMap.put("pageSize", pageView.getPageSize());
		formMap.put("mapper_id", "logDataMapper.findLogDataByParam");
		
		List<DataFormMap> list=formMap.findByNames();
		if(null!=list&&!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				DataFormMap data=list.get(i);
				data.put("createTime", format.format(data.getDate("createTime")));
			}
		}else{
			list=new ArrayList<DataFormMap>();
		}
		return list;
	}
}
