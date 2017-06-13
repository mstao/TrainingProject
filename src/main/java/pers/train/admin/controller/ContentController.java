package pers.train.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 内容管理控制器
 * @author mingshan
 *
 */
@Controller
@RequestMapping("/admin/content")
public class ContentController {

	/**
	 * 显示撰写页面
	 * @return
	 */
	@RequestMapping("/write")
	public String showWrite(){
		return "admin/content/write";
	}
}
