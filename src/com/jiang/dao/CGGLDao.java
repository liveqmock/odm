package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.bean.CGGLDJGL;
import com.jiang.bean.CGTH;
import com.jiang.bean.CangKu;
import com.jiang.bean.GYS;
import com.jiang.bean.GYSXH;
import com.jiang.bean.RKQR;
import com.jiang.bean.User;
import com.jiang.bean.ZLGLBCPZL;
import com.jiang.bean.ZLGLCPZL;
import com.jiang.bean.ZLGLSPZL;
import com.jiang.bean.ZLGLYLZL;

public interface CGGLDao {

	public User getUserById();

	public void addUser(User user);

	public boolean queryUserByPWD(User user);

	public List<CGGLDJGL> queryDJGLBypage(int startRow, int pageSize,
			Map<String, Object> map);

	public int getDJGLCount(Map<String, Object> map);

	public boolean deleteDJGLById(List<String> id);

	public int getRKQRCount(Map<String, Object> map);

	public List<RKQR> queryRKQRBypage(int startRow, int pageSize,
			Map<String, Object> map);

	public int getCGTHCount(Map<String, Object> map);

	public List<CGTH> queryCGTHBypage(int startRow, int pageSize,
			Map<String, Object> map);

	public boolean deleteCGTHById(List<String> id);

	public int getCKCXCount(Map<String, Object> map);

	public List<CangKu> queryCKCXBypage(int startRow, int pageSize,
			Map<String, Object> map);

	public boolean deleteCKCXById(List list);

	public int getGYSCount(Map<String, Object> map);

	public List queryGYSBypage(int startRow, int pageSize,Map<String, Object> map);

	public boolean deleteGYSById(List list);

	public List queryZLGL_YLBypage(int page, int rp, Map<String, Object> map);

	public int getZLGL_YLCount(Map<String, Object> map);

	public boolean deleteZLGL_YLById(List list);

	public int getZLGL_BCPCount(Map<String, Object> map);

	public List queryZLGL_BCPBypage(int page, int rp,Map<String, Object> map);

	public boolean deleteZLGL_BCPById(List list);

	public int getZLGL_CPCount(Map<String, Object> map);

	public List queryZLGL_CPBypage(int page, int rp,Map<String, Object> map);

	public boolean deleteZLGL_CPById(List list);

	public int getZLGL_SPCount(Map<String, Object> map);

	public List queryZLGL_SPBypage(int page, int rp, Map<String, Object> map);

	public boolean deleteZLGL_SPById(List list);

	public void insertGYSGL(GYS gys);

	public GYS getGYSById(Integer valueOf);

	public void updateGYSGL(GYS gys);

	public boolean checkGYSUniqueness(GYS gys);

	public  CGGLDJGL getDJGLById(Integer valueOf);

	public List<GYS> findGYSByAll();

	public List<ZLGLYLZL> findYLByAll();

	public List<ZLGLBCPZL> findBCPByAll();

	public List<ZLGLCPZL> findCPSByAll();

	public List<ZLGLSPZL> findSPByAll();

	public void updateDJGL(CGGLDJGL djgl);

	public boolean checkDJGLUniqueness(CGGLDJGL djgl);

	public void insertDJGL(CGGLDJGL djgl);

	public boolean checkGYSXHUniqueness(GYSXH gysxh);

	public void insertGYSXHGL(GYSXH gysxh);

	public int getGYSXHCount(Map<String, Object> map);

	public List<GYSXH> findGYSXHByPage(int page, int rp, Map<String, Object> map);

	public void deleteGYSXHById(List<String> ids);

	public GYSXH getGYSXHById(Integer ids);

	public void updateGYSXHGL(GYSXH gysxh);

	public boolean checkYLUniqueness(ZLGLYLZL yl);

	public void insertZLGL_YL(ZLGLYLZL yl);

	public ZLGLYLZL getZLGL_YLById(Integer id);

    public ZLGLYLZL getZLGL_YLBySome(Map type_num);

	public void updateZLGL_YL(ZLGLYLZL yl);

	public boolean checkBCPUniqueness(ZLGLBCPZL yl);

	public void insertZLGL_BCP(ZLGLBCPZL yl);

	public ZLGLBCPZL getZLGL_BCPById(Integer id);

	public void updateZLGL_BCP(ZLGLBCPZL yl);

	public boolean checkCPUniqueness(ZLGLCPZL yl);

	public void insertZLGL_CP(ZLGLCPZL yl);

	public void updateZLGL_CP(ZLGLCPZL yl);

	public ZLGLCPZL getZLGL_CPById(Integer id);

	public boolean checkCGTHUniqueness(CGTH yl);

	public void insertCGTH(CGTH yl);

	public List<CGGLDJGL> findDJGLAll();

	public void updateCGTH(CGTH yl);

	public CGTH getCGTHById(Integer id);

	public CGGLDJGL getDJGLByCGId(String pingzhengnum);

	public String disableJHD(String id);
	
	public boolean changeDJGLState(String id, String state);

    public ZLGLCPZL findCPSByTypeNum(String t_tiaoma);

    List<GYSXH> findAllGYSXH();
}
