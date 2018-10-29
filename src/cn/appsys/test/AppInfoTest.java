package cn.appsys.test;

import java.io.File;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.appsys.pojo.AppInfo;
import cn.appsys.service.appinfo.AppInfoService;
import cn.appsys.tools.PageBean;

public class AppInfoTest {
	private ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
	private AppInfoService appInfoService = (AppInfoService) ctx.getBean("appInfoService");

	@Test
	public void count() throws Exception {
		AppInfo appInfo = new AppInfo();
		appInfo.setSoftwareName("");
		System.out.println(appInfoService.getAppInfoCountByThis(appInfo));
	}

	@Test
	public void list() throws Exception {
		AppInfo appInfo = new AppInfo();
		appInfo.setSoftwareName("");
		PageBean pageBean = new PageBean(0, 1, 5);
		List<AppInfo> appInfos = appInfoService.getAppInfosByThis(appInfo, pageBean);
		for (AppInfo appInfo2 : appInfos) {
			System.out.println(appInfo2.getStatusName());
		}
	}

	@Test
	public void getByAPKName() throws Exception {
		System.out.println(appInfoService.getAppInfosByAPKName("com.aaa.test").getLogoPicPath());
	}
}
