package com.jiang.bean;

import java.io.Serializable;

public class XTCS  implements Serializable {
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	private String name;
	private String zhonglei;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZhonglei() {
		return zhonglei;
	}
	public void setZhonglei(String zhonglei) {
		this.zhonglei = zhonglei;
	}
	
}
