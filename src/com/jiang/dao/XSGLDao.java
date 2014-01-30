package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.bean.*;


public interface XSGLDao {

	public int getYDDGLCount(Map<String, Object> map);

	public List queryYDDGLBypage(int page, int rp, Map<String, Object> map);

	public boolean deleteYDDGLById(List list);

	int getXSDGLCount(Map<String, Object> map);

	public List<FHGL> queryXSDGLBypage(int page, int rp, Map<String, Object> map);

	public boolean deleteXSDGLById(List list);

	public int getKHGLCount(Map<String, Object> map);

	public List queryKHGLBypage(int page, int rp, Map<String, Object> map);

	public boolean deleteKHGLById(List list);

	public boolean checkKHGLUniqueness(KHGL yl);

	public void insertKHGL(KHGL yl);

	public KHGL getKHGLById(Integer valueOf);

	public void updateKHGL(KHGL yl);


    public int getKHGL_FHCount(Map<String,Object> map);

    public List queryKHGL_FHBypage(int page, int rp, Map<String,Object> map);

    public void deleteKHGLFHById(List<String> strings);

    public void insertKHGLFH(KHGL_FH yl);

    public KHGL_FH getKHGLFHById(Integer integer);

    public void updateKHGLFH(KHGL_FH yl);

    public List getAllKHGL();
    public boolean isExistKehuId(String kehu_id);


    /**
     * 获取所以的客户信息
     * @return
     */
    public List<KHGL> findAllKHGL();

    /**
     * 通过客户ID（精确查询） 和 客户名字（模糊查询） 查询客户信息 ，如果查出多条默认显示第一条。
     * @param map
     * @return
     */
    public KHGL findXSGLBykehu_idAndKeHuname(Map<String, Object> map);

    int getXSGLDingDanmingxiCount(Map<String,Object> map);

    List findXSGLDingDanmingxi(int page, int rp, Map<String,Object> map);

    float getXSGLDingDanTotalNum(String ddid);

    float getXSGLDingDanTotalPrice(String ddid);

    void insertDDMX(DingDanmingxi yl);

    void deleteZHDDdetail(List<String> strings);

    int getCountByOnlyDD_TypeNum(DingDanmingxi yl);

    void updateDDMXMishu(Map<String,String> map);

    void insertDDToSale(YDDGL ydd);

    KHGL getKHGLByName(String kehuid);

    int getXSGLDingDanmingxiCount_ddgl(Map<String,Object> map);

    List findXSGLDingDanmingxi_ddgl(int page, int rp, Map<String,Object> map);

    List<KHGL_FH> getKHGLFHsByKehuname(String kehuname);

    YDDGL findYDDGLByDDID(String id);

    List findKHGL_FHByDDID(String kehu_id);

    void updateKHGLFH_CHECK(String ddid, String id);

    void updateDDZT(Map<String,Object> map);
}
