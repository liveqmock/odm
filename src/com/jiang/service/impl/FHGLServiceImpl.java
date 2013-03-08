package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jiang.dao.FHGLDao;
import com.jiang.service.FHGLService;

@Component("fHGLService")
public class FHGLServiceImpl implements FHGLService {
	
	@Autowired
	private FHGLDao fHGLDao;


	public int getFHGLCount(Map<String, Object> map) {
		return fHGLDao.getFHGLCount(map);
	}


	public List findFHGLByPage(int startRow, int pageSize,Map<String, Object> map) {
		return fHGLDao.findFHGLByPage(startRow,pageSize,map);
	}


	public void deleteFHGLByIds(List<Integer> ids) {
		fHGLDao.deleteFHGLByIds(ids);
	}

}
