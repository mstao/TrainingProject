package pers.train.common.base.service;

import java.util.List;
import java.util.Map;

/**
 * 通用service接口<p>
 * 该通用service接口将通用的方法抽取出来，子service接口通过继承该BaseService接口获取其方法<p>
 * 
 * 子接口必须遵守以下规范
 * <ul>
 *    <li>子service接口必须继承该BaseService</li>
 *    <li>子service接口禁止重写BaseService有的方法</li>
 *    <li>子service接口可以写自己特有的方法</li>
 * <ul>
 * 
 * @author mingshan
 *
 * @param <T>
 */
public interface BaseService<T> {
	
	//通过id查询信息，返回实体类
	T findById(int id);
    
	//查询全部信息，无分页
	List<T> findAll();
	
	//查询信息，有分页，传入map，map里面包含  position 和 pageSize
	List<T> findByPage(Map map);
	
	//插入
	int insert(T model);
	
	//插入 不会忽略default
	int insertSelective(T model);
	
	//根据其他唯一字段查询,传入为pojo，便于简化sql
	T selectByUniqueFiled(T t);
	
	//更新信息
	int update(T model);
	
	//删除信息
	int delete(Integer id);	
}
