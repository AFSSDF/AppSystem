package cn.appsys.dao.backenduser;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.BackendUser;

public interface BackendUserMapper {

	BackendUser getBackendUserByName(@Param("backendName") String backendName) throws Exception;
	

}
