package com.jiang.bean;

import java.io.Serializable;

public class KHGL_FH  implements Serializable {
	private int id;
	private String kehu_id;
    private String fahuofangshi;
    private String lianxiren;
    private String dianhua;
    private String yidongdianhua;
    private String dizhi;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKehu_id() {
        return kehu_id;
    }

    public void setKehu_id(String kehu_id) {
        this.kehu_id = kehu_id;
    }

    public String getFahuofangshi() {
        return fahuofangshi;
    }

    public void setFahuofangshi(String fahuofangshi) {
        this.fahuofangshi = fahuofangshi;
    }

    public String getLianxiren() {
        return lianxiren;
    }

    public void setLianxiren(String lianxiren) {
        this.lianxiren = lianxiren;
    }

    public String getDianhua() {
        return dianhua;
    }

    public void setDianhua(String dianhua) {
        this.dianhua = dianhua;
    }

    public String getYidongdianhua() {
        return yidongdianhua;
    }

    public void setYidongdianhua(String yidongdianhua) {
        this.yidongdianhua = yidongdianhua;
    }

    public String getDizhi() {
        return dizhi;
    }

    public void setDizhi(String dizhi) {
        this.dizhi = dizhi;
    }

}
