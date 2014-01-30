package com.jiang.dao;

import java.util.List;
import java.util.Map;

public interface FHGLDao {
	
	public int getFHGLCount(Map<String, Object> map);
	
	public List findFHGLByPage(int startRow, int pageSize,Map<String, Object> map);
	
	public void deleteFHGLByIds(List<Integer> ids);

}
