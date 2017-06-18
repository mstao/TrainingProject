package pers.train.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import pers.train.admin.po.Article;
import pers.train.admin.po.ArticleType;
import pers.train.admin.po.FriendLink;
import pers.train.admin.service.ArticleService;
import pers.train.admin.service.ArticleTypeService;
import pers.train.admin.service.FriendLinkService;
import pers.train.common.base.service.PageHelperService;
import pers.train.common.config.PageSizeConfig;

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
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private PageHelperService pageHelperService;
	
	@Autowired
	private FriendLinkService friendLinkService;
	
	private int pageSize = PageSizeConfig.HOME_PAGE_SIZE;
	
	@RequestMapping("/index")
	public String goIndex(ModelMap map) {
		
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		
		//获取简单文章信息
		List<ArticleType> articleList = articleTypeService.selectSimpleArticleListByType();
		
		//获取友情链接
		List<FriendLink> link = friendLinkService.findAll();
		
		map.put("link", link);
		map.put("typeList", typeList);
		map.put("articleList", articleList);
		return "home/index";
	}
	
	/**
	 * 获取详细信息
	 * @return
	 */
	@RequestMapping("/details")
	public String details(Integer id,ModelMap map) {
		
		//
		Article article = articleService.findById(id);
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		//获取友情链接
		List<FriendLink> link = friendLinkService.findAll();
		//浏览量+1
		articleService.addViewCount(id);
		
		map.put("link", link);
		map.put("details", article);
		map.put("typeList", typeList);
		return "home/details";
	}
	
	/**
	 * 列表
	 * 
	 * @param p
	 * @param typeId
	 * @param map
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Integer p,String typeId,ModelMap map) {
		Map<String,Object> umap = new HashMap<String,Object>(); 
		
		int isPublish = 1;
		String sp = p + "";
		String url = "";
		Article article = new Article();
	    if(("".equals(sp))) {
			p = 1;
	    }
	    url = "./list?typeId='"+typeId+"'&p=";
	    int iTypeId = Integer.parseInt(typeId);

    	umap.put("typeId", iTypeId);
    	article.setTypeId(iTypeId);
    	article.setIsPublish(isPublish);
    	
    	int count = articleService.selectArticleCount(article);
    	 //计算偏移量
	    int position = (p-1)*pageSize;
	
	    umap.put("position", position);
	    umap.put("pageSize", pageSize);
	    
	    List<Article> list = articleService.selectArticleList(umap);
	    
	    //分页工具
		String toolBar = pageHelperService.createToolBar(count, pageSize, url, p);
    	
		//根据typeId获取栏目信息
		ArticleType type = articleTypeService.findById(iTypeId);
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		//获取友情链接
		List<FriendLink> link = friendLinkService.findAll();
		
		map.put("link", link);
		map.put("toolBar", toolBar);
		map.put("list", list);
		map.put("type", type);
		map.put("typeList", typeList);
		
		return "home/list";
	}
	
}
