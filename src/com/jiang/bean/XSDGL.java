package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class XSDGL   implements Serializable {
	private Integer id;
	private String xiaoshoudan_id;
	private String dingdan_id;
	private Integer mingxi_id;
	private String type_num;
	private BigDecimal mishu;
	private String apply_man;
	private Date apply_time;
	private String queren_man;
	private Date queren_time;
	private String fahuo_or_not;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getXiaoshoudan_id() {
		return xiaoshoudan_id;
	}
	public void setXiaoshoudan_id(String xiaoshoudan_id) {
		this.xiaoshoudan_id = xiaoshoudan_id;
	}
	public String getDingdan_id() {
		return dingdan_id;
	}
	public void setDingdan_id(String dingdan_id) {
		this.dingdan_id = dingdan_id;
	}
	public Integer getMingxi_id() {
		return mingxi_id;
	}
	public void setMingxi_id(Integer mingxi_id) {
		this.mingxi_id = mingxi_id;
	}
	public String getType_num() {
		return type_num;
	}
	public void setType_num(String type_num) {
		this.type_num = type_num;
	}
	public BigDecimal getMishu() {
		return mishu;
	}
	public void setMishu(BigDecimal mishu) {
		this.mishu = mishu;
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
	public String getQueren_man() {
		return queren_man;
	}
	public void setQueren_man(String queren_man) {
		this.queren_man = queren_man;
	}
	public Date getQueren_time() {
		return queren_time;
	}
	public void setQueren_time(Date queren_time) {
		this.queren_time = queren_time;
	}
	public String getFahuo_or_not() {
		return fahuo_or_not;
	}
	public void setFahuo_or_not(String fahuo_or_not) {
		this.fahuo_or_not = fahuo_or_not;
	}
}
