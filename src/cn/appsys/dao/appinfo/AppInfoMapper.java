package cn.appsys.dao.appinfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppInfo;

public interface AppInfoMapper {

	int getAppInfoCountByThis(AppInfo appInfo) throws Exception;

	List<AppInfo> getAppInfosByThis(Map<String, Object> map) throws Exception;

	int add(AppInfo appInfo) throws Exception;

	AppInfo getAppInfosByAPKName(@Param("APKName") String APKName);

	AppInfo getAppInfoById(@Param("id") String id) throws Exception;

	int modify(AppInfo appInfo) throws Exception;

	int delPicPath(@Param("id") String id) throws Exception;

	int delById(@Param("id") String id) throws Exception;

	int op(@Param("id") String id, @Param("status") int status) throws Exception;

}
