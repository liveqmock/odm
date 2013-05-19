package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
import com.jiang.dao.SCGLDao;
import com.jiang.service.SCGLService;

@Component("sCGLService")
public class SCGLServiceImpl implements SCGLService {

    private Logger log = Logger.getLogger(SCGLServiceImpl.class);

    @Autowired
    private SCGLDao sCGLDao;


    public int getSCGYDZJGCount(Map<String, Object> map) {
        return sCGLDao.getSCGYDZJGCount(map);
    }


    public List<ZJGgongyidan> findSCGYDZJGByPage(int startRow, int pageSize, Map<String, Object> map) {
        return sCGLDao.findSCGYDZJGByPage(startRow, pageSize, map);
    }

    public WJGgongyidan getSCGLWJGBySCId(String pingzhengnum)
    {
        return  sCGLDao.getSCGLWJGBySCId(pingzhengnum);
    }
    public void deleteSCGYDZJGByIds(List<Integer> ids) {
        sCGLDao.deleteSCGYDZJGByIds(ids);
    }


    public int getSCGYDWJGCount(Map<String, Object> map) {
        return sCGLDao.getSCGYDWJGCount(map);
    }


    public List<WJGgongyidan> findSCGYDWJGByPage(int startRow, int pageSize, Map<String, Object> map) {
        return sCGLDao.findSCGYDWJGByPage(startRow, pageSize, map);
    }


    public void deleteSCGYDWJGByIds(List<Integer> ids) {
        sCGLDao.deleteSCGYDWJGByIds(ids);
    }

