package cn.appsys.service.appversion;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mysql.jdbc.StringUtils;

import cn.appsys.dao.appversion.AppVersionMapper;
import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppVersion;

@Service("appVersionService")
public class AppVersionServiceImpl implements AppVersionService {
	@Resource
	private AppVersionMapper appVersionMapper;

	@Override
	public List<AppVersion> getListByAppId(String appId) throws Exception {
		return appVersionMapper.getListByAppId(appId);
	}

	@Override
	public boolean add(AppVersion appVersion) throws Exception {
		boolean result1 = false;
		boolean result2 = false;
		if (appVersionMapper.getCountByAppId(appVersion.getAppId()) > 0) {
			appVersion.setModifyDate(new Date());
		}
		if (appVersionMapper.add(appVersion) > 0) {
			result1 = true;
		}
		if (appVersionMapper.modifyAppVersionId(appVersion) > 0) {
			result2 = true;
		}
		return result1 && result2;
	}

	@Override
	public AppVersion getNewAppVersionByAppId(String appId) throws Exception {
		return appVersionMapper.getNewAppVersionByAppId(appId);
	}

	@Override
	public boolean delAPKPath(String id) throws Exception {
		boolean result = false;
		AppVersion appVersion = appVersionMapper.getAppVersionById(id);
		if (appVersion != null) {
			String apkLocPath = appVersion.getApkLocPath();
			if (!StringUtils.isNullOrEmpty(apkLocPath)) {
				File file = new File(apkLocPath);
				if (file.exists()) {
					file.delete();
				}
				if (!file.exists()) {
					if (appVersionMapper.delApkLocPath(id) > 0) {
						result = true;
					}
				}
			}
		}
		return result;
	}

	@Override
	public boolean modify(AppVersion appVersion) throws Exception {
		return appVersionMapper.modify(appVersion) > 0 ? true : false;
	}

	@Override
	public AppVersion getAppVersionById(String id) throws Exception {
		return appVersionMapper.getAppVersionById(id);
	}

}
