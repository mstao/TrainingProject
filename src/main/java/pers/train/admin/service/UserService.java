package pers.train.admin.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import pers.train.admin.po.SecurityUser;
import pers.train.common.base.service.BaseService;

/**
 * 用户service 接口<p>
 * 继承自{@link BaseService}
 * @author mingshan
 *
 */
@SuppressWarnings("rawtypes")
public interface UserService extends BaseService<SecurityUser>{

	/**根据userName获取角色**/
	Set<String> getRoles(String userName);
	
	/**获取权限**/
	Set<String> getPermissions(String userName);
	
	/**模糊查询用户**/
	List<SecurityUser> selectUserByToken(String username);
	
	/**查询所有用户 -数量**/
    int findUserCount();
    
    /**查询所有用户 -分页**/
  	List<SecurityUser> selectUserList(Map map);
  	
    /**批量删除**/
  	int deleteBatch(SecurityUser securityUser);
  	
    /**模糊查询所有用户**/
  	List<SecurityUser> selectAllUserByToken(String token);
  	
}
