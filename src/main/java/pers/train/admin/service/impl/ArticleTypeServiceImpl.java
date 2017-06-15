package pers.train.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import pers.train.admin.dao.ArticleTypeMapper;
import pers.train.admin.po.ArticleType;
import pers.train.admin.service.ArticleTypeService;
import pers.train.common.base.service.impl.BaseServiceImpl;

/**
 * 文章类型 service 实现类，继承了{@link BaseServiceImpl}基类，
 * 实现了{@link ArticleTypeService}接口
 * @author mingshan
 *
 */
public class ArticleTypeServiceImpl extends BaseServiceImpl<ArticleType> implements ArticleTypeService {

	@Autowired
	private ArticleTypeMapper articleTypeMapper;
	
	@Override
	public List<ArticleType> selectByToken(String token) {
		
		return articleTypeMapper.selectByToken(token);
	}

	@Override
	public int deleteBatch(ArticleType articleType) {
	
		return articleTypeMapper.deleteBatch(articleType);
	}



}
