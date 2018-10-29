package cn.appsys.service.devuser;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.dao.devuser.DevUserMapper;
import cn.appsys.pojo.DevUser;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {

	@Resource
	private DevUserMapper devUserMapper;

	@Override
	public DevUser getDevUserByName(String devName) throws Exception {
		return devUserMapper.getDevUserByName(devName);
	}

}
