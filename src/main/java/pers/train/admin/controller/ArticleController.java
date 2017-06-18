package pers.train.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import pers.train.admin.po.Article;
import pers.train.admin.po.ArticleType;
import pers.train.admin.service.ArticleService;
import pers.train.admin.service.ArticleTypeService;
import pers.train.common.base.service.PageHelperService;
import pers.train.common.config.PageSizeConfig;

/**
 * 内容管理控制器
 * @author mingshan
 *
 */
@Controller
@RequestMapping("/admin/article")
public class ArticleController {
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private ArticleTypeService articleTypeService; 
	
	@Autowired
	private ArticleService articleService;

	@Autowired
	private PageHelperService pageHelperService;
	
	private int pageSize = PageSizeConfig.ADMIN_PAGE_SIZE;
	
	
	/**
	 * 显示撰写页面
	 * @return
	 */
	@RequestMapping("/write")
	public String showWrite(ModelMap map) {
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		map.put("typeList", typeList);
		return "admin/content/write";
	}
	
	/**
	 * 显示列表
	 * @param p
	 * @param typeId
	 * @param map
	 * @return
	 */
	@RequestMapping("/list")
	public String showList(Integer p,@RequestParam(value = "typeId", required = false) String typeId,ModelMap map) {
		
		String sp = p + "";
		String url = "";
	    HashMap<String,Object> uMap = new HashMap<String,Object>();
		Article article = new Article();
	    if(("".equals(sp))) {
			p = 1;
	    }
	   	    
	    if(typeId == null) {
	    	url = "./list?p=";
	    } else {
	    	int iTypeId = Integer.parseInt(typeId);
	    	url = "./list?typeId='"+typeId+"'&p=";
	    	uMap.put("typeId", iTypeId);
	    	article.setTypeId(iTypeId);
	    }
	    
	    //获取总记录量
	    int count = articleService.selectArticleCount(article);
	    System.out.println("总记录量="+count);

	    //计算偏移量
	    int position = (p-1)*pageSize;
	
	    uMap.put("position", position);
	    uMap.put("pageSize", pageSize);
	    
	    List<Article> list = articleService.selectArticleList(uMap);
	    
	    //分页工具
		String toolBar = pageHelperService.createToolBar(count, pageSize, url, p);
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		
		map.put("typeList", typeList);
		map.put("toolBar", toolBar);
		map.put("list", list);
		
		return "admin/content/list";
	}
	
	/**
	 * 添加 文章
	 * @param article
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String saveArticle(Article article) {
		int result = articleService.insert(article);
		return result + "";
	}
	
	/**
	 * 删除  批量与单项皆可
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteArticle(String ids) {
		try{
		    //将字符串转为字符串数组
	        String[] idArray = ids.split(","); 
	        //将字符串数组转为整形数组
	        Integer[] iid = new Integer[idArray.length];
	        for(int i = 0;i < iid.length; i++){
	        	iid[i] = Integer.parseInt(idArray[i]);
	        }
	        //将数组转为list
	        List<Integer> idList = new ArrayList<Integer>();	
	        Collections.addAll(idList, iid);
	        
	        Article t = new Article();
	        t.setIds(idList);
	        //执行删除语句
	        articleService.deleteBatch(t);
	        return "1";
		} catch(RuntimeException e){
			e.printStackTrace();
			return "0";
		}
	}
	
	
	/**
	 * 更新
	 * @param articleType
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String updateArticle(Article article) {
		String r;		
		int result = articleService.update(article);		
		if(result > 0) {
			r = "1";
		} else{
			r = "0";
		}
		
		return r;
	}
 	
	/**
	 * 模糊查询
	 * @param token
	 * @param response
	 */
	@RequestMapping("/findArticle")
	public void findArticleByName(String token, HttpServletResponse response) {
		response.setContentType("application/json");
		PrintWriter out = null;
		//获取权限列表
		List<Article> list = (ArrayList<Article>)  articleService.selectArticleByToken(token);
		//调用fastjson生成json信息
		String json = JSON.toJSONString(list, true);
		logger.info("findCategory 方法生成的json信息为:"+json);
		try {
			out = response.getWriter();
			out.write(json);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}
	
	/**
	 * 显示更新文章界面
	 * @return
	 */
	@RequestMapping("/showUpdate")
	public String showUpdate(Integer id,ModelMap map) {
		//根据i的获取文章信息
		Article articles = articleService.findById(id);
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		map.put("typeList", typeList);
		map.put("articles", articles);
		return "admin/content/update";
	}
	
	
}
