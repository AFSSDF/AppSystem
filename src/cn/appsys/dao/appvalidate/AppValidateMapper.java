package cn.appsys.dao.appvalidate;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppValidate;

public interface AppValidateMapper {

	int insertAppValidate(AppValidate appValidate);

	AppValidate selectNewAppValidateByAppId(@Param("appId") String appId);

}
