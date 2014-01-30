package com.jiang.service;

import java.util.List;
import java.util.Map;

import com.jiang.bean.YHGL;
import com.jiang.bean.XTCS;

public interface XTGLService {

	public int getYHGLCount(Map<String, Object> map);
	public List  findYHGLByPage(int page, int rp, Map<String, Object> map);
	public YHGL getYHGLById(Integer valueOf);
	public String getZGpwdByBumen(String bumen);
	public boolean checkUniqueness(YHGL yhgl);
	
	public boolean deleteYHGLById(List list);
	public int getLSJLCount();
	public List findLSJLByPage(int page, int rp, String sortOrder,
			String sortName);
	public boolean deleteLSJLById(List list);
	public int getXTCSCount(Map<String, Object> map);
	public List<XTCS> findXTCSByPage(int page, int rp, Map<String, Object> map);
	
	/***
	 * 批量删除系统参数
	 */
	public void deleteXTCSByIds(List<Integer> ids);
	
	public XTCS getXTCSById(Integer id);
	
	public XTCS getXTCSByOhter(String name,String zhonglei);
	
	public void updateXTCS(XTCS xtcs);
	
	public void addXTCS(XTCS xtcs);
	public void updateYHGL(YHGL yhgl);
	public void addYHGL(YHGL yhgl);

}
