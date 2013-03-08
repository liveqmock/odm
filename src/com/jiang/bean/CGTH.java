package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class CGTH  implements Serializable {
	private int id;
	private String TuiHuo_Id;//退货单号
	private String CaiGou_Id;//采购单号
	private float TuiHuoDanJia;//退货单价
	private String Reason;//退货理由
	private String Apply_Man;//退货申请人
	private Date Apply_Time;//退货申请时间
	private String Queren_Man;//出库确认人
	private Date Queren_Time;//出库确认时间
	private String Zhuangtai;//状态
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTuiHuo_Id() {
		return TuiHuo_Id;
	}
	public void setTuiHuo_Id(String tuiHuo_Id) {
		TuiHuo_Id = tuiHuo_Id;
	}
	public String getCaiGou_Id() {
		return CaiGou_Id;
	}
	public void setCaiGou_Id(String caiGou_Id) {
		CaiGou_Id = caiGou_Id;
	}
	public float getTuiHuoDanJia() {
		return TuiHuoDanJia;
	}
	public void setTuiHuoDanJia(float tuiHuoDanJia) {
		TuiHuoDanJia = tuiHuoDanJia;
	}
	public String getReason() {
		return Reason;
	}
	public void setReason(String reason) {
		Reason = reason;
	}
	public String getApply_Man() {
		return Apply_Man;
	}
	public void setApply_Man(String apply_Man) {
		Apply_Man = apply_Man;
	}
	public Date getApply_Time() {
		return Apply_Time;
	}
	public void setApply_Time(Date apply_Time) {
		Apply_Time = apply_Time;
	}
	public String getQueren_Man() {
		return Queren_Man;
	}
	public void setQueren_Man(String queren_Man) {
		Queren_Man = queren_Man;
	}
	public Date getQueren_Time() {
		return Queren_Time;
	}
	public void setQueren_Time(Date queren_Time) {
		Queren_Time = queren_Time;
	}
	public String getZhuangtai() {
		return Zhuangtai;
	}
	public void setZhuangtai(String zhuangtai) {
		Zhuangtai = zhuangtai;
	}
	
}
