package cn.appsys.service.appcategory;

import java.util.List;

import cn.appsys.pojo.AppCategory;

public interface AppCategoryService {

	List<AppCategory> getCategoryLevelListByPId(String pid) throws Exception;

	List<AppCategory> getFirstAppCategory() throws Exception;
}
