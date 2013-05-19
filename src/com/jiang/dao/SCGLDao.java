package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.bean.BCPKJ_Apply;
import com.jiang.bean.SCRuKu;
import com.jiang.bean.WJGgongyidan;
import com.jiang.bean.YBgongyidan;
import com.jiang.bean.ZJGgongyidan;
import com.jiang.bean.caiGouZhiLing;
import com.jiang.bean.cangKuChaXun;
import com.jiang.bean.gongYingShang;
import com.jiang.bean.wJGGongYingShang;
import com.jiang.bean.zhiJianReport;

public interface SCGLDao {

    /**
     * 采购指令管理
     *
     * @return
     */
    public int getCGZLGLCount();

    public List<caiGouZhiLing> findCGZLGLByPage(int startRow, int pageSize);

    public void deleteCGZLGLByIds(List<Integer> ids);

    /**
     *
     *
     * @return
     */
    public int getCangKuCount();

    public List<cangKuChaXun> findCangKuByPage(int startRow, int pageSize);

    public void deleteCangKuByIds(List<Integer> ids);

    /**
     * 生产入库
     *
     * @return
     */
    public int getSCRuKuCount(Map<String, Object> map);

    public List<SCRuKu> findSCRuKuByPage(int startRow, int pageSize, Map<String, Object> map);

    public void deleteSCRuKuByIds(List<Integer> ids);

    /**
     * 质检报告
     *
     * @return
     */
    public int getZhiJianReportCount(Map<String, Object> map);

    public List<zhiJianReport> findZhiJianReportByPage(int startRow,
                                                       int pageSize, Map<String, Object> map);

    public void deleteZhiJianReportByIds(List<Integer> ids);

    /**
     * 供应商管理
     *
     * @return
     */
    public int getGYSCount();

    public List<gongYingShang> findGYSByPage(int startRow, int pageSize);

    public void deleteGYSByIds(List<Integer> ids);

    /**
     * 外加工单位管理
     *
     * @return
     */
    public int getWJGDWGLCount(Map<String, Object> map);

    public void updateWJGDWGL(wJGGongYingShang zjg);

    public void insertWJGDWGL(wJGGongYingShang zjg);

    public wJGGongYingShang getWJGDWGLById(Integer valueOf);

    public List<wJGGongYingShang> findWJGDWGLByPage(int startRow, int pageSize, Map<String, Object> map);

    public List<wJGGongYingShang> findWJGGYSByAll();

    public void deleteWJGDWGLByIds(List<Integer> ids);


    /**
     * 样本加工
     *
     * @return
     */
    public int getSCGYDYBCount(Map<String, Object> map);

    public List<YBgongyidan> findSCGYDYBByPage(int startRow, int pageSize, Map<String, Object> map);

    public void deleteSCGYDYBByIds(List<Integer> ids);

    public boolean checkSCGLYBUniqueness(YBgongyidan zjg);

    public void insertSCGLYB(YBgongyidan zjg);

    public void updateSCGLYB(YBgongyidan zjg);

    public YBgongyidan getSCGLYBById(Integer valueOf);

    public List<YBgongyidan> findYBByAll();


    /**
     * 半成品开剪
     *
     * @return
     */
    public int getBCPKJApplyCount(Map<String, Object> map);

    public List<BCPKJ_Apply> findBCPKJApplyByPage(int startRow, int pageSize, Map<String, Object> map);

    public void deleteBCPKJApplyByIds(List<Integer> ids);

    public boolean checkBCPKJAPPLYUniqueness(BCPKJ_Apply zjg);

    public void updateBCPKJAPPLY(BCPKJ_Apply zjg);

    public BCPKJ_Apply getBCPKJ_ApplyById(Integer valueOf);

    public boolean insertBCPKJAPPLY(BCPKJ_Apply zjg);


    /**
     * @param map
     */

    public void changeStateZJ_CG(Map<String, Object> map);



    /**
     * 自加工
     *
     * @return
     */
    public boolean checkSCGLZJGUniqueness(ZJGgongyidan zjg);

    public void insertSCGLZJG(ZJGgongyidan zjg);

    public ZJGgongyidan getSCGLZJGById(Integer valueOf);

    public void updateSCGLZJG(ZJGgongyidan zjg);

    public List<ZJGgongyidan> findZJGByAll();

    public int getSCGYDZJGCount(Map<String, Object> map);

    public List<ZJGgongyidan> findSCGYDZJGByPage(int startRow, int pageSize, Map<String, Object> map);

    public void deleteSCGYDZJGByIds(List<Integer> ids);

    public String disableSCZJG(String id);

    /**
     * 外加工
     */

    public List<WJGgongyidan> findWJGByAll();

    public boolean checkSCGLWJGUniqueness(WJGgongyidan wjg);

    public void insertSCGLWJG(WJGgongyidan wjg);

    public int getSCGYDWJGCount(Map<String, Object> map);

    public List<WJGgongyidan> findSCGYDWJGByPage(int startRow, int pageSize, Map<String, Object> map);

    public void deleteSCGYDWJGByIds(List<Integer> ids);

    public WJGgongyidan getSCGLWJGById(Integer valueOf);

    public void updateSCGLWJG(WJGgongyidan wjg);

    public String disableSCWJG(String id);

    WJGgongyidan getSCGLWJGBySCId(String pingzhengnum);

    ZJGgongyidan getSCGLZJGBySCId(String pingzhengnum);

    boolean disableBCPKJAPPLY(Integer integer);

    int getCPKJApplyCount(Map<String,Object> map);

    List<BCPKJ_Apply> findCPKJApplyByPage(int page, int rp, Map<String,Object> map);


    boolean checkCPKJAPPLYUniqueness(BCPKJ_Apply zjg);

    boolean insertCPKJAPPLY(BCPKJ_Apply zjg);

    void changeStateZJ_CG_BTG(Map<String,Object> map);
}