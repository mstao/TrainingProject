package pers.train.common.base.dao;

import java.util.List;
import java.util.Map;

/**
 * 通用  mapper接口<p>
 * 子类mapper接口可以继承该通用mapper接口，该接口将增删改查的通用方法抽取出来<p>
 * 相同的功能子接口通过继承获取通用的功能，service层通过反射将BaseMapper中的泛型
 * 替代成普通的pojo对象，在service层只需注入对应的子mapper即可
 * 子类mapper应遵循以下规范：<p>
 * <ul>
 *    <li> 子接口必须继承该BaseMapper</li>
 *    <li> 子接口必须以Mapper单词结尾</li>
 *    <li> 子接口禁止重写BaseMapper中有的通用方法 </li>
 *    <li> 子接口可以写自己特有的方法</li>
 * </ul>
 * 
 * @author mingshan
 *
 */
public interface BaseMapper<T> {
	
	//根据主键删除
	int deleteByPrimaryKey(Integer id);

	//插入
	int insert(T model);

	//插入 不会忽略default
	int insertSelective(T model);
    
	//根据主键查询
	T selectByPrimaryKey(Integer id);

	//根据其他唯一字段查询,传入为pojo，便于简化sql
	T selectByUniqueFiled(T t);
	
	//更新
	int updateByPrimaryKeySelective(T model);
	
    //查询全部
	List<T> selectAll();
   
	//查询信息，有分页，传入map，map里面包含  position 和 pageSize
    List<T> findByPage(Map map);
}
