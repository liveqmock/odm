package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class YBgongyidan   implements Serializable {

	private Integer id;
	private String yBGongYiId;
	private String yBtype;
	private Integer num;
	private String kHoRyB;
	private String xJType;
	private String tiaoXingMa;
	private String finish;
	private String beiZhu;
	private Date kaiDanTime;
	private String kaiDanRen;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getyBGongYiId() {
		return yBGongYiId;
	}

	public void setyBGongYiId(String yBGongYiId) {
		this.yBGongYiId = yBGongYiId;
	}

	public String getyBtype() {
		return yBtype;
	}

	public void setyBtype(String yBtype) {
		this.yBtype = yBtype;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getkHoRyB() {
		return kHoRyB;
	}

	public void setkHoRyB(String kHoRyB) {
		this.kHoRyB = kHoRyB;
	}

	public String getxJType() {
		return xJType;
	}

	public void setxJType(String xJType) {
		this.xJType = xJType;
	}

	public String getTiaoXingMa() {
		return tiaoXingMa;
	}

	public void setTiaoXingMa(String tiaoXingMa) {
		this.tiaoXingMa = tiaoXingMa;
	}

	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}

	public String getBeiZhu() {
		return beiZhu;
	}

	public void setBeiZhu(String beiZhu) {
		this.beiZhu = beiZhu;
	}

	public Date getKaiDanTime() {
		return kaiDanTime;
	}

	public void setKaiDanTime(Date kaiDanTime) {
		this.kaiDanTime = kaiDanTime;
	}

	public String getKaiDanRen() {
		return kaiDanRen;
	}

	public void setKaiDanRen(String kaiDanRen) {
		this.kaiDanRen = kaiDanRen;
	}

}
