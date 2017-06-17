package pers.train.home.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.train.admin.po.ArticleType;
import pers.train.admin.service.ArticleTypeService;

/**
 * 主页控制器
 * @author mingshan
 *
 */
@Controller
@RequestMapping("/home")
public class HomeIndexController {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private ArticleTypeService articleTypeService; 
	
	@RequestMapping("/index")
	public String goIndex(ModelMap map) {
		
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		
		//获取简单文章信息
		List<ArticleType> articleList = articleTypeService.selectSimpleArticleListByType();
		
		map.put("typeList", typeList);
		map.put("articleList", articleList);
		return "home/index";
	}
	
}
