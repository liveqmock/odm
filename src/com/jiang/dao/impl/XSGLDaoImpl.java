package com.jiang.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jiang.bean.*;
import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.dao.XSGLDao;

@Component("xSGLDao")
public class XSGLDaoImpl extends SqlMapClientDaoSupport implements XSGLDao {
	private Logger log = Logger.getLogger(XSGLDaoImpl.class);


	public int getYDDGLCount(Map<String, Object> map) {
		log.info("getYDDGLCount");
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"XSGL.getYDDGLCount", map);
	}


	public List queryYDDGLBypage(int startRow, int pageSize, Map<String, Object> map) {
		if (startRow == 0) {
			return null;
		}
		map.put("pstart", pageSize * (startRow - 1));
		map.put("pend", pageSize * startRow);
		return getSqlMapClientTemplate()
				.queryForList("XSGL.getYDDGLBypage", map);
	}

	@Transactional

	public boolean deleteYDDGLById(List ids) {
		getSqlMapClientTemplate().delete("XSGL.deleteYDDGLById", ids);
		return true;
	}


	public int getXSDGLCount(Map<String, Object> map) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"XSGL.getXSDGLCount");
	}


	public List queryXSDGLBypage(int startRow, int pageSize, Map<String, Object> map) {
		if (startRow == 0) {
			return null;
		}
		map.put("pstart", pageSize * (startRow - 1));
		map.put("pend", pageSize * startRow);
		return getSqlMapClientTemplate()
				.queryForList("XSGL.getXSDGLBypage", map);
	}

	@Transactional

	public boolean deleteXSDGLById(List ids) {
		getSqlMapClientTemplate().delete("XSGL.deleteXSDGLById", ids);
		return true;
	}


	public int getKHGLCount(Map<String, Object> map) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"XSGL.getKHGLCount");
	}


	public List queryKHGLBypage(int startRow, int pageSize, Map<String, Object> map) {
		if (startRow == 0) {
			return null;
		}
		map.put("pstart", pageSize * (startRow - 1));
		map.put("pend", pageSize * startRow);
		return getSqlMapClientTemplate()
				.queryForList("XSGL.getKHGLBypage", map);
	}

	@Transactional

	public boolean deleteKHGLById(List list) {
		getSqlMapClientTemplate().delete("XSGL.deleteKHGLById", list);
		return true;
	}


	public boolean checkKHGLUniqueness(KHGL yl) {
		int count = (Integer) getSqlMapClientTemplate().queryForObject(
				"XSGL.checkKHGLUniqueness", yl);
		return count == 0 ? true : false;
	}


	public void insertKHGL(KHGL yl) {
		getSqlMapClientTemplate().insert("XSGL.insertKHGL", yl);
	}


	public KHGL getKHGLById(Integer id) {
		return (KHGL) getSqlMapClientTemplate().queryForObject(
				"XSGL.getKHGLById", id);
	}


	public void updateKHGL(KHGL yl) {
		getSqlMapClientTemplate().update("XSGL.updateKHGL", yl);
	}

    public int getKHGL_FHCount(Map<String, Object> map) {
        int count = 0;
        log.info("getKHGL_FHCount");
        count = (Integer) getSqlMapClientTemplate().queryForObject(
                "XSGL.getKHGL_FHCount");
        return count;
    }

    public List queryKHGL_FHBypage(int startRow, int pageSize, Map<String, Object> map) {
        if (startRow == 0) {
            return null;
        }
        map.put("pstart", pageSize * (startRow - 1));
        map.put("pend", pageSize * startRow);
        return getSqlMapClientTemplate()
                .queryForList("XSGL.getKHGL_FHBypage", map);
    }

    public void deleteKHGLFHById(List<String> list) {
        getSqlMapClientTemplate().delete("XSGL.deleteKHGLFHById", list);
    }

    public void insertKHGLFH(KHGL_FH yl) {
        getSqlMapClientTemplate().insert("XSGL.insertKHGLFH", yl);
    }

    public KHGL_FH getKHGLFHById(Integer id) {
        return (KHGL_FH) getSqlMapClientTemplate().queryForObject(
                "XSGL.getKHGLFHById", id);
    }

    public void updateKHGLFH(KHGL_FH yl) {
        getSqlMapClientTemplate().update("XSGL.updateKHGLFH", yl);
    }

    public List getAllKHGL() {
        return getSqlMapClientTemplate().queryForList("XSGL.getAllKHGL");
    }

    public boolean isExistKehuId(String kehu_id) {
        int count = 0;
        count = (Integer) getSqlMapClientTemplate().queryForObject(
                "XSGL.isExistKehuId", kehu_id);
        if(count > 0)
        {
            return true;
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    public List<KHGL> findAllKHGL() {
        List<KHGL> list = new ArrayList<KHGL>();
        list = getSqlMapClientTemplate().queryForList("XSGL.findAllKHGL");
        return list;
    }

    @SuppressWarnings("unchecked")
    public KHGL findXSGLBykehu_idAndKeHuname(Map<String, Object> map) {
        List<KHGL> list = new ArrayList<KHGL>();
        list = getSqlMapClientTemplate().queryForList("XSGL.findXSGLBykehu_idAndKeHuname",map);
        if(list.size() > 0){
            return list.get(0);
        }
        return null;
    }

    public int getXSGLDingDanmingxiCount(Map<String, Object> map) {
        int count = 0;
        count = (Integer) getSqlMapClientTemplate().queryForObject(
                "XSGL.getXSGLDingDanmingxiCount", map);
        return count;
    }

    public List findXSGLDingDanmingxi(int page, int rp, Map<String, Object> map) {
        if (page == 0) {
            return null;
        }
        map.put("pstart", rp * (page - 1));
        map.put("pend", rp * page);

        List<DingDanmingxi> list = new ArrayList<DingDanmingxi>();
        list = getSqlMapClientTemplate().queryForList("XSGL.findXSGLDingDanmingxi", map);
        return list;
    }

    public float getXSGLDingDanTotalNum(String dingdan_id) {
        Float count = null;
        count = (Float) getSqlMapClientTemplate().queryForObject(
                "XSGL.getXSGLDingDanTotalNum", dingdan_id);
        if(count == null)
        {
            count = 0.0f;
        }
        return count;
    }

    public float getXSGLDingDanTotalPrice(String dingdan_id) {
        Float count = null;
        count = (Float) getSqlMapClientTemplate().queryForObject(
                "XSGL.getXSGLDingDanTotalPrice", dingdan_id);
        if(count == null)
        {
            count = 0.0f;
        }
        return count;
    }

    public void insertDDMX(DingDanmingxi yl) {
        getSqlMapClientTemplate().insert("XSGL.insertDDMX", yl);
    }

    public void deleteZHDDdetail(List<String> ids) {
        getSqlMapClientTemplate().delete("XSGL.deleteZHDDdetail", ids);
    }

    public int getCountByOnlyDD_TypeNum(DingDanmingxi yl) {
        int count = 0;
        count = (Integer) getSqlMapClientTemplate().queryForObject(
                "XSGL.getCountByOnlyDD_TypeNum", yl);
        return count;
    }

    public void updateDDMXMishu(Map<String, String> map) {
        getSqlMapClientTemplate().update("XSGL.updateDDMXMishu", map);
    }

    public void insertDDToSale(YDDGL ydd) {
        getSqlMapClientTemplate().insert("XSGL.insertDDToSale", ydd);
        getSqlMapClientTemplate().insert("XSGL.insertDDTempToDD", ydd);

    }

    public KHGL getKHGLByName(String kehuid) {
        return (KHGL) getSqlMapClientTemplate().queryForObject(
                "XSGL.getKHGLByName", kehuid);
    }

    public int getXSGLDingDanmingxiCount_ddgl(Map<String, Object> map) {
        int count = 0;
        count = (Integer) getSqlMapClientTemplate().queryForObject(
                "XSGL.getXSGLDingDanmingxiCount_ddgl", map);
        return count;
    }

    public List findXSGLDingDanmingxi_ddgl(int page, int rp, Map<String, Object> map) {
        if (page == 0) {
            return null;
        }
        map.put("pstart", rp * (page - 1));
        map.put("pend", rp * page);

        List<DingDanmingxi> list = new ArrayList<DingDanmingxi>();
        list = getSqlMapClientTemplate().queryForList("XSGL.findXSGLDingDanmingxi_ddgl", map);
        return list;
    }

}
