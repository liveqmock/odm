package com.jiang.bean;

import java.io.Serializable;

public class User  implements Serializable {

	private Integer id;
	private String userName;
	private String passWord;
	private String quanxian;
	private String realName;
	private String bumen;
	private String ZGpwd;
	private String company;
	
	public String getQuanxian() {
		return quanxian;
	}

	public void setQuanxian(String quanxian) {
		this.quanxian = quanxian;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getBumen() {
		return bumen;
	}

	public void setBumen(String bumen) {
		this.bumen = bumen;
	}

	public String getZGpwd() {
		return ZGpwd;
	}

	public void setZGpwd(String zGpwd) {
		ZGpwd = zGpwd;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}
