package cn.appsys.service.appvalidate;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.dao.appvalidate.AppValidateMapper;
import cn.appsys.pojo.AppValidate;

@Service("appvalidateService")
public class AppValidateServiceImpl implements AppValidateService {
	@Resource
	private AppValidateMapper appvalidateMapper;

	@Override
	public int addAppValidate(AppValidate appValidate) throws Exception {
		return appvalidateMapper.insertAppValidate(appValidate);
	}

	@Override
	public AppValidate getNewAppValidateByAppId(String appId) throws Exception {
		return appvalidateMapper.selectNewAppValidateByAppId(appId);
	}
}
