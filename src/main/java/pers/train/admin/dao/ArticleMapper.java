package pers.train.admin.dao;

import java.util.List;
import java.util.Map;

import pers.train.admin.po.Article;
import pers.train.common.base.dao.BaseMapper;

/**
 * 文章 Mapper
 * 该接口 继承自BaseMapper接口
 * @author mingshan
 *
 */
@SuppressWarnings("rawtypes")
public interface ArticleMapper extends BaseMapper<Article> {
	//模糊查询文章
    List<Article> selectArticleByToken(String name);
	
    //批量删除
  	int deleteBatch(Article article);
  	
	//分页查询，传入的map中 key为 position , pageSize
  	List<Article> selectArticleList(Map map);
  	
  	//根据typeId获取记录量，传入 实体类
  	int selectArticleCount(Article article);
  	
  	//根据typeId查询信息
  	List<Article> selectArticleByTypeId(int typeId);
}
