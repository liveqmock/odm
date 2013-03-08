package com.jiang.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.bean.YHGL;
import com.jiang.bean.XTCS;
import com.jiang.dao.XTGLDao;

@Component("xTGLDao")
public class XTGLDaoImpl extends SqlMapClientDaoSupport implements XTGLDao {
	private Logger log = Logger.getLogger(XTGLDaoImpl.class);


	public int getYHGLCount(Map<String, Object> map) {
		log.info("getYHGLCount");
		if ("@".equals((String) map.get("ZGpwd"))) {
			System.out.println("getYHGLCount2@");
			return (Integer) getSqlMapClientTemplate().queryForObject(
					"XTGL.getYHGLCount2", map);
		} else {
			return (Integer) getSqlMapClientTemplate().queryForObject(
					"XTGL.getYHGLCount", map);
		}

	}


	public YHGL getYHGLById(Integer valueOf) {
		return (YHGL) getSqlMapClientTemplate().queryForObject(
				"XTGL.getYHGLByID", valueOf);
	}


	public List queryYHGLBypage(int startRow, int pageSize,
			Map<String, Object> map) {
		Integer end = startRow * pageSize;
		int totalRows = getYHGLCount(map);
		if (startRow * pageSize > totalRows) {
			pageSize = totalRows - (startRow - 1) * pageSize;
		}
		map.put("psize", pageSize);
		map.put("pend", end);
		System.out.println((String) map.get("ZGpwd"));
		if ("@".equals((String) map.get("ZGpwd"))) {
			System.out.println("getYHGLBypage2@");
			return getSqlMapClientTemplate().queryForList(
					"XTGL.getYHGLBypage2", map);
		} else {
			return getSqlMapClientTemplate().queryForList("XTGL.getYHGLBypage",
					map);
		}

	}

	@Transactional

	public boolean deleteYHGLById(List ids) {
		getSqlMapClientTemplate().delete("XTGL.deleteYHGLById", ids);
		return true;
	}


	public boolean checkUniqueness(YHGL yhgl) {
		int count = (Integer) getSqlMapClientTemplate().queryForObject(
				"XTGL.checkUniqueness", yhgl);
		return count == 0 ? true : false;
	}


	public void updateYHGL(YHGL yhgl) {
		getSqlMapClientTemplate().update("XTGL.updateYHGL", yhgl);
	}

	public void addYHGL(YHGL yhgl) {
		log.info("添加用户"+yhgl.getRealName());
		log.info(yhgl.getBumen());
		log.info(yhgl.getQuanxian());
		log.info(yhgl.getZGpwd());
		log.info(yhgl.getCompany());
		getSqlMapClientTemplate().insert("XTGL.addYHGL", yhgl);
		log.info("添加用户成功!");
	}


	public int getLSJLCount() {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"XTGL.getLSJLCount");
	}


	public List queryLSJLBypage(int startRow, int pageSize, String sortOrder,
			String sortName) {
		Integer end = startRow * pageSize;
		int totalRows = getLSJLCount();
		if (startRow * pageSize > totalRows) {
			pageSize = totalRows - (startRow - 1) * pageSize;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("psize", pageSize);
		map.put("pend", end);
		map.put("sortOrder", sortOrder);
		map.put("sortName", sortName);
		return getSqlMapClientTemplate()
				.queryForList("XTGL.getLSJLBypage", map);
	}

	@Transactional

	public boolean deleteLSJLById(List ids) {
		getSqlMapClientTemplate().delete("XTGL.deleteLSJLById", ids);
		return true;
	}


	public int getXTCSCount(Map<String, Object> map) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"XTGL.getXTCSCount", map);
	}

	@SuppressWarnings("unchecked")

	public List<XTCS> queryXTCSBypage(int startRow, int pageSize,
			Map<String, Object> map) {
		Integer end = startRow * pageSize;
		int totalRows = getXTCSCount(map);
		if (startRow * pageSize > totalRows) {
			pageSize = totalRows - (startRow - 1) * pageSize;
		}
		map.put("psize", pageSize);
		map.put("pend", end);
		return getSqlMapClientTemplate()
				.queryForList("XTGL.getXTCSBypage", map);
	}

	@Transactional

	public void deleteXTCSByIds(List<Integer> ids) {
		getSqlMapClientTemplate().delete("XTGL.deleteXTCSByIds", ids);
	}


	public XTCS getXTCSById(Integer id) {
		return (XTCS) getSqlMapClientTemplate().queryForObject(
				"XTGL.getXTCSById", id);
	}


	public XTCS getXTCSByOhter(String name, String zhonglei) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("zhonglei", zhonglei);
		return (XTCS) getSqlMapClientTemplate().queryForObject(
				"XTGL.getXTCSByOhter", map);
	}

	@Transactional

	public void updateXTCS(XTCS xtcs) {
		getSqlMapClientTemplate().update("XTGL.updateXTCS", xtcs);
	}

	@Transactional

	public void addXTCS(XTCS xtcs) {
		getSqlMapClientTemplate().insert("XTGL.addXTCS", xtcs);
	}


	public String getZGpwdByBumen(String bumen) {
        List<String> all = new ArrayList<String>();
        all  =getSqlMapClientTemplate().queryForList(
                "XTGL.getZGpwdbybumen", bumen);
        if(all.size()>0)
        {
            return all.get(0);
        }
        else
        {
            return null;
        }
	}



}