    public WJGgongyidan getSCGLWJGById(Integer valueOf) {
        return sCGLDao.getSCGLWJGById(valueOf);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public void updateSCGLWJG(WJGgongyidan wjg) {
        sCGLDao.updateSCGLWJG(wjg);//To change body of implemented methods use File | Settings | File Templates.
    }


    public int getSCGYDYBCount(Map<String, Object> map) {
        return sCGLDao.getSCGYDYBCount(map);
    }


    public List<YBgongyidan> findSCGYDYBByPage(int startRow, int pageSize, Map<String, Object> map) {
        return sCGLDao.findSCGYDYBByPage(startRow, pageSize, map);
    }


    public void deleteSCGYDYBByIds(List<Integer> ids) {
        sCGLDao.deleteSCGYDYBByIds(ids);
    }


    public int getCGZLGLCount() {
        return sCGLDao.getCGZLGLCount();
    }


    public List<caiGouZhiLing> findCGZLGLByPage(int startRow, int pageSize) {
        return sCGLDao.findCGZLGLByPage(startRow, pageSize);
    }


    public void deleteCGZLGLByIds(List<Integer> ids) {
        sCGLDao.deleteCGZLGLByIds(ids);
    }


    public int getCangKuCount() {
        return sCGLDao.getCangKuCount();
    }


    public List<cangKuChaXun> findCangKuByPage(int startRow, int pageSize) {
        return sCGLDao.findCangKuByPage(startRow, pageSize);
    }


    public void deleteCangKuByIds(List<Integer> ids) {
        sCGLDao.deleteCangKuByIds(ids);
    }


    public int getSCRuKuCount(Map<String, Object> map) {
        return sCGLDao.getSCRuKuCount(map);
    }


    public List<SCRuKu> findSCRuKuByPage(int startRow, int pageSize, Map<String, Object> map) {
        return sCGLDao.findSCRuKuByPage(startRow, pageSize, map);
    }


    public void deleteSCRuKuByIds(List<Integer> ids) {
        sCGLDao.deleteSCRuKuByIds(ids);
    }


    public int getZhiJianReportCount(Map<String, Object> map) {
        return sCGLDao.getZhiJianReportCount(map);
    }


    public List<zhiJianReport> findZhiJianReportByPage(int startRow,
                                                       int pageSize, Map<String, Object> map) {
        return sCGLDao.findZhiJianReportByPage(startRow, pageSize, map);
    }


    public void deleteZhiJianReportByIds(List<Integer> ids) {
        sCGLDao.deleteZhiJianReportByIds(ids);
    }


    public int getBCPKJApplyCount(Map<String, Object> map) {
        return sCGLDao.getBCPKJApplyCount(map);
    }


    public List<BCPKJ_Apply> findBCPKJApplyByPage(int startRow, int pageSize, Map<String, Object> map) {
        return sCGLDao.findBCPKJApplyByPage(startRow, pageSize, map);
    }


    public void deleteBCPKJApplyByIds(List<Integer> ids) {
        sCGLDao.deleteBCPKJApplyByIds(ids);
    }


    public int getGYSCount() {
        return sCGLDao.getGYSCount();
    }


    public List<gongYingShang> findGYSByPage(int startRow, int pageSize) {
        return sCGLDao.findGYSByPage(startRow, pageSize);
    }


    public void deleteGYSByIds(List<Integer> ids) {
        sCGLDao.deleteGYSByIds(ids);
    }


    public int getWJGDWGLCount(Map<String, Object> map) {
        return sCGLDao.getWJGDWGLCount(map);
    }


    public List<wJGGongYingShang> findWJGDWGLByPage(int startRow, int pageSize, Map<String, Object> map) {
        return sCGLDao.findWJGDWGLByPage(startRow, pageSize, map);
    }


    public void deleteWJGDWGLByIds(List<Integer> ids) {
        sCGLDao.deleteWJGDWGLByIds(ids);
    }


    public boolean checkSCGLZJGUniqueness(ZJGgongyidan zjg) {
        return sCGLDao.checkSCGLZJGUniqueness(zjg);
    }


    public void insertSCGLZJG(ZJGgongyidan zjg) {
        sCGLDao.insertSCGLZJG(zjg);
    }


    public ZJGgongyidan getSCGLZJGById(Integer id) {
        return sCGLDao.getSCGLZJGById(id);
    }

    public ZJGgongyidan getSCGLZJGBySCId(String pingzhengnum) {
        return sCGLDao.getSCGLZJGBySCId(pingzhengnum);
    }


    public void updateSCGLZJG(ZJGgongyidan zjg) {
        sCGLDao.updateSCGLZJG(zjg);
    }


    public boolean checkSCGLYBUniqueness(YBgongyidan zjg) {
        return sCGLDao.checkSCGLYBUniqueness(zjg);
    }


    public void insertSCGLYB(YBgongyidan zjg) {
        sCGLDao.insertSCGLYB(zjg);
    }


    public void updateSCGLYB(YBgongyidan zjg) {
        sCGLDao.updateSCGLYB(zjg);
    }


    public YBgongyidan getSCGLYBById(Integer valueOf) {
        return sCGLDao.getSCGLYBById(valueOf);
    }


    public wJGGongYingShang getWJGDWGLById(Integer valueOf) {
        return sCGLDao.getWJGDWGLById(valueOf);
    }


    public void insertWJGDWGL(wJGGongYingShang zjg) {
        sCGLDao.insertWJGDWGL(zjg);
    }


    public void updateWJGDWGL(wJGGongYingShang zjg) {
        sCGLDao.updateWJGDWGL(zjg);
    }


    public boolean checkBCPKJAPPLYUniqueness(BCPKJ_Apply zjg) {
        return sCGLDao.checkBCPKJAPPLYUniqueness(zjg);
    }


    public void updateBCPKJAPPLY(BCPKJ_Apply zjg) {
        sCGLDao.updateBCPKJAPPLY(zjg);
    }


    public BCPKJ_Apply getBCPKJ_ApplyById(Integer valueOf) {
        return sCGLDao.getBCPKJ_ApplyById(valueOf);
    }


    public boolean insertBCPKJAPPLY(BCPKJ_Apply zjg) {
        return sCGLDao.insertBCPKJAPPLY(zjg);
    }


    public List<ZJGgongyidan> findZJGByAll() {
        return sCGLDao.findZJGByAll();
    }


    public List<WJGgongyidan> findWJGByAll() {
        return sCGLDao.findWJGByAll();
    }

    public boolean checkSCGLWJGUniqueness(WJGgongyidan wjg) {
        return sCGLDao.checkSCGLWJGUniqueness(wjg);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public void insertSCGLWJG(WJGgongyidan wjg) {
        sCGLDao.insertSCGLWJG(wjg);
        //To change body of implemented methods use File | Settings | File Templates.
    }


    public List<YBgongyidan> findYBByAll() {
        return sCGLDao.findYBByAll();
    }


    public void changeStateZJ_CG(Map<String, Object> map) {
        sCGLDao.changeStateZJ_CG(map);
    }

    public String disableSCZJG(String id) {
        return sCGLDao.disableSCZJG(id);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public List<wJGGongYingShang> findWJGGYSByAll() {
        return sCGLDao.findWJGGYSByAll(); //To change body of implemented methods use File | Settings | File Templates.
    }

    public String disableSCWJG(String id)
    {
        return sCGLDao.disableSCWJG(id);
    }

    public boolean disableBCPKJAPPLY(Integer integer) {
        return sCGLDao.disableBCPKJAPPLY(integer);
    }

    public int getCPKJApplyCount(Map<String, Object> map) {
        return sCGLDao.getCPKJApplyCount(map);
    }
    public boolean checkCPKJAPPLYUniqueness(BCPKJ_Apply zjg) {
        return sCGLDao.checkCPKJAPPLYUniqueness(zjg);
    }

    public boolean insertCPKJAPPLY(BCPKJ_Apply zjg) {
        return sCGLDao.insertCPKJAPPLY(zjg);
    }

    public List<BCPKJ_Apply> findCPKJApplyByPage(int page, int rp, Map<String, Object> map) {
        return sCGLDao.findCPKJApplyByPage(page, rp, map);
    }

    public void changeStateZJ_CG_BTG(Map<String, Object> map) {
        sCGLDao.changeStateZJ_CG_BTG(map);
    }

}
