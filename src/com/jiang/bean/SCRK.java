package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class SCRK   implements Serializable {
	private int id;//序号
	private String gongyidan_id;//采购订单号
	private String bupi_id;//条形码
	private Float price;//单价
	private Float mishu; //米数
	private String gongyingname;//供应商
	private String apply_man;//申请人
	private Date apply_time;//申请时间
	private String queren_man;//申请确认人
	private Date queren_time;//申请确认人
	private String zhijian_or_not;//是否已质检
    private String beizhu;

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getMishu() {
        return mishu;
    }

    public void setMishu(Float mishu) {
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

    public String getZhijian_or_not() {
        return zhijian_or_not;
    }

    public void setZhijian_or_not(String zhijian_or_not) {
        this.zhijian_or_not = zhijian_or_not;
    }
}
