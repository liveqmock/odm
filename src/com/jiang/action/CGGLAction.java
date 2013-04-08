package com.jiang.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

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
import com.jiang.service.CGGLService;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;

@SuppressWarnings("serial")
public class CGGLAction extends BaseAction {
    Logger log = Logger.getLogger(CGGLAction.class);
    @Autowired
    private CGGLService cgglService;

    public String dolist() {
        Result result = new Result();
        String hidden = request.getParameter(HIDDEN);
        String type = request.getParameter(TYPE);
        String sortOrder = request.getParameter(SORTORDER);
        String sortName = request.getParameter(SORTNAME);
        /**
         * 查询模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("manage")) {
            manager(type, result);
        }
        /**
         * 删除模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("delete")) {
            delete(type);
        }
        /**
         * 添加模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("add")) {
            return add(type);
        }
        /**
         * 预修改模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("premodify")) {
            return preModify(type);
        }
        /***
         * 修改模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("modify")) {
            return modify(type);
        }
        /***
         * 修改状态
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("state")) {
            return changeState(type);
        }
        return SUCCESS;
    }

    private String changeState(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("DJGLCG")) {
            return changeStateDJGLCG();
        }
        return SUCCESS;
    }

    private String changeStateDJGLCG() {
        String id = "";
        if(null != request.getParameter("id")) {
            id = request.getParameter("id");
        }
        log.info("changestate:"+id);
        log.info("changestate:"+PublicFunc.ORDER_STATE_WATINGCG);
        cgglService.changeDJGLState(id, PublicFunc.ORDER_STATE_WATINGCG);
        return SUCCESS;
    }

    /**
     * 入库确认查询
     *
     * @param result
     * @return
     */
    private Result query_RKQR(Result result) {
        int totalRows = 0;
        String bp = request.getParameter("bupi_id");
        String cg = request.getParameter("caigou_id");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(bp)) {
            map.put("bupi_id", bp);
        }
        if (PublicFunc.unEmpty(cg)) {
            map.put("caigou_id", cg);
        }
        setSearchPage(map);
        totalRows = cgglService.getRKQRCount(map);
        List<RKQR> rows = cgglService.findRKQRByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findRKQRByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getRKQRInfoJSON(rows));
        return result;
    }

    /***
     * 单据管理查询
     *
     * @param result
     * @return
     */
    private Result query_DJGL(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String zt = request.getParameter("zhuangtai");
        String bt = request.getParameter("beginTime");
        String et = request.getParameter("endTime");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
            map.put("zhuangtai", zt);
        }
        if (PublicFunc.unEmpty(bt)) {
            map.put("beginTime", PublicFunc.paseStringToDate(bt));
        }
        if (PublicFunc.unEmpty(et)) {
            map.put("endTime", PublicFunc.paseStringToDate(et));
        }
        setSearchPage(map);
        totalRows = cgglService.getDJGLCount(map);
        if(PublicFunc.pageChange)
        {
            page = PublicFunc.currentPage;
            PublicFunc.pageChange = false;

        }
        List<CGGLDJGL> rows = cgglService.findDJGLByPage(page, rp, map);

        PublicFunc.currentPage = page;
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findDJGLByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getReleaseInfoJSON(rows));
        return result;
    }

    /**
     * 采购退货查询
     *
     * @param result
     * @return
     */
    private Result query_CGTH(Result result) {
        int totalRows = 0;
        String am = request.getParameter("Apply_Man");
        String zt = request.getParameter("Zhuangtai");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(am)) {
            map.put("Apply_Man", am);
        }
        if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
            map.put("Zhuangtai", zt);
        }
        setSearchPage(map);
        totalRows = cgglService.getCGTHCount(map);
        List<CGTH> rows = cgglService.findCGTHByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findCGTHByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getCGTHInfoJSON(rows));
        return result;
    }

    /**
     * 仓库查询
     *
     * @param result
     * @return
     */
    private Result query_CKCX(Result result) {
        int totalRows = 0;
        String tn = null;
        String ck = null;
        String bp = null;
        String bupi_id = null;
        String mudidanhao = null;
        if (null != request.getParameter("type_num")) {
            tn = request.getParameter("type_num");
        }
        if (null != request.getParameter("ckname")) {
            ck = request.getParameter("ckname");
        }
        if (null != request.getParameter("bptype")) {
            bp = request.getParameter("bptype");
        }
        if (null != request.getParameter("bupi_id")) {
            bupi_id = request.getParameter("bupi_id");
        }
        if (null != request.getParameter("mudidanhao")) {
            mudidanhao = request.getParameter("mudidanhao");
        }

        Map<String, Object> map = new HashMap<String, Object>();
        if(bp != null && bp.equals("bcp"))
        {
            bp = "半成品";
        }
        else if(bp != null && bp.equals("cp"))
        {
            bp = "成品";
        }
        else if(bp != null && bp.equals("yl"))
        {
            bp = "原料";
        }
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(bupi_id)) {
            map.put("bupi_id", bupi_id);
        }
        if (PublicFunc.unEmpty(mudidanhao)) {
            map.put("mudidanhao", mudidanhao);
        }
        if (PublicFunc.unEmpty(ck) && !ck.contains("请选择")) {
            map.put("ckname", ck);
        }
        if (PublicFunc.unEmpty(bp) && !bp.contains("请选择")) {
            map.put("bptype", bp);
        }
        log.info("tn:"+tn);
        log.info("bupi_id:"+bupi_id);
        log.info("mudidanhao:"+mudidanhao);
        log.info("ck:"+ck);
        log.info("bp:"+bp);
        setSearchPage(map);
        totalRows = cgglService.getCKCXCount(map);
        List<CangKu> rows = cgglService.findCKCXByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findCKCXByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getCKCXInfoJSON(rows));
        return result;
    }

    /**
     * 供应商管理查询
     */
    private Result query_GYSGL(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("gongyingname");
        String zt = request.getParameter("leixing");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("gongyingname", tn);
        }
        if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
            map.put("leixing", zt);
        }
        setSearchPage(map);
        totalRows = cgglService.getGYSCount(map);
        List rows = cgglService.findGYSByPage(page, rp, map);

        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findGYSByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getGYSGLInfoJSON(rows));
        return result;
    }

    /**
     * 原料资料管理查询
     *
     * @param result
     * @return
     */
    private Result query_ZLGL_YL(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String zt = request.getParameter("xilie");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(zt)) {
            map.put("xilie", zt);
        }
        setSearchPage(map);
        totalRows = cgglService.getZLGL_YLCount(map);
        List rows = cgglService.findZLGL_YLByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findZLGL_YLByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getZLGL_YLInfoJSON(rows));
        return result;
    }

    /**
     * 半成品资料管理查询
     *
     * @param result
     * @return
     */
    private Result query_ZLGL_BCP(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String zt = request.getParameter("xilie");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(zt)) {
            map.put("xilie", zt);
        }
        setSearchPage(map);
        totalRows = cgglService.getZLGL_BCPCount(map);
        List rows = cgglService.findZLGL_BCPByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findZLGL_BCPByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getZLGL_BCPInfoJSON(rows));
        return result;
    }

    /**
     * 成品资料管理查询
     *
     * @param result
     * @return
     */
    private Result query_ZLGL_CP(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String zt = request.getParameter("xilie");
        String tm = request.getParameter("tiaoxingma");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(zt)) {
            map.put("xilie", zt);
        }
        if (PublicFunc.unEmpty(tm)) {
            map.put("tiaoxingma", tm);
        }
        setSearchPage(map);
        totalRows = cgglService.getZLGL_CPCount(map);
        List rows = cgglService.findZLGL_CPByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findZLGL_CPByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getZLGL_CPInfoJSON(rows));
        return result;
    }

    /**
     * 商品资料管理查询
     *
     * @param result
     * @return
     */
    private Result query_ZLGL_SP(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String zt = request.getParameter("xilie");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(zt)) {
            map.put("xilie", zt);
        }
        setSearchPage(map);
        totalRows = cgglService.getZLGL_SPCount(map);
        List rows = cgglService.findZLGL_SPByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findZLGL_SPByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getZLGL_SPInfoJSON(rows));
        return result;
    }

    /**
     * 查询模块
     *
     * @param type
     * @param result
     */
    private void manager(String type, Result result) {
        if (PublicFunc.unEmpty(type) && type.equals("RKQR")) {
            result = query_RKQR(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("DJGL")) {
            result = query_DJGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGTH")) {
            result = query_CGTH(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("CKCX")) {
            result = query_CKCX(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            result = query_GYSGL(result);
        }
        if(PublicFunc.unEmpty(type) && type.equals("GYSXHGL"))
        {
            result = query_GYSXHGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_YL")) {
            result = query_ZLGL_YL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_BCP")) {
            result = query_ZLGL_BCP(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_CP")) {
            result = query_ZLGL_CP(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_SP")) {
            result = query_ZLGL_SP(result);
        }
        json = JsonUtil.getResponseJson(result);
        onResponse(json);
    }

    private Result query_GYSXHGL(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("gongyingname");
        String ck = request.getParameter("xinghao");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("gongyingname", tn);
        }
        if (PublicFunc.unEmpty(ck)) {
            map.put("xinghao", ck);
        }
        setSearchPage(map);
        totalRows = cgglService.getGYSXHCount(map);
        List<GYSXH> rows = cgglService.findGYSXHByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgglService.findGYSXHByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        List<GYS> gyss = new ArrayList<GYS>();
        if (null != request.getSession().getAttribute("gyss")) {
            gyss = (List<GYS>) request.getSession().getAttribute("gyss");
        }
        Map<Integer, String> gysmap = new HashMap<Integer, String>();
        for(int i=0;i<gyss.size();i++)
        {
            gysmap.put(gyss.get(i).getId(), gyss.get(i).getGongyingname());
        }
        result.setRows(JsonUtil.getGYSXHInfoJSON(rows, gysmap));
        return result;
    }

    /**
     * 删除模块
     *
     * @param type
     */
    private void delete(String type) {
        String[] id = request.getParameterValues("id");
        if (PublicFunc.unEmpty(type) && type.equals("DJGL")) {
            cgglService.deleteDJGLById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("CKCX")) {
            cgglService.deleteCKCXById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            cgglService.deleteGYSById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSXH")) {
            cgglService.deleteGYSXHById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_BCP")) {
            cgglService.deleteZLGL_BCPById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_CP")) {
            cgglService.deleteZLGL_CPById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_SP")) {
            cgglService.deleteZLGL_SPById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_YL")) {
            cgglService.deleteZLGL_YLById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGTH")) {
            cgglService.deleteCGTHById(Arrays.asList(id));
        }
    }

    /**
     * 添加供应商管理
     *
     * @return
     */
    private String add_GYSGL() {
        String gysname = request.getParameter("gysname");
        String gysname_j = request.getParameter("gysname_j");
        String gystype = request.getParameter("gystype");
        String telephone = request.getParameter("telephone");
        String telename = request.getParameter("telename");
        String phone = request.getParameter("phone");
        String cz = request.getParameter("cz");
        String kpmc = request.getParameter("kpmc");
        String kpdz = request.getParameter("kpdz");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String khhzh = request.getParameter("khhzh");
        String xiangxi = request.getParameter("xiangxi");
        GYS gys = new GYS();
        if (PublicFunc.unEmpty(gysname)) {
            gys.setGongyingname(gysname);
        }
        System.out.println("gys:" + gysname);
        if (PublicFunc.unEmpty(gysname_j)) {
            gys.setSuoxie(gysname_j);
        }
        if (PublicFunc.unEmpty(gystype) && !("--请选择--").equals(gystype)) {
            gys.setLeixing(gystype);
        }
        if (PublicFunc.unEmpty(telephone)) {
            gys.setTelephone(telephone);
        }
        if (PublicFunc.unEmpty(telename)) {
            gys.setSeller(telename);
        }
        if (PublicFunc.unEmpty(phone)) {
            gys.setPhone(phone);
        }
        if (PublicFunc.unEmpty(cz)) {
            gys.setChuanzhen(cz);
        }
        if (PublicFunc.unEmpty(kpmc)) {
            gys.setKpmc1(kpmc);
        }
        if (PublicFunc.unEmpty(kpdz)) {
            gys.setKpaddress1(kpdz);
        }
        if (PublicFunc.unEmpty(address)) {
            gys.setAddress(address);
        }
        if (PublicFunc.unEmpty(email)) {
            gys.setEmail(email);
        }
        if (PublicFunc.unEmpty(khhzh)) {
            gys.setKhhzh1(khhzh);
        }
        if (PublicFunc.unEmpty(xiangxi)) {
            gys.setBeizhu(xiangxi);
        }

        if (gys != null) {
            boolean unique = cgglService.checkGYSUniqueness(gys);
            if (unique) {
                cgglService.insertGYSGL(gys);
                return "gysgl";
            } else {
                request.setAttribute("gysgl", gys);
                request.setAttribute("modifygysglerror", "已存在该供应商名!");
                return "addGYSGL";
            }
        }
        return SUCCESS;
    }

    /**
     * 添加模块
     *
     * @param type
     * @return
     */
    private String add(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            return add_GYSGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("DJGL")) {
            return add_DJGL();
        }
        if(PublicFunc.unEmpty(type) && type.equals("GYSXHGL"))
        {
            return add_GYSXHGL();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZLGL_YL"))
        {
            return add_ZLGL_YL();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZLGL_BCP"))
        {
            return add_ZLGL_BCP();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZLGL_CP"))
        {
            return add_ZLGL_CP();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZLGL_SP"))
        {
            return add_ZLGL_SP();
        }
        if(PublicFunc.unEmpty(type) && type.equals("CGTH"))
        {
            return add_CGTH();
        }
        return SUCCESS;
    }

    private String add_CGTH() {
        String id = request.getParameter("id");
        String shenqtime = request.getParameter("shenqtime");
        String tuihuoid = request.getParameter("tuihuoid");
        String caigouid = request.getParameter("caigouid");
        String danjia = request.getParameter("danjia");
        String shenqr = request.getParameter("shenqr");
        String liuyou = request.getParameter("liuyou");

        CGTH yl = new CGTH();
        if (PublicFunc.unEmpty(shenqtime)) {
            yl.setApply_Time(PublicFunc.paseStringToDate(shenqtime,"yyyy/MM/dd"));
        }
        if (PublicFunc.unEmpty(caigouid)) {
            yl.setCaiGou_Id(caigouid);
        }
        if (PublicFunc.unEmpty(tuihuoid)) {
            yl.setTuiHuo_Id(tuihuoid);
        }
        if (PublicFunc.unEmpty(danjia)) {
            yl.setTuiHuoDanJia(new BigDecimal(danjia));
        }
        if (PublicFunc.unEmpty(shenqr)) {
            yl.setApply_Man(shenqr);
        }
        if (PublicFunc.unEmpty(liuyou)) {
            yl.setReason(liuyou);
        }
        if (yl != null) {
            yl.setZhuangtai("退货中");

            boolean unique = cgglService.checkCGTHUniqueness(yl);
            if (unique) {
                cgglService.insertCGTH(yl);
                return "cgth";
            } else {
                request.setAttribute("cgth", yl);
                request.setAttribute("modifycgtherror", "已存在该条码!");
                return "addCGTH";
            }
        }
        return SUCCESS;
    }

    private String add_ZLGL_SP() {
        // TODO Auto-generated method stub
        return null;
    }

    private String add_ZLGL_CP() {
        String xinghao = request.getParameter("xinghao");
        String beizhu = request.getParameter("beizhu");
        String guige = request.getParameter("guige");
        String sebie = request.getParameter("sebie");
        String xiaxian = request.getParameter("xiaxian");
        String tiaoxingma = request.getParameter("tiaoma");
        String xilie = request.getParameter("xilie");
        String pinming = request.getParameter("pinming");
        String lingsj = request.getParameter("lingsj");
        String zhengqj = request.getParameter("zhengqj");
        String sanbmj = request.getParameter("sanbmj");
        String pifajia = request.getParameter("pifajia");
        String zidingyijia = request.getParameter("zidingyijia");
        String danwei = request.getParameter("danwei");
        String chenfen = request.getParameter("chenfen");
        String kezhong = request.getParameter("kezhong");
        String sphuawei = request.getParameter("sphuawei");
        String czhuawei = request.getParameter("czhuawei");
        String yongtu = request.getParameter("yongtu");
        String xihushuoming = request.getParameter("xihushuoming");
        String tupian = request.getParameter("tupian");

        ZLGLCPZL yl = new ZLGLCPZL();
        if (PublicFunc.unEmpty(xinghao)) {
            yl.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(guige)) {
            yl.setGuige(guige);
        }
        if (PublicFunc.unEmpty(sebie)) {
            yl.setColor(sebie);
        }
        if (PublicFunc.unEmpty(xiaxian)) {
            yl.setXiaxian(xiaxian);
        }
        if (PublicFunc.unEmpty(tiaoxingma)) {
            yl.setTiaoxingma(tiaoxingma);
        }
        if (PublicFunc.unEmpty(xilie)) {
            yl.setXilie(xilie);
        }
        if (PublicFunc.unEmpty(pinming)) {
            yl.setPinming(pinming);
        }
        if (PublicFunc.unEmpty(lingsj)) {
            yl.setLingjianjia(new BigDecimal(lingsj));
        }
        if (PublicFunc.unEmpty(zhengqj)) {
            yl.setZhengjuanjia(new BigDecimal(zhengqj));
        }
        if (PublicFunc.unEmpty(sanbmj)) {
            yl.setBaimijia(new BigDecimal(sanbmj));
        }
        if (PublicFunc.unEmpty(pifajia)) {
            yl.setPifajia(new BigDecimal(pifajia));
        }
        if (PublicFunc.unEmpty(zidingyijia)) {
            yl.setZidingyijia(new BigDecimal(zidingyijia));
        }
        if (PublicFunc.unEmpty(danwei)) {
            yl.setDanwei(danwei);
        }
        if (PublicFunc.unEmpty(chenfen)) {
            yl.setChengfen(chenfen);
        }
        if (PublicFunc.unEmpty(kezhong)) {
            yl.setWeigh(kezhong);
        }
        if (PublicFunc.unEmpty(sphuawei)) {
            yl.setWeigh(sphuawei);
        }
        if (PublicFunc.unEmpty(czhuawei)) {
            yl.setCZ_huawei(czhuawei);
        }
        if (PublicFunc.unEmpty(yongtu)) {
            yl.setYongtu(yongtu);
        }
        if (PublicFunc.unEmpty(xihushuoming)) {
            yl.setYongtu(xihushuoming);
        }
        if (PublicFunc.unEmpty(tupian)) {
            yl.setTupian(tupian);
        }

        if (yl != null) {
            boolean unique = cgglService.checkCPUniqueness(yl);
            if (unique) {
                cgglService.insertZLGL_CP(yl);
                return "zlgl_cp";
            } else {
                request.setAttribute("zlgl_cp", yl);
                request.setAttribute("modifyzlgl_cperror", "已存在该条码!");
                return "addZLGL_CP";
            }
        }
        return SUCCESS;
    }

    private String add_ZLGL_BCP() {
        String xinghao = request.getParameter("xinghao");
        String beizhu = request.getParameter("beizhu");
        String guige = request.getParameter("guige");
        String sebie = request.getParameter("sebie");
        String xiaxian = request.getParameter("xiaxian");
        String danwei = request.getParameter("danwei");
        String xilie = request.getParameter("xilie");

        String kahao = request.getParameter("kahao");
        String zhenshu = request.getParameter("zhenshu");


        ZLGLBCPZL yl = new ZLGLBCPZL();
        if (PublicFunc.unEmpty(xinghao)) {
            yl.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(guige)) {
            yl.setGuige(guige);
        }
        if (PublicFunc.unEmpty(sebie)) {
            yl.setColor(sebie);
        }
        if (PublicFunc.unEmpty(xiaxian)) {
            yl.setXiaxian(xiaxian);
        }
        if (PublicFunc.unEmpty(danwei)) {
            yl.setDanwei(danwei);
        }
        if (PublicFunc.unEmpty(xilie)) {
            yl.setXilie(xilie);
        }
        if (PublicFunc.unEmpty(kahao)) {
             yl.setKahao(kahao);
        }
        if (PublicFunc.unEmpty(zhenshu)) {
            yl.setZhenshu(zhenshu);
        }

        if (yl != null) {
            boolean unique = cgglService.checkBCPUniqueness(yl);
            if (unique) {
                cgglService.insertZLGL_BCP(yl);
                return "zlgl_bcp";
            } else {
                request.setAttribute("zlgl_bcp", yl);
                request.setAttribute("modifyzlgl_bcperror", "已存在该型号!");
                return "addZLGL_BCP";
            }
        }
        return SUCCESS;
    }

    private String add_ZLGL_YL() {
        String xinghao = request.getParameter("xinghao");
        String beizhu = request.getParameter("beizhu");
        String guige = request.getParameter("guige");
        String chenfen = request.getParameter("chenfen");
        String zhongliang = request.getParameter("zhongliang");
        String xiaxian = request.getParameter("xiaxian");
        String danwei = request.getParameter("danwei");
        String xilie = request.getParameter("xilie");
        ZLGLYLZL yl = new ZLGLYLZL();
        if (PublicFunc.unEmpty(xinghao)) {
            yl.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(guige)) {
            yl.setGuige(guige);
        }
        if (PublicFunc.unEmpty(chenfen)) {
            yl.setChengfen(chenfen);
        }
        if (PublicFunc.unEmpty(zhongliang)) {
            yl.setZhongliang(Integer.valueOf(zhongliang));
        }
        if (PublicFunc.unEmpty(xiaxian)) {
            yl.setXiaxian(xiaxian);
        }
        if (PublicFunc.unEmpty(danwei)) {
            yl.setDanwei(danwei);
        }
        if (PublicFunc.unEmpty(xilie)) {
            yl.setXilie(xilie);
        }
        if (yl != null) {
            boolean unique = cgglService.checkYLUniqueness(yl);
            if (unique) {
                cgglService.insertZLGL_YL(yl);
                return "zlgl_yl";
            } else {
                request.setAttribute("zlgl_yl", yl);
                request.setAttribute("modifyzlgl_ylerror", "已存在该型号!");
                return "addZLGL_YL";
            }
        }
        return SUCCESS;
    }

    private String add_GYSXHGL() {
        GYSXH gysxh = new GYSXH();
        String gysname = request.getParameter("gysname");
        String xinghao = request.getParameter("xinghao");
        if (PublicFunc.unEmpty(xinghao)) {
            gysxh.setXinghao(xinghao);
        }
        if (PublicFunc.unEmpty(gysname)) {
            List<GYS> gyss = new ArrayList<GYS>();
            if (null != request.getSession().getAttribute("gyss")) {
                gyss = (List<GYS>) request.getSession().getAttribute("gyss");
            }
            for(int i=0;i<gyss.size();i++)
            {
                if(gyss.get(i).getGongyingname().equals(gysname))
                {
                    gysxh.setGysid(gyss.get(i).getId());
                    break;
                }
            }
        }

        if (gysxh != null) {
            boolean unique = cgglService.checkGYSXHUniqueness(gysxh);
            if (unique) {
                cgglService.insertGYSXHGL(gysxh);
                return "gys_xhgl";
            } else {
                request.setAttribute("gysxhgl", gysxh);
                request.setAttribute("modifygysxhglerror", "已存在供型号!");
                return "addGYSXHGL";
            }
        }
        return SUCCESS;
    }

    private String modify_DJGLAGYS() {
        CGGLDJGL djgl = new CGGLDJGL();
        String errormsg = "";
        String id = request.getParameter("id");
        String gysname = request.getParameter("gysname");
        String gysname_xh = request.getParameter("gysname_xh");

        String jiedanren = request.getParameter("jiedanren");
        if (PublicFunc.unEmpty(id) ) {
            djgl.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(jiedanren) ) {
            djgl.setJiedanren(jiedanren);
        }
        if (PublicFunc.unEmpty(gysname) ) {
            //gysname判断供应商NAME将 ID插入到单据表中,
            List<GYS> gyss = null;
            if(request.getSession().getAttribute("gyss") !=null)
            {
                gyss = (List<GYS>) request.getSession().getAttribute("gyss");
                int s=0;
                for(int i=0;i<gyss.size();i++)
                {
                    GYS gys = gyss.get(i);
                    if(gysname.equals(gys.getGongyingname()))
                    {
                        djgl.setGongyingshangid(gys.getId());
                        break;
                    }
                    else
                    {
                        s++;
                    }
                }
                if(s == gyss.size())
                {
                    errormsg = "不存在该供应商名称!";
                    djgl.setGongyingshangid(9999);
                }
            }
        }
        else
        {
            errormsg = "不存在该供应商名称!";
            djgl.setGongyingshangid(9999);
        }
        if (PublicFunc.unEmpty(gysname_xh) ) {
            djgl.setGyspinming(gysname_xh);
        }

        if(errormsg == "")
        {
            cgglService.updateDJGL(djgl);
            log.info("修改供应商信息");
            return "djgl_cg";
        }
        else
        {
            request.setAttribute("djgl_add", djgl);
            request.setAttribute("djglerror", errormsg);
            return "djgl_cg";
        }


    }

    private String add_DJGL() {
        String success_page = "djgl";
        String error_page = "addDJGL";
        CGGLDJGL djgl = new CGGLDJGL();
        String errormsg = "";

        String id = request.getParameter("id");
        String caigoudanid = request.getParameter("caigoudanid");
        String gystype = request.getParameter("gystype");
        String totalnum = request.getParameter("totalnum");
        String jiaohuoText = request.getParameter("jiaohuoText");
        String opname = request.getParameter("opname");
        String xiangxi = request.getParameter("xiangxi");
        if (PublicFunc.unEmpty(id) ) {
            djgl.setId(Integer.valueOf(id));
        }
        djgl.setGongyingshangid(0);
        djgl.setGyspinming("");
        if (PublicFunc.unEmpty(gystype)) {
            djgl.setLeixing(gystype);
            Map<String, Integer> map = new HashMap<String,Integer>();
            map.put("原料", 0);
            map.put("半成品", 1);
            map.put("成品", 2);
            map.put("商品", 3);
            System.out.println("gystype"+gystype);
            int index = map.get(gystype);
            String xinghao = request.getParameterValues("xinghao")[index];
            if(PublicFunc.unEmpty(xinghao))
            {
                djgl.setType_num(xinghao);
            }
        }
        if (PublicFunc.unEmpty(totalnum) ) {
            djgl.setCG_totalnum(new BigDecimal(totalnum));
        }
        if (PublicFunc.unEmpty(jiaohuoText) ) {
            djgl.setJiaohuo_time(PublicFunc.paseStringToDate(jiaohuoText));
        }
        if (PublicFunc.unEmpty(opname) ) {
            djgl.setUserName(opname);
        }
        if (PublicFunc.unEmpty(xiangxi) ) {
            djgl.setBeizhu(xiangxi);
        }
        if (PublicFunc.unEmpty(caigoudanid) ) {
            djgl.setCaigou_id(caigoudanid);
            boolean isuni = cgglService.checkDJGLUniqueness(djgl);
            if(!isuni)
            {
                if(errormsg == "")
                    errormsg = "采购单号重复!";
            }
        }
        if(errormsg == "")
        {
            djgl.setXiadan_time(new Date());
            djgl.setZhuangtai(PublicFunc.ORDER_STATE_NOPERSON);//初始化单据状态
            cgglService.insertDJGL(djgl);
            log.info("添加新采购单"+djgl.getUserName());
            return success_page;
        }
        else
        {
            request.setAttribute("djgl_add", djgl);
            request.setAttribute("modifydjglerror", errormsg);
            return error_page;
        }
    }

    /**
     * 根据ID获取供应商信息
     *
     * @return
     */
    private String preModify_GYSGL() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            GYS tmp = cgglService.getGYSById(Integer.valueOf(id));
            request.setAttribute("gysgl", tmp);
        }
        return "gysgl_modify";
    }

    /***
     * 预修改模块
     *
     * @param type
     * @return
     */
    private String preModify(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            return preModify_GYSGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSXHGL")) {
            return preModify_GYSXHGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("DJGL")) {
            return preModify_DJGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("DJGLAGYS")) {
            return preModify_DJGLAGYS();
        }

        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_YL")) {
            return preModify_ZLGL_YL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_BCP")) {
            return preModify_ZLGL_BCP();
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_CP")) {
            return preModify_ZLGL_CP();
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_SP")) {
            return preModify_ZLGL_SP();
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGTH")) {
            return preModify_CGTH();
        }

        return SUCCESS;
    }

    private String preModify_CGTH() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            CGTH tmp = cgglService.getCGTHById(Integer.valueOf(id));
            request.setAttribute("cgth", tmp);
        }
        return "cgth_modify";
    }

    private String preModify_ZLGL_SP() {
        // TODO Auto-generated method stub
        return null;
    }

    private String preModify_ZLGL_CP() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            ZLGLCPZL tmp = cgglService.getZLGL_CPById(Integer.valueOf(id));
            request.setAttribute("zlgl_cp", tmp);
        }
        return "zlglcp_modify";
    }

    private String preModify_ZLGL_BCP() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            ZLGLBCPZL tmp = cgglService.getZLGL_BCPById(Integer.valueOf(id));
            request.setAttribute("zlgl_bcp", tmp);
        }
        return "zlglbcp_modify";
    }

    private String preModify_ZLGL_YL() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            ZLGLYLZL tmp = cgglService.getZLGL_YLById(Integer.valueOf(id));
            request.setAttribute("zlgl_yl", tmp);
        }
        return "zlglyl_modify";
    }

    private String preModify_GYSXHGL() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            GYSXH tmp = cgglService.getGYSXHById(Integer.valueOf(id));
            request.setAttribute("gysxh", tmp);
        }
        return "gysxhgl_modify";
    }

    private String preModify_DJGLAGYS() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            CGGLDJGL tmp = cgglService.getDJGLById(Integer.valueOf(id));

            System.out.println("preModify_DJGL"+tmp.getGongyingshangid());
            request.getSession().setAttribute("djgl", tmp);
            List<GYS> gys = cgglService.findGYSByAll();
            request.getSession().setAttribute("gyss", gys);
            List<ZLGLYLZL> yls = cgglService.findYLByAll();
            List<ZLGLBCPZL> bcps = cgglService.findBCPByAll();
            List<ZLGLCPZL> cps = cgglService.findCPSByAll();
            List<ZLGLSPZL> sps	 = cgglService.findSPByAll();
            List<List<String>> strs = new ArrayList<List<String>>();
            List<String> str1 = new ArrayList<String>();
            List<String> str2 = new ArrayList<String>();
            List<String> str3 = new ArrayList<String>();
            List<String> str4 = new ArrayList<String>();
            for(int i=0;i<yls.size();i++)
            {
                str1.add(((ZLGLYLZL)(yls.get(i))).getType_num());
            }
            for(int i=0;i<bcps.size();i++)
            {
                str2.add(((ZLGLBCPZL)(bcps.get(i))).getType_num());
            }
            for(int i=0;i<cps.size();i++)
            {
                str3.add(((ZLGLCPZL)(cps.get(i))).getType_num());
            }
            for(int i=0;i<sps.size();i++)
            {
                str4.add(((ZLGLSPZL)(sps.get(i))).getType_num());
            }
            Map<String, List<String>> map = new HashMap<String, List<String>>();
            Collections.sort(str1);
            Collections.sort(str2);
            Collections.sort(str3);
            Collections.sort(str4);
            map.put("str1", str1);
            map.put("str2", str2);
            map.put("str3", str3);
            map.put("str4", str4);
            request.getSession().setAttribute("type_nums", map);
        }
        return "djgl_modify2";
    }
    private String preModify_DJGL() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            CGGLDJGL tmp = cgglService.getDJGLById(Integer.valueOf(id));

            System.out.println("preModify_DJGL"+tmp.getGongyingshangid());
            request.getSession().setAttribute("djgl", tmp);
            List<GYS> gys = cgglService.findGYSByAll();
            request.getSession().setAttribute("gyss", gys);
            List<ZLGLYLZL> yls = cgglService.findYLByAll();
            List<ZLGLBCPZL> bcps = cgglService.findBCPByAll();
            List<ZLGLCPZL> cps = cgglService.findCPSByAll();
            List<ZLGLSPZL> sps	 = cgglService.findSPByAll();
            List<List<String>> strs = new ArrayList<List<String>>();
            List<String> str1 = new ArrayList<String>();
            List<String> str2 = new ArrayList<String>();
            List<String> str3 = new ArrayList<String>();
            List<String> str4 = new ArrayList<String>();
            for(int i=0;i<yls.size();i++)
            {
                str1.add(((ZLGLYLZL)(yls.get(i))).getType_num());
            }
            for(int i=0;i<bcps.size();i++)
            {
                str2.add(((ZLGLBCPZL)(bcps.get(i))).getType_num());
            }
            for(int i=0;i<cps.size();i++)
            {
                str3.add(((ZLGLCPZL)(cps.get(i))).getType_num());
            }
            for(int i=0;i<sps.size();i++)
            {
                str4.add(((ZLGLSPZL)(sps.get(i))).getType_num());
            }
            Map<String, List<String>> map = new HashMap<String, List<String>>();
            Collections.sort(str1);
            Collections.sort(str2);
            Collections.sort(str3);
            Collections.sort(str4);
            map.put("str1", str1);
            map.put("str2", str2);
            map.put("str3", str3);
            map.put("str4", str4);
            request.getSession().setAttribute("type_nums", map);
        }
        return "djgl_modify";
    }

    /**
     * 修改页面
     *
     * @param type
     * @return
     */
    private String modify(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            return modify_GYSGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSXHGL")) {
            return modify_GYSXHGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("DJGL")) {
            return modify_DJGL();
        }

        if (PublicFunc.unEmpty(type) && type.equals("DJGLAGYS")) {
            return modify_DJGLAGYS();
        }

        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_YL")) {
            return modify_ZLGL_YL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_BCP")) {
            return modify_ZLGL_BCP();
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_CP")) {
            return modify_ZLGL_CP();
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZLGL_SP")) {
            return modify_ZLGL_SP();
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGTH")) {
            return modify_CGTH();
        }
        return SUCCESS;
    }

    private String modify_CGTH() {
        String id = request.getParameter("id");
        String shenqtime = request.getParameter("shenqtime");
        String tuihuoid = request.getParameter("tuihuoid");
        String caigouid = request.getParameter("caigouid");
        String danjia = request.getParameter("danjia");
        String shenqr = request.getParameter("shenqr");
        String liuyou = request.getParameter("liuyou");

        CGTH yl = new CGTH();
        if (PublicFunc.unEmpty(id)) {
            yl.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(shenqtime)) {
            yl.setApply_Time(PublicFunc.paseStringToDate(shenqtime,"yyyy/MM/dd"));
        }
        if (PublicFunc.unEmpty(caigouid)) {
            yl.setCaiGou_Id(caigouid);
        }
        if (PublicFunc.unEmpty(tuihuoid)) {
            yl.setTuiHuo_Id(tuihuoid);
        }
        if (PublicFunc.unEmpty(danjia)) {
            yl.setTuiHuoDanJia(new BigDecimal(danjia));
        }
        if (PublicFunc.unEmpty(shenqr)) {
            yl.setApply_Man(shenqr);
        }
        if (PublicFunc.unEmpty(liuyou)) {
            yl.setReason(liuyou);
        }
        if (yl != null) {
            yl.setZhuangtai("退货中");
            boolean unique = cgglService.checkCGTHUniqueness(yl);
            if (unique) {
                cgglService.updateCGTH(yl);
                return "cgth";
            } else {
                request.setAttribute("cgth", yl);
                request.setAttribute("modifycgtherror", "已存在该条码!");
                return "cgth_modify";
            }
        }
        return SUCCESS;
    }

    private String modify_ZLGL_SP() {
        // TODO Auto-generated method stub
        return null;
    }

    private String modify_ZLGL_CP() {
        String xinghao = request.getParameter("xinghao");
        String id = request.getParameter("id");
        String beizhu = request.getParameter("beizhu");
        String guige = request.getParameter("guige");
        String sebie = request.getParameter("sebie");
        String xiaxian = request.getParameter("xiaxian");
        String tiaoxingma = request.getParameter("tiaoma");
        String xilie = request.getParameter("xilie");
        String pinming = request.getParameter("pinming");
        String lingsj = request.getParameter("lingsj");
        String zhengqj = request.getParameter("zhengqj");
        String sanbmj = request.getParameter("sanbmj");
        String pifajia = request.getParameter("pifajia");
        String zidingyijia = request.getParameter("zidingyijia");
        String danwei = request.getParameter("danwei");
        String chenfen = request.getParameter("chenfen");
        String kezhong = request.getParameter("kezhong");
        String sphuawei = request.getParameter("sphuawei");
        String czhuawei = request.getParameter("czhuawei");
        String yongtu = request.getParameter("yongtu");
        String xihushuoming = request.getParameter("xihushuoming");
        String tupian = request.getParameter("tupian");

        ZLGLCPZL yl = new ZLGLCPZL();
        if (PublicFunc.unEmpty(id)) {
            yl.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(xinghao)) {
            yl.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(guige)) {
            yl.setGuige(guige);
        }
        if (PublicFunc.unEmpty(sebie)) {
            yl.setColor(sebie);
        }
        if (PublicFunc.unEmpty(xiaxian)) {
            yl.setXiaxian(xiaxian);
        }
        if (PublicFunc.unEmpty(tiaoxingma)) {
            yl.setTiaoxingma(tiaoxingma);
        }
        if (PublicFunc.unEmpty(xilie)) {
            yl.setXilie(xilie);
        }
        if (PublicFunc.unEmpty(pinming)) {
            yl.setPinming(pinming);
        }
        if (PublicFunc.unEmpty(lingsj)) {
            yl.setLingjianjia(new BigDecimal(lingsj));
        }
        if (PublicFunc.unEmpty(zhengqj)) {
            yl.setZhengjuanjia(new BigDecimal(zhengqj));
        }
        if (PublicFunc.unEmpty(sanbmj)) {
            yl.setBaimijia(new BigDecimal(sanbmj));
        }
        if (PublicFunc.unEmpty(pifajia)) {
            yl.setPifajia(new BigDecimal(pifajia));
        }
        if (PublicFunc.unEmpty(zidingyijia)) {
            yl.setZidingyijia(new BigDecimal(zidingyijia));
        }
        if (PublicFunc.unEmpty(danwei)) {
            yl.setDanwei(danwei);
        }
        if (PublicFunc.unEmpty(chenfen)) {
            yl.setChengfen(chenfen);
        }
        if (PublicFunc.unEmpty(kezhong)) {
            yl.setWeigh(kezhong);
        }
        if (PublicFunc.unEmpty(sphuawei)) {
            yl.setWeigh(sphuawei);
        }
        if (PublicFunc.unEmpty(czhuawei)) {
            yl.setCZ_huawei(czhuawei);
        }
        if (PublicFunc.unEmpty(yongtu)) {
            yl.setYongtu(yongtu);
        }
        if (PublicFunc.unEmpty(xihushuoming)) {
            yl.setYongtu(xihushuoming);
        }
        if (PublicFunc.unEmpty(tupian)) {
            yl.setTupian(tupian);
        }

        if (yl != null) {
            boolean unique = cgglService.checkCPUniqueness(yl);
            if (unique) {
                cgglService.updateZLGL_CP(yl);
                return "zlgl_cp";
            } else {
                request.setAttribute("zlgl_cp", yl);
                request.setAttribute("modifyzlgl_cperror", "已存在该条码!");
                return "zlglcp_modify";
            }
        }
        return SUCCESS;
    }

    private String modify_ZLGL_BCP() {
        String xinghao = request.getParameter("xinghao");
        String beizhu = request.getParameter("beizhu");
        String guige = request.getParameter("guige");
        String sebie = request.getParameter("sebie");
        String xiaxian = request.getParameter("xiaxian");
        String danwei = request.getParameter("danwei");
        String xilie = request.getParameter("xilie");
        String id = request.getParameter("id");

        String kahao = request.getParameter("kahao");
        String zhenshu = request.getParameter("zhenshu");

        ZLGLBCPZL yl = new ZLGLBCPZL();
        if (PublicFunc.unEmpty(id)) {
            yl.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(xinghao)) {
            yl.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(guige)) {
            yl.setGuige(guige);
        }
        if (PublicFunc.unEmpty(sebie)) {
            yl.setColor(sebie);
        }
        if (PublicFunc.unEmpty(xiaxian)) {
            yl.setXiaxian(xiaxian);
        }
        if (PublicFunc.unEmpty(danwei)) {
            yl.setDanwei(danwei);
        }
        if (PublicFunc.unEmpty(xilie)) {
            yl.setXilie(xilie);
        }
        if (PublicFunc.unEmpty(kahao)) {
            yl.setKahao(kahao);
        }
        if (PublicFunc.unEmpty(zhenshu)) {
            yl.setZhenshu(zhenshu);
        }
        if (yl != null) {
            boolean unique = cgglService.checkBCPUniqueness(yl);
            if (unique) {
                cgglService.updateZLGL_BCP(yl);
                return "zlgl_bcp";
            } else {
                request.setAttribute("zlgl_bcp", yl);
                request.setAttribute("modifyzlgl_bcperror", "已存在该型号!");
                return "zlglbcp_modify";
            }
        }
        return SUCCESS;
    }

    private String modify_ZLGL_YL() {
        String id = request.getParameter("id");
        String xinghao = request.getParameter("xinghao");
        String beizhu = request.getParameter("beizhu");
        String guige = request.getParameter("guige");
        String chenfen = request.getParameter("chenfen");
        String zhongliang = request.getParameter("zhongliang");
        String xiaxian = request.getParameter("xiaxian");
        String danwei = request.getParameter("danwei");
        String xilie = request.getParameter("xilie");
        ZLGLYLZL yl = new ZLGLYLZL();
        if (PublicFunc.unEmpty(id)) {
            yl.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(xinghao)) {
            yl.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(guige)) {
            yl.setGuige(guige);
        }
        if (PublicFunc.unEmpty(chenfen)) {
            yl.setChengfen(chenfen);
        }
        if (PublicFunc.unEmpty(zhongliang)) {
            yl.setZhongliang(Integer.valueOf(zhongliang));
        }
        if (PublicFunc.unEmpty(xiaxian)) {
            yl.setXiaxian(xiaxian);
        }
        if (PublicFunc.unEmpty(danwei)) {
            yl.setDanwei(danwei);
        }
        if (PublicFunc.unEmpty(xilie)) {
            yl.setXilie(xilie);
        }
        if (yl != null) {
            boolean unique = cgglService.checkYLUniqueness(yl);
            if (unique) {
                cgglService.updateZLGL_YL(yl);
                return "zlgl_yl";
            } else {
                request.setAttribute("zlgl_yl", yl);
                request.setAttribute("modifyzlgl_ylerror", "已存在该型号!");
                return "zlglyl_modify";
            }
        }
        return SUCCESS;
    }

    private String modify_GYSXHGL() {
        GYSXH gysxh = new GYSXH();
        String gysname = request.getParameter("gysname");
        String xinghao = request.getParameter("xinghao");
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(xinghao)) {
            gysxh.setXinghao(xinghao);
        }
        if (PublicFunc.unEmpty(id)) {
            gysxh.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(gysname)) {
            List<GYS> gyss = new ArrayList<GYS>();
            if (null != request.getSession().getAttribute("gyss")) {
                gyss = (List<GYS>) request.getSession().getAttribute("gyss");
            }
            for(int i=0;i<gyss.size();i++)
            {
                if(gyss.get(i).getGongyingname().equals(gysname))
                {
                    gysxh.setGysid(gyss.get(i).getId());
                    break;
                }
            }
        }

        if (gysxh != null) {
            boolean unique = cgglService.checkGYSXHUniqueness(gysxh);
            if (unique) {
                cgglService.updateGYSXHGL(gysxh);
                return "gys_xhgl";
            } else {
                request.setAttribute("gysxhgl", gysxh);
                request.setAttribute("modifygysxhglerror", "已存在供型号!");
                return "gysxhgl_modify";
            }
        }
        return SUCCESS;
    }

    private String modify_DJGL() {
        String success_page = "djgl";
        String error_page = "djgl_modify";
        CGGLDJGL djgl = new CGGLDJGL();

        String id = request.getParameter("id");
        String caigoudanid = request.getParameter("caigoudanid");
        String gystype = request.getParameter("gystype");
        String totalnum = request.getParameter("totalnum");
        String jiaohuoText = request.getParameter("jiaohuoText");
        String opname = request.getParameter("opname");
        String xiangxi = request.getParameter("xiangxi");
        if (PublicFunc.unEmpty(id) ) {
            djgl.setId(Integer.valueOf(id));
        }

        if (PublicFunc.unEmpty(gystype)) {
            djgl.setLeixing(gystype);
            Map<String, Integer> map = new HashMap<String,Integer>();
            map.put("原料", 0);
            map.put("半成品", 1);
            map.put("成品", 2);
            map.put("商品", 3);
            System.out.println("gystype"+gystype);
            int index = map.get(gystype);
            String xinghao = request.getParameterValues("xinghao")[index];
            if(PublicFunc.unEmpty(xinghao))
            {
                djgl.setType_num(xinghao);
            }
        }
        if (PublicFunc.unEmpty(totalnum) ) {
            djgl.setCG_totalnum(new BigDecimal(totalnum));
        }
        if (PublicFunc.unEmpty(jiaohuoText) ) {
            djgl.setJiaohuo_time(PublicFunc.paseStringToDate(jiaohuoText));
        }
        if (PublicFunc.unEmpty(opname) ) {
            djgl.setUserName(opname);
        }
        if (PublicFunc.unEmpty(xiangxi) ) {
            djgl.setBeizhu(xiangxi);
        }
        if (PublicFunc.unEmpty(caigoudanid) ) {
            djgl.setCaigou_id(caigoudanid);
        }

        if (djgl != null) {
            cgglService.updateDJGL(djgl);
            return success_page;
        }
        return SUCCESS;
    }

    /**
     * 修改供应商管理
     *
     * @return
     */
    private String modify_GYSGL() {
        String id = request.getParameter("id");
        String gysname = request.getParameter("gysname");
        String gysname_j = request.getParameter("gysname_j");
        String gystype = request.getParameter("gystype");
        String telephone = request.getParameter("telephone");
        String telename = request.getParameter("telename");
        String phone = request.getParameter("phone");
        String cz = request.getParameter("cz");
        String kpmc = request.getParameter("kpmc");
        String kpdz = request.getParameter("kpdz");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String khhzh = request.getParameter("khhzh");
        String xiangxi = request.getParameter("xiangxi");
        GYS gys = new GYS();
        if (PublicFunc.unEmpty(id)) {
            gys.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(gysname)) {
            gys.setGongyingname(gysname);
        }
        if (PublicFunc.unEmpty(gysname_j)) {
            gys.setSuoxie(gysname_j);
        }
        if (PublicFunc.unEmpty(gystype) && !("--请选择--").equals(gystype)) {
            gys.setLeixing(gystype);
        }
        if (PublicFunc.unEmpty(telephone)) {
            gys.setTelephone(telephone);
        }
        if (PublicFunc.unEmpty(telename)) {
            gys.setSeller(telename);
        }
        if (PublicFunc.unEmpty(phone)) {
            gys.setPhone(phone);
        }
        if (PublicFunc.unEmpty(cz)) {
            gys.setChuanzhen(cz);
        }
        if (PublicFunc.unEmpty(kpmc)) {
            gys.setKpmc1(kpmc);
        }
        if (PublicFunc.unEmpty(kpdz)) {
            gys.setKpaddress1(kpdz);
        }
        if (PublicFunc.unEmpty(address)) {
            gys.setAddress(address);
        }
        if (PublicFunc.unEmpty(email)) {
            gys.setEmail(email);
        }
        if (PublicFunc.unEmpty(khhzh)) {
            gys.setKhhzh1(khhzh);
        }
        if (PublicFunc.unEmpty(xiangxi)) {
            gys.setBeizhu(xiangxi);
        }

        if (gys != null) {
            boolean unique = cgglService.checkGYSUniqueness(gys);
            if (unique) {
                cgglService.updateGYSGL(gys);
                return "gysgl";
            } else {
                request.setAttribute("gysgl", gys);
                request.setAttribute("modifygysglerror", "已存在该供应商名!");
                return "gysgl_modify";
            }
        }
        return SUCCESS;
    }
}
