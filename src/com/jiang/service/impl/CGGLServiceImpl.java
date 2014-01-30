package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jiang.bean.CGGLDJGL;
import com.jiang.bean.CGTH;
import com.jiang.bean.CangKu;
import com.jiang.bean.GYS;
import com.jiang.bean.GYSXH;
import com.jiang.bean.RKQR;
import com.jiang.bean.ZLGLBCPZL;
import com.jiang.bean.ZLGLCPZL;
import com.jiang.bean.ZLGLSPZL;
import com.jiang.bean.ZLGLYLZL;
import com.jiang.dao.CGGLDao;
import com.jiang.service.CGGLService;



@Component("cGGLService")
public class CGGLServiceImpl implements CGGLService {

	@Autowired
	private CGGLDao cGGLDao;

    public int getTotalDJGL() {
		return 0;
	}


	public List<CGGLDJGL> findDJGLByPage(int startRow, int pageSize,Map<String, Object> map) {
		return cGGLDao.queryDJGLBypage(startRow, pageSize,map);
	}


	public int getDJGLCount(Map<String, Object> map) {
		return cGGLDao.getDJGLCount(map);
	}

	@Transactional

	public boolean deleteDJGLById(List<String> id) {
		return cGGLDao.deleteDJGLById(id);
	}


	public List<RKQR> findRKQRByPage(int startRow, int pageSize,Map<String, Object> map) {
		return cGGLDao.queryRKQRBypage(startRow, pageSize,map);
	}


	public int getRKQRCount(Map<String, Object> map) {
		return cGGLDao.getRKQRCount(map);
	}


	public int getCGTHCount(Map<String, Object> map) {
		return cGGLDao.getCGTHCount(map);
	}


	public List<CGTH> findCGTHByPage(int startRow, int pageSize,Map<String, Object> map) {
		return cGGLDao.queryCGTHBypage(startRow, pageSize, map);
	}
	@Transactional

	public boolean deleteCGTHById(List<String> id) {
		return cGGLDao.deleteCGTHById(id);
	}


	public int getCKCXCount(Map<String, Object> map) {
		return cGGLDao.getCKCXCount(map);
	}


	public List<CangKu> findCKCXByPage(int startRow, int pageSize,Map<String, Object> map) {
		return cGGLDao.queryCKCXBypage(startRow, pageSize, map);
	}


	public boolean deleteCKCXById(List list) {
		return cGGLDao.deleteCKCXById(list);
	}


	public int getGYSCount(Map<String, Object> map) {
		return cGGLDao.getGYSCount(map);
	}


	public List findGYSByPage(int startRow, int pageSize,Map<String, Object> map) {
		return cGGLDao.queryGYSBypage(startRow, pageSize, map);
	}

	@Transactional

	public boolean deleteGYSById(List list) {
		return cGGLDao.deleteGYSById(list);
	}


	public int getZLGL_YLCount(Map<String, Object> map) {
		return cGGLDao.getZLGL_YLCount(map);
	}


	public List findZLGL_YLByPage(int page, int rp,Map<String, Object> map) {
		return cGGLDao.queryZLGL_YLBypage(page, rp, map);
	}


	public boolean deleteZLGL_YLById(List list) {
		return cGGLDao.deleteZLGL_YLById(list);
	}


	public int getZLGL_BCPCount(Map<String, Object> map) {
		return cGGLDao.getZLGL_BCPCount(map);
	}


	public List findZLGL_BCPByPage(int page, int rp, Map<String, Object> map) {
		return cGGLDao.queryZLGL_BCPBypage(page, rp, map);
	}


	public boolean deleteZLGL_BCPById(List list) {
		return cGGLDao.deleteZLGL_BCPById(list);
	}


	public int getZLGL_CPCount(Map<String, Object> map) {
		return cGGLDao.getZLGL_CPCount(map);
	}


	public List findZLGL_CPByPage(int page, int rp, Map<String, Object> map) {
		return cGGLDao.queryZLGL_CPBypage(page, rp, map);
	}


	public boolean deleteZLGL_CPById(List list) {
		return cGGLDao.deleteZLGL_CPById(list);
	}
	

	public int getZLGL_SPCount(Map<String, Object> map) {
		return cGGLDao.getZLGL_SPCount(map);
	}


	public List findZLGL_SPByPage(int page, int rp,Map<String, Object> map) {
		return cGGLDao.queryZLGL_SPBypage(page, rp, map);
	}


	public boolean deleteZLGL_SPById(List list) {
		return cGGLDao.deleteZLGL_SPById(list);
	}


	public void insertGYSGL(GYS gys) {
		 cGGLDao.insertGYSGL(gys);
	}


	public GYS getGYSById(Integer valueOf) {
		return  cGGLDao.getGYSById(valueOf);
	}


	public void updateGYSGL(GYS gys) {
		cGGLDao.updateGYSGL(gys);
	}


	public boolean checkGYSUniqueness(GYS gys) {
		return cGGLDao.checkGYSUniqueness(gys);
	}


