package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import com.jiang.bean.DingDanmingxi;
import com.jiang.bean.KHGL_FH;
import com.jiang.bean.YDDGL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jiang.bean.KHGL;
import com.jiang.dao.XSGLDao;
import com.jiang.service.XSGLService;

@Component("xSGLService")
public class XSGLServiceImpl implements XSGLService {

	@Autowired
	private XSGLDao xSGLDao;


	public int getYDDGLCount(Map<String, Object> map) {
		return xSGLDao.getYDDGLCount(map);
	}
	

	public List findYDDGLByPage(int page, int rp,Map<String, Object> map) {
		return xSGLDao.queryYDDGLBypage(page, rp, map);
	}

    public YDDGL findYDDGLByDDID(String id) {
        return xSGLDao.findYDDGLByDDID(id);
    }


    public boolean deleteYDDGLById(List list) {
		return xSGLDao.deleteYDDGLById(list);
	}


	public int getXSDGLCount(Map<String, Object> map) {
		return xSGLDao.getXSDGLCount(map);
	}


	public List findXSDGLByPage(int page, int rp, Map<String, Object> map) {
		return xSGLDao.queryXSDGLBypage(page, rp, map);
	}


	public boolean deleteXSDGLById(List list) {
		return xSGLDao.deleteXSDGLById(list);
	}


	public int getKHGLCount(Map<String, Object> map) {
		return xSGLDao.getKHGLCount(map);
	}


	public List findKHGLByPage(int page, int rp, Map<String, Object> map) {
		return xSGLDao.queryKHGLBypage(page, rp, map);
	}


	public boolean deleteKHGLById(List list) {
		return xSGLDao.deleteKHGLById(list);
	}


	public boolean checkKHGLUniqueness(KHGL yl) {
		return xSGLDao.checkKHGLUniqueness(yl);
	}


	public void insertKHGL(KHGL yl) {
		xSGLDao.insertKHGL(yl);
	}


	public KHGL getKHGLById(Integer valueOf) {
		return xSGLDao.getKHGLById(valueOf);
	}


	public void updateKHGL(KHGL yl) {
		xSGLDao.updateKHGL(yl);
	}

    public List getAllKHGL() {
        return xSGLDao.getAllKHGL();
    }

    public int getKHGL_FHCount(Map<String, Object> map) {
        return xSGLDao.getKHGL_FHCount(map);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public List findKHGL_FHByPage(int page, int rp, Map<String, Object> map) {
        return xSGLDao.queryKHGL_FHBypage(page, rp, map);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public void updateKHGLFH(KHGL_FH yl) {
        xSGLDao.updateKHGLFH(yl);
    }

    public KHGL_FH getKHGLFHById(Integer integer) {
        return xSGLDao.getKHGLFHById(integer);
    }

    public List<KHGL_FH> getKHGLFHsByKehuname(String kehuname) {

        return xSGLDao.getKHGLFHsByKehuname(kehuname);
    }

    public void insertKHGLFH(KHGL_FH yl) {
        xSGLDao.insertKHGLFH(yl);
    }

    public void deleteKHGLFHById(List<String> strings) {
        xSGLDao.deleteKHGLFHById(strings);
    }

    public boolean isExistKehuId(String kehu_id) {
        return xSGLDao.isExistKehuId(kehu_id);
    }

    public List<KHGL> findAllKHGL() {
        return xSGLDao.findAllKHGL();
    }

    public KHGL findXSGLBykehu_idAndKeHuname(Map<String, Object> map) {
        return xSGLDao.findXSGLBykehu_idAndKeHuname(map);
    }

    public int getXSGLDingDanmingxiCount(Map<String, Object> map) {
        return xSGLDao.getXSGLDingDanmingxiCount(map);
    }

    public List findXSGLDingDanmingxi(int page, int rp, Map<String, Object> map) {
        return xSGLDao.findXSGLDingDanmingxi(page,rp,map);
    }

    public float getXSGLDingDanTotalNum(String ddid) {
        return xSGLDao.getXSGLDingDanTotalNum(ddid);
    }

    public float getXSGLDingDanTotalPrice(String ddid) {
        return xSGLDao.getXSGLDingDanTotalPrice(ddid);
    }

    public void insertDDMX(DingDanmingxi yl) {
        xSGLDao.insertDDMX(yl);
    }

    public void deleteZHDDdetail(List<String> strings) {
        xSGLDao.deleteZHDDdetail(strings);
    }

    public int getCountByOnlyDD_TypeNum(DingDanmingxi yl) {
        return xSGLDao.getCountByOnlyDD_TypeNum(yl);
    }

    public void updateDDMXMishu(Map<String, String> map) {
        xSGLDao.updateDDMXMishu(map);
    }

    public void insertDDToSale(YDDGL ydd) {
        xSGLDao.insertDDToSale(ydd);

    }

    public KHGL getKHGLByName(String kehuid) {
        return xSGLDao.getKHGLByName(kehuid);
    }

    public int getXSGLDingDanmingxiCount_ddgl(Map<String, Object> map) {
        return xSGLDao.getXSGLDingDanmingxiCount_ddgl(map);
    }

    public List findXSGLDingDanmingxi_ddgl(int page, int rp, Map<String, Object> map) {
        return xSGLDao.findXSGLDingDanmingxi_ddgl(page, rp, map);
    }

    public List findKHGL_FHByDDID(String kehu_id) {
        return xSGLDao.findKHGL_FHByDDID(kehu_id);
    }

    public void updateKHGLFH_CHECK(String ddid, String id) {
        xSGLDao.updateKHGLFH_CHECK(ddid,id);
    }


}
