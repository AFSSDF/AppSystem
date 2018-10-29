package cn.appsys.service.appversion;

import java.util.List;

import cn.appsys.pojo.AppVersion;

public interface AppVersionService {

	List<AppVersion> getListByAppId(String appId) throws Exception;

	boolean add(AppVersion appVersion) throws Exception;

	AppVersion getNewAppVersionByAppId(String appId) throws Exception;

	boolean delAPKPath(String id) throws Exception;

	boolean modify(AppVersion appVersion) throws Exception;

	AppVersion getAppVersionById(String id) throws Exception;

}
