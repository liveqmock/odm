package com.jiang.bean;

import java.math.BigDecimal;

/**
 * Created by Jonelindy on 14-1-31.
 */
public class DDBupis {
    private int  id;
    private String order_id ;
    private String type_num ;
    private String bupi_id ;
    private BigDecimal mishu ;
    private String beizhu ;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getType_num() {
        return type_num;
    }

    public void setType_num(String type_num) {
        this.type_num = type_num;
    }

    public String getBupi_id() {
        return bupi_id;
    }

    public void setBupi_id(String bupi_id) {
        this.bupi_id = bupi_id;
    }

    public BigDecimal getMishu() {
        return mishu;
    }

    public void setMishu(BigDecimal mishu) {
        this.mishu = mishu;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }
}
