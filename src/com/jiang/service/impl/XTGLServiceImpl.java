package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jiang.bean.YHGL;
import com.jiang.bean.XTCS;
import com.jiang.dao.XTGLDao;
import com.jiang.service.XTGLService;

@Component("xTGLService")
public class XTGLServiceImpl implements XTGLService {

	@Autowired
	private XTGLDao xTGLDao;


	public int getYHGLCount(Map<String, Object> map) {
		return xTGLDao.getYHGLCount(map);
	}
	

	public List findYHGLByPage(int page, int rp, Map<String, Object> map) {
		return xTGLDao.queryYHGLBypage(page, rp, map);
	}


	public YHGL getYHGLById(Integer valueOf) {
		return xTGLDao.getYHGLById(valueOf);
	}


	public boolean deleteYHGLById(List list) {
		return xTGLDao.deleteYHGLById(list);
	}


	public int getLSJLCount() {
		return xTGLDao.getLSJLCount();
	}


	public List findLSJLByPage(int page, int rp, String sortOrder,
			String sortName) {
		return xTGLDao.queryLSJLBypage(page, rp, sortOrder, sortName);
	}


	public boolean deleteLSJLById(List list) {
		return xTGLDao.deleteLSJLById(list);
	}


	public int getXTCSCount(Map<String, Object> map) {
		return xTGLDao.getXTCSCount(map);
	}

	@SuppressWarnings("unchecked")

	public List<XTCS> findXTCSByPage(int page, int rp, Map<String, Object> map) {
		return xTGLDao.queryXTCSBypage(page, rp, map);
	}


	public void deleteXTCSByIds(List<Integer> ids) {
		xTGLDao.deleteXTCSByIds(ids);
	}


	public XTCS getXTCSById(Integer id) {
		return xTGLDao.getXTCSById(id);
	}


	public XTCS getXTCSByOhter(String name, String zhonglei) {
		return xTGLDao.getXTCSByOhter(name, zhonglei);
	}


	public void updateXTCS(XTCS xtcs) {
		xTGLDao.updateXTCS(xtcs);
	}


	public void addXTCS(XTCS xtcs) {
		xTGLDao.addXTCS(xtcs);
	}


	public boolean checkUniqueness(YHGL yhgl) {
		return xTGLDao.checkUniqueness(yhgl);
	}


	public void updateYHGL(YHGL yhgl) {
		xTGLDao.updateYHGL(yhgl);
	}


	public void addYHGL(YHGL yhgl) {
		xTGLDao.addYHGL(yhgl);
	}


	public String getZGpwdByBumen(String bumen) {
		return xTGLDao.getZGpwdByBumen(bumen);
	}
	

}
