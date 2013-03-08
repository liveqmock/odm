package com.jiang.bean;


import java.io.Serializable;

public class ZLGLBCPZL  implements Serializable {
	private Integer id;// int4 否 序号
	private String type_num;// nvarchar50 否 型号
	private String xilie;// nvarchar50 否 系列
	private String danwei;// numeric9 是 单位
	private String xiaxian;// nvarchar50 是 下限
	private String guige;// nvarchar50 是 规格
	private String color;// 是 色别
    private String zhenshu;// int4 否 成份
    private String kahao;// int4 否 成份
	private String beizhu;// int4 否 备注

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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

    public String getZhenshu() {
        return zhenshu;
    }

    public void setZhenshu(String zhenshu) {
        this.zhenshu = zhenshu;
    }

    public String getKahao() {
        return kahao;
    }

    public void setKahao(String kahao) {
        this.kahao = kahao;
    }

    public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	
	
}
