package cn.appsys.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import cn.appsys.pojo.AppCategory;
import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppVersion;
import cn.appsys.pojo.DataDictionary;
import cn.appsys.pojo.DevUser;
import cn.appsys.service.appcategory.AppCategoryService;
import cn.appsys.service.appinfo.AppInfoService;
import cn.appsys.service.appversion.AppVersionService;
import cn.appsys.service.datadictionary.DataDictionaryService;
import cn.appsys.tools.Constants;
import cn.appsys.tools.PageBean;

/**
 * 
 * @author Li
 *
 */
@Controller
@RequestMapping("/dev/flatform/app")
public class AppInfoController {

	@Resource
	private AppInfoService appInfoService;

	@Resource
	private AppVersionService appVersionService;

	@Resource
	private DataDictionaryService dataDictionaryService;

	@Resource
	private AppCategoryService appCategoryService;

	// 列表
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(@RequestParam(value = "querySoftwareName", required = false) String querySoftwareName,
				@RequestParam(value = "queryStatus", required = false) String queryStatus,
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
			Integer status = null;
			Integer flatformId = null;
			Integer categoryLevel1 = null;
			Integer categoryLevel2 = null;
			Integer categoryLevel3 = null;
			if (!StringUtils.isNullOrEmpty(queryStatus)) {
				status = Integer.parseInt(queryStatus);
			}
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
			List<AppCategory> appCategories2 = appCategoryService.getCategoryLevelListByPId(queryCategoryLevel2);
			List<AppCategory> appCategories3 = appCategoryService.getCategoryLevelListByPId(queryCategoryLevel3);
			model.addAttribute("flatformList", flatformList);
			model.addAttribute("statusList", statusList);
			model.addAttribute("appCategories1", appCategories1);
			model.addAttribute("appCategories2", appCategories2);
			model.addAttribute("appCategories3", appCategories3);
			model.addAttribute("appInfos", appInfos);
			model.addAttribute("querySoftwareName", querySoftwareName);
			model.addAttribute("queryStatus", queryStatus);
			model.addAttribute("queryFlatformId", queryFlatformId);
			model.addAttribute("queryCategoryLevel1", queryCategoryLevel1);
			model.addAttribute("queryCategoryLevel2", queryCategoryLevel2);
			model.addAttribute("queryCategoryLevel3", queryCategoryLevel3);
			model.addAttribute("pageBean", pageBean);
			return "devflatformapplist";
		}
		
	

	// 添加
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(@ModelAttribute AppInfo appInfo) {
		return "devflatformappadd";
	}

