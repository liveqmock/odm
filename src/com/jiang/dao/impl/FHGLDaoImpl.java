package com.jiang.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;

import com.jiang.bean.FHGL;
import com.jiang.dao.FHGLDao;

@Component("fHGLDao")
public class FHGLDaoImpl extends SqlMapClientDaoSupport implements FHGLDao{
	private Logger log = Logger.getLogger(FHGLDaoImpl.class);


	public int getFHGLCount(Map<String, Object> map) {
		return (Integer) getSqlMapClientTemplate().queryForObject("FHGL.getFHGLCount",map);
	}

	@SuppressWarnings("unchecked")

	public List<FHGL> findFHGLByPage(int startRow, int pageSize,Map<String, Object> map) {
	    	if(startRow == 0){
				return null;
	    	}
			map.put("pstart", pageSize*(startRow-1));
			map.put("pend", pageSize*startRow);
			return getSqlMapClientTemplate().queryForList("FHGL.getFHGLBypage", map);
	}


	public void deleteFHGLByIds(List<Integer> ids) {
		getSqlMapClientTemplate().delete("FHGL.deleteFHGLByIds", ids);
	}

}
