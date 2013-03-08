package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class BCPKJ_Apply  implements Serializable {

	private Integer id;
	private String kaijian_id;
	private String bupi_id;
	private String type_num;
	private String yuanmishu;
	private String jianchumishu;
	private String apply_man;
	private Date apply_time;
	private String queren_man;
	private Date queren_time;
	private String zhuangtai;
	private String beizhu;
    private String new_bupi_id;
    private String shunhao;

    public String getShunhao() {
        return shunhao;
    }

    public void setShunhao(String shunhao) {
        this.shunhao = shunhao;
    }

    public String getNew_bupi_id() {
        return new_bupi_id;
    }

    public void setNew_bupi_id(String new_bupi_id) {
        this.new_bupi_id = new_bupi_id;
    }

    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKaijian_id() {
		return kaijian_id;
	}

	public void setKaijian_id(String kaijian_id) {
		this.kaijian_id = kaijian_id;
	}

	public String getBupi_id() {
		return bupi_id;
	}

	public void setBupi_id(String bupi_id) {
		this.bupi_id = bupi_id;
	}

	public String getType_num() {
		return type_num;
	}

	public void setType_num(String type_num) {
		this.type_num = type_num;
	}

	public String getYuanmishu() {
		return yuanmishu;
	}

	public void setYuanmishu(String yuanmishu) {
		this.yuanmishu = yuanmishu;
	}

	public String getJianchumishu() {
		return jianchumishu;
	}

	public void setJianchumishu(String jianchumishu) {
		this.jianchumishu = jianchumishu;
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
}
