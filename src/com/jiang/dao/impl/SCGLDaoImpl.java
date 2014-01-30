package com.jiang.dao.impl;

import com.jiang.bean.*;
import com.jiang.dao.SCGLDao;
import com.jiang.util.PublicFunc;
import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("sCGLDao")
public class SCGLDaoImpl extends SqlMapClientDaoSupport implements SCGLDao {

    private Logger log = Logger.getLogger(SCGLDaoImpl.class);


    public int getSCGYDZJGCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getSCGYDZJGCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<ZJGgongyidan> findSCGYDZJGByPage(int startRow, int pageSize,
                                                 Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList(
                "SCGL.findSCGYDZJGByPage", map);
    }

    @Transactional

    public void deleteSCGYDZJGByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteSCGYDZJGByIds", ids);
    }


    public int getSCGYDWJGCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getSCGYDWJGCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<WJGgongyidan> findSCGYDWJGByPage(int startRow, int pageSize,
                                                 Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList(
                "SCGL.findSCGYDWJGByPage", map);
    }

    @Transactional

    public void deleteSCGYDWJGByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteSCGYDWJGByIds", ids);
    }

    public WJGgongyidan getSCGLWJGById(Integer id) {
        return (WJGgongyidan) getSqlMapClientTemplate().queryForObject(
                "SCGL.getSCGLWJGById", id);
    }

    public void updateSCGLWJG(WJGgongyidan wjg) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", "" + wjg.getId());
        map.put("state", PublicFunc.ORDER_STATE_RESEND);
        getSqlMapClientTemplate().update("SCGL.updateSCGLWJG", wjg);
        getSqlMapClientTemplate().update("SCGL.updateSCGLWJG_ZT", map);
    }


    public int getSCGYDYBCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getSCGYDYBCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<YBgongyidan> findSCGYDYBByPage(int startRow, int pageSize,
                                               Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("SCGL.findSCGYDYBByPage",
                map);
    }

    @Transactional

    public void deleteSCGYDYBByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteSCGYDYBByIds", ids);
    }


    public int getCGZLGLCount() {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getCGZLGLCount");
    }

    @SuppressWarnings("unchecked")

    public List<caiGouZhiLing> findCGZLGLByPage(int startRow, int pageSize) {
        Integer end = startRow * pageSize;
        int totalRows = getCGZLGLCount();
        if (end > totalRows) {
            pageSize = totalRows - (startRow - 1) * pageSize;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("psize", pageSize);
        map.put("pend", end);
        return getSqlMapClientTemplate().queryForList("SCGL.findCGZLGLByPage",
                map);
    }

    @Transactional

    public void deleteCGZLGLByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteCGZLGLByIds", ids);
    }


    public int getCangKuCount() {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getCangKuCount");
    }

    @SuppressWarnings("unchecked")

    public List<cangKuChaXun> findCangKuByPage(int startRow, int pageSize) {
        Integer end = startRow * pageSize;
        int totalRows = getCangKuCount();
        if (end > totalRows) {
            pageSize = totalRows - (startRow - 1) * pageSize;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("psize", pageSize);
        map.put("pend", end);
        return getSqlMapClientTemplate().queryForList("SCGL.findCangKuByPage",
                map);
    }

    @Transactional

    public void deleteCangKuByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteCangKuByIds", ids);
    }


    public int getSCRuKuCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getSCRuKuCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<SCRuKu> findSCRuKuByPage(int startRow, int pageSize,
                                         Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("SCGL.findSCRuKuByPage",
                map);
    }

    @Transactional

    public void deleteSCRuKuByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteSCRuKuByIds", ids);
    }


    public int getZhiJianReportCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getZhiJianReportCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<zhiJianReport> findZhiJianReportByPage(int startRow,
                                                       int pageSize, Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList(
                "SCGL.findZhiJianReportByPage", map);
    }

    @Transactional

    public void deleteZhiJianReportByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteZhiJianReportByIds", ids);
    }

    public zhiJianReport getZhiJianReportBySome(Map<String, Object> map) {
        return (zhiJianReport) getSqlMapClientTemplate().queryForObject(
                "SCGL.getZhiJianReportBySome", map);
    }

    public void insertZhiJianReport(zhiJianReport report) {
        getSqlMapClientTemplate().insert("SCGL.insertZhiJianReport", report);
    }

    public void changeStateZJ_CG_ONLY(Map<String, Object> map) {
        getSqlMapClientTemplate().update("SCGL.changeStateZJ_CG_ONLY", map);
    }

    public void changeStateRK_CG_ONLY(Map<String, Object> map) {
        getSqlMapClientTemplate().update("SCGL.changeStateRK_CG_ONLY", map);
    }

    public int getBCPKJApplyCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getBCPKJApplyCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<BCPKJ_Apply> findBCPKJApplyByPage(int startRow, int pageSize,
                                                  Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList(
                "SCGL.findBCPKJApplyByPage", map);
    }

    @Transactional

    public void deleteBCPKJApplyByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteBCPKJApplyByIds", ids);
    }


    public int getGYSCount() {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getGYSCount");
    }

    @SuppressWarnings("unchecked")

    public List<gongYingShang> findGYSByPage(int startRow, int pageSize) {
        Integer end = startRow * pageSize;
        int totalRows = getGYSCount();
        if (end > totalRows) {
            pageSize = totalRows - (startRow - 1) * pageSize;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("psize", pageSize);
        map.put("pend", end);
        return getSqlMapClientTemplate()
                .queryForList("SCGL.findGYSByPage", map);
    }

    @Transactional

    public void deleteGYSByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteGYSByIds", ids);
    }


    public int getWJGDWGLCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getWJGDWGLCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<wJGGongYingShang> findWJGDWGLByPage(int startRow, int pageSize,
                                                    Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("SCGL.findWJGDWGLByPage",
                map);
    }

    @Transactional

    public void deleteWJGDWGLByIds(List<Integer> ids) {
        getSqlMapClientTemplate().delete("SCGL.deleteWJGDWGLByIds", ids);
    }


    public boolean checkSCGLZJGUniqueness(ZJGgongyidan zjg) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.checkSCGLZJGUniqueness", zjg);
        return count == 0 ? true : false;
    }


    public void insertSCGLZJG(ZJGgongyidan zjg) {
        getSqlMapClientTemplate().insert("SCGL.insertSCGLZJG", zjg);
    }


    public ZJGgongyidan getSCGLZJGById(Integer id) {
        return (ZJGgongyidan) getSqlMapClientTemplate().queryForObject(
                "SCGL.getSCGLZJGById", id);
    }


    public void updateSCGLZJG(ZJGgongyidan zjg) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("id", "" + zjg.getId());
        map.put("state", PublicFunc.ORDER_STATE_RESEND);
        getSqlMapClientTemplate().update("SCGL.updateSCGLZJG", zjg);
        getSqlMapClientTemplate().update("SCGL.updateSCGLZJG_ZT", map);

    }


    public boolean checkSCGLYBUniqueness(YBgongyidan zjg) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.checkSCGLYBUniqueness", zjg);
        return count == 0 ? true : false;
    }


    public void insertSCGLYB(YBgongyidan zjg) {
        getSqlMapClientTemplate().insert("SCGL.insertSCGLYB", zjg);
    }


    public void updateSCGLYB(YBgongyidan zjg) {
        getSqlMapClientTemplate().update("SCGL.updateSCGLYB", zjg);
    }

    @SuppressWarnings("unchecked")

    public YBgongyidan getSCGLYBById(Integer id) {
        List<YBgongyidan> list = getSqlMapClientTemplate().queryForList(
                "SCGL.getSCGLYBById", id);
        return list.get(0);
    }

    @SuppressWarnings("unchecked")

    public wJGGongYingShang getWJGDWGLById(Integer id) {
        List<wJGGongYingShang> list = getSqlMapClientTemplate().queryForList(
                "SCGL.getWJGDWGLById", id);
        return list.get(0);
    }


    public void insertWJGDWGL(wJGGongYingShang zjg) {
        getSqlMapClientTemplate().insert("SCGL.insertWJGDWGL", zjg);
    }


    public void updateWJGDWGL(wJGGongYingShang zjg) {
        getSqlMapClientTemplate().update("SCGL.updateWJGDWGL", zjg);
    }


    public boolean checkBCPKJAPPLYUniqueness(BCPKJ_Apply zjg) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.checkBCPKJAPPLYUniqueness", zjg);
        return count == 0 ? true : false;
    }


    public void updateBCPKJAPPLY(BCPKJ_Apply zjg) {
        getSqlMapClientTemplate().update("SCGL.updateBCPKJAPPLY", zjg);
    }

    @SuppressWarnings("unchecked")

    public BCPKJ_Apply getBCPKJ_ApplyById(Integer id) {
        List<BCPKJ_Apply> list = getSqlMapClientTemplate().queryForList(
                "SCGL.getBCPKJ_ApplyById", id);
        return list.get(0);
    }


    public boolean insertBCPKJAPPLY(BCPKJ_Apply zjg) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("bpid", zjg.getBupi_id());
        map.put("kjnum", zjg.getJianchumishu());
        map.put("KY_num", zjg.getYuanmishu());
       long count =   getSqlMapClientTemplate().update("SCGL.updateCangkuByKJBP", map);
       if(count == 1)
       {
           getSqlMapClientTemplate().insert("SCGL.insertBCPKJAPPLY", zjg);
           return true;
       }
        return false;
    }


    public List<ZJGgongyidan> findZJGByAll() {
        log.info("findZJGByAll");
        return getSqlMapClientTemplate().queryForList("SCGL.findZJGByAll");
    }

    @SuppressWarnings("unchecked")

    public List<WJGgongyidan> findWJGByAll() {
        return getSqlMapClientTemplate().queryForList("SCGL.findWJGByAll");
    }

    public boolean checkSCGLWJGUniqueness(WJGgongyidan wjg) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.checkSCGLWJGUniqueness", wjg);
        return count == 0 ? true : false;
    }

    public void insertSCGLWJG(WJGgongyidan wjg) {
        getSqlMapClientTemplate().insert("SCGL.insertSCGLWJG", wjg);
    }

    @SuppressWarnings("unchecked")

    public List<YBgongyidan> findYBByAll() {
        return getSqlMapClientTemplate().queryForList("SCGL.findYBByAll");
    }


    public void changeStateZJ_CG(Map<String, Object> map) {
        getSqlMapClientTemplate().update("SCGL.changeStateZJ_CG", map);
    }

    public String disableSCZJG(String id) {
        String oldstate = "";

        // CGGLDJGL djgl = (CGGLDJGL)getSqlMapClientTemplate().queryForObject(
        //         "CGGL.getDJGLById", map);
        //  String oldstate =  djgl.getZhuangtai();

        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("state", PublicFunc.ORDER_STATE_DELETE);
        getSqlMapClientTemplate().update("SCGL.updateSCGLZJG_ZT", map);
        return oldstate;
    }

    public List<wJGGongYingShang> findWJGGYSByAll() {
        return getSqlMapClientTemplate().queryForList("SCGL.findWJGGYSByAll");
    }
    public String disableSCWJG(String id)
    {
        String oldstate = "";
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("state", PublicFunc.ORDER_STATE_DELETE);
        getSqlMapClientTemplate().update("SCGL.updateSCGLWJG_ZT", map);
        return oldstate;
    }

    public WJGgongyidan getSCGLWJGBySCId(String pingzhengnum) {
        List<WJGgongyidan> list = null;
        list = getSqlMapClientTemplate().queryForList(
                "SCGL.getSCGLWJGBySCId", pingzhengnum);
        if(list.size() > 0)
            return list.get(0);
        else
            return null;
    }

    public ZJGgongyidan getSCGLZJGBySCId(String pingzhengnum) {
        List<ZJGgongyidan> list = null;
        list = getSqlMapClientTemplate().queryForList(
                "SCGL.getSCGLZJGBySCId", pingzhengnum);
        if(list.size() > 0)
             return list.get(0);
        else
            return null;
    }

    public boolean disableBCPKJAPPLY(Integer id) {
        long count = getSqlMapClientTemplate().update("SCGL.updateCANGKU_KJ", id);
        if(count > 0)
            getSqlMapClientTemplate().update("SCGL.updateBCPKJAPPLY_ZT", id);
        else
            return false;
        return true;
    }

    public int getCPKJApplyCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.getCPKJApplyCount", map);
    }

    public List<BCPKJ_Apply> findCPKJApplyByPage(int startRow, int pageSize, Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList(
                "SCGL.findCPKJApplyByPage", map);
    }



    public boolean checkCPKJAPPLYUniqueness(BCPKJ_Apply zjg) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "SCGL.checkCPKJAPPLYUniqueness", zjg);
        return count == 0 ? true : false;
    }

    public boolean insertCPKJAPPLY(BCPKJ_Apply zjg) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("bpid", zjg.getBupi_id());
        map.put("kjnum", zjg.getJianchumishu());
        map.put("KY_num", zjg.getYuanmishu());
        long count =   getSqlMapClientTemplate().update("SCGL.updateCangkuByKJBP", map);
        if(count == 1)
        {
            getSqlMapClientTemplate().insert("SCGL.insertCPKJAPPLY", zjg);
            return true;
        }
        return false;
    }

    public void changeStateZJ_CG_BTG(Map<String, Object> map) {
        getSqlMapClientTemplate().update("SCGL.changeStateZJ_CG_BTG", map);
    }



}
