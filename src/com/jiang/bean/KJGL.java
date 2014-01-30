package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class KJGL   implements Serializable {
	private Integer id;
	private String kaijian_man;
	private Date kaijian_time;
	private String type_num;
	private String tiaoxingma;
	private BigDecimal yuanmishu;
	private BigDecimal mishu;
	private Integer shunhao_id;
	private String his_Tiaoxingma;
	private String zhijian_reasult;
	public String getZhijian_reasult() {
		return zhijian_reasult;
	}
	public void setZhijian_reasult(String zhijian_reasult) {
		this.zhijian_reasult = zhijian_reasult;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getKaijian_man() {
		return kaijian_man;
	}
	public void setKaijian_man(String kaijian_man) {
		this.kaijian_man = kaijian_man;
	}
	public Date getKaijian_time() {
		return kaijian_time;
	}
	public void setKaijian_time(Date kaijian_time) {
		this.kaijian_time = kaijian_time;
	}
	public String getType_num() {
		return type_num;
	}
	public void setType_num(String type_num) {
		this.type_num = type_num;
	}
	public String getTiaoxingma() {
		return tiaoxingma;
	}
	public void setTiaoxingma(String tiaoxingma) {
		this.tiaoxingma = tiaoxingma;
	}
	public BigDecimal getYuanmishu() {
		return yuanmishu;
	}
	public void setYuanmishu(BigDecimal yuanmishu) {
		this.yuanmishu = yuanmishu;
	}
	public BigDecimal getMishu() {
		return mishu;
	}
	public void setMishu(BigDecimal mishu) {
		this.mishu = mishu;
	}
	public Integer getShunhao_id() {
		return shunhao_id;
	}
	public void setShunhao_id(Integer shunhao_id) {
		this.shunhao_id = shunhao_id;
	}
	public String getHis_Tiaoxingma() {
		return his_Tiaoxingma;
	}
	public void setHis_Tiaoxingma(String his_Tiaoxingma) {
		this.his_Tiaoxingma = his_Tiaoxingma;
	}
	

}
