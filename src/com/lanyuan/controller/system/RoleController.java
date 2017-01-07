package com.lanyuan.controller.system;

import java.util.ArrayList;
import java.util.List;



import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.ResRoleFormMap;
import com.lanyuan.entity.RoleFormMap;
import com.lanyuan.entity.UserRoleFormMap;
import com.lanyuan.exception.SystemException;

import com.lanyuan.util.Common;

/**
 * 
 * @author lanyuan 2014-11-19
 * @Email mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/role/")
public class RoleController extends BaseController {
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="角色管理-新增角色")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity(String resId,String txtSelect) throws Exception {
		try {
				RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
				roleFormMap.save();
				pession(roleFormMap.get("id")+"", resId, txtSelect);
			} catch (Exception e) {
				//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
				String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
				throw new SystemException(results);
			}
			return "success";
			
	}
	

	@ResponseBody
	@RequestMapping("editEntity")
	@SystemLog(module="系统管理",methods="角色管理-修改角色")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity(String resId,String txtSelect) throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleFormMap.update();
		pession(roleFormMap.get("id")+"", resId, txtSelect);
		return "success";
	}
	public void pession(String roleId,String resId,String txtUserSelect) throws Exception{
		String[] txt = txtUserSelect.split(",");
		UserRoleFormMap userRoleFormMap = new UserRoleFormMap();
		userRoleFormMap.deleteByAttribute("roleId", roleId);
		if (!Common.isEmpty(txtUserSelect)) {
			List<UserRoleFormMap> ulis = new ArrayList<UserRoleFormMap>();
			for (String userId : txt) {
				userRoleFormMap = new UserRoleFormMap();
				userRoleFormMap.put("userId", userId);
				userRoleFormMap.put("roleId", roleId);
				ulis.add(userRoleFormMap);
			}
			userRoleFormMap.batchSave(ulis);
		}
		new ResRoleFormMap().deleteByAttribute("roleId", roleId);
		if(Common.isNotEmpty(resId)){
			String[] s = Common.trimComma(resId).split(",");
			List<ResRoleFormMap> resUserFormMaps = new ArrayList<ResRoleFormMap>();
			ResRoleFormMap resRoleFormMap = null;
			for (String rid : s) {
				resRoleFormMap = new ResRoleFormMap();
				resRoleFormMap.put("resId", rid);
				resRoleFormMap.put("roleId", roleId);
				resUserFormMaps.add(resRoleFormMap);
			}
			userRoleFormMap.batchSave(resUserFormMaps);
		}	
	}
	@RequestMapping("seletRole")
	public String seletRole(Model model) throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleFormMap.put("mapper_id", "RoleMapper.seletUserRole");
		List<RoleFormMap> list = roleFormMap.findByNames();
		String ugid = "";
		for (RoleFormMap ml : list) {
			ugid += ml.get("id")+",";
		}
		ugid = Common.trimComma(ugid);
		model.addAttribute("txtSelect", ugid);
		model.addAttribute("useSelect", list);
		if(StringUtils.isNotBlank(ugid)){
			String[] g = ugid.split(",");
			String v = "";
			for (String s : g) {
				v+="'"+s+"',";
			}
			roleFormMap.put("where", " id not in ("+Common.trimComma(v)+")");
		}
		roleFormMap.remove("mapper_id");
		List<RoleFormMap> role = roleFormMap.findByWhere();
		model.addAttribute("unSelect", role);
		model.addAttribute("lableName", roleFormMap.get("lableName"));
		return "/common/select_plugin";
	}
}