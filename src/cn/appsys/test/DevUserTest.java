package cn.appsys.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.appsys.pojo.DevUser;
import cn.appsys.service.devuser.DevUserService;

public class DevUserTest {
	private ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
	private DevUserService devUserService = (DevUserService) ctx.getBean("devUserService");

	@Test
	public void getDevUserByName() {
		try {
			DevUser devUser = devUserService.getDevUserByName("测试账户001");
			System.out.println(devUser.getCreationDate());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
