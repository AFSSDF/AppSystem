package cn.appsys.service.appinfo;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mysql.jdbc.StringUtils;

import cn.appsys.dao.appinfo.AppInfoMapper;
import cn.appsys.dao.appversion.AppVersionMapper;
import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppVersion;
import cn.appsys.tools.PageBean;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {
	@Resource
	private AppInfoMapper appInfoMapper;

	@Resource
	private AppVersionMapper appVersionMapper;

	@Override
	public int getAppInfoCountByThis(AppInfo appInfo) throws Exception {
		return appInfoMapper.getAppInfoCountByThis(appInfo);
	}

	@Override
	public List<AppInfo> getAppInfosByThis(AppInfo appInfo, PageBean pageBean) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("appInfo", appInfo);
		map.put("pageCur", (pageBean.getPageCur() - 1) * pageBean.getPageSize());
		map.put("pageSize", pageBean.getPageSize());
		return appInfoMapper.getAppInfosByThis(map);
	}

	@Override
	public boolean add(AppInfo appInfo) throws Exception {
		boolean result = false;
		if (appInfoMapper.add(appInfo) > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public AppInfo getAppInfosByAPKName(String aPKName) throws Exception {
		return appInfoMapper.getAppInfosByAPKName(aPKName);
	}

	@Override
	public AppInfo getAppInfoById(String id) throws Exception {
		return appInfoMapper.getAppInfoById(id);
	}

	@Override
	public boolean modify(AppInfo appInfo) throws Exception {
		boolean result = false;
		if (appInfoMapper.modify(appInfo) > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean delPicPath(String id) throws Exception {
		boolean result = false;
		AppInfo appInfo = appInfoMapper.getAppInfoById(id);
		if (appInfo != null) {
			String logoLocPath = appInfo.getLogoLocPath();
			if (!StringUtils.isNullOrEmpty(logoLocPath)) {
				File file = new File(logoLocPath);
				if (file.exists()) {
					file.delete();
				}
				if (!file.exists()) {
					if (appInfoMapper.delPicPath(id) > 0) {
						result = true;
					}
				}
			}
		}
		return result;
	}

	@Override
	public boolean delById(String id) throws Exception {
		boolean result = false;
		AppInfo appInfo = appInfoMapper.getAppInfoById(id);
		if (appInfo != null) {
			String logoLocPath = appInfo.getLogoLocPath();
			if (!StringUtils.isNullOrEmpty(logoLocPath)) {
				File file = new File(logoLocPath);
				if (file.exists()) {
					file.delete();
				}
			}
		}
		List<AppVersion> appVersions = appVersionMapper.getListByAppId(id);
		for (AppVersion appVersion : appVersions) {
			if (appVersion != null) {
				String apkLocPath = appVersion.getApkLocPath();
				if (!StringUtils.isNullOrEmpty(apkLocPath)) {
					File file = new File(apkLocPath);
					if (file.exists()) {
						file.delete();
					}
				}
			}
		}
		return (appInfoMapper.delById(id) > 0 ? true : false) && (appVersionMapper.delByAppId(id) >= 0 ? true : false);
	}

	@Override
	public boolean op(String id, int status) throws Exception {
		return appInfoMapper.op(id, status) > 0 ? true : false;
	}

}
