package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class zhiJianReport   implements Serializable {
	private Integer id;
	private String report_id;
	private String laiyuan_id;
	private Integer num;
	private String xinghao;
	private String apply_man;
	private Date apply_time;
	private Integer jindu;
	private Integer Alljindu;
	private String beizhu;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getLaiyuan_id() {
		return laiyuan_id;
	}

	public void setLaiyuan_id(String laiyuan_id) {
		this.laiyuan_id = laiyuan_id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getXinghao() {
		return xinghao;
	}

	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}

	public String getApply_man() {
		return apply_man;
	}

	public void setApply_man(String apply_man) {
		this.apply_man = apply_man;
	}

	public Date getApply_time() {
		return apply_time;
	}

	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
	}

	public Integer getJindu() {
		return jindu;
	}

	public void setJindu(Integer jindu) {
		this.jindu = jindu;
	}

	public Integer getAlljindu() {
		return Alljindu;
	}

	public void setAlljindu(Integer alljindu) {
		Alljindu = alljindu;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

}
