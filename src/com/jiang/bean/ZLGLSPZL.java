package com.jiang.bean;

import java.io.Serializable;

public class ZLGLSPZL  implements Serializable {
	private Integer id;
	private String type_num;
	private String zhonglei;
	private String xilie;
	private String chengfen;
	private Integer weigh;
	private String SP_huawei;
	private String CZ_huawei;
	private String guige;
	private String picture;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType_num() {
		return type_num;
	}
	public void setType_num(String type_num) {
		this.type_num = type_num;
	}
	public String getZhonglei() {
		return zhonglei;
	}
	public void setZhonglei(String zhonglei) {
		this.zhonglei = zhonglei;
	}
	public String getXilie() {
		return xilie;
	}
	public void setXilie(String xilie) {
		this.xilie = xilie;
	}
	public String getChengfen() {
		return chengfen;
	}
	public void setChengfen(String chengfen) {
		this.chengfen = chengfen;
	}
	public Integer getWeigh() {
		return weigh;
	}
	public void setWeigh(Integer weigh) {
		this.weigh = weigh;
	}
	public String getSP_huawei() {
		return SP_huawei;
	}
	public void setSP_huawei(String sP_huawei) {
		SP_huawei = sP_huawei;
	}
	public String getCZ_huawei() {
		return CZ_huawei;
	}
	public void setCZ_huawei(String cZ_huawei) {
		CZ_huawei = cZ_huawei;
	}
	public String getGuige() {
		return guige;
	}
	public void setGuige(String guige) {
		this.guige = guige;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}

}
