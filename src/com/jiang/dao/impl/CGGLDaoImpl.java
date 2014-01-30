package com.jiang.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.bean.CGGLDJGL;
import com.jiang.bean.CGTH;
import com.jiang.bean.CangKu;
import com.jiang.bean.GYS;
import com.jiang.bean.GYSXH;
import com.jiang.bean.RKQR;
import com.jiang.bean.User;
import com.jiang.bean.ZLGLBCPZL;
import com.jiang.bean.ZLGLCPZL;
import com.jiang.bean.ZLGLSPZL;
import com.jiang.bean.ZLGLYLZL;
import com.jiang.dao.CGGLDao;
import com.jiang.util.PublicFunc;

@Component("cGGLDao")
public class CGGLDaoImpl extends SqlMapClientDaoSupport implements CGGLDao {

    private Logger log = Logger.getLogger(CGGLDaoImpl.class);


    public void addUser(User user) {
        getSqlMapClientTemplate().insert("User.addUser", user);
    }


    public User getUserById() {
        return null;
    }

    @SuppressWarnings("unchecked")

    public boolean queryUserByPWD(User user) {
        log.info("DAO查询用户通过密码");
        List<User> users = new ArrayList<User>();
        users = getSqlMapClientTemplate().queryForList("User.getUserByPWD",
                user);
        if (users.size() > 0) {
            return true;
        }
        return false;
    }

    @SuppressWarnings("unchecked")

    public List<CGGLDJGL> queryDJGLBypage(int startRow, int pageSize,
                                          Map<String, Object> map) {
        log.info("DAO查询采购单据分页查询");
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate()
                .queryForList("CGGL.getDJGLBypage", map);
    }


    public int getDJGLCount(Map<String, Object> map) {
        log.info("DAO查询采购单据总页数");
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getDJGLCount", map);
    }

    @Transactional

    public boolean deleteDJGLById(List<String> ids) {
        log.info("DAO删除采购单据通过ids");
        getSqlMapClientTemplate().delete("CGGL.deleteDJGLById", ids);
        return true;
    }

    @SuppressWarnings("unchecked")

    public List<RKQR> queryRKQRBypage(int startRow, int pageSize,
                                      Map<String, Object> map) {
        log.info("DAO查询入库确认单分页查询");
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate()
                .queryForList("CGGL.getRKQRBypage", map);

    }


    public int getRKQRCount(Map<String, Object> map) {
        log.info("DAO查询入库确认总页数");
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getRKQRCount", map);
    }


    public int getCGTHCount(Map<String, Object> map) {
        log.info("DAO查询采购退货总页数");
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getCGTHCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<CGTH> queryCGTHBypage(int startRow, int pageSize,
                                      Map<String, Object> map) {
        log.info("DAO查询采购退货分页查询");
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate()
                .queryForList("CGGL.getCGTHBypage", map);
    }

    @Transactional

    public boolean deleteCGTHById(List<String> ids) {
        log.info("DAO删除采购退货单通过IDS");
        getSqlMapClientTemplate().delete("CGGL.deleteCGTHById", ids);
        return true;
    }


    public int getCKCXCount(Map<String, Object> map) {
        log.info("DAO查询仓库查询总页数");
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getCKCXCount", map);
    }

    @SuppressWarnings("unchecked")

    public List<CangKu> queryCKCXBypage(int startRow, int pageSize,
                                        Map<String, Object> map) {
        log.info("DAO查询仓库查询分页查询");
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate()
                .queryForList("CGGL.getCKCXBypage", map);
    }

    @Transactional

    public boolean deleteCKCXById(List ids) {
        log.info("DAO删除仓库查询通过IDS");
        getSqlMapClientTemplate().delete("CGGL.deleteCKCXById", ids);
        return true;
    }


    public int getGYSCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getGYSGLCount", map);
    }


