package pers.train.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.train.admin.dao.SecurityRoleMapper;
import pers.train.admin.po.SecurityRole;
import pers.train.admin.service.RoleService;
import pers.train.common.base.service.impl.BaseServiceImpl;



/**
 * 角色service实现类，继承了{@link BaseServiceImpl}基类，
 * 实现了{@link RoleService}接口
 * @author mingshan
 *
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<SecurityRole> implements RoleService {

	@Autowired
	private SecurityRoleMapper securityRoleMapper;

	@Override
	public int deleteBatch(SecurityRole securityRole) {

		return securityRoleMapper.deleteBatch(securityRole);
	}

	@Override
	public List<SecurityRole> selectRoleByToken(String token) {
	
		return securityRoleMapper.selectRoleByToken(token);
	}

	
	
}
