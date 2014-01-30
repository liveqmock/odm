package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class FHGL   implements Serializable {
	private Integer id;
	private String XiaoshoudanId;
	private String KuaididanId;
	private String Fahuoren;
	private Date FahuoTime;
	private String Zhuangtai;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getXiaoshoudanId() {
		return XiaoshoudanId;
	}

	public void setXiaoshoudanId(String xiaoshoudanId) {
		XiaoshoudanId = xiaoshoudanId;
	}

	public String getKuaididanId() {
		return KuaididanId;
	}

	public void setKuaididanId(String kuaididanId) {
		KuaididanId = kuaididanId;
	}

	public String getFahuoren() {
		return Fahuoren;
	}

	public void setFahuoren(String fahuoren) {
		Fahuoren = fahuoren;
	}

	public Date getFahuoTime() {
		return FahuoTime;
	}

	public void setFahuoTime(Date fahuoTime) {
		FahuoTime = fahuoTime;
	}

	public String getZhuangtai() {
		return Zhuangtai;
	}

	public void setZhuangtai(String zhuangtai) {
		Zhuangtai = zhuangtai;
	}

}
