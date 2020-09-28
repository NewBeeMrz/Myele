package entity;

import java.util.List;
import java.util.Map;

public class Store {
	private Integer s_id;
	private String src;
	private String s_name;
	private String star;
	private String grade;
	private Integer sale;
	private String send;
	private String spend;
	private String tag;
	private String activityA;
	private String activityB;
	private String search_content;
	private List<food> foodList;
	private Integer c_id;
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Integer getSale() {
		return sale;
	}
	public void setSale(Integer sale) {
		this.sale = sale;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public String getSpend() {
		return spend;
	}
	public void setSpend(String spend) {
		this.spend = spend;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getSearch_content() {
		return search_content;
	}
	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}
	public String getActivityA() {
		return activityA;
	}
	public void setActivityA(String activityA) {
		this.activityA = activityA;
	}
	public String getActivityB() {
		return activityB;
	}
	public void setActivityB(String activityB) {
		this.activityB = activityB;
	}
	public List<food> getFoodList() {
		return foodList;
	}
	public void setFoodList(List<food> foodList) {
		this.foodList = foodList;
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}	
	
}
