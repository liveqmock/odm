package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Jonelindy
 * Date: 12/7/12
 * Time: 11:29 PM
 * To change this template use File | Settings | File Templates.
 */
public class RuKuDan   implements Serializable {
    private Integer id;
    private String ruku_id;
    private String inck_man;
    private Date inck_time;
    private String ruku_leixing;
    private String mudidanhao;
    private Float num;
    private String type_num;
    private String zhijian_id;

    public String getRuku_id() {
        return ruku_id;
    }

    public void setRuku_id(String ruku_id) {
        this.ruku_id = ruku_id;
    }

    public String getInck_man() {
        return inck_man;
    }

    public void setInck_man(String inck_man) {
        this.inck_man = inck_man;
    }

    public Date getInck_time() {
        return inck_time;
    }

    public void setInck_time(Date inck_time) {
        this.inck_time = inck_time;
    }

    public String getRuku_leixing() {
        return ruku_leixing;
    }

    public void setRuku_leixing(String ruku_leixing) {
        this.ruku_leixing = ruku_leixing;
    }

    public String getMudidanhao() {
        return mudidanhao;
    }

    public void setMudidanhao(String mudidanhao) {
        this.mudidanhao = mudidanhao;
    }

    public Float getNum() {
        return num;
    }

    public void setNum(Float num) {
        this.num = num;
    }

    public String getType_num() {
        return type_num;
    }

    public void setType_num(String type_num) {
        this.type_num = type_num;
    }

    public String getZhijian_id() {
        return zhijian_id;
    }

    public void setZhijian_id(String zhijian_id) {
        this.zhijian_id = zhijian_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
