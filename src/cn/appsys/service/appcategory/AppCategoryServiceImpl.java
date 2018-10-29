package cn.appsys.service.appcategory;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.dao.appcategory.AppCategoryMapper;
import cn.appsys.pojo.AppCategory;

/**
 * 
 * @author Li
 *
 */
@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

	@Resource
	private AppCategoryMapper appCategoryMapper;

	@Override
	public List<AppCategory> getCategoryLevelListByPId(String pid) throws Exception {
		return appCategoryMapper.getCategoryLevelListByPId(pid);
	}

	@Override
	public List<AppCategory> getFirstAppCategory() throws Exception {
		return appCategoryMapper.getFirstAppCategory();
	}

}
