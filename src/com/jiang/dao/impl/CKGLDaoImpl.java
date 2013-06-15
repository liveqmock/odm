package com.jiang.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jiang.bean.BCPKJ_Apply;
import com.jiang.bean.RuKuDan;
import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.bean.CangKu;
import com.jiang.bean.RKQR;
import com.jiang.dao.CKGLDao;

@Component("cKGLDao")
public class CKGLDaoImpl extends SqlMapClientDaoSupport implements CKGLDao {
	private Logger log = Logger.getLogger(CKGLDaoImpl.class);


	public int getKJGLCount() {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"CKGL.getKJGLCount");
	}


	public List queryKJGLBypage(int startRow, int pageSize) {
		Integer end = startRow * pageSize;
		int totalRows = getKJGLCount();
		if (startRow * pageSize > totalRows) {
			pageSize = totalRows - (startRow - 1) * pageSize;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("psize", pageSize);
		map.put("pend", end);
		log.info("queryKJGLBypage");
		return getSqlMapClientTemplate()
				.queryForList("CKGL.getKJGLBypage", map);
	}

	@Transactional

	public boolean deleteKJGLById(List ids) {
		getSqlMapClientTemplate().delete("CKGL.deleteKJGLById", ids);
		return true;
	}


	public int getCGRKCount(Map<String, Object> map) {
		log.info("getCGRKCount" + map.get("cgid"));
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"CKGL.getCGRKCount", map);
	}


	public List findCGRKByPage(int startRow, int pageSize,
			Map<String, Object> map) {
		if (startRow == 0) {
			return null;
		}
		log.info("findCGRKByPage");
		map.put("pstart", pageSize * (startRow - 1));
		map.put("pend", pageSize * startRow);
		return getSqlMapClientTemplate().queryForList("CKGL.findCGRKByPage",
				map);
	}


	public boolean checkUniquessRKDanhao(String danhao) {
		int count = (Integer) getSqlMapClientTemplate().queryForObject(
				"CKGL.checkUniquessRKDanhao", danhao);
		return count == 0 ? true : false;
	}


	public boolean checkCGRKQRUniqueness(RKQR rkrq) {
		int count = (Integer) getSqlMapClientTemplate().queryForObject(
				"CKGL.checkCGRKQRUniqueness", rkrq);
		return count == 0 ? true : false;
	}


	public void insertCGRKQR(RKQR rkrq) {
		getSqlMapClientTemplate().insert("CKGL.insertCGRKQR", rkrq);
	}


	public List<CangKu> findChangKuByCKname(String ckname) {
		return getSqlMapClientTemplate().queryForList("CKGL.findChangKuByCKname", ckname);
	}


	public CangKu findChangKuById(Integer id) {
		return (CangKu) getSqlMapClientTemplate().queryForObject("CKGL.findChangKuById", id);
	}


	public int findChangKuById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int getZHIJIANCountByCGID(String caigou_id) {
		int count = (Integer) getSqlMapClientTemplate().queryForObject(
				"CKGL.getZHIJIANCountByCGID", caigou_id);
		return count;
	}


	public int getCountByCGID(String caigou_id) {
		int count = (Integer) getSqlMapClientTemplate().queryForObject(
				"CKGL.getCountByCGID", caigou_id);
		return count;
	}

    public String getRuKuDanIDByMudiID(String mudiid)
    {
        return (String) getSqlMapClientTemplate().queryForObject("CKGL.getRuKuDanIDByMudiID", mudiid);
    }
    public void insertRuKuDan(RuKuDan rkd)
    {
        getSqlMapClientTemplate().insert("CKGL.insertRuKuDan", rkd);
    }

    public Float getTotalNum(String mudidanhao)
    {
        return  (Float)getSqlMapClientTemplate().queryForObject("CKGL.getTotalNum", mudidanhao);
    }

    public void deleteCGRKSQById(List<String> ids) {
        getSqlMapClientTemplate().delete("CKGL.deleteCGRKSQById", ids);
    }

    public int getCountBySCZJGID(String scid) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CKGL.getCountBySCZJGID", scid);
        return count;
    }

    public int getCountBySCWJGID(String scid) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CKGL.getCountBySCWJGID", scid);
        return count;
    }


    public int getSCZJGRKCount(Map<String, Object> map) {
        log.info("getSCZJGRKCount" + map.get("scdid"));
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CKGL.getSCZJGRKCount", map);
    }
    public int getSCWJGRKCount(Map<String, Object> map) {
        log.info("getSCWJGRKCount" + map.get("scdid"));
        return (Integer) getSqlMapClientTemplate().queryForObject(
                "CKGL.getSCWJGRKCount", map);
    }

    public List findSCZJGRKByPage(int startRow, int pageSize, Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        log.info("findSCZJGRKByPage");
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate().queryForList("CKGL.findSCZJGRKByPage",
                map);
    }
    public List findSCWJGRKByPage(int page, int rp, Map<String, Object> map) {
        if (page == 0) {
            return null;
        }
        log.info("findSCWJGRKByPage");
        map.put("pstart", rp * (page - 1));
        map.put("pend", rp * page);
        return getSqlMapClientTemplate().queryForList("CKGL.findSCWJGRKByPage",
                map);
    }

    public void setKJFinish(BCPKJ_Apply zjg) {
        getSqlMapClientTemplate().update("SCGL.updateBCPKJAPPLY", zjg);
        getSqlMapClientTemplate().update("CKGL.setKJFinish", zjg.getId());
    }

    public void setKJCPFinish(BCPKJ_Apply bcpkj) {
        getSqlMapClientTemplate().update("SCGL.updateCPKJAPPLY", bcpkj);
        getSqlMapClientTemplate().update("CKGL.setKJCPFinish", bcpkj.getId());
    }

    public BigDecimal getZHIJIANMishuByCGID(String caigou_id) {
        BigDecimal count = (BigDecimal) getSqlMapClientTemplate().queryForObject(
                "CKGL.getZHIJIANMishuByCGID", caigou_id);
        return count;
    }

    public int getZHIJIANCountBySCZJGID(String gongyidan_id) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CKGL.getZHIJIANCountBySCZJGID",gongyidan_id);
        return count;
    }
    public int getZHIJIANCountBySCWJGID(String gongyidan_id) {
        int count = (Integer) getSqlMapClientTemplate().queryForObject(
                "CKGL.getZHIJIANCountBySCWJGID",gongyidan_id);
        return count;
    }

}
