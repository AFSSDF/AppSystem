package cn.appsys.service.appinfo;

import java.util.List;

import cn.appsys.pojo.AppInfo;
import cn.appsys.tools.PageBean;

/**
 * 
 * @author Li
 *
 */
public interface AppInfoService {

	int getAppInfoCountByThis(AppInfo appInfo) throws Exception;

	List<AppInfo> getAppInfosByThis(AppInfo appInfo, PageBean pageBean) throws Exception;

	boolean add(AppInfo appInfo) throws Exception;

	AppInfo getAppInfosByAPKName(String aPKName) throws Exception;

	AppInfo getAppInfoById(String id) throws Exception;

	boolean modify(AppInfo appInfo) throws Exception;

	boolean delPicPath(String id) throws Exception;

	boolean delById(String id) throws Exception;

	boolean op(String id, int status) throws Exception;

}
