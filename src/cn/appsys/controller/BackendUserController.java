package cn.appsys.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.StringUtils;

import cn.appsys.pojo.AppCategory;
import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppValidate;
import cn.appsys.pojo.AppVersion;
import cn.appsys.pojo.BackendUser;
import cn.appsys.pojo.DataDictionary;
import cn.appsys.service.appcategory.AppCategoryService;
import cn.appsys.service.appinfo.AppInfoService;
import cn.appsys.service.appvalidate.AppValidateService;
import cn.appsys.service.appversion.AppVersionService;
import cn.appsys.service.backenduser.BackendUserService;
import cn.appsys.service.datadictionary.DataDictionaryService;
import cn.appsys.tools.Constants;
import cn.appsys.tools.PageBean;

@Controller
@RequestMapping("/backend")
public class BackendUserController {
	@Resource
	private BackendUserService backendUserService;

	@Resource
	private AppInfoService appInfoService;

	@Resource
	private DataDictionaryService dataDictionaryService;

	@Resource
	private AppCategoryService appCategoryService;

	@Resource
	private AppVersionService appVersionService;

	@Resource
	private AppValidateService appValidateService;

	// 登陆页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "backendlogin";
	}

	// 验证登陆
	@RequestMapping(value = "/loginflatform.html", method = RequestMethod.POST)
	public String loginFlatform(@RequestParam() String backendName, @RequestParam String backendPassword,
			HttpSession session, HttpServletRequest request) throws Exception {
		BackendUser backendUser = backendUserService.getBackendUserByName(backendName);
		if (backendUser == null) {
			request.setAttribute("message", "用户不存在！");
			return "backendlogin";
		} else if (backendUser.getUserPassword().equals(backendPassword)) {
			session.setAttribute(Constants.BACKEND_USER_SESSION, backendUser);
			request.setAttribute("message", "");
			return "redirect:/backend/flatform/main";
		} else {
			request.setAttribute("message", "密码不正确！");
			return "backendlogin";
		}
	}

	// 用户主页面
	@RequestMapping(value = "/flatform/main", method = RequestMethod.GET)
	public String flatformMain() {
		return "backendflatformmain";
	}

	// 注销
	@RequestMapping(value = "/flatform/logout", method = RequestMethod.GET)
	public String flatformLogOut(HttpSession session) {
		session.removeAttribute(Constants.BACKEND_USER_SESSION);
		return "backendlogin";
	}

	// 审核
	@RequestMapping(value = "/flatform/app/check", method = RequestMethod.GET)
	public String check(@RequestParam("aid") String aid, @RequestParam("vid") String vid, Model model)
			throws Exception {
		AppInfo appInfo = appInfoService.getAppInfoById(aid);
		AppVersion newAppVersion = appVersionService.getAppVersionById(vid);
		model.addAttribute("appInfo", appInfo);
		model.addAttribute("newAppVersion", newAppVersion);
		return "backendflatformappcheck";
	}

	// 审核保存
	@RequestMapping(value = "/flatform/app/checksave", method = RequestMethod.POST)
	public String checkSave(@RequestParam String id, @RequestParam String status) throws Exception {
		int _status = Integer.parseInt(status);
		appInfoService.op(id, _status);
		return "redirect:/backend/flatform/app/list";
	}

	@RequestMapping(value = "/flatform/app/checkSaveWithNoAdopt", method = RequestMethod.POST)
	public String checkSaveWithNoAdopt(@RequestParam String id, @RequestParam String status,
			@RequestParam String describeText) throws Exception {
		int _status = Integer.parseInt(status);
		appInfoService.op(id, _status);
		AppValidate appValidate = new AppValidate();
		Integer appId = Integer.parseInt(id);
		appValidate.setAppId(appId);
		appValidate.setCreateDate(new Date());
		appValidate.setDescribeText(describeText);
		appValidateService.addAppValidate(appValidate);
		return "redirect:/backend/flatform/app/list";
	}

	// 列表
	@RequestMapping(value = "/flatform/app/list", method = RequestMethod.GET)
	public String list(@RequestParam(value = "querySoftwareName", required = false) String querySoftwareName,
			@RequestParam(value = "queryFlatformId", required = false) String queryFlatformId,
			@RequestParam(value = "queryCategoryLevel1", required = false) String queryCategoryLevel1,
			@RequestParam(value = "queryCategoryLevel2", required = false) String queryCategoryLevel2,
			@RequestParam(value = "queryCategoryLevel3", required = false) String queryCategoryLevel3,
			@RequestParam(value = "pageIndex", required = false) String pageIndex, Model model) throws Exception {
		int pageCur = 0;
		if (!StringUtils.isNullOrEmpty(pageIndex)) {
			pageCur = Integer.parseInt(pageIndex);
		}
		AppInfo appInfo = new AppInfo();
		appInfo.setSoftwareName(querySoftwareName);
		Integer status = 1;
		Integer flatformId = null;
		Integer categoryLevel1 = null;
		Integer categoryLevel2 = null;
		Integer categoryLevel3 = null;
		if (!StringUtils.isNullOrEmpty(queryFlatformId)) {
			flatformId = Integer.parseInt(queryFlatformId);
		}
		if (!StringUtils.isNullOrEmpty(queryCategoryLevel1)) {
			categoryLevel1 = Integer.parseInt(queryCategoryLevel1);
		}
		if (!StringUtils.isNullOrEmpty(queryCategoryLevel2)) {
			categoryLevel2 = Integer.parseInt(queryCategoryLevel2);
		}
		if (!StringUtils.isNullOrEmpty(queryCategoryLevel3)) {
			categoryLevel3 = Integer.parseInt(queryCategoryLevel3);
		}
		appInfo.setStatus(status);
		appInfo.setFlatformId(flatformId);
		appInfo.setCategoryLevel1(categoryLevel1);
		appInfo.setCategoryLevel2(categoryLevel2);
		appInfo.setCategoryLevel3(categoryLevel3);
		int dataTotal = appInfoService.getAppInfoCountByThis(appInfo);
		PageBean pageBean = new PageBean(dataTotal, pageCur, Constants.pageSize);
		List<AppInfo> appInfos = appInfoService.getAppInfosByThis(appInfo, pageBean);
		List<DataDictionary> flatformList = dataDictionaryService.getDataDictionaryList("APP_FLATFORM");
		List<DataDictionary> statusList = dataDictionaryService.getDataDictionaryList("APP_STATUS");
		List<AppCategory> appCategories1 = appCategoryService.getFirstAppCategory();
		List<AppCategory> appCategories2 = null;
		if (queryCategoryLevel2 != null) {
			appCategories2 = appCategoryService.getCategoryLevelListByPId(queryCategoryLevel1);
		}
		List<AppCategory> appCategories3 = null;
		if (queryCategoryLevel3 != null) {
			appCategories3 = appCategoryService.getCategoryLevelListByPId(queryCategoryLevel2);
		}
		model.addAttribute("flatformList", flatformList);
		model.addAttribute("statusList", statusList);
		model.addAttribute("appCategories1", appCategories1);
		model.addAttribute("appCategories2", appCategories2);
		model.addAttribute("appCategories3", appCategories3);
		model.addAttribute("appInfos", appInfos);
		model.addAttribute("querySoftwareName", querySoftwareName);
		model.addAttribute("queryFlatformId", queryFlatformId);
		model.addAttribute("queryCategoryLevel1", queryCategoryLevel1);
		model.addAttribute("queryCategoryLevel2", queryCategoryLevel2);
		model.addAttribute("queryCategoryLevel3", queryCategoryLevel3);
		model.addAttribute("pageBean", pageBean);
		return "backendflatformapplist";
	}

}
