package cn.appsys.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppVersion;
import cn.appsys.pojo.DevUser;
import cn.appsys.service.appinfo.AppInfoService;
import cn.appsys.service.appversion.AppVersionService;
import cn.appsys.tools.Constants;

@Controller
@RequestMapping("/dev/flatform/app/version")
public class AppVersionController {
	@Resource
	private AppVersionService appVersionService;

	@Resource
	private AppInfoService appInfoService;

	// 列表
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam String id, Model model) throws Exception {
		List<AppVersion> appVersions = appVersionService.getListByAppId(id);
		AppInfo appInfo = appInfoService.getAppInfoById(id);
		model.addAttribute("appVersions", appVersions);
		model.addAttribute("appInfo", appInfo);
		return "devflatformappversionlist";
	}

	// 修改
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam String id, Model model) throws Exception {
		List<AppVersion> appVersions = appVersionService.getListByAppId(id);
		AppInfo appInfo = appInfoService.getAppInfoById(id);
		AppVersion newAppVersion = appVersionService.getNewAppVersionByAppId(id);
		model.addAttribute("newAppVersion", newAppVersion);
		model.addAttribute("appVersions", appVersions);
		model.addAttribute("appInfo", appInfo);
		return "devflatformappversionmodify";
	}

	// 修改保存
	@RequestMapping(value = "/modifysave", method = RequestMethod.POST)
	public String modifySave(AppVersion appVersion, @RequestParam String APKName,
			@RequestParam(value = "attach", required = false) MultipartFile attach, HttpSession session,
			HttpServletRequest request) throws Exception {
		boolean result = true;
		if (!attach.isEmpty()) {
			int fileSize = 500 * 1024 * 1024;
			String downloadLink = null;
			String apkLocPath = null;
			String apkFileName = null;
			if (attach.getSize() > fileSize) {
				request.setAttribute("message", "文件不能超过500MB！");
				result = false;
			} else {
//				String path = request.getSession().getServletContext().getRealPath(File.separator + "statics/uploadfiles");
				String path = Constants.UPLOAD_PATH;
				// 完整文件名
				String originalFilename = attach.getOriginalFilename();
				// 文件名
//				String caselsh = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				// 后缀带.
				String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));

				String fileName = APKName + "-" + appVersion.getVersionNo() + suffix;

				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					attach.transferTo(targetFile);
				} catch (IllegalStateException | IOException e) {
					request.setAttribute("message", "上传失败！");
					e.printStackTrace();
					result = false;
				}
				apkLocPath = path + File.separator + fileName;
				downloadLink = "/statics/uploadfiles/" + fileName;
				apkFileName = fileName;
			}
			appVersion.setDownloadLink(downloadLink);
			appVersion.setApkLocPath(apkLocPath);
			appVersion.setApkFileName(apkFileName);
		}
		if (result) {
			request.setAttribute("message", "");
			DevUser devUser = (DevUser) session.getAttribute(Constants.DEV_USER_SESSION);
			appVersion.setModifyBy(devUser.getId());
			appVersion.setModifyDate(new Date());
			if (appVersionService.modify(appVersion)) {
				return "redirect:/dev/flatform/app/list";
			}
		}
		return "devflatformappversionlist";
	}

	// 添加保存
	@RequestMapping(value = "/addsave", method = RequestMethod.POST)
	public String addSave(AppVersion appVersion, @RequestParam String APKName, @RequestParam MultipartFile attach,
			HttpSession session, HttpServletRequest request) throws Exception {
		boolean result = true;
		int fileSize = 500 * 1024 * 1024;
		String downloadLink = null;
		String apkLocPath = null;
		String apkFileName = null;
		if (attach.getSize() > fileSize) {
			request.setAttribute("message", "文件不能超过500MB！");
			result = false;
		} else {
//			String path = request.getSession().getServletContext().getRealPath(File.separator + "statics/uploadfiles");
			String path = Constants.UPLOAD_PATH;
			// 完整文件名
			String originalFilename = attach.getOriginalFilename();
			// 文件名
//			String caselsh = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			// 后缀带.
			String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));

			String fileName = APKName + "-" + appVersion.getVersionNo() + suffix;

			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			try {
				attach.transferTo(targetFile);
			} catch (IllegalStateException | IOException e) {
				request.setAttribute("message", "上传失败！");
				e.printStackTrace();
				result = false;
			}
			apkLocPath = path + File.separator + fileName;
			downloadLink = "/statics/uploadfiles/" + fileName;
			apkFileName = fileName;
		}
		appVersion.setDownloadLink(downloadLink);
		appVersion.setApkLocPath(apkLocPath);
		appVersion.setApkFileName(apkFileName);
		if (result) {
			request.setAttribute("message", "");
			DevUser devUser = (DevUser) session.getAttribute(Constants.DEV_USER_SESSION);
			appVersion.setCreatedBy(devUser.getId());
			appVersion.setCreationDate(new Date());
			if (appVersionService.add(appVersion)) {
				return "redirect:/dev/flatform/app/list";
			}
		}
		return "devflatformappversionlist";
	}
}
