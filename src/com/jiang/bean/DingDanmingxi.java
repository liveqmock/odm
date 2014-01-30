package com.jiang.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Jonelindy
 * Date: 1/2/13
 * Time: 4:57 PM
 * To change this template use File | Settings | File Templates.
 */
public class DingDanmingxi   implements Serializable {
    private int  id;
    private String dingdan_id ;
    private String type_num ;
    private String color ;
    private BigDecimal num ;
    private BigDecimal danjia ;
    private BigDecimal jine ;
    private Date fahuo_time ;
    private String finish_or_not ;
    private Date jiaohuo_time ;
    private String jiageleixing ;
    private Date liuhuo_time ;
    private String beizhu ;
    private String guige ;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDingdan_id() {
        return dingdan_id;
    }

    public void setDingdan_id(String dingdan_id) {
        this.dingdan_id = dingdan_id;
    }

    public String getType_num() {
        return type_num;
    }

    public void setType_num(String type_num) {
        this.type_num = type_num;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public BigDecimal getNum() {
        return num;
    }

    public void setNum(BigDecimal num) {
        this.num = num;
    }

    public BigDecimal getDanjia() {
        return danjia;
    }

    public void setDanjia(BigDecimal danjia) {
        this.danjia = danjia;
    }

    public BigDecimal getJine() {
        return jine;
    }

    public void setJine(BigDecimal jine) {
        this.jine = jine;
    }

    public Date getFahuo_time() {
        return fahuo_time;
    }

    public void setFahuo_time(Date fahuo_time) {
        this.fahuo_time = fahuo_time;
    }

    public String getFinish_or_not() {
        return finish_or_not;
    }

    public void setFinish_or_not(String finish_or_not) {
        this.finish_or_not = finish_or_not;
    }

    public Date getJiaohuo_time() {
        return jiaohuo_time;
    }

    public void setJiaohuo_time(Date jiaohuo_time) {
        this.jiaohuo_time = jiaohuo_time;
    }

    public String getJiageleixing() {
        return jiageleixing;
    }

    public void setJiageleixing(String jiageleixing) {
        this.jiageleixing = jiageleixing;
    }

    public Date getLiuhuo_time() {
        return liuhuo_time;
    }

    public void setLiuhuo_time(Date liuhuo_time) {
        this.liuhuo_time = liuhuo_time;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String getGuige() {
        return guige;
    }

    public void setGuige(String guige) {
        this.guige = guige;
    }
}