	public  CGGLDJGL getDJGLById(Integer valueOf) {
		return cGGLDao.getDJGLById(valueOf);
	}


	public List<GYS> findGYSByAll() {
		return cGGLDao.findGYSByAll();
	}


	public List<ZLGLYLZL> findYLByAll() {
		return cGGLDao.findYLByAll();
	}


	public List<ZLGLBCPZL> findBCPByAll() {
		return cGGLDao.findBCPByAll();
	}


	public List<ZLGLCPZL> findCPSByAll() {
		return cGGLDao.findCPSByAll();
	}


	public List<ZLGLSPZL> findSPByAll() {
		return cGGLDao.findSPByAll();
	}


	public void updateDJGL(CGGLDJGL djgl) {
		 cGGLDao.updateDJGL(djgl);
	}


	public boolean checkDJGLUniqueness(CGGLDJGL djgl) {
		return cGGLDao.checkDJGLUniqueness(djgl);
	}


	public void insertDJGL(CGGLDJGL djgl) {
		 cGGLDao.insertDJGL(djgl);
	}


	public boolean checkGYSXHUniqueness(GYSXH gysxh) {
		return cGGLDao.checkGYSXHUniqueness(gysxh);
	}


	public void insertGYSXHGL(GYSXH gysxh) {
		cGGLDao.insertGYSXHGL(gysxh);
	}


	public int getGYSXHCount(Map<String, Object> map) {
		return cGGLDao.getGYSXHCount(map);
	}


	public List<GYSXH> findGYSXHByPage(int page, int rp, Map<String, Object> map) {
		return cGGLDao.findGYSXHByPage(page,rp,map);
	}

    public List<GYSXH> findAllGYSXH() {
        return cGGLDao.findAllGYSXH();
    }


    public void deleteGYSXHById(List<String> ids) {
		 cGGLDao.deleteGYSXHById(ids);
	}


	public GYSXH getGYSXHById(Integer ids) {
		return  cGGLDao.getGYSXHById(ids);
	}


	public void updateGYSXHGL(GYSXH gysxh) {
	   cGGLDao.updateGYSXHGL(gysxh);
	}


	public boolean checkYLUniqueness(ZLGLYLZL yl) {
		return  cGGLDao.checkYLUniqueness(yl);
	}


	public void insertZLGL_YL(ZLGLYLZL yl) {
		cGGLDao.insertZLGL_YL(yl);
	}


	public ZLGLYLZL getZLGL_YLById(Integer id) {
		return  cGGLDao.getZLGL_YLById(id);
	}

    public ZLGLYLZL getZLGL_YLBySome(Map type_num) {
        return cGGLDao.getZLGL_YLBySome(type_num);
    }


    public void updateZLGL_YL(ZLGLYLZL yl) {
		   cGGLDao.updateZLGL_YL(yl);
	}


	public boolean checkBCPUniqueness(ZLGLBCPZL yl) {
		return  cGGLDao.checkBCPUniqueness(yl);
	}


	public void insertZLGL_BCP(ZLGLBCPZL yl) {
		cGGLDao.insertZLGL_BCP(yl);
		
	}


	public ZLGLBCPZL getZLGL_BCPById(Integer id) {
		return  cGGLDao.getZLGL_BCPById(id);
	}


	public void updateZLGL_BCP(ZLGLBCPZL yl) {
		   cGGLDao.updateZLGL_BCP(yl);
		
	}


	public boolean checkCPUniqueness(ZLGLCPZL yl) {
		return  cGGLDao.checkCPUniqueness(yl);
	}


	public void insertZLGL_CP(ZLGLCPZL yl) {
		cGGLDao.insertZLGL_CP(yl);
		
	}


	public void updateZLGL_CP(ZLGLCPZL yl) {
		cGGLDao.updateZLGL_CP(yl);
		
	}


	public ZLGLCPZL getZLGL_CPById(Integer id) {
		return  cGGLDao.getZLGL_CPById(id);
	}


	public boolean checkCGTHUniqueness(CGTH yl) {
		return  cGGLDao.checkCGTHUniqueness(yl);
	}


	public void insertCGTH(CGTH yl) {
		cGGLDao.insertCGTH(yl);
	}


	public List<CGGLDJGL> findDJGLAll() {
		return cGGLDao.findDJGLAll();
	}


	public void updateCGTH(CGTH yl) {
		cGGLDao.updateCGTH(yl);
	}


	public CGTH getCGTHById(Integer id) {
		return  cGGLDao.getCGTHById(id);
	}


	public CGGLDJGL getDJGLByCGId(String pingzhengnum) {
		return  cGGLDao.getDJGLByCGId(pingzhengnum);
	}


	public String disableJHD(String id) {
		return  cGGLDao.disableJHD(id);
	}


	public boolean changeDJGLState(String id, String state) {
		return  cGGLDao.changeDJGLState(id, state);
	}

    public ZLGLCPZL findCPSByTypeNum(String t_tiaoma) {
        return  cGGLDao.findCPSByTypeNum(t_tiaoma);
    }

}