    public List queryGYSBypage(int startRow, int pageSize,
                               Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CGGL.getGYSGLBypage",
                map);

    }

    @Transactional

    public boolean deleteGYSById(List ids) {
        getSqlMapClientTemplate().delete("CGGL.deleteGYSGLById", ids);
        return true;
    }


    public List queryZLGL_YLBypage(int startRow, int pageSize,
                                   Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CGGL.getZLGLYLBypage",
                map);
    }


    public int getZLGL_YLCount(Map<String, Object> map) {
        log.info("getZLGL_YLCount");
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGLYLCount", map);
    }

    @Transactional

    public boolean deleteZLGL_YLById(List ids) {
        log.info("DAO删除原料资料数据通过IDS");
        getSqlMapClientTemplate().delete("CGGL.deleteZLGLYLById", ids);
        return true;
    }


    public int getZLGL_BCPCount(Map<String, Object> map) {
        log.info("半成品资料分页查询数据量");
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGLBCPCount", map);
    }


    public List queryZLGL_BCPBypage(int startRow, int pageSize,
                                    Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CGGL.getZLGLBCPBypage",
                map);
    }

    @Transactional

    public boolean deleteZLGL_BCPById(List ids) {
        log.info("DAO删除半成品资料数据通过IDS");
        getSqlMapClientTemplate().delete("CGGL.deleteZLGLBCPById", ids);
        return true;
    }


    public int getZLGL_CPCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGLCPCount", map);
    }


    public List queryZLGL_CPBypage(int startRow, int pageSize,
                                   Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CGGL.getZLGLCPBypage",
                map);
    }

    @Transactional

    public boolean deleteZLGL_CPById(List ids) {
        log.info("DAO删除成品资料数据通过IDS");
        getSqlMapClientTemplate().delete("CGGL.deleteZLGLCPById", ids);
        return true;
    }


    public int getZLGL_SPCount(Map<String, Object> map) {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGLSPCount", map);
    }


    public List queryZLGL_SPBypage(int startRow, int pageSize,
                                   Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CGGL.getZLGLSPBypage",
                map);
    }

    @Transactional

    public boolean deleteZLGL_SPById(List ids) {
        getSqlMapClientTemplate().delete("CGGL.deleteZLGLSPById", ids);
        return true;
    }


    public void insertGYSGL(GYS gys) {
        getSqlMapClientTemplate().insert("CGGL.insertGYSGL", gys);
    }


    public GYS getGYSById(Integer valueOf) {
        return (GYS) getSqlMapClientTemplate().queryForObject(
                "CGGL.getGYSGLById", valueOf);
    }


    public void updateGYSGL(GYS gys) {
        log.info("DAO更新供应商信息"+gys.getGongyingname());
        getSqlMapClientTemplate().update("CGGL.updateGYSGL", gys);
    }


    public boolean checkGYSUniqueness(GYS gys) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkGYSUniqueness", gys);
        return count == 0 ? true : false;
    }


    public CGGLDJGL getDJGLById(Integer id) {
        Map map = new HashMap();
        map.put("id", id);
        return (CGGLDJGL) getSqlMapClientTemplate().queryForObject(
                "CGGL.getDJGLById", map);
    }


    public List<GYS> findGYSByAll() {
        return (List<GYS>) getSqlMapClientTemplate().queryForList(
                "CGGL.findGYSByAll");
    }


    public List<ZLGLYLZL> findYLByAll() {
        return (List<ZLGLYLZL>) getSqlMapClientTemplate().queryForList(
                "CGGL.findYLByAll");
    }


    public List<ZLGLBCPZL> findBCPByAll() {
        return (List<ZLGLBCPZL>) getSqlMapClientTemplate().queryForList(
                "CGGL.findBCPByAll");
    }


    public List<ZLGLCPZL> findCPSByAll() {
        return (List<ZLGLCPZL>) getSqlMapClientTemplate().queryForList(
                "CGGL.findCPByAll");
    }


    public List<ZLGLSPZL> findSPByAll() {
        return (List<ZLGLSPZL>) getSqlMapClientTemplate().queryForList(
                "CGGL.findSPByAll");
    }


    public void updateDJGL(CGGLDJGL djgl) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", ""+djgl.getId());
        map.put("state",  PublicFunc.ORDER_STATE_RESEND);
        getSqlMapClientTemplate().update("CGGL.updateDJGL", djgl);
        getSqlMapClientTemplate().update("CGGL.updateCGDJ_ZT", map);
    }


    public boolean checkDJGLUniqueness(CGGLDJGL djgl) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkDJGLUniqueness", djgl);
        return count == 0 ? true : false;
    }


    public void insertDJGL(CGGLDJGL djgl) {
        getSqlMapClientTemplate().insert("CGGL.insertDJGL", djgl);
    }


    public boolean checkGYSXHUniqueness(GYSXH gysxh) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkGYSXHUniqueness", gysxh);
        return count == 0 ? true : false;
    }


    public void insertGYSXHGL(GYSXH gysxh) {
        getSqlMapClientTemplate().insert("CGGL.insertGYSXHGL", gysxh);
    }


    public int getGYSXHCount(Map<String, Object> map) {
        int x = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.getGYSXHCount", map);
        return x;
    }


    public List<GYSXH> findGYSXHByPage(int startRow, int pageSize,
                                       Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CGGL.findGYSXHByPage",
                map);
    }


    public void deleteGYSXHById(List<String> ids) {
        getSqlMapClientTemplate().delete("CGGL.deleteGYSXHById", ids);
    }


    public GYSXH getGYSXHById(Integer id) {
        return (GYSXH) getSqlMapClientTemplate().queryForObject(
                "CGGL.getGYSXHById", id);
    }


    public void updateGYSXHGL(GYSXH gysxh) {
        getSqlMapClientTemplate().update("CGGL.updateGYSXHGL", gysxh);
    }


    public boolean checkYLUniqueness(ZLGLYLZL yl) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkYLUniqueness", yl);
        return count == 0 ? true : false;
    }


    public void insertZLGL_YL(ZLGLYLZL yl) {
        getSqlMapClientTemplate().insert("CGGL.insertZLGL_YL", yl);
    }


    public ZLGLYLZL getZLGL_YLById(Integer id) {
        return (ZLGLYLZL) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGL_YLById", id);
    }

    public ZLGLYLZL getZLGL_YLBySome(Map map) {

        return (ZLGLYLZL) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGL_YLBySome", map);
    }


    public void updateZLGL_YL(ZLGLYLZL yl) {
        getSqlMapClientTemplate().update("CGGL.updateZLGL_YL", yl);
    }


    public boolean checkBCPUniqueness(ZLGLBCPZL yl) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkBCPUniqueness", yl);
        return count == 0 ? true : false;
    }


    public void insertZLGL_BCP(ZLGLBCPZL yl) {
        getSqlMapClientTemplate().insert("CGGL.insertZLGL_BCP", yl);

    }


    public ZLGLBCPZL getZLGL_BCPById(Integer id) {
        return (ZLGLBCPZL) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGL_BCPById", id);
    }


    public void updateZLGL_BCP(ZLGLBCPZL yl) {
        getSqlMapClientTemplate().update("CGGL.updateZLGL_BCP", yl);
    }


    public boolean checkCPUniqueness(ZLGLCPZL yl) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkCPUniqueness", yl);
        return count == 0 ? true : false;
    }


    public void insertZLGL_CP(ZLGLCPZL yl) {
        getSqlMapClientTemplate().insert("CGGL.insertZLGL_CP", yl);
    }


    public void updateZLGL_CP(ZLGLCPZL yl) {
        getSqlMapClientTemplate().update("CGGL.updateZLGL_CP", yl);
    }


    public ZLGLCPZL getZLGL_CPById(Integer id) {
        return (ZLGLCPZL) getSqlMapClientTemplate().queryForObject(
                "CGGL.getZLGL_CPById", id);
    }


    public boolean checkCGTHUniqueness(CGTH yl) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CGGL.checkCGTHUniqueness", yl);
        return count == 0 ? true : false;
    }


    public void insertCGTH(CGTH yl) {
        getSqlMapClientTemplate().insert("CGGL.insertCGTH", yl);
    }


    public List<CGGLDJGL> findDJGLAll() {
        return (List<CGGLDJGL>) getSqlMapClientTemplate().queryForList(
                "CGGL.findDJGLAll");
    }


    public void updateCGTH(CGTH yl) {
        getSqlMapClientTemplate().update("CGGL.updateCGTH", yl);
    }


    public CGTH getCGTHById(Integer id) {
        return (CGTH) getSqlMapClientTemplate().queryForObject(
                "CGGL.getCGTHById", id);
    }


    public CGGLDJGL getDJGLByCGId(String cgid) {
        return (CGGLDJGL) getSqlMapClientTemplate().queryForObject(
                "CGGL.getDJGLByCGId", cgid);
    }


    public String disableJHD(String cgid) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("id", cgid);
        CGGLDJGL djgl = (CGGLDJGL)getSqlMapClientTemplate().queryForObject(
                "CGGL.getDJGLById", map);
        String oldstate =  djgl.getZhuangtai();
        map.put("state", PublicFunc.ORDER_STATE_DELETE);
        getSqlMapClientTemplate().update("CGGL.updateCGDJ_ZT", map);
        return oldstate;
    }


    public boolean changeDJGLState(String id, String state) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("state", state);
        getSqlMapClientTemplate().update("CGGL.updateCGDJ_ZT", map);
        return true;
    }

    public ZLGLCPZL findCPSByTypeNum(String type_num) {
        ZLGLCPZL djgl = (ZLGLCPZL)getSqlMapClientTemplate().queryForObject(
                "CGGL.findCPSByTypeNum", type_num);
        return djgl;
    }

    public List<GYSXH> findAllGYSXH() {
        return getSqlMapClientTemplate().queryForList("CGGL.findAllGYSXH");
    }

}
