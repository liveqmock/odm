package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.bean.YHGL;
import com.jiang.bean.XTCS;


public interface XTGLDao {

	public int getYHGLCount(Map<String, Object> map);

	public List queryYHGLBypage(int page, int rp, Map<String, Object> map);

	public YHGL getYHGLById(Integer valueOf);

	public boolean deleteYHGLById(List list);

	public int getLSJLCount();

	public List queryLSJLBypage(int page, int rp, String sortOrder,
			String sortName);

	public boolean deleteLSJLById(List list);

	public int getXTCSCount(Map<String, Object> map);

	public List<XTCS> queryXTCSBypage(int page, int rp, Map<String, Object> map);

	public void deleteXTCSByIds(List<Integer> ids);
	
	public XTCS getXTCSById(Integer id);
	
	public XTCS getXTCSByOhter(String name,String zhonglei);
	
	public void updateXTCS(XTCS xtcs);
	
	public void addXTCS(XTCS xtcs);

	public boolean checkUniqueness(YHGL yhgl);

	public void updateYHGL(YHGL yhgl);

	public void addYHGL(YHGL yhgl);

	public String getZGpwdByBumen(String bumen);

}
