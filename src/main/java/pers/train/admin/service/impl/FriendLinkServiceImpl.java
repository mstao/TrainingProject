package pers.train.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.train.admin.dao.FriendLinkMapper;
import pers.train.admin.po.FriendLink;
import pers.train.admin.service.FriendLinkService;
import pers.train.common.base.service.impl.BaseServiceImpl;

/**
 * 友情链接service实现类，继承了{@link BaseServiceImpl}基类，
 * 实现了{@link FriendLinkService}接口
 * 
 * @author mingshan
 *
 */
@Service
public class FriendLinkServiceImpl extends BaseServiceImpl<FriendLink> implements FriendLinkService {

	@Autowired
	private FriendLinkMapper friendLinkMapper;
	
	@Override
	public List<FriendLink> selectByToken(String token) {

		return friendLinkMapper.selectByToken(token);
	}

	@Override
	public int deleteBatch(FriendLink  friendLink) {

		return friendLinkMapper.deleteBatch(friendLink );
	}

 
}
