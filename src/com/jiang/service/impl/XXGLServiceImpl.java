package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.bean.Message;
import com.jiang.dao.XXGLDao;
import com.jiang.service.XXGLService;

@Component("xXGLService")
public class XXGLServiceImpl implements XXGLService {

	@Autowired
	private XXGLDao xXGLDao;


	public List<Message> findXXGLByPage(int startRow, int pageSize,
			Map<String, Object> map) {
		return xXGLDao.queryXXGLBypage(startRow, pageSize, map);
	}


	public int getXXGLCount(Map<String, Object> map) {
		return xXGLDao.getXXGLCount(map);
	}

	@Transactional

	public void deleteXXGLById(List<Integer> ids) {
		xXGLDao.deleteXXGLById(ids);
	}


	public void insertXXGL(Message msg) {
		xXGLDao.insertXXGL(msg);
	}


	public void setReadedXXGLById(List<Integer> ids) {
		xXGLDao.setReadedXXGLById(ids);
	}

}
