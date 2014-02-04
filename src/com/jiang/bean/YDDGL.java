package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class YDDGL   implements Serializable {
	private Integer id;
	private String dingdan_id;
	private String dingdan_name;
	private String pay_way;
	private String fh_address;
	private String fh_way;
	private String finish_or_not;
	private String zongjine;
	private Date kaidan_time;
	private String kaidanren;
	private BigDecimal dingjin;
	private String yewuyuan;
	private String beizhu;
	private String zhuangtai;
    private String order_state;
    private Integer fahuoaddressid;

    public String getOrder_state() {
        return order_state;
    }

    public void setOrder_state(String order_state) {
        this.order_state = order_state;
    }

    public Integer getFahuoaddressid() {
        return fahuoaddressid;
    }

    public void setFahuoaddressid(Integer fahuoaddressid) {
        this.fahuoaddressid = fahuoaddressid;
    }

    public String getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDingdan_id() {
		return dingdan_id;
	}
	public void setDingdan_id(String dingdan_id) {
		this.dingdan_id = dingdan_id;
	}
	public String getDingdan_name() {
		return dingdan_name;
	}
	public void setDingdan_name(String dingdan_name) {
		this.dingdan_name = dingdan_name;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getFh_address() {
		return fh_address;
	}
	public void setFh_address(String fh_address) {
		this.fh_address = fh_address;
	}
	public String getFh_way() {
		return fh_way;
	}
	public void setFh_way(String fh_way) {
		this.fh_way = fh_way;
	}
	public String getFinish_or_not() {
		return finish_or_not;
	}
	public void setFinish_or_not(String finish_or_not) {
		this.finish_or_not = finish_or_not;
	}
	public String getZongjine() {
		return zongjine;
	}
	public void setZongjine(String zongjine) {
		this.zongjine = zongjine;
	}
	public Date getKaidan_time() {
		return kaidan_time;
	}
	public void setKaidan_time(Date kaidan_time) {
		this.kaidan_time = kaidan_time;
	}
	public String getKaidanren() {
		return kaidanren;
	}
	public void setKaidanren(String kaidanren) {
		this.kaidanren = kaidanren;
	}
	public BigDecimal getDingjin() {
		return dingjin;
	}
	public void setDingjin(BigDecimal dingjin) {
		this.dingjin = dingjin;
	}
	public String getYewuyuan() {
		return yewuyuan;
	}
	public void setYewuyuan(String yewuyuan) {
		this.yewuyuan = yewuyuan;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
}
