package pers.train.admin.po;

import java.util.List;

/**
 * 文章栏目 实体类
 * @author mingshan
 *
 */
public class ArticleType {

	//自增id
	private int id;
	
	//栏目类型名称
	private String itemType;
	
	//栏目类型标识
	private String itemFlag;
	
	//栏目id对应文章  一对多
	private List<Article> articles;
	
	//批量删除
	private List<Integer> ids;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getItemFlag() {
		return itemFlag;
	}

	public void setItemFlag(String itemFlag) {
		this.itemFlag = itemFlag;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}


	
	
}
