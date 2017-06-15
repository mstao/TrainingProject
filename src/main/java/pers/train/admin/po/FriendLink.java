package pers.train.admin.po;

import java.util.List;

/**
 * 友情链接实体类
 * @author mingshan
 *
 */
public class FriendLink {

	//自增id
	private int id;
	
	//链接名称
	private String linkName;
	
	//链接具体url
	private String linkUrl;

	//批量删除
	private List<Integer> ids;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	
	
	
}
