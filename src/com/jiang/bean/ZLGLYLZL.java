package com.jiang.bean;


import java.io.Serializable;

public class ZLGLYLZL  implements Serializable {
	private Integer id;// int4 否 序号
	private String type_num;// nvarchar50 否 型号
	private String xilie;// nvarchar50 否 系列
	private String danwei;// numeric9 是 单位
	private String xiaxian;// nvarchar50 是 下限
	private String guige;// nvarchar50 是 规格
	private Integer zhongliang;// 是 重量
	private String chengfen;// int4 否 成份
	private String beizhu;// int4 否 备注
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getZhongliang() {
		return zhongliang;
	}
	public void setZhongliang(Integer zhongliang) {
		this.zhongliang = zhongliang;
	}
	public String getType_num() {
		return type_num;
	}
	public void setType_num(String type_num) {
		this.type_num = type_num;
	}
	public String getXilie() {
		return xilie;
	}
	public void setXilie(String xilie) {
		this.xilie = xilie;
	}
	public String getDanwei() {
		return danwei;
	}
	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}
	public String getXiaxian() {
		return xiaxian;
	}
	public void setXiaxian(String xiaxian) {
		this.xiaxian = xiaxian;
	}
	public String getGuige() {
		return guige;
	}
	public void setGuige(String guige) {
		this.guige = guige;
	}

	public String getChengfen() {
		return chengfen;
	}
	public void setChengfen(String chengfen) {
		this.chengfen = chengfen;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	
	
}
