package pers.train.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.train.admin.dao.ArticleMapper;
import pers.train.admin.po.Article;
import pers.train.admin.po.ArticleType;
import pers.train.admin.service.ArticleService;
import pers.train.common.base.service.impl.BaseServiceImpl;

/**
 * 文章servie实现类 ，继承了{@link BaseServiceImpl}基类，
 * 实现了{@link ArticleService}接口
 * @author mingshan
 *
 */
@Service
@SuppressWarnings("rawtypes") 
public class ArticleServiceImpl  extends BaseServiceImpl<Article> implements ArticleService {

	@Autowired
	private ArticleMapper articleMapper;
	
	@Override
	public List<Article> selectArticleByToken(String name) {
	
		return articleMapper.selectArticleByToken(name);
	}

	@Override
	public int deleteBatch(Article article) {

		return articleMapper.deleteBatch(article);
	}

	@Override
	public List<Article> selectArticleList(Map map) {

		return articleMapper.selectArticleList(map);
	}

	@Override
	public List<Article> selectArticleByTypeId(int typeId) {
		
		return articleMapper.selectArticleByTypeId(typeId);
	}

	@Override
	public int selectArticleCount(Article article) {

		return articleMapper.selectArticleCount(article);
	}



	

}
