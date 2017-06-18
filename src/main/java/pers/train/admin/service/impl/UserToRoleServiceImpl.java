package pers.train.admin.service.impl;

import org.springframework.stereotype.Service;

import pers.train.admin.po.SecurityUserToRole;
import pers.train.admin.service.UserToRoleService;
import pers.train.common.base.service.impl.BaseServiceImpl;


/**
 * 用户角色关联,继承了{@link BaseServiceImpl}基类,
 * 实现了{@link UserToRoleService}接口
 * @author mingshan
 *
 */
@Service
public class UserToRoleServiceImpl extends BaseServiceImpl<SecurityUserToRole> implements UserToRoleService {

}
