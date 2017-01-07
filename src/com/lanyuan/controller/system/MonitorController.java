package com.lanyuan.controller.system;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.hyperic.sigar.Sigar;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DataFormMap;
import com.lanyuan.entity.ParamFormMap;
import com.lanyuan.entity.ServerInfoFormMap;
import com.lanyuan.util.Common;
import com.lanyuan.util.JavaMail;
import com.lanyuan.util.SystemInfo;

/**
 * 
 * @author lanyuan 2015-11-19
 * @Email: mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/monitor")
public class MonitorController extends BaseController {
	
	private static final SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private static ConcurrentHashMap<String,Integer> lock=new ConcurrentHashMap<String, Integer>();
	
	@RequestMapping("/info")
	public String info(Model model) throws Exception {
		ParamFormMap paramFormMap=getFormMap(ParamFormMap.class);
		Map<String,Object> res=paramFormMap.findById("1");
		model.addAttribute("frequency", res.get("value"));
		res=paramFormMap.findById("2");
		model.addAttribute("haspower", res.get("value"));
		res=paramFormMap.findById("3");
		model.addAttribute("nopower", res.get("value"));
		res=paramFormMap.findById("4");
		model.addAttribute("effective", res.get("value"));
		res=paramFormMap.findById("5");
		model.addAttribute("voltage", res.get("value"));
		res=paramFormMap.findById("6");
		model.addAttribute("current", res.get("value"));
		res=paramFormMap.findById("7");
		model.addAttribute("toEmail", res.get("value"));
		res=paramFormMap.findById("8");
		model.addAttribute("phase", res.get("value"));
		double freq=this.nextDouble(45,55);
		model.addAttribute("d1",freq);
		double efc=this.nextDouble(90,95);
		model.addAttribute("d2",efc);
		double currency=this.nextDouble(1.7,1.9);
		model.addAttribute("d3",currency);
		double voltage=this.nextDouble(22,24);
		model.addAttribute("d4",voltage);
		double hasPower=BigDecimal.valueOf(currency).multiply(BigDecimal.valueOf(voltage)).setScale(2, RoundingMode.HALF_UP).doubleValue();
		model.addAttribute("d5",hasPower);
		model.addAttribute("d6",BigDecimal.valueOf(hasPower).multiply(BigDecimal.valueOf(efc)).divide(BigDecimal.valueOf(100), RoundingMode.HALF_UP).setScale(2, RoundingMode.HALF_UP).doubleValue());
		model.addAttribute("d7", 0);
		lock.put("status", 1);
		return Common.BACKGROUND_PATH + "/system/monitor/info";
	}
	
	@RequestMapping("/monitor")
	public String monitor() throws Exception {
		return Common.BACKGROUND_PATH + "/system/monitor/monitor";
	}
	
	@RequestMapping("/systemInfo")
	public String systemInfo(Model model) throws Exception {
		model.addAttribute("systemInfo", SystemInfo.SystemProperty());
		return Common.BACKGROUND_PATH + "/system/monitor/systemInfo";
	}
	
	@ResponseBody
	@RequestMapping("/usage")
	public ServerInfoFormMap usage(Model model) throws Exception {
		return SystemInfo.usage(new Sigar());
	}
	
	@ResponseBody
	@RequestMapping("/realTimeData")
	public synchronized Map<String, Object> realTimeData(@RequestParam("type")Integer type){
		
		 Map<String, Object> res=new HashMap<String, Object>();
		 List<Double> electricCurrentList=new ArrayList<Double>();
		 List<Double> voltageList=new ArrayList<Double>();
		 List<Double> hasPowerList=new ArrayList<Double>();
		 List<Double> noPowerList=new ArrayList<Double>();
		 DataFormMap daFormMap=getFormMap(DataFormMap.class);
		 try{
			 
			 for(int xx=0;xx<10;xx++){
				 double electricCurrent=this.nextDouble(1.7,1.9);
				 double voltage=this.nextDouble(22, 24);
				 electricCurrentList.add(electricCurrent);
				 voltageList.add(voltage);
				 double value1=new BigDecimal(electricCurrent*voltage).setScale(2, RoundingMode.HALF_UP).doubleValue();
				 if(!this.inRang(value1, 0, 100)){
					 value1=this.nextDouble(0, 100);
				 }
				 double efc=this.nextDouble(0.9,0.95);
				 double value2=new BigDecimal(value1*efc).setScale(2, RoundingMode.HALF_UP).doubleValue();
				 if(!this.inRang(value2, 0, 100)){
					 value2=this.nextDouble(0, 100);
				 }
				 hasPowerList.add(value1);
				 noPowerList.add(value2);
			   }
				 switch (type) {
				 case 1:
					 res.put("json", electricCurrentList);
					 break;
		         case 2:
		        	 res.put("json", voltageList);
					 break;
		         case 3:
		        	 res.put("json", hasPowerList);
					 break;
		         case 4:
		        	 res.put("json", noPowerList);
					 break;	
		         case 5:
		        	 List<DataFormMap> saveMapList=new ArrayList<DataFormMap>();
		        	 double freQue=this.nextDouble(45,55);
		        	 res.put("freQue", freQue);
		        	 DataFormMap d1=new DataFormMap();
					 d1.put("name", "频率");
					 d1.put("value1", freQue);
					 d1.put("type", 1);
					 d1.put("createTime", new Date().toLocaleString());
					 
					 double efc=this.nextDouble(90, 95);
		    		 res.put("efc",efc);
		    		 DataFormMap d2=new DataFormMap();
					 d2.put("name", "效率");
					 d2.put("value1", efc);
					 d2.put("type", 2);
					 d2.put("createTime", new Date().toLocaleString());
					 
		    		 double nextElectricCurrent=this.nextDouble(1.7, 1.9);
		    		 res.put("nextElectricCurrent", nextElectricCurrent);
		    		 DataFormMap d3=new DataFormMap();
					 d3.put("name", "直流电流");
					 d3.put("value1", nextElectricCurrent);
					 d3.put("type", 3);
					 d3.put("createTime", new Date().toLocaleString());
		    		 
		    		 double nextVoltage= this.nextDouble(22,24);
		    		 DataFormMap d4=new DataFormMap();
					 d4.put("name", "直流电压");
					 d4.put("value1", nextVoltage);
					 d4.put("type", 4);
					 d4.put("createTime", new Date().toLocaleString());
		    		 res.put("nextVoltage",nextVoltage);
		    		 
		    		 double nextHasPower=new BigDecimal(nextElectricCurrent*nextVoltage).setScale(2, RoundingMode.HALF_UP).doubleValue();
		    		 if(!this.inRang(nextHasPower, 0, 100)){
		    			 nextHasPower=this.nextDouble(0, 100);
		    		 }
		    		 DataFormMap d5=new DataFormMap();
					 d5.put("name", "输入功率");
					 d5.put("value1", nextHasPower);
					 d5.put("type", 5);
					 d5.put("createTime", new Date().toLocaleString());
		    		 res.put("nextHasPower",nextHasPower);
		    		 
		    		 double percentEfc=BigDecimal.valueOf(efc).divide(BigDecimal.valueOf(100),2, RoundingMode.HALF_UP).setScale(2, RoundingMode.HALF_UP).doubleValue();
		    		 double nextNoPower=new BigDecimal(nextHasPower*percentEfc).setScale(2, RoundingMode.HALF_UP).doubleValue();
		    		 if(!this.inRang(nextNoPower, 0, 100)){
		    			 nextNoPower=this.nextDouble(0, 100);
		    		 }
		    		 DataFormMap d7=new DataFormMap();
		    		 d7.put("name", "输出功率");
		    		 d7.put("value1", nextNoPower);
		    		 d7.put("type", 7);
		    		 d7.put("createTime", new Date().toLocaleString());
		    		 res.put("nextNoPower",nextNoPower);
		    		
					 double nextPhase=this.nextDouble(-90, 90);
					 res.put("nextPhase",0);
					 DataFormMap d6=new DataFormMap();
					 d6.put("name", "相位");
					 d6.put("value1", 0);
					 d6.put("type", 6);
					 d6.put("createTime", new Date().toLocaleString());
					 saveMapList.add(d1);
					 saveMapList.add(d2);
					 saveMapList.add(d3);
					 saveMapList.add(d4);
					 saveMapList.add(d5);
					 saveMapList.add(d7);
					 saveMapList.add(d6);
					 daFormMap.batchSave(saveMapList);
					 this.sendMailProxy(saveMapList);
		    		 break;	
				default:
					break;
				}
		 }catch(Exception e){
			 System.out.println("出错了:"+e.getMessage());
		 }
		 return res; 
	}
	private boolean inRang(double target,double minRang,double maxRang){
		return (target>=minRang&&target<=maxRang);
	}
	private double nextDouble(final double min, final double max){
	        return  BigDecimal.valueOf(min).add(BigDecimal.valueOf((max - min) * new Random().nextDouble())).setScale(2, RoundingMode.HALF_UP).doubleValue();
	 }
	/**
	 * 修改配置　
	 * @param request
	 * @param nodeId
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping("/modifySer")
    @SystemLog(module="系统监控管理",methods="实时监控-警告阈值设置")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
    public Map<String, Object> modifySer(String id,String value) throws Exception{
    	Map<String, Object> dataMap = new HashMap<String,Object>();
    	try {
    		ParamFormMap paramFormMap=getFormMap(ParamFormMap.class);
    		paramFormMap.update();
    		dataMap.put("flag", true);
		} catch (Exception e) {
			dataMap.put("flag", false);
		}
		return dataMap;
    }
    
    @ResponseBody
   	@RequestMapping("/startMonitor")
    @SystemLog(module="系统监控管理",methods="实时监控-开启监控")//凡需要处理业务逻辑的.都需要记录操作日志
    public Map<String, Object> startMonitor(){
    	Map<String, Object> dataMap = new HashMap<String,Object>();
    	lock.put("status", 1);
    	dataMap.put("flag", true);
    	return dataMap;
    }
    
    @ResponseBody
   	@RequestMapping("/closeMonitor")
    @SystemLog(module="系统监控管理",methods="实时监控-关闭监控")//凡需要处理业务逻辑的.都需要记录操作日志
    public Map<String, Object> closeMonitor(){
    	Map<String, Object> dataMap = new HashMap<String,Object>();
    	lock.put("status",0);
    	dataMap.put("flag", true);
    	return dataMap;
    }
    
    @ResponseBody
   	@RequestMapping("/getMonitorStatus")
    public synchronized Map<String, Object> getMonitorStatus(){
    	Map<String, Object> dataMap = new HashMap<String,Object>();
    	int status=lock.get("status");
    	dataMap.put("success", (status==1?true:false));
    	return dataMap;
    }
    
    private void sendMailProxy(List<DataFormMap> dataFormMapList){
    	if(null!=dataFormMapList&&!dataFormMapList.isEmpty()){
    		ExecutorService pool=Executors.newFixedThreadPool(dataFormMapList.size());
    		for(DataFormMap dataFormMap:dataFormMapList){
    			SendMailAction action=new SendMailAction(getFormMap(ParamFormMap.class), getFormMap(ServerInfoFormMap.class), dataFormMap);
    			pool.submit(action);
    		}
    		try{
    			pool.shutdown();
    			pool.awaitTermination(2,TimeUnit.MINUTES);
    		}catch(Exception e){
    		   System.out.println("发送短信失败了:"+e);
    		}
    	}
    }
    
    static class SendMailAction implements Runnable{
    	
    	private Lock lock = new ReentrantLock();
    	private ParamFormMap paramFormMap;
    	private ServerInfoFormMap serverInfoFormMap;
    	private DataFormMap dataFormMap;
    	
    	public SendMailAction(ParamFormMap paramFormMap,ServerInfoFormMap serverInfoFormMap,DataFormMap dataFormMap){
    		 this.paramFormMap=paramFormMap;
    		 this.serverInfoFormMap=serverInfoFormMap;
    		 this.dataFormMap=dataFormMap;
    	}
    	
    	@Override
    	public void run() {
    		lock.lock();
    		DataFormMap teMap=this.dataFormMap;
			Integer type= teMap.getInt("type");
			JavaMail mailUtil=new JavaMail();
			Map<String,Object> mailMsg=paramFormMap.findById("7");
			String receiveUser=mailMsg.get("value").toString();
			try{
				System.out.println("来执行发送类型为:"+type+"的邮件了");
				switch (type) {
				case 1:
					Map<String,Object> res1=paramFormMap.findById("1");
					double freQueThreshold=Double.valueOf(res1.get("value").toString());
					if(teMap.getDouble("value1")>freQueThreshold){
						String body="当前实时频率为"+teMap.getDouble("value1")+"HZ,已超过设置的预警值"+freQueThreshold+"HZ,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"HZ");
						serverInfoFormMap.put("setCpuUsage", freQueThreshold+"HZ");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "频率预警邮件");
						serverInfoFormMap.put("ramUsage", "频率告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("频率预警邮件",body, receiveUser);
					}
					break;
				case 2:
					Map<String,Object> res2=paramFormMap.findById("4");
					double efcThreshold=Double.valueOf(res2.get("value").toString());
					if(teMap.getDouble("value1")<efcThreshold){
						String body="当前实时效率为"+teMap.getDouble("value1")+"%,已低于设置的预警值"+efcThreshold+"%,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"%");
						serverInfoFormMap.put("setCpuUsage", efcThreshold+"%");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "效率预警邮件");
						serverInfoFormMap.put("ramUsage", "效率告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("效率预警邮件",body, receiveUser);
					}
					break;
				case 3:
					Map<String,Object> res3=paramFormMap.findById("5");
					double currencyThreshold=Double.valueOf(res3.get("value").toString());
					if(teMap.getDouble("value1")>currencyThreshold){
						String body="当前实时直流电流为"+teMap.getDouble("value1")+"A,已高于设置的预警值"+currencyThreshold+"A,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"A");
						serverInfoFormMap.put("setCpuUsage", currencyThreshold+"A");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "直流电流预警邮件");
						serverInfoFormMap.put("ramUsage", "直流电流告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("直流电流预警邮件",body, receiveUser);
					}
				case 4:
					Map<String,Object> res4=paramFormMap.findById("5");
					double voltageThreshold=Double.valueOf(res4.get("value").toString());
					if(teMap.getDouble("value1")>voltageThreshold){
						String body="当前实时直流电压为"+teMap.getDouble("value1")+"V,已高于设置的预警值"+voltageThreshold+"V,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"V");
						serverInfoFormMap.put("setCpuUsage", voltageThreshold+"V");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "直流电压预警邮件");
						serverInfoFormMap.put("ramUsage", "直流电压告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("直流电压预警邮件",body, receiveUser);
					}
					break;
				case 5:
					Map<String,Object> hasPower=paramFormMap.findById("2");
					Map<String,Object> noPower=paramFormMap.findById("3");
					double hasPowerThreshold=Double.valueOf(hasPower.get("value").toString());
					double noPowerThreshold=Double.valueOf(noPower.get("value").toString());
					if(teMap.getDouble("value1")>hasPowerThreshold){
						String body="当前实时输入功率为"+teMap.getDouble("value1")+"W,已高于设置的预警值"+hasPowerThreshold+"W,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"W");
						serverInfoFormMap.put("setCpuUsage", hasPowerThreshold+"W");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "输入功率预警邮件");
						serverInfoFormMap.put("ramUsage", "输入功率告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("输入功率预警邮件",body, receiveUser);
					}
					if(teMap.getDouble("value1")>noPowerThreshold){
						String body="当前实时输出功率为"+teMap.getDouble("value1")+"W,已高于设置的预警值"+noPowerThreshold+"W,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"W");
						serverInfoFormMap.put("setCpuUsage", noPowerThreshold+"W");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "输出功率预警邮件");
						serverInfoFormMap.put("ramUsage", "输出功率告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("输出功率预警邮件",body, receiveUser);
					}
					break;
				case 6:
					Map<String,Object> phase=paramFormMap.findById("8");
					double phaseThreshold=Double.valueOf(phase.get("value").toString());
					if(teMap.getDouble("value1")>90){
						String body="当前实时相位为"+teMap.getDouble("value1")+"°,已高于设置的预警值"+phaseThreshold+"°,请检查!";
						serverInfoFormMap.put("cpuUsage", teMap.getDouble("value1")+"°");
						serverInfoFormMap.put("setCpuUsage", phaseThreshold+"°");
						serverInfoFormMap.put("jvmUsage", body);//邮件内容
						serverInfoFormMap.put("setJvmUsage", format.format(new Date()));//发送时间
						serverInfoFormMap.put("email", receiveUser);
						serverInfoFormMap.put("mark", "相位预警邮件");
						serverInfoFormMap.put("ramUsage", "相位告警");
						serverInfoFormMap.save();
						mailUtil.doSendHtmlEmail("相位预警邮件",body, receiveUser);
					}
					break;
				default:
					break;
				}
			}catch(Exception e){
				
			}finally{
				System.out.println("类型为:"+type+"的邮件了发送成功了");
				lock.unlock();
			}
    	}
    }
    
}