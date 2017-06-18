package pers.train.admin.service;

import java.util.List;

import pers.train.admin.po.FriendLink;
import pers.train.common.base.service.BaseService;
/**
 * 友情链接service 接口<p>
 * 继承自{@link BaseService}
 * @author mingshan
 *
 */
public interface FriendLinkService extends BaseService<FriendLink> {

	//模糊查询
    List<FriendLink> selectByToken(String token);
	
    //批量删除
	int deleteBatch(FriendLink  friendLink ); 
}
