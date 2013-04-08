package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;

public class ZLGLCPZL   implements Serializable {
	private Integer id;//	int4	否	序号
	private String tiaoxingma;//	nvarchar12	是	货号条形码
	private String pinming;//	nvarchar50	是	成品名称
	private String type_num;//	nvarchar50	是	型号
	private String xilie;//	nvarchar50	是	系列
	private String color;//	nvarchar10	是	色别
	private String danwei;//	nvarchar50	是	单位
	private String xiaxian;//	nvarchar50	是	下限
	private String guige;//	nvarchar100	是	规格
	private String beizhu;//	nvarchar250	是	备注
	private BigDecimal zhengjuanjia;//	numeric9	是	整卷价
	private BigDecimal lingjianjia;//	numeric9	是	零剪价
	private BigDecimal baimijia;//	numeric9	是	300米价
	private BigDecimal pifajia;//	numeric9	是	批发价
	private BigDecimal zidingyijia;//	numeric9	是	自定义价
	private String chengfen;//	nvarchar100	是	成分
	private String weigh;//	nvarchar50	是	克重
	private String SP_huawei;//	nvarchar100	是	水平花位
	private String CZ_huawei;//	nvarchar100	　是	垂直花位
	private String yongtu;//用途
	private String xihushuoming; 
	private String tupian;
	public String getYongtu() {
		return yongtu;
	}
	public void setYongtu(String yongtu) {
		this.yongtu = yongtu;
	}
	public String getXihushuoming() {
		return xihushuoming;
	}
	public void setXihushuoming(String xihushuoming) {
		this.xihushuoming = xihushuoming;
	}
	public String getTupian() {
		return tupian;
	}
	public void setTupian(String tupian) {
		this.tupian = tupian;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTiaoxingma() {
		return tiaoxingma;
	}
	public void setTiaoxingma(String tiaoxingma) {
		this.tiaoxingma = tiaoxingma;
	}
	public String getPinming() {
		return pinming;
	}
	public void setPinming(String pinming) {
		this.pinming = pinming;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public BigDecimal getZhengjuanjia() {
		return zhengjuanjia;
	}
	public void setZhengjuanjia(BigDecimal zhengjuanjia) {
		this.zhengjuanjia = zhengjuanjia;
	}
	public BigDecimal getLingjianjia() {
		return lingjianjia;
	}
	public void setLingjianjia(BigDecimal lingjianjia) {
		this.lingjianjia = lingjianjia;
	}
	public BigDecimal getBaimijia() {
		return baimijia;
	}
	public void setBaimijia(BigDecimal baimijia) {
		this.baimijia = baimijia;
	}
	public BigDecimal getPifajia() {
		return pifajia;
	}
	public void setPifajia(BigDecimal pifajia) {
		this.pifajia = pifajia;
	}
	public BigDecimal getZidingyijia() {
		return zidingyijia;
	}
	public void setZidingyijia(BigDecimal zidingyijia) {
		this.zidingyijia = zidingyijia;
	}
	public String getChengfen() {
		return chengfen;
	}
	public void setChengfen(String chengfen) {
		this.chengfen = chengfen;
	}
	public String getWeigh() {
		return weigh;
	}
	public void setWeigh(String weigh) {
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
	

}
