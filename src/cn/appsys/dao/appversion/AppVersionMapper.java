package cn.appsys.dao.appversion;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import cn.appsys.pojo.AppVersion;

public interface AppVersionMapper {

	List<AppVersion> getListByAppId(@RequestParam("appId") String appId) throws Exception;

	int add(AppVersion appVersion) throws Exception;

	int modifyAppVersionId(AppVersion appVersion) throws Exception;

	int getCountByAppId(@RequestParam("appId") Integer appId);

	AppVersion getNewAppVersionByAppId(@RequestParam("appId") String appId) throws Exception;

	AppVersion getAppVersionById(@RequestParam("id") String id) throws Exception;

	int delApkLocPath(@RequestParam("id") String id) throws Exception;

	int modify(AppVersion appVersion) throws Exception;

	int delByAppId(@RequestParam("appId") String appId) throws Exception;


}
