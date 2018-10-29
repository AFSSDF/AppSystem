package cn.appsys.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.appsys.pojo.DevUser;
import cn.appsys.service.devuser.DevUserService;
import cn.appsys.tools.Constants;

/**
 * 
 * @author Li
 *
 */
@Controller
@RequestMapping("/dev")
public class DevUserController {

	@Resource
	private DevUserService devUserService;

	// 登陆页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "devlogin";
	}

	// 验证登陆
	@RequestMapping(value = "/loginflatform.html", method = RequestMethod.POST)
	public String loginFlatform(@RequestParam() String devName, @RequestParam String devPassword, HttpSession session,
			HttpServletRequest request) throws Exception {
		DevUser devUser = devUserService.getDevUserByName(devName);
		if (devUser == null) {
			request.setAttribute("message", "用户不存在！");
			return "devlogin";
		} else if (devUser.getDevPassword().equals(devPassword)) {
			session.setAttribute(Constants.DEV_USER_SESSION, devUser);
			request.setAttribute("message", "");
			return "redirect:/dev/flatform/main";
		} else {
			request.setAttribute("message", "密码不正确！");
			return "devlogin";
		}
	}

	// 用户主页面
	@RequestMapping(value = "/flatform/main", method = RequestMethod.GET)
	public String flatformMain() {
		return "devflatformmain";
	}

	// 注销
	@RequestMapping(value = "/flatform/logout", method = RequestMethod.GET)
	public String flatformLogOut(HttpSession session) {
		session.removeAttribute(Constants.DEV_USER_SESSION);
		return "devlogin";
	}

}
