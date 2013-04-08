package com.jiang.bean;
 
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class CGGLDJGL  implements Serializable {

	private int id;
	private String caigou_id;
	private String type_num;
	private BigDecimal CG_totalnum;
	private Date jiaohuo_time;
	private String userName;
	private Date xiadan_time;
	private String zhuangtai;
	private String beizhu;
	private String leixing;
	private int gongyingshangid;
	private String gongyingname;
	private String gyspinming;
	private String jiedanren;
	public String getGongyingname() {
		return gongyingname;
	}

	public void setGongyingname(String gongyingname) {
		this.gongyingname = gongyingname;
	}

	public String getJiedanren() {
		return jiedanren;
	}

	public void setJiedanren(String jiedanren) {
		this.jiedanren = jiedanren;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCaigou_id() {
		return caigou_id;
	}

	public void setCaigou_id(String caigou_id) {
		this.caigou_id = caigou_id;
	}

	public String getType_num() {
		return type_num;
	}

	public void setType_num(String type_num) {
		this.type_num = type_num;
	}

	public BigDecimal getCG_totalnum() {
		return CG_totalnum;
	}

	public void setCG_totalnum(BigDecimal cG_totalnum) {
		CG_totalnum = cG_totalnum;
	}

	public Date getJiaohuo_time() {
		return jiaohuo_time;
	}

	public void setJiaohuo_time(Date jiaohuo_time) {
		this.jiaohuo_time = jiaohuo_time;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getXiadan_time() {
		return xiadan_time;
	}

	public void setXiadan_time(Date xiadan_time) {
		this.xiadan_time = xiadan_time;
	}

	public String getZhuangtai() {
		return zhuangtai;
	}

	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getLeixing() {
		return leixing;
	}

	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}

	public int getGongyingshangid() {
		return gongyingshangid;
	}

	public void setGongyingshangid(int gongyingshangid) {
		this.gongyingshangid = gongyingshangid;
	}

	public String getGyspinming() {
		return gyspinming;
	}

	public void setGyspinming(String gyspinming) {
		this.gyspinming = gyspinming;
	}

}
