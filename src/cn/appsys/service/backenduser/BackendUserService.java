package cn.appsys.service.backenduser;

import cn.appsys.pojo.BackendUser;

public interface BackendUserService {

	BackendUser getBackendUserByName(String backendName) throws Exception;
	
}
