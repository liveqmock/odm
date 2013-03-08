package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class caiGouZhiLing  implements Serializable {

	private Integer id;
	private String caiGouId;
	private String typeNum;
	private String muDiDanHao;
	private String cGTotalNum;
	private Date jiaoHuoTime;
	private String yGNum;
	private String userName;
	private Date xiaDanTime;
	private String zhuangTai;
	private String beiZhu;
	private String leiXing;
	private Integer gongYingShangId;
	private String gyspinming;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCaiGouId() {
		return caiGouId;
	}

	public void setCaiGouId(String caiGouId) {
		this.caiGouId = caiGouId;
	}

	public String getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(String typeNum) {
		this.typeNum = typeNum;
	}

	public String getMuDiDanHao() {
		return muDiDanHao;
	}

	public void setMuDiDanHao(String muDiDanHao) {
		this.muDiDanHao = muDiDanHao;
	}

	public String getcGTotalNum() {
		return cGTotalNum;
	}

	public void setcGTotalNum(String cGTotalNum) {
		this.cGTotalNum = cGTotalNum;
	}

	public Date getJiaoHuoTime() {
		return jiaoHuoTime;
	}

	public void setJiaoHuoTime(Date jiaoHuoTime) {
		this.jiaoHuoTime = jiaoHuoTime;
	}

	public String getyGNum() {
		return yGNum;
	}

	public void setyGNum(String yGNum) {
		this.yGNum = yGNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getXiaDanTime() {
		return xiaDanTime;
	}

	public void setXiaDanTime(Date xiaDanTime) {
		this.xiaDanTime = xiaDanTime;
	}

	public String getZhuangTai() {
		return zhuangTai;
	}

	public void setZhuangTai(String zhuangTai) {
		this.zhuangTai = zhuangTai;
	}

	public String getBeiZhu() {
		return beiZhu;
	}

	public void setBeiZhu(String beiZhu) {
		this.beiZhu = beiZhu;
	}

	public String getLeiXing() {
		return leiXing;
	}

	public void setLeiXing(String leiXing) {
		this.leiXing = leiXing;
	}

	public Integer getGongYingShangId() {
		return gongYingShangId;
	}

	public void setGongYingShangId(Integer gongYingShangId) {
		this.gongYingShangId = gongYingShangId;
	}

	public String getGyspinming() {
		return gyspinming;
	}

	public void setGyspinming(String gyspinming) {
		this.gyspinming = gyspinming;
	}

}
