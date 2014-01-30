package com.jiang.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.jiang.bean.BCPKJ_Apply;
import com.jiang.bean.CangKu;
import com.jiang.bean.RKQR;
import com.jiang.bean.RuKuDan;


public interface CKGLDao {

	int getKJGLCount();

	List queryKJGLBypage(int page, int rp);

	boolean deleteKJGLById(List list);

	int getCGRKCount(Map<String, Object> map);

	List findCGRKByPage(int page, int rp, Map<String, Object> map);

	boolean checkUniquessRKDanhao(String danhao);

	boolean checkCGRKQRUniqueness(RKQR rkrq);

	void insertCGRKQR(RKQR rkrq);


	List<CangKu> findChangKuByCKname(String ckname);

	CangKu findChangKuById(Integer valueOf);

	int findChangKuById(String id);

	int getZHIJIANCountByCGID(String id);

	int getCountByCGID(String id);

    String getRuKuDanIDByMudiID(String mudiid);

    void insertRuKuDan(RuKuDan rkd);

    Float getTotalNum(String mudidanhao);

    void deleteCGRKSQById(List<String> strings);

    int getCountBySCZJGID(String id);

    int getCountBySCWJGID(String id);

    int getSCZJGRKCount(Map<String,Object> map);

    List findSCZJGRKByPage(int page, int rp, Map<String,Object> map);

    int getZHIJIANCountBySCZJGID(String id);
    int getZHIJIANCountBySCWJGID(String id);

    int getSCWJGRKCount(Map<String,Object> map);

    List findSCWJGRKByPage(int page, int rp, Map<String,Object> map);

    void setKJFinish(BCPKJ_Apply kjid);

    void setKJCPFinish(BCPKJ_Apply bcpkj);

    BigDecimal getZHIJIANMishuByCGID(String id);
}