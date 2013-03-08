package com.jiang.bean;

import java.io.Serializable;

public class GYS  implements Serializable {
	private int id;//	int4	否	自动编号
	private String gongyingname;//	nvarchar50	是	供应商名称
	private String suoxie;//	nvarchar50	是	缩写
	private String leixing;//	nvarchar50	是	类型
	private String telephone;//	nvarchar50	是	联系电话
	private String seller;//	nvarchar50	是	联系人
	private String phone;//	nvarchar50	是	移动电话
	private String chuanzhen;//	nvarchar50	是	传真
	private String email;//	nvarchar50	是	E_mail
	private String address;//	nvarchar100	是	地址
	private String kpmc1;//	nvarchar50	是	开票名称1
	private String shuihao1;//	nvarchar50	是	税号1
	private String khhzh1;//	nvarchar50	是	开户行帐号1
	private String kpaddress1;//	nvarchar100	是	开票地址1
	private String dianhua1;//	nvarchar50	是	电话1
	private String kpmc2;//	nvarchar50	是	开票名称2
	private String shuihao2;//	nvarchar50	是	税号2
	private String khhzh2;//	nvarchar50	是	开户行帐号2
	private String kpaddress2;//	nvarchar100	是	开票地址2
	private String dianhua2;//	nvarchar50	是	电话2
	private String shoukuanren1;//	nvarchar50	是	收款人1
	private String kaihuhang1;//	nvarchar50	是	开户行1
	private String zhanghao1;//	nvarchar50	是	账号1
	private String shoukuanren2;//	nvarchar50	是	收款人2
	private String kaihuhang2;//	nvarchar50	是	开户行2
	private String zhanghao2;//	nvarchar50	是	账号2
	private String beizhu;//	nvarchar100	　是	备注
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getGongyingname() {
		return gongyingname;
	}
	public void setGongyingname(String gongyingname) {
		this.gongyingname = gongyingname;
	}
	public String getSuoxie() {
		return suoxie;
	}
	public void setSuoxie(String suoxie) {
		this.suoxie = suoxie;
	}
	public String getLeixing() {
		return leixing;
	}
	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getChuanzhen() {
		return chuanzhen;
	}
	public void setChuanzhen(String chuanzhen) {
		this.chuanzhen = chuanzhen;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getKpmc1() {
		return kpmc1;
	}
	public void setKpmc1(String kpmc1) {
		this.kpmc1 = kpmc1;
	}
	public String getShuihao1() {
		return shuihao1;
	}
	public void setShuihao1(String shuihao1) {
		this.shuihao1 = shuihao1;
	}
	public String getKhhzh1() {
		return khhzh1;
	}
	public void setKhhzh1(String khhzh1) {
		this.khhzh1 = khhzh1;
	}
	public String getKpaddress1() {
		return kpaddress1;
	}
	public void setKpaddress1(String kpaddress1) {
		this.kpaddress1 = kpaddress1;
	}
	public String getDianhua1() {
		return dianhua1;
	}
	public void setDianhua1(String dianhua1) {
		this.dianhua1 = dianhua1;
	}
	public String getKpmc2() {
		return kpmc2;
	}
	public void setKpmc2(String kpmc2) {
		this.kpmc2 = kpmc2;
	}
	public String getShuihao2() {
		return shuihao2;
	}
	public void setShuihao2(String shuihao2) {
		this.shuihao2 = shuihao2;
	}
	public String getKhhzh2() {
		return khhzh2;
	}
	public void setKhhzh2(String khhzh2) {
		this.khhzh2 = khhzh2;
	}
	public String getKpaddress2() {
		return kpaddress2;
	}
	public void setKpaddress2(String kpaddress2) {
		this.kpaddress2 = kpaddress2;
	}
	public String getDianhua2() {
		return dianhua2;
	}
	public void setDianhua2(String dianhua2) {
		this.dianhua2 = dianhua2;
	}
	public String getShoukuanren1() {
		return shoukuanren1;
	}
	public void setShoukuanren1(String shoukuanren1) {
		this.shoukuanren1 = shoukuanren1;
	}
	public String getKaihuhang1() {
		return kaihuhang1;
	}
	public void setKaihuhang1(String kaihuhang1) {
		this.kaihuhang1 = kaihuhang1;
	}
	public String getZhanghao1() {
		return zhanghao1;
	}
	public void setZhanghao1(String zhanghao1) {
		this.zhanghao1 = zhanghao1;
	}
	public String getShoukuanren2() {
		return shoukuanren2;
	}
	public void setShoukuanren2(String shoukuanren2) {
		this.shoukuanren2 = shoukuanren2;
	}
	public String getKaihuhang2() {
		return kaihuhang2;
	}
	public void setKaihuhang2(String kaihuhang2) {
		this.kaihuhang2 = kaihuhang2;
	}
	public String getZhanghao2() {
		return zhanghao2;
	}
	public void setZhanghao2(String zhanghao2) {
		this.zhanghao2 = zhanghao2;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	
	

}
