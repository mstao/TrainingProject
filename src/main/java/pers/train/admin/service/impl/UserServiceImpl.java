package pers.train.admin.service.impl;



import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import pers.train.admin.po.SecurityUser;
import pers.train.admin.service.UserService;
import pers.train.common.base.service.impl.BaseServiceImpl;



/**
 * 用户service
 * @author mingshan
 *
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<SecurityUser> implements UserService{

	protected Logger logger = LoggerFactory.getLogger(this.getClass());


}
