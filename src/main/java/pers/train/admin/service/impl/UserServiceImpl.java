package pers.train.admin.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.train.admin.dao.SecurityUserMapper;
import pers.train.admin.po.SecurityPermission;
import pers.train.admin.po.SecurityUser;
import pers.train.admin.service.ArticleService;
import pers.train.admin.service.UserService;
import pers.train.common.base.service.impl.BaseServiceImpl;

/**
 * 用户service,继承了{@link BaseServiceImpl}基类,
 * 实现了{@link UserService}接口
 * @author mingshan
 *
 */
@Service
@SuppressWarnings("rawtypes") 
public class UserServiceImpl extends BaseServiceImpl<SecurityUser> implements UserService {

	@Autowired
 	private SecurityUserMapper securityUserMapper;
	
	@Override
	public Set<String> getRoles(String userName) {

		Set<String>  roles = new HashSet<String>();
		String roleCode = securityUserMapper.selectUserRole(userName);
		roles.add(roleCode);
		return roles;
	}

	@Override
	public Set<String> getPermissions(String userName) {

		Set<String>  permissions = new HashSet<String>();
		SecurityUser user = securityUserMapper.selectUserPersmission(userName);
		if(user!=null){
			
			ArrayList<SecurityPermission> list = (ArrayList<SecurityPermission>) user.getPermission(); 
			
			for(SecurityPermission l :list){
				permissions.add(l.getPermissionName());
			}
		}
		return permissions;
	}

	@Override
	public List<SecurityUser> selectUserByToken(String username) {

		List<SecurityUser> list = securityUserMapper.selectUserByToken(username);
		return list;
	}

	@Override
	public int findUserCount() {

		return securityUserMapper.findUserCount();
	}

	@Override
	public List<SecurityUser> selectUserList(Map map) {

		return securityUserMapper.selectUserList(map);
	}

	@Override
	public int deleteBatch(SecurityUser securityUser) {

		return securityUserMapper.deleteBatch(securityUser);
	}

	@Override
	public List<SecurityUser> selectAllUserByToken(String token) {

		return securityUserMapper.selectAllUserByToken(token);
	}

}
