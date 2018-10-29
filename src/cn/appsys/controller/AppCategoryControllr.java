package cn.appsys.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.appsys.pojo.AppCategory;
import cn.appsys.service.appcategory.AppCategoryService;

@Controller
@RequestMapping("/appcategory")
public class AppCategoryControllr {
	@Resource
	private AppCategoryService appCategoryService;

	@RequestMapping("/categorylevellist")
	@ResponseBody
	public Object categoryLevelList(@RequestParam String pid) throws Exception {
		List<AppCategory> appCategories = appCategoryService.getCategoryLevelListByPId(pid);
		return appCategories;
	}

	@RequestMapping("/firstcategorylevellist")
	@ResponseBody
	public Object firstCategoryLevelList() throws Exception {
		List<AppCategory> appCategories = appCategoryService.getFirstAppCategory();
		return appCategories;
	}
}
