package pers.train.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.train.admin.po.FriendLink;
import pers.train.admin.service.FriendLinkService;

@Controller
@RequestMapping("/admin/link")
public class FriendLinkController {

	@Autowired
	private FriendLinkService friendLinkService;
	@RequestMapping("/list")
	public String list(ModelMap map){
		List<FriendLink> list = friendLinkService.findAll();
		map.put("list",list);
		return "admin/link/list";
	}
}
