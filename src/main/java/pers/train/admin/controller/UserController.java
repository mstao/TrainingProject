package pers.train.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.train.admin.po.SecurityUser;
import pers.train.admin.service.UserService;

/**
 * 用户控制器
 * @author mingshan
 *
 */
@Controller
@RequestMapping("/main")
public class UserController {
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private  UserService userService;
	
	
	@RequestMapping("/index")
	public String index(ModelMap map){
		
		List<SecurityUser> list = userService.findAll();
		
		map.put("list", list);
		
		return "list";
	}
}
