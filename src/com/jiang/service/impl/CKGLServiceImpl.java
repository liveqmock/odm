package com.jiang.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.jiang.bean.BCPKJ_Apply;
import com.jiang.bean.RuKuDan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jiang.bean.CangKu;
import com.jiang.bean.RKQR;
import com.jiang.dao.CKGLDao;
import com.jiang.service.CKGLService;

@Component("cKGLService")
public class CKGLServiceImpl implements CKGLService {

	@Autowired
	private CKGLDao cKGLDao;


	public int getKJGLCount() {
		return cKGLDao.getKJGLCount();
	}
	

	public List findKJGLByPage(int page, int rp) {
		return cKGLDao.queryKJGLBypage(page, rp);
	}


	public boolean deleteKJGLById(List list) {
		return cKGLDao.deleteKJGLById(list);
	}


	public int getCGRKCount(Map<String, Object> map) {
		return cKGLDao.getCGRKCount(map);
	}

    public int getSCZJGRKCount(Map<String, Object> map) {
        return cKGLDao.getSCZJGRKCount(map);
    }
    public int getSCWJGRKCount(Map<String, Object> map) {
        return cKGLDao.getSCWJGRKCount(map);
    }

    public List findCGRKByPage(int page, int rp, Map<String, Object> map) {
		return cKGLDao.findCGRKByPage(page, rp, map);
	}

    public List findSCZJGRKByPage(int page, int rp, Map<String, Object> map) {
        return cKGLDao.findSCZJGRKByPage(page, rp, map);
    }
    public List findSCWJGRKByPage(int page, int rp, Map<String, Object> map) {
        return cKGLDao.findSCWJGRKByPage(page, rp, map);
    }


    public boolean checkUniquessRKDanhao(String danhao) {
		return cKGLDao.checkUniquessRKDanhao(danhao);
	}


	public boolean checkCGRKQRUniqueness(RKQR rkrq) {
		return cKGLDao.checkCGRKQRUniqueness(rkrq);
	}


	public void insertCGRKQR(RKQR rkrq) {
		cKGLDao.insertCGRKQR(rkrq);
	}


	public List<CangKu> findChangKuByCKname(String ckname) {
		return cKGLDao.findChangKuByCKname(ckname);
	}


	public CangKu findChangKuById(Integer valueOf) {
		return cKGLDao.findChangKuById(valueOf);
	}


	public int getCountByCGID(String id) {
		return cKGLDao.getCountByCGID(id);
	}

    public int getCountBySCZJGID(String id) {
        return cKGLDao.getCountBySCZJGID(id);
    }
    public int getCountBySCWJGID(String id) {
        return cKGLDao.getCountBySCWJGID(id);
    }

    public int getZHIJIANCountByCGID(String id) {
		return cKGLDao.getZHIJIANCountByCGID(id);
	}

    public int getZHIJIANCountBySCZJGID(String id) {
        return cKGLDao.getZHIJIANCountBySCZJGID(id);
    }

    public int getZHIJIANCountBySCWJGID(String id) {
        return cKGLDao.getZHIJIANCountBySCWJGID(id);
    }
    public String getRuKuDanIDByMudiID(String mudiid){
        return cKGLDao.getRuKuDanIDByMudiID(mudiid);
    }
    public void insertRuKuDan(RuKuDan rkd){
          cKGLDao.insertRuKuDan(rkd);
    }
    public Float getTotalNum(String mudidanhao){
        return cKGLDao.getTotalNum(mudidanhao);
    }

    public void deleteCGRKSQById(List<String> strings) {
        cKGLDao.deleteCGRKSQById(strings);
    }

    public void setKJFinish(BCPKJ_Apply kjid) {
        cKGLDao.setKJFinish(kjid);
    }

    public void setKJCPFinish(BCPKJ_Apply bcpkj) {
        cKGLDao.setKJCPFinish(bcpkj);
    }

    public BigDecimal getZHIJIANMishuByCGID(String id) {
        return cKGLDao.getZHIJIANMishuByCGID(id);
    }
}
