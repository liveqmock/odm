package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class WJGgongyidan   implements Serializable {
	private Integer id;
	private String bianhao;
	private String UP_typeNum;
	private String Down_typeNum;
	private String dibuName;
	private BigDecimal num;
	private String JG_danwei;
	private String gongyi;
	private Date jiaohuo_time;
    private String jgtype;
    private String guige;
	private String zhuangtai;
	private String beizhu;
	private Date kaidantime;
	private String kaidanren;
    private String jiedanren;

    public String getGuige() {
        return guige;
    }

    public void setGuige(String guige) {
        this.guige = guige;
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

    public String getUP_typeNum() {
        return UP_typeNum;
    }

    public void setUP_typeNum(String UP_typeNum) {
        this.UP_typeNum = UP_typeNum;
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

    public String getJG_danwei() {
        return JG_danwei;
    }

    public void setJG_danwei(String JG_danwei) {
        this.JG_danwei = JG_danwei;
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

    public String getJgtype() {
        return jgtype;
    }

    public void setJgtype(String jgtype) {
        this.jgtype = jgtype;
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

    public String getJiedanren() {
        return jiedanren;
    }

    public void setJiedanren(String jiedanren) {
        this.jiedanren = jiedanren;
    }
}
