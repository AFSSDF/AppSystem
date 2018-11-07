package cn.appsys.service.appvalidate;

import cn.appsys.pojo.AppValidate;

public interface AppValidateService {

	int addAppValidate(AppValidate appValidate) throws Exception;

	AppValidate getNewAppValidateByAppId(String appId) throws Exception;

}
