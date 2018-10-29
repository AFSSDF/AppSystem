package cn.appsys.dao.devuser;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.DevUser;

public interface DevUserMapper {

	DevUser getDevUserByName(@Param("devName") String devName) throws Exception;

}
