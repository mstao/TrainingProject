package pers.train.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import pers.train.admin.po.ArticleType;
import pers.train.admin.service.ArticleTypeService;

/**
 * 栏目 控制器
 * @author mingshan
 *
 */
@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private ArticleTypeService articleTypeService; 
	
	/**
	 * 栏目列表界面
	 * @return
	 */
	@RequestMapping("/show")
	public String show(ModelMap map) {
		//获取栏目信息
		List<ArticleType> typeList = articleTypeService.findAll();
		map.put("typeList", typeList);
		return "admin/category/show";
	}
	
	/**
	 * 显示添加信息界面
	 * @return
	 */
	@RequestMapping("/showAddCategory")
	public String showAddPage() {
		return "admin/category/add";
	}
	
	/**
	 * 添加栏目
	 * @param articleType
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String saveCategory(ArticleType articleType) {
		int result = articleTypeService.insert(articleType);
		return result + "";
	}
	
	/**
	 * 删除栏目
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteCategory(String ids) {
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
	        
	        ArticleType t = new ArticleType();
	        t.setIds(idList);
	        //执行删除语句
	        articleTypeService.deleteBatch(t);
	        return "1";
		} catch(RuntimeException e) {
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
	public String updateCategory(ArticleType articleType) {
		String r;		
		int result = articleTypeService.update(articleType);		
		if(result > 0) {
			r = "1";
		} else {
			r = "0";
		}
		
		return r;
	}
 	
	/**
	 * 模糊查询
	 * @param token
	 * @param response
	 */
	@RequestMapping("/findCategory")
	public void findCategoryByName(String token, HttpServletResponse response) {
		response.setContentType("application/json");
		PrintWriter out = null;
		//获取权限列表
		List<ArticleType> typeList = (ArrayList<ArticleType>)  articleTypeService.selectByToken(token);
		//调用fastjson生成json信息
		String json = JSON.toJSONString(typeList, true);
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
}
