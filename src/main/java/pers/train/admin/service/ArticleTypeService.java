package pers.train.admin.service;

import java.util.List;

import pers.train.admin.po.ArticleType;
import pers.train.common.base.service.BaseService;
/**
 * 文章类型 service 接口<p>
 * 继承自{@link BaseService}
 * @author mingshan
 *
 */
public interface ArticleTypeService extends BaseService<ArticleType> {
	//模糊查询
    List<ArticleType> selectByToken(String token);
	
    //批量删除
	int deleteBatch(ArticleType articleType); 
	
	//前台首页加载文章信息
	List<ArticleType> selectSimpleArticleListByType(int size);
}
