package com.jiang.service;

import java.util.List;
import java.util.Map;

public interface FHGLService {

	public int getFHGLCount(Map<String, Object> map);

	public List findFHGLByPage(int startRow, int pageSize,
			Map<String, Object> map);
	
	public void deleteFHGLByIds(List<Integer> ids);
}