	// 添加并保存
	@RequestMapping(value = "/addsave", method = RequestMethod.POST)
	public String addSave(AppInfo appInfo, @RequestParam(value = "attach") MultipartFile attach, HttpSession session,
			HttpServletRequest request) throws Exception {
		String logoPicPath = "";
		String logoLocPath = "";
		boolean result = true;
		int filesSize = 500000;
		if (attach.getSize() > filesSize) {
			request.setAttribute("message", "上传失败，上传大小不得超过 500KB");
			result = false;
		} else {
			String path = request.getSession().getServletContext().getRealPath(File.separator + "statics/uploadfiles");
			String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_Personal.jpg";
			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}

			try {
				attach.transferTo(targetFile);
			} catch (IllegalStateException | IOException e) {
				request.setAttribute("message", "上传失败！");
				e.printStackTrace();
				result = false;
			}
			logoLocPath = path + File.separator + fileName;
			logoPicPath = "/statics/uploadfiles/" + fileName;
		}
		if (result) {
			request.setAttribute("message", "");
			DevUser devUser = (DevUser) session.getAttribute(Constants.DEV_USER_SESSION);
			appInfo.setCreatedBy(devUser.getId());
			appInfo.setDevId(devUser.getId());
			appInfo.setCreationDate(new Date());
			appInfo.setLogoPicPath(logoPicPath);
			appInfo.setLogoLocPath(logoLocPath);
			if (appInfoService.add(appInfo)) {
				return "redirect:/dev/flatform/app/list";
			}
		}
		return "devflatformappadd";
	}

	// apk名字是否存在
	@RequestMapping(value = "/apkexist", method = RequestMethod.GET)
	@ResponseBody
	public Object apkExist(String APKName, Model model) throws Exception {
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		if (appInfoService.getAppInfosByAPKName(APKName) == null) {
			map.put("valid", true);
		} else {
			map.put("valid", false);
		}
		return map;
	}

	// 修改
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(String id, Model model) throws Exception {
		AppInfo appInfo = appInfoService.getAppInfoById(id);
		model.addAttribute("appInfo", appInfo);
		return "devflatformappmodify";
	}

	// 修改并保存
	@RequestMapping(value = "/modifysave", method = RequestMethod.POST)
	public String modifySave(AppInfo appInfo, @RequestParam(value = "attach", required = false) MultipartFile attach,
			HttpSession session, HttpServletRequest request) throws Exception {
		boolean result = true;
		if (!attach.isEmpty()) {
			String logoPicPath = "";
			String logoLocPath = "";
			int filesSize = 500000;
			if (attach.getSize() > filesSize) {
				request.setAttribute("message", "上传失败，上传大小不得超过 500KB");
				result = false;
			} else {
				String path = request.getSession().getServletContext()
						.getRealPath(File.separator + "statics/uploadfiles");
				String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_Personal.jpg";
				File targetFile = new File(path, fileName);
				if (targetFile.exists()) {
					targetFile.mkdirs();
				}

				try {
					attach.transferTo(targetFile);
				} catch (IllegalStateException | IOException e) {
					request.setAttribute("message", "上传失败！");
					e.printStackTrace();
					result = false;
				}
				logoLocPath = path + File.separator + fileName;
				logoPicPath = "/statics/uploadfiles/" + fileName;
			}
			appInfo.setLogoPicPath(logoPicPath);
			appInfo.setLogoLocPath(logoLocPath);
		}
		if (result) {
			request.setAttribute("message", "");
			DevUser devUser = (DevUser) session.getAttribute(Constants.DEV_USER_SESSION);
			appInfo.setModifyBy(devUser.getId());
			appInfo.setModifyDate(new Date());
			if (appInfoService.modify(appInfo)) {
				return "redirect:/dev/flatform/app/list";
			}
		}
		return "devflatformappmodify";
	}

	// 删除文件
	@RequestMapping(value = "/delfile", method = RequestMethod.GET)
	@ResponseBody
	public Object delFile(@RequestParam String id, @RequestParam String flag) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		if (flag.equals("logo")) {
			if (appInfoService.delPicPath(id)) {
				map.put("result", "success");
			} else {
				map.put("result", "failed");
			}
		} else if (flag.equals("apk")) {
			if (appVersionService.delAPKPath(id)) {
				map.put("result", "success");
			} else {
				map.put("result", "failed");
			}
		}
		return map;
	}

	// 查看
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable String id, Model model) throws Exception {
		AppInfo appInfo = appInfoService.getAppInfoById(id);
		List<AppVersion> appVersions = appVersionService.getListByAppId(id);
		model.addAttribute("appVersions", appVersions);
		model.addAttribute("appInfo", appInfo);
		return "devflatformappview";
	}

	// 删除
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String del(@RequestParam String id) throws Exception {
		appInfoService.delById(id);
		return "redirect:/dev/flatform/app/list";
	}
	
	//上架
	@RequestMapping(value="/us",method=RequestMethod.GET)
	public String us(@RequestParam String id) throws Exception {
		appInfoService.op(id,4);
		return "redirect:/dev/flatform/app/list";
	}
	
	//下架
	@RequestMapping(value="/ls",method=RequestMethod.GET)
	public String ls(@RequestParam String id) throws Exception {
		appInfoService.op(id,5);
		return "redirect:/dev/flatform/app/list";
	}
}
