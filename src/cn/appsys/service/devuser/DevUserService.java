package cn.appsys.service.devuser;

import cn.appsys.pojo.DevUser;

public interface DevUserService {

	DevUser getDevUserByName(String devName) throws Exception;

}
