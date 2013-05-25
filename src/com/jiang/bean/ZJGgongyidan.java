package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ZJGgongyidan   implements Serializable {

	private Integer id;
	private String bianhao;
	private String Up_typeNum;
	private String Down_typeNum;
	private String dibuName;
	private BigDecimal num;
	private String gongyi;
	private Date jiaohuo_time;
	private String kahao;
	private String zhenshu;
	private String chejian;
	private String zhuangtai;
	private String beizhu;
	private Date kaidantime;
	private String kaidanren;
	private String jiedanren;
    private String jgtype;

    public String getJgtype() {
        return jgtype;
    }

    public void setJgtype(String jgtype) {
        this.jgtype = jgtype;
    }

    public String getJiedanren() {
		return jiedanren;
	}
	public void setJiedanren(String jiedanren) {
		this.jiedanren = jiedanren;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBianhao() {
		return bianhao;
	}
	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}
	public String getUp_typeNum() {
		return Up_typeNum;
	}
	public void setUp_typeNum(String up_typeNum) {
		Up_typeNum = up_typeNum;
	}
	public String getDown_typeNum() {
		return Down_typeNum;
	}
	public void setDown_typeNum(String down_typeNum) {
		Down_typeNum = down_typeNum;
	}
	public String getDibuName() {
		return dibuName;
	}
	public void setDibuName(String dibuName) {
		this.dibuName = dibuName;
	}
	public BigDecimal getNum() {
		return num;
	}
	public void setNum(BigDecimal num) {
		this.num = num;
	}
	public String getGongyi() {
		return gongyi;
	}
	public void setGongyi(String gongyi) {
		this.gongyi = gongyi;
	}
	public Date getJiaohuo_time() {
		return jiaohuo_time;
	}
	public void setJiaohuo_time(Date jiaohuo_time) {
		this.jiaohuo_time = jiaohuo_time;
	}
	public String getKahao() {
		return kahao;
	}
	public void setKahao(String kahao) {
		this.kahao = kahao;
	}
	public String getZhenshu() {
		return zhenshu;
	}
	public void setZhenshu(String zhenshu) {
		this.zhenshu = zhenshu;
	}

	public String getChejian() {
		return chejian;
	}
	public void setChejian(String chejian) {
		this.chejian = chejian;
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
	public Date getKaidantime() {
		return kaidantime;
	}
	public void setKaidantime(Date kaidantime) {
		this.kaidantime = kaidantime;
	}
	public String getKaidanren() {
		return kaidanren;
	}
	public void setKaidanren(String kaidanren) {
		this.kaidanren = kaidanren;
	}

}
