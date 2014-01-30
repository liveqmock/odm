package com.jiang.bean;

import java.io.Serializable;

public class SCRuKu   implements Serializable {
	private Integer id;
	private String gongyidan_id;
	private String bupi_id;
	private String price;
	private String mishu;
	private String gongyingname;
	private String apply_man;
	private String apply_time;
	private String queren_man;
	private String queren_time;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGongyidan_id() {
		return gongyidan_id;
	}

	public void setGongyidan_id(String gongyidan_id) {
		this.gongyidan_id = gongyidan_id;
	}

	public String getBupi_id() {
		return bupi_id;
	}

	public void setBupi_id(String bupi_id) {
		this.bupi_id = bupi_id;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMishu() {
		return mishu;
	}

	public void setMishu(String mishu) {
		this.mishu = mishu;
	}

	public String getGongyingname() {
		return gongyingname;
	}

	public void setGongyingname(String gongyingname) {
		this.gongyingname = gongyingname;
	}

	public String getApply_man() {
		return apply_man;
	}

	public void setApply_man(String apply_man) {
		this.apply_man = apply_man;
	}

	public String getApply_time() {
		return apply_time;
	}

	public void setApply_time(String apply_time) {
		this.apply_time = apply_time;
	}

	public String getQueren_man() {
		return queren_man;
	}

	public void setQueren_man(String queren_man) {
		this.queren_man = queren_man;
	}

	public String getQueren_time() {
		return queren_time;
	}

	public void setQueren_time(String queren_time) {
		this.queren_time = queren_time;
	}

}
