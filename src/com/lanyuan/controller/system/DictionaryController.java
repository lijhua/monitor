package com.lanyuan.controller.system;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DictionaryFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.util.Common;

/**
 * 
 * @author lanyuan 2014-11-19
 * @Email mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/dictionary")
public class DictionaryController extends BaseController {

	@ResponseBody
	@RequestMapping("/addEntity")
	@SystemLog(module="系统管理",methods="字典管理-新增字典")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		try {
			DictionaryFormMap dictionaryFormMap = getFormMap(DictionaryFormMap.class);
			dictionaryFormMap.save();
			List<DictionaryFormMap> dics = new ArrayList<DictionaryFormMap>();
			String[] childCode = getParaValues("childCode");
			String[] childValue = getParaValues("childValue");
			for (int i = 0; i < childCode.length; i++) {
				DictionaryFormMap formMap = new DictionaryFormMap();
				formMap.put("code", childCode[i]);
				formMap.put("value", childValue[i]);
				formMap.put("parent_code", dictionaryFormMap.get("code"));
				dics.add(formMap);
			}
			dictionaryFormMap.batchSave(dics);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
		return "success";
	}

	@RequestMapping("/editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			DictionaryFormMap dictionaryFormMap = getFormMap(DictionaryFormMap.class);
			dictionaryFormMap=dictionaryFormMap.findbyFrist("id", id);
			model.addAttribute("dictionary",dictionaryFormMap );
			DictionaryFormMap formMap = new DictionaryFormMap();
			formMap.put("parent_code", dictionaryFormMap.get("code"));
			model.addAttribute("dicChild", formMap.findByNames());
		}
		return Common.BACKGROUND_PATH + "/system/dictionary/edit";
	}

	@ResponseBody
	@RequestMapping("/editEntity")
	@SystemLog(module="系统管理",methods="字典管理-修改字典")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		try {
			DictionaryFormMap dictionaryFormMap = getFormMap(DictionaryFormMap.class);
			dictionaryFormMap.update();
			String[] childCode = getParaValues("childCode");
			String[] childValue = getParaValues("childValue");
			List<DictionaryFormMap> dics = new ArrayList<DictionaryFormMap>();
			dictionaryFormMap.deleteByAttribute("parent_code", dictionaryFormMap.get("code")+"");
			for (int i = 0; i < childCode.length; i++) {
				DictionaryFormMap formMap = new DictionaryFormMap();
				formMap.put("code", childCode[i]);
				formMap.put("value", childValue[i]);
				formMap.put("parent_code", dictionaryFormMap.get("code"));
				dics.add(formMap);
			}
			if(dics.size()>0)
				dictionaryFormMap.batchSave(dics);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
		return "success";
	}
}