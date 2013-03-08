package com.jiang.bean;

import java.io.Serializable;

public class GYSXH   implements Serializable {
	private Integer id;
	private Integer gysid;
	private String xinghao;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGysid() {
		return gysid;
	}
	public void setGysid(Integer gysid) {
		this.gysid = gysid;
	}
	public String getXinghao() {
		return xinghao;
	}
	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}
}
