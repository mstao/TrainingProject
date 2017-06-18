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

import pers.train.admin.po.FriendLink;
import pers.train.admin.service.FriendLinkService;

@Controller
@RequestMapping("/admin/link")
public class FriendLinkController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private FriendLinkService friendLinkService;
	
	/**
	 * 列表界面
	 * @return
	 */
	@RequestMapping("/show")
	public String show(ModelMap map) {
		//获取信息
		List<FriendLink> linkList = friendLinkService.findAll();
		map.put("linkList", linkList);
		return "admin/link/show";
	}
	
	/**
	 * 显示添加信息界面
	 * @return
	 */
	@RequestMapping("/showAddLink")
	public String showAddPage() {
		return "admin/link/add";
	}
	
	/**
	 * 添加
	 * @param friendLink
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String saveLink(FriendLink friendLink) {
		int result = friendLinkService.insert(friendLink);
		return result + "";
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteLink(String ids) {
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
	        
	        FriendLink link = new FriendLink();
	        link.setIds(idList);
	        //执行删除语句
	        friendLinkService.deleteBatch(link);
	        return "1";
		} catch(RuntimeException e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	/**
	 * 更新
	 * @param friendLink
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String updateLink(FriendLink  friendLink) {
		String r;		
		int result =  friendLinkService.update(friendLink);		
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
	@RequestMapping("/findLink")
	public void findLinkByName(String token, HttpServletResponse response) {
		response.setContentType("application/json");
		PrintWriter out = null;
		//获取权限列表
		List<FriendLink> list = (ArrayList<FriendLink>)  friendLinkService.selectByToken(token);
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
}
