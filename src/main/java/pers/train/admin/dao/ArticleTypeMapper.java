package pers.train.admin.dao;

import java.util.List;

import pers.train.admin.po.ArticleType;
import pers.train.common.base.dao.BaseMapper;

/**
 * 文章栏目Mapper
 * 该接口 继承自BaseMapper接口
 * @author mingshan
 *
 */
public interface ArticleTypeMapper extends BaseMapper<ArticleType>{
	
	//模糊查询
    List<ArticleType> selectByToken(String token);
	
    //批量删除
	int deleteBatch(ArticleType articleType); 
	
	//前台首页加载文章信息
	List<ArticleType> selectSimpleArticleListByType();
}
