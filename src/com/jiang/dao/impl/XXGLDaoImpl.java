package com.jiang.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.bean.Message;
import com.jiang.bean.YHGL;
import com.jiang.dao.XXGLDao;
import com.jiang.util.PublicFunc;

@Component("xXGLDao")
public class XXGLDaoImpl extends SqlMapClientDaoSupport implements XXGLDao {

	private Logger log = Logger.getLogger(XXGLDaoImpl.class);

	@SuppressWarnings("unchecked")

	public List<Message> queryXXGLBypage(int startRow, int pageSize,
			Map<String, Object> map) {
		Integer end = startRow * pageSize;
		int totalRows = getXXGLCount(map);
		if (startRow * pageSize > totalRows) {
			pageSize = totalRows - (startRow - 1) * pageSize;
		}
		map.put("psize", pageSize);
		map.put("pend", end);
		return getSqlMapClientTemplate()
				.queryForList("XXGL.getXXGLBypage", map);
	}


	public int getXXGLCount(Map<String, Object> map) {
		return (Integer) getSqlMapClientTemplate().queryForObject(
				"XXGL.getXXGLCount", map);
	}

	@Transactional

	public void deleteXXGLById(List<Integer> ids) {
		getSqlMapClientTemplate().delete("XXGL.deleteXXGLById", ids);
	}


	public void insertXXGL(Message msg) {
		if("群发".equals(msg.getSendtype()))
		{
			String bumen = msg.getMudibumen();
			Map map = new HashMap();
			map.put("bumen", bumen);
			System.out.println("bumen"+bumen);
			List<YHGL>  names = getSqlMapClientTemplate().queryForList("XXGL.queryUserbyBumen", map);
			for(int i=0;i<names.size();i++)
			{
				YHGL unames = names.get(i);
				System.out.println("names"+unames.getRealName());
				if(!PublicFunc.unEmpty(unames.getRealName()))
				{
					continue;
				}
				msg.setReceive_man(unames.getRealName());
				getSqlMapClientTemplate().insert("XXGL.insertXXGL", msg);
			}
		}
		else
		{
			getSqlMapClientTemplate().insert("XXGL.insertXXGL", msg);
		}
	}


	public void setReadedXXGLById(List<Integer> ids) {
		getSqlMapClientTemplate().update("XXGL.setReadedXXGLById", ids);
		
	}

}
