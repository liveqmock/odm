package com.jiang.service;

import com.jiang.bean.BCPKJ_Apply;
import com.jiang.bean.CangKu;
import com.jiang.bean.RKQR;
import com.jiang.bean.RuKuDan;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface CKGLService {

	int getKJGLCount();
	List  findKJGLByPage(int page, int rp);
	boolean deleteKJGLById(List list);
	int getCGRKCount(Map<String, Object> map);
    int getSCZJGRKCount(Map<String, Object> map);
    int getSCWJGRKCount(Map<String, Object> map);

	List findCGRKByPage(int page, int rp, Map<String, Object> map);
    List findSCZJGRKByPage(int page, int rp, Map<String,Object> map);
    List findSCWJGRKByPage(int page, int rp, Map<String,Object> map);

	boolean checkUniquessRKDanhao(String danhao);
	boolean checkCGRKQRUniqueness(RKQR rkrq);
	void insertCGRKQR(RKQR rkrq);
	List<CangKu> findChangKuByCKname(String ckname);
	CangKu findChangKuById(Integer valueOf);

	int getCountByCGID(String id);
    int getCountBySCZJGID(String id);
    int getCountBySCWJGID(String id);

	int getZHIJIANCountByCGID(String id);
    int getZHIJIANCountBySCZJGID(String id);
    int getZHIJIANCountBySCWJGID(String id);



    /**
     *   入库查询通过目的单号*
     */
    public String getRuKuDanIDByMudiID(String mudiid);

    public void insertRuKuDan(RuKuDan rkd);

    public Float getTotalNum(String mudidanhao);

    public void deleteCGRKSQById(List<String> strings);

    void setKJFinish(BCPKJ_Apply kjid);

    void setKJCPFinish(BCPKJ_Apply bcpkj);

    BigDecimal getZHIJIANMishuByCGID(String id);
}