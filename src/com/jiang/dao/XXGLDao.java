package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.bean.Message;

public interface XXGLDao {

	public List<Message> queryXXGLBypage(int startRow, int pageSize,
			Map<String, Object> map);

	public int getXXGLCount(Map<String, Object> map);

	public void deleteXXGLById(List<Integer> ids);

	public void insertXXGL(Message msg);

	public void setReadedXXGLById(List<Integer> ids);
}
