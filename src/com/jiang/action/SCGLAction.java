package com.jiang.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiang.bean.BCPKJ_Apply;
import com.jiang.bean.SCRuKu;
import com.jiang.bean.WJGgongyidan;
import com.jiang.bean.YBgongyidan;
import com.jiang.bean.ZJGgongyidan;
import com.jiang.bean.caiGouZhiLing;
import com.jiang.bean.cangKuChaXun;
import com.jiang.bean.gongYingShang;
import com.jiang.bean.wJGGongYingShang;
import com.jiang.bean.zhiJianReport;
import com.jiang.service.CGGLService;
import com.jiang.service.CKGLService;
import com.jiang.service.SCGLService;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;

@SuppressWarnings("serial")
public class SCGLAction extends BaseAction {

    Logger log = Logger.getLogger(SCGLAction.class);

    @Autowired
    private SCGLService sCGLService;

    @Autowired
    private CGGLService cggLService;

    @Autowired
    private CKGLService ckgLService;

    public String dolist() {
        Result result = new Result();
        String hidden = request.getParameter(HIDDEN);
        String type = request.getParameter(TYPE);
        String sortOrder = request.getParameter(SORTORDER);
        String sortName = request.getParameter(SORTNAME);
        log.info("parm hidden =" + hidden);
        log.info("parm type =" + type);
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
         * premodify模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("premodify")) {
            return premodify(type);
        }
        /**
         * 修改模块
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("modify")) {
            return modify(type);
        }

        if (PublicFunc.unEmpty(hidden) && hidden.equals("disable")) {
            return disable(type);
        }
        if (PublicFunc.unEmpty(hidden) && hidden.equals("kaijian")) {
            return kaijian(type);
        }
        return SUCCESS;
    }
    private String kaijian(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
            return kaijianBCPKJAPPLY();
        }
        if (PublicFunc.unEmpty(type) && type.equals("CPKJAPPLY")) {
            return kaijianCPKJAPPLY();
        }
        return SUCCESS;
    }

    private String kaijianCPKJAPPLY() {
        String id  = request.getParameter("id");
        String newbupiid  = request.getParameter("newbupiid");
        String username  = request.getParameter("username");
        String datetime  = request.getParameter("datetime");
        BCPKJ_Apply   bcpkj = new BCPKJ_Apply();
        if(id != null)
        {
            bcpkj.setId(Integer.valueOf(id));
        }
        if(newbupiid != null)
        {
            bcpkj.setNew_bupi_id(newbupiid);
        }
        if(username != null)
        {
            try {
                username = new String(username.getBytes("ISO8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            bcpkj.setQueren_man(username);
        }
        if(datetime != null)
        {
            log.info("not null");
            bcpkj.setQueren_time(PublicFunc.paseStringToDate(datetime));
            bcpkj.setZhuangtai(PublicFunc.KJ_STATE_FINISH);
            ckgLService.setKJCPFinish(bcpkj);
        }

        log.info("id"+id);
        log.info("newbupiid"+newbupiid);
        log.info("username"+username);
        log.info("datetime"+datetime);

        return SUCCESS;
    }
    private String kaijianBCPKJAPPLY() {
        String id  = request.getParameter("id");
        String newbupiid  = request.getParameter("newbupiid");
        String username  = request.getParameter("username");
        String datetime  = request.getParameter("datetime");
        BCPKJ_Apply   bcpkj = new BCPKJ_Apply();
        if(id != null)
        {
            bcpkj.setId(Integer.valueOf(id));
        }
        if(newbupiid != null)
        {
            bcpkj.setNew_bupi_id(newbupiid);
        }
        if(username != null)
        {
            try {
                username = new String(username.getBytes("ISO8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            bcpkj.setQueren_man(username);
        }
        if(datetime != null)
        {
            log.info("not null");
            bcpkj.setQueren_time(PublicFunc.paseStringToDate(datetime));
            bcpkj.setZhuangtai(PublicFunc.KJ_STATE_FINISH);
            ckgLService.setKJFinish(bcpkj);
        }

        log.info("id"+id);
        log.info("newbupiid"+newbupiid);
        log.info("username"+username);
        log.info("datetime"+datetime);

        return SUCCESS;
    }


    private String disable(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
            return disableBCPKJAPPLY(type);
        }
        return SUCCESS;
    }
    private String disableBCPKJAPPLY(String type) {
        String id = request.getParameter("id");
        boolean isok = sCGLService.disableBCPKJAPPLY(Integer.valueOf(id));
        return SUCCESS;
    }
    private String modify(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("SCGLZJG")) {
            return modifySCGLZJG(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLWJG")) {
           return modifySCGLWJG(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLYB")) {
            return modifySCGLYB(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("WJGDWGL")) {
            return modifyWJGDWGL(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
            return modifyBCPKJ_Apply(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHIJIAN_CG")) {
            return modifyZHIJIAN_CG(type);
        }

        return SUCCESS;

    }

    private String modifyZHIJIAN_CG(String type) {
        String bptiaoma  = request.getParameter("bptiaoma");
        String shijimishu  = request.getParameter("shijimishu");
        String beizhu  = request.getParameter("beizhu");
        String cgdid  = (String) request.getSession().getAttribute("cgdid");
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            beizhu = new String(beizhu.getBytes("ISO8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        map.put("bptiaoma", bptiaoma);
        map.put("shijimishu", shijimishu);
        map.put("beizhu", beizhu);
        sCGLService.changeStateZJ_CG(map);
        int zjcount = ckgLService.getZHIJIANCountByCGID(cgdid);
        request.getSession().setAttribute("zhijiancount", zjcount+"");
        return "addCGZHIJIAN";
    }

    private String modifyBCPKJ_Apply(String type) {
        String id  = request.getParameter("id");
        String danhao  = request.getParameter("danhao");
        String bupiid  = request.getParameter("bupiid");
        String xinghao = request.getParameter("xinghao");
        String mishu  = request.getParameter("mishu");
        String getmishu  = request.getParameter("getmishu");
        String beizhu   = request.getParameter("beizhu");
        String shenqren  = request.getParameter("shenqren");
        String shenqtime  = request.getParameter("shenqtime");
        BCPKJ_Apply zjg = new BCPKJ_Apply();
        if (PublicFunc.unEmpty(danhao)) {
            zjg.setKaijian_id(danhao);
        }
        if (PublicFunc.unEmpty(id)) {
            zjg.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(bupiid)) {
            zjg.setBupi_id(bupiid);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(mishu)) {
            zjg.setYuanmishu(mishu);
        }
        if (PublicFunc.unEmpty(getmishu)) {
            zjg.setJianchumishu(getmishu);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(shenqren)) {
            zjg.setApply_man(shenqren);
        }


        if (PublicFunc.unEmpty(shenqtime)) {
            zjg.setApply_time(PublicFunc.paseStringToDate(shenqtime));
        }

        if (zjg != null) {
            boolean unique = sCGLService.checkBCPKJAPPLYUniqueness(zjg);
            if (unique) {
                sCGLService.updateBCPKJAPPLY(zjg);
                return "BCPKJAPPLY";
            } else {
                request.setAttribute("bcpkj", zjg);
                request.setAttribute("modifybcpkjerror", "已存在该编号!");
                return "addBCPKJAPPLY";
            }
        }
        return SUCCESS;
    }

    private String modifyWJGDWGL(String type) {
        String id= request.getParameter("id");
        String jgdanwei= request.getParameter("jgdanwei");
        String suoxie= request.getParameter("suoxie");
        String leixing=request.getParameter("leixing");
        String telephone= request.getParameter("telephone");
        String person= request.getParameter("person");
        String phone= request.getParameter("phone");
        String urladdress= request.getParameter("urladdress");
        String chuanzhen= request.getParameter("chuanzhen");
        String kaipname= request.getParameter("kaipname");
        String kpaddress= request.getParameter("kpaddress");
        String address= request.getParameter("address");
        String email= request.getParameter("email");
        String kaihuZh= request.getParameter("kaihuZh");
        String beizhu= request.getParameter("beizhu");

        wJGGongYingShang zjg = new wJGGongYingShang();
        if (PublicFunc.unEmpty(id)) {
            zjg.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(jgdanwei)) {
            zjg.setDanweiname(jgdanwei);
        }
        if (PublicFunc.unEmpty(suoxie)) {
            zjg.setSuoxie(suoxie);
        }
        if (PublicFunc.unEmpty(telephone)) {
            zjg.setTelephone(telephone);
        }
        if (PublicFunc.unEmpty(person)) {
            zjg.setSeller(person);
        }
        if (PublicFunc.unEmpty(phone)) {
            zjg.setPhone(phone);
        }
        if (PublicFunc.unEmpty(urladdress)) {
            zjg.setWeb(urladdress);
        }
        if (PublicFunc.unEmpty(chuanzhen)) {
            zjg.setChuanzhen(chuanzhen);
        }
        if (PublicFunc.unEmpty(kaipname)) {
            zjg.setKpmc(kaipname);
        }
        if (PublicFunc.unEmpty(kpaddress)) {
            zjg.setKpaddress(kpaddress);
        }
        if (PublicFunc.unEmpty(address)) {
            zjg.setAddress(address);
        }
        if (PublicFunc.unEmpty(email)) {
            zjg.setEmail(email);
        }
        if (PublicFunc.unEmpty(kaihuZh)) {
            zjg.setKhhzh(kaihuZh);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }

        if (PublicFunc.unEmpty(leixing) && !("--请选择--").equals(leixing)) {
            zjg.setJGleixing(leixing);
        }

        if (zjg != null) {
            sCGLService.updateWJGDWGL(zjg);
            return "WJGDWGL";
        }
        return SUCCESS;
    }

    private String modifySCGLYB(String type) {
        String id = request.getParameter("id");
        String gydid = request.getParameter("gydid");
        String jgxinghao = request.getParameter("jgxinghao");
        String xinghao = request.getParameter("xinghao");
        String shuliang = request.getParameter("shuliang");
        String beizhu = request.getParameter("beizhu");
        String xiadanren = request.getParameter("xiadanren");
        String diaoka = request.getParameter("diaoka");
        String xiadantime = request.getParameter("xiadantime");
        YBgongyidan zjg = new YBgongyidan();
        if (PublicFunc.unEmpty(id)) {
            zjg.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setyBGongYiId(gydid);
        }
        if (PublicFunc.unEmpty(jgxinghao)) {
            zjg.setxJType(jgxinghao);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setyBtype(xinghao);
        }
        if (PublicFunc.unEmpty(shuliang)) {
            zjg.setNum(Integer.valueOf(shuliang));
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeiZhu(beizhu);
        }
        if (PublicFunc.unEmpty(xiadanren)) {
            zjg.setKaiDanRen(xiadanren);
        }
        if (PublicFunc.unEmpty(xiadantime)) {
            zjg.setKaiDanTime(PublicFunc.paseStringToDate(xiadantime));
        }

        if (PublicFunc.unEmpty(diaoka) && !("--请选择--").equals(diaoka)) {
            zjg.setkHoRyB(diaoka);
        }

        if (zjg != null) {
            boolean unique = sCGLService.checkSCGLYBUniqueness(zjg);
            if (unique) {
                sCGLService.updateSCGLYB(zjg);
                return "SCGLYB";
            } else {
                request.setAttribute("yb", zjg);
                request.setAttribute("modifyyberror", "已存在该编号!");
                return "addSCGLYB";
            }
        }
        return SUCCESS;
    }

    private String modifySCGLWJG(String type) {
        String gydid = request.getParameter("gydid");
        String id = request.getParameter("id");
        String jgxinghao = request.getParameter("jgxinghao");
        String xinghao = request.getParameter("xinghao");
        String dbmingchen = request.getParameter("dbmingchen");
        String shuliang = request.getParameter("shuliang");
        String jhtime = request.getParameter("jhtime");
        String beizhu = request.getParameter("beizhu");
        String xiadanren = request.getParameter("xiadanren");
        String chejian = request.getParameter("chejian");
        String gongyi = request.getParameter("gongyi");
        String xiadantime = request.getParameter("xiadantime");

        String jgtype = request.getParameter("jgtype");
         WJGgongyidan  zjg = new WJGgongyidan();
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(jgtype)) {
            zjg.setJgtype(jgtype);
        }
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setBianhao(gydid);
        }
        if (PublicFunc.unEmpty(jgxinghao)) {
            zjg.setDown_typeNum(jgxinghao);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setUP_typeNum(xinghao);
        }
        if (PublicFunc.unEmpty(dbmingchen)) {
            zjg.setDibuName(dbmingchen);
        }
        if (PublicFunc.unEmpty(shuliang)) {
            zjg.setNum(Integer.valueOf(shuliang));
        }
        if (PublicFunc.unEmpty(jhtime)) {
            zjg.setJiaohuo_time(PublicFunc.paseStringToDate(jhtime));
        }

        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(xiadanren)) {
            zjg.setKaidanren(xiadanren);
        }
        if (PublicFunc.unEmpty(xiadantime)) {
            zjg.setKaidantime(PublicFunc.paseStringToDate(xiadantime));
        }

        if (PublicFunc.unEmpty(chejian) && !("--请选择--").equals(chejian)) {
            zjg.setJG_danwei(chejian);
        }
        if (PublicFunc.unEmpty(gongyi) && !("--请选择--").equals(gongyi)) {
            zjg.setGongyi(gongyi);
        }
        if (zjg != null) {
            boolean unique = sCGLService.checkSCGLWJGUniqueness(zjg);
            if (unique) {
                sCGLService.updateSCGLWJG(zjg);
                return "SCGLWJG";
            } else {
                request.setAttribute("wjg", zjg);
                request.setAttribute("modifywjgglerror", "已存在该编号!");
                return "modifySCGLWJG";
            }
        }
        return SUCCESS;
    }
    private String modifySCGLZJG(String type) {
        String gydid = request.getParameter("gydid");
        String id = request.getParameter("id");
        String jgxinghao = request.getParameter("jgxinghao");
        String xinghao = request.getParameter("xinghao");
        String dbmingchen = request.getParameter("dbmingchen");
        String shuliang = request.getParameter("shuliang");
        String jhtime = request.getParameter("jhtime");
        String beizhu = request.getParameter("beizhu");
        String xiadanren = request.getParameter("xiadanren");
        String chejian = request.getParameter("chejian");
        String gongyi = request.getParameter("gongyi");
        String xiadantime = request.getParameter("xiadantime");

        String jgtype = request.getParameter("jgtype");
        ZJGgongyidan zjg = new ZJGgongyidan();
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(jgtype)) {
            zjg.setJgtype(jgtype);
        }
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setBianhao(gydid);
        }
        if (PublicFunc.unEmpty(jgxinghao)) {
            zjg.setDown_typeNum(jgxinghao);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setUp_typeNum(xinghao);
        }
        if (PublicFunc.unEmpty(dbmingchen)) {
            zjg.setDibuName(dbmingchen);
        }
        if (PublicFunc.unEmpty(shuliang)) {
            zjg.setNum(Integer.valueOf(shuliang));
        }
        if (PublicFunc.unEmpty(jhtime)) {
            zjg.setJiaohuo_time(PublicFunc.paseStringToDate(jhtime));
        }

        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(xiadanren)) {
            zjg.setKaidanren(xiadanren);
        }
        if (PublicFunc.unEmpty(xiadantime)) {
            zjg.setKaidantime(PublicFunc.paseStringToDate(xiadantime));
        }

        if (PublicFunc.unEmpty(chejian) && !("--请选择--").equals(chejian)) {
            zjg.setChejian(chejian);
        }
        if (PublicFunc.unEmpty(gongyi) && !("--请选择--").equals(gongyi)) {
            zjg.setGongyi(gongyi);
        }
        if (zjg != null) {
            boolean unique = sCGLService.checkSCGLZJGUniqueness(zjg);
            if (unique) {
                sCGLService.updateSCGLZJG(zjg);
                return "SCGLZJG";
            } else {
                request.setAttribute("zjg", zjg);
                request.setAttribute("modifyzjgglerror", "已存在该编号!");
                return "modifySCGLZJG";
            }
        }
        return SUCCESS;
    }
    private String premodify(String type) {

        if (PublicFunc.unEmpty(type) && type.equals("SCGLZJG")) {
            return premodifySCGLZJG(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLWJG")) {
            return premodifySCGLWJG(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLYB")) {
            return premodifySCGLYB(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("WJGDWGL")) {
            return premodifyWJGDWGL(type);
        }
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
            return premodifyBCPKJAPPLY(type);
        }

        return SUCCESS;

    }

    private String premodifyBCPKJAPPLY(String type) {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            BCPKJ_Apply tmp = sCGLService.getBCPKJ_ApplyById(Integer.valueOf(id));
            request.setAttribute("bcpkj", tmp);
        }
        return "modifyBCPKJAPPLY";
    }

    private String premodifyWJGDWGL(String type) {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            wJGGongYingShang tmp = sCGLService.getWJGDWGLById(Integer.valueOf(id));
            request.setAttribute("wjgdwgl", tmp);
        }
        return "modifyWJGDWGL";
    }

    private String premodifySCGLYB(String type) {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            YBgongyidan tmp = sCGLService.getSCGLYBById(Integer.valueOf(id));
            request.setAttribute("yb", tmp);
        }
        return "modifySCGLYB";
    }

    private String premodifySCGLZJG(String type) {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            ZJGgongyidan tmp = sCGLService.getSCGLZJGById(Integer.valueOf(id));
            request.setAttribute("zjg", tmp);
        }
        return "modifySCGLZJG";
    }
    private String premodifySCGLWJG(String type) {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            WJGgongyidan tmp = sCGLService.getSCGLWJGById(Integer.valueOf(id));
            request.setAttribute("wjg", tmp);
        }
        return "modifySCGLWJG";
    }

    private String add(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("SCGLZJG")) {
            return addSCGLZJG();
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLWJG")) {
            return addSCGLWJG();
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLYB")) {
            return addSCGLYB();
        }
        if (PublicFunc.unEmpty(type) && type.equals("WJGDWGL")) {
            return addWJGDWGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
            return addBCPKJAPPLY();
        }
        if (PublicFunc.unEmpty(type) && type.equals("CPKJAPPLY")) {
            return addCPKJAPPLY();
        }


        return SUCCESS;
    }

    private String addBCPKJAPPLY() {
        String danhao  = request.getParameter("danhao");
        String bupiid  = request.getParameter("bupiid");
        String xinghao = request.getParameter("xinghao");
        String mishu  = request.getParameter("mishu");
        String getmishu  = request.getParameter("getmishu");
        String beizhu   = request.getParameter("beizhu");
        String shenqren  = request.getParameter("shenqren");
        String shenqtime  = request.getParameter("shenqtime");
        BCPKJ_Apply zjg = new BCPKJ_Apply();
        if (PublicFunc.unEmpty(danhao)) {
            zjg.setKaijian_id(danhao);
        }
        if (PublicFunc.unEmpty(bupiid)) {
            zjg.setBupi_id(bupiid);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(mishu)) {
            zjg.setYuanmishu(mishu);
        }
        if (PublicFunc.unEmpty(getmishu)) {
            zjg.setJianchumishu(getmishu);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(shenqren)) {
            zjg.setApply_man(shenqren);
        }
        if (PublicFunc.unEmpty(shenqtime)) {
            zjg.setApply_time(PublicFunc.paseStringToDate(shenqtime));
        }

        if (zjg != null) {
            boolean unique = sCGLService.checkBCPKJAPPLYUniqueness(zjg);
            if (unique) {
                zjg.setZhuangtai(PublicFunc.KJ_STATE_WAITING);
                zjg.setShunhao("0.0");
               boolean isok =  sCGLService.insertBCPKJAPPLY(zjg);
               if(isok)
               {
                   return "BCPKJAPPLY";
               }
                else
               {
                   request.setAttribute("bcpkj", zjg);
                   request.setAttribute("modifybcpkjerror", "修改仓库时出错!");
                   return "addBCPKJAPPLY";
               }
            } else {
                request.setAttribute("bcpkj", zjg);
                request.setAttribute("modifybcpkjerror", "已存在该编号!");
                return "addBCPKJAPPLY";
            }
        }
        return SUCCESS;
    }
    private String addCPKJAPPLY() {
        String danhao  = request.getParameter("danhao");
        String bupiid  = request.getParameter("bupiid");
        String xinghao = request.getParameter("xinghao");
        String mishu  = request.getParameter("mishu");
        String getmishu  = request.getParameter("getmishu");
        String beizhu   = request.getParameter("beizhu");
        String shenqren  = request.getParameter("shenqren");
        String shenqtime  = request.getParameter("shenqtime");
        BCPKJ_Apply zjg = new BCPKJ_Apply();
        if (PublicFunc.unEmpty(danhao)) {
            zjg.setKaijian_id(danhao);
        }
        if (PublicFunc.unEmpty(bupiid)) {
            zjg.setBupi_id(bupiid);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setType_num(xinghao);
        }
        if (PublicFunc.unEmpty(mishu)) {
            zjg.setYuanmishu(mishu);
        }
        if (PublicFunc.unEmpty(getmishu)) {
            zjg.setJianchumishu(getmishu);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(shenqren)) {
            zjg.setApply_man(shenqren);
        }
        if (PublicFunc.unEmpty(shenqtime)) {
            zjg.setApply_time(PublicFunc.paseStringToDate(shenqtime));
        }

        if (zjg != null) {
            boolean unique = sCGLService.checkCPKJAPPLYUniqueness(zjg);
            if (unique) {
                zjg.setZhuangtai(PublicFunc.KJ_STATE_WAITING);
                zjg.setShunhao("0.0");
                boolean isok =  sCGLService.insertCPKJAPPLY(zjg);
                if(isok)
                {
                    return "cpkjapply";
                }
                else
                {
                    request.setAttribute("bcpkj", zjg);
                    request.setAttribute("modifybcpkjerror", "修改仓库时出错!");
                    return "addCPKJAPPLY";
                }
            } else {
                request.setAttribute("bcpkj", zjg);
                request.setAttribute("modifybcpkjerror", "已存在该编号!");
                return "addCPKJAPPLY";
            }
        }
        return SUCCESS;
    }
    private String addWJGDWGL() {
        String jgdanwei= request.getParameter("jgdanwei");
        String suoxie= request.getParameter("suoxie");
        String leixing=request.getParameter("leixing");
        String telephone= request.getParameter("telephone");
        String person= request.getParameter("person");
        String phone= request.getParameter("phone");
        String urladdress= request.getParameter("urladdress");
        String chuanzhen= request.getParameter("chuanzhen");
        String kaipname= request.getParameter("kaipname");
        String kpaddress= request.getParameter("kpaddress");
        String address= request.getParameter("address");
        String email= request.getParameter("email");
        String kaihuZh= request.getParameter("kaihuZh");
        String beizhu= request.getParameter("beizhu");

        wJGGongYingShang zjg = new wJGGongYingShang();
        if (PublicFunc.unEmpty(jgdanwei)) {
            zjg.setDanweiname(jgdanwei);
        }
        if (PublicFunc.unEmpty(suoxie)) {
            zjg.setSuoxie(suoxie);
        }
        if (PublicFunc.unEmpty(telephone)) {
            zjg.setTelephone(telephone);
        }
        if (PublicFunc.unEmpty(person)) {
            zjg.setSeller(person);
        }
        if (PublicFunc.unEmpty(phone)) {
            zjg.setPhone(phone);
        }
        if (PublicFunc.unEmpty(urladdress)) {
            zjg.setWeb(urladdress);
        }
        if (PublicFunc.unEmpty(chuanzhen)) {
            zjg.setChuanzhen(chuanzhen);
        }
        if (PublicFunc.unEmpty(kaipname)) {
            zjg.setKpmc(kaipname);
        }
        if (PublicFunc.unEmpty(kpaddress)) {
            zjg.setKpaddress(kpaddress);
        }
        if (PublicFunc.unEmpty(address)) {
            zjg.setAddress(address);
        }
        if (PublicFunc.unEmpty(email)) {
            zjg.setEmail(email);
        }
        if (PublicFunc.unEmpty(kaihuZh)) {
            zjg.setKhhzh(kaihuZh);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }

        if (PublicFunc.unEmpty(leixing) && !("--请选择--").equals(leixing)) {
            zjg.setJGleixing(leixing);
        }

        if (zjg != null) {
            sCGLService.insertWJGDWGL(zjg);
            return "WJGDWGL";
        }
        return SUCCESS;
    }

    private String addSCGLWJG() {
        String gydid = request.getParameter("gydid");
        String jgxinghao = request.getParameter("jgxinghao");
        String xinghao = request.getParameter("xinghao");
        String dbmingchen = request.getParameter("dbmingchen");
        String shuliang = request.getParameter("shuliang");
        String jhtime = request.getParameter("jhtime");
        String beizhu = request.getParameter("beizhu");
        String xiadanren = request.getParameter("xiadanren");
        String chejian = request.getParameter("chejian");
        String gongyi = request.getParameter("gongyi");
        String xiadantime = request.getParameter("xiadantime");
        String jgtype = request.getParameter("jgtype");
        WJGgongyidan wjg = new WJGgongyidan();
        if (PublicFunc.unEmpty(gydid)) {
            wjg.setBianhao(gydid);
        }
        if (PublicFunc.unEmpty(jgtype)) {
            wjg.setJgtype(jgtype);
        }
        if (PublicFunc.unEmpty(jgxinghao)) {
            wjg.setDown_typeNum(jgxinghao);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            wjg.setUP_typeNum(xinghao);
        }
        if (PublicFunc.unEmpty(dbmingchen)) {
            wjg.setDibuName(dbmingchen);
        }
        if (PublicFunc.unEmpty(shuliang)) {
            wjg.setNum(Integer.valueOf(shuliang));
        }
        if (PublicFunc.unEmpty(jhtime)) {
            wjg.setJiaohuo_time(PublicFunc.paseStringToDate(jhtime));
        }
        if (PublicFunc.unEmpty(beizhu)) {
            wjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(xiadanren)) {
            wjg.setKaidanren(xiadanren);
        }
        if (PublicFunc.unEmpty(xiadantime)) {
            wjg.setKaidantime(PublicFunc.paseStringToDate(xiadantime));
        }

        if (PublicFunc.unEmpty(chejian) && !("--请选择--").equals(chejian)) {
            wjg.setJG_danwei(chejian);
        }
        if (PublicFunc.unEmpty(gongyi) && !("--请选择--").equals(gongyi)) {
            wjg.setGongyi(gongyi);
        }
        if (wjg != null) {
            boolean unique = sCGLService.checkSCGLWJGUniqueness(wjg);
            if (unique) {
                wjg.setZhuangtai(PublicFunc.ORDER_STATE_NOPERSON);
                sCGLService.insertSCGLWJG(wjg);
                return "SCGLWJG";
            } else {
                request.setAttribute("wjg", wjg);
                request.setAttribute("modifywjgglerror", "已存在该编号!");
                return "addSCGLWJG";
            }
        }
        return SUCCESS;
    }

    private String addSCGLYB() {
        String gydid = request.getParameter("gydid");
        String jgxinghao = request.getParameter("jgxinghao");
        String xinghao = request.getParameter("xinghao");
        String shuliang = request.getParameter("shuliang");
        String beizhu = request.getParameter("beizhu");
        String xiadanren = request.getParameter("xiadanren");
        String diaoka = request.getParameter("diaoka");
        String xiadantime = request.getParameter("xiadantime");
        YBgongyidan zjg = new YBgongyidan();
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setyBGongYiId(gydid);
        }
        if (PublicFunc.unEmpty(jgxinghao)) {
            zjg.setxJType(jgxinghao);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setyBtype(xinghao);
        }
        if (PublicFunc.unEmpty(shuliang)) {
            zjg.setNum(Integer.valueOf(shuliang));
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeiZhu(beizhu);
        }
        if (PublicFunc.unEmpty(xiadanren)) {
            zjg.setKaiDanRen(xiadanren);
        }
        if (PublicFunc.unEmpty(xiadantime)) {
            zjg.setKaiDanTime(PublicFunc.paseStringToDate(xiadantime));
        }

        if (PublicFunc.unEmpty(diaoka) && !("--请选择--").equals(diaoka)) {
            zjg.setkHoRyB(diaoka);
        }

        if (zjg != null) {
            zjg.setFinish("未完成");
            boolean unique = sCGLService.checkSCGLYBUniqueness(zjg);
            if (unique) {
                sCGLService.insertSCGLYB(zjg);
                return "SCGLYB";
            } else {
                request.setAttribute("yb", zjg);
                request.setAttribute("modifyyberror", "已存在该编号!");
                return "addSCGLYB";
            }
        }
        return SUCCESS;
    }

    private String addSCGLZJG() {
        String gydid = request.getParameter("gydid");
        String jgxinghao = request.getParameter("jgxinghao");
        String xinghao = request.getParameter("xinghao");
        String dbmingchen = request.getParameter("dbmingchen");
        String shuliang = request.getParameter("shuliang");
        String jhtime = request.getParameter("jhtime");
        String beizhu = request.getParameter("beizhu");
        String xiadanren = request.getParameter("xiadanren");
        String chejian = request.getParameter("chejian");
        String gongyi = request.getParameter("gongyi");
        String xiadantime = request.getParameter("xiadantime");
        String jgtype = request.getParameter("jgtype");
        ZJGgongyidan zjg = new ZJGgongyidan();
        if (PublicFunc.unEmpty(gydid)) {
            zjg.setBianhao(gydid);
        }
        if (PublicFunc.unEmpty(jgtype)) {
            zjg.setJgtype(jgtype);
        }
        if (PublicFunc.unEmpty(jgxinghao)) {
            zjg.setDown_typeNum(jgxinghao);
        }
        if (PublicFunc.unEmpty(xinghao)) {
            zjg.setUp_typeNum(xinghao);
        }
        if (PublicFunc.unEmpty(dbmingchen)) {
            zjg.setDibuName(dbmingchen);
        }
        if (PublicFunc.unEmpty(shuliang)) {
            zjg.setNum(Integer.valueOf(shuliang));
        }
        if (PublicFunc.unEmpty(jhtime)) {
            zjg.setJiaohuo_time(PublicFunc.paseStringToDate(jhtime));
        }
        if (PublicFunc.unEmpty(beizhu)) {
            zjg.setBeizhu(beizhu);
        }
        if (PublicFunc.unEmpty(xiadanren)) {
            zjg.setKaidanren(xiadanren);
        }
        if (PublicFunc.unEmpty(xiadantime)) {
            zjg.setKaidantime(PublicFunc.paseStringToDate(xiadantime));
        }

        if (PublicFunc.unEmpty(chejian) && !("--请选择--").equals(chejian)) {
            zjg.setChejian(chejian);
        }
        if (PublicFunc.unEmpty(gongyi) && !("--请选择--").equals(gongyi)) {
            zjg.setGongyi(gongyi);
        }
        if (zjg != null) {
            boolean unique = sCGLService.checkSCGLZJGUniqueness(zjg);
            if (unique) {
                zjg.setZhuangtai(PublicFunc.ORDER_STATE_NOPERSON);
                sCGLService.insertSCGLZJG(zjg);
                return "SCGLZJG";
            } else {
                request.setAttribute("zjg", zjg);
                request.setAttribute("modifyzjgglerror", "已存在该编号!");
                return "addSCGLZJG";
            }
        }
        return SUCCESS;
    }

    /**
     * 自加工工艺单查询
     *
     * @param result
     * @return
     */
    private Result query_SCGLZJG(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("chejian");
        String zt = request.getParameter("zhuangtai");
        String bt = request.getParameter("Up_typeNum");
        String et = request.getParameter("gongyi");
        String bh = request.getParameter("bianhao");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("chejian", tn);
        }
        else
        {
            String chejian = (String) request.getSession().getAttribute("zjgchejian");
            if (PublicFunc.unEmpty(chejian)) {
                map.put("chejian", chejian);
            }
        }
        if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
            map.put("zhuangtai", zt);
        }
        if (PublicFunc.unEmpty(bt)) {
            map.put("Up_typeNum", bt);
        }
        if (PublicFunc.unEmpty(et) && !et.equals("--请选择--")) {
            map.put("gongyi", et);
        }
        if (PublicFunc.unEmpty(bh)) {
            map.put("bianhao", bh);
        }
        setSearchPage(map);
        totalRows = sCGLService.getSCGYDZJGCount(map);
        List<ZJGgongyidan> rows = sCGLService.findSCGYDZJGByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findSCGYDZJGByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getSCGLzjgGongYiDanInfoJSON(rows));
        return result;
    }

    /**
     * 外加工工艺单查询
     *
     * @param result
     * @return
     */
    private Result query_SCGLWJG(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("JG_danwei");
        String zt = request.getParameter("zhuangtai");
        String bt = request.getParameter("Up_typeNum");
        String et = request.getParameter("gongyi");
        String bh = request.getParameter("bianhao");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("JG_danwei", tn);
        }
        if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
            map.put("zhuangtai", zt);
        }
        if (PublicFunc.unEmpty(bt)) {
            map.put("Up_typeNum", bt);
        }
        if (PublicFunc.unEmpty(et) && !et.equals("--请选择--")) {
            map.put("gongyi", et);
        }
        if (PublicFunc.unEmpty(bh)) {
            map.put("bianhao", bh);
        }
        setSearchPage(map);
        totalRows = sCGLService.getSCGYDWJGCount(map);
        List<WJGgongyidan> rows = sCGLService.findSCGYDWJGByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findSCGYDWJGByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getSCGLwjgGongYiDanInfoJSON(rows));
        return result;
    }

    /**
     * 样本加工工艺单查询
     *
     * @param result
     * @return
     */
    private Result query_SCGLYB(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("YBgongyi_id");
        String zt = request.getParameter("zhuangtai");
        String bt = request.getParameter("YB_type");
        String bh = request.getParameter("XJ_type");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("YBgongyi_id", tn);
        }
        if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
            map.put("zhuangtai", zt);
        }
        if (PublicFunc.unEmpty(bt) && !bt.equals("--请选择--")) {
            map.put("YB_type", bt);
        }
        if (PublicFunc.unEmpty(bh)) {
            map.put("XJ_type", bh);
        }
        setSearchPage(map);
        totalRows = sCGLService.getSCGYDYBCount(map);
        List<YBgongyidan> rows = sCGLService.findSCGYDYBByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findSCGYDYBByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getSCGLybGongYiDanInfoJSON(rows));
        return result;
    }

    /**
     * 采购指令管理查询
     *
     * @param result
     * @return
     */
    private Result query_SGZLGL(Result result) {
        int totalRows = 0;
        totalRows = sCGLService.getCGZLGLCount();
        List<caiGouZhiLing> rows = sCGLService.findCGZLGLByPage(page, rp);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findCGZLGLByPage(page, rp);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getCGZLGLInfoJSON(rows));
        return result;
    }

    /*
      * 生产单审核
      */
    private Result query_SCDCHECK(Result result) {
        return result;
    }

    /**
     * 外加工单位查询
     *
     * @param result
     * @return
     */
    private Result query_WJGDWGL(Result result) {
        int totalRows = 0;
        String n = request.getParameter("danweiname");
        String jglx = request.getParameter("JGleixing");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(n)) {
            map.put("danweiname", n);
        }
        if (PublicFunc.unEmpty(jglx) && !jglx.equals("--请选择--")) {
            map.put("JGleixing", jglx);
        }
        setSearchPage(map);
        totalRows = sCGLService.getWJGDWGLCount(map);
        List<wJGGongYingShang> rows = sCGLService.findWJGDWGLByPage(page, rp,
                map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findWJGDWGLByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getWJGDWGLInfoJSON(rows));
        return result;
    }

    /**
     * 半成品开剪申请查询
     *
     * @param result
     * @return
     */
    private Result query_BCPKJAPPLY(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String am = request.getParameter("zhuangtai");
        String bt = request.getParameter("'beginTime'");
        String et = request.getParameter("endTime");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(am) && !am.equals("--请选择--")) {
            map.put("zhuangtai", am);
        }

        if (PublicFunc.unEmpty(bt)) {
            map.put("beginTime", PublicFunc.paseStringToDate(bt));
        }
        if (PublicFunc.unEmpty(et)) {
            map.put("endTime", PublicFunc.paseStringToDate(et));
        }

        setSearchPage(map);
        totalRows = sCGLService.getBCPKJApplyCount(map);
        List<BCPKJ_Apply> rows = sCGLService
                .findBCPKJApplyByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findBCPKJApplyByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getBCPKJApplyInfoJSON(rows));
        return result;
    }

    /**
     * 成品开剪申请查询
     *
     * @param result
     * @return
     */
    private Result query_CPKJAPPLY(Result result) {
        int totalRows = 0;
        String tn = request.getParameter("type_num");
        String am = request.getParameter("zhuangtai");
        String bt = request.getParameter("'beginTime'");
        String et = request.getParameter("endTime");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(tn)) {
            map.put("type_num", tn);
        }
        if (PublicFunc.unEmpty(am) && !am.equals("--请选择--")) {
            map.put("zhuangtai", am);
        }

        if (PublicFunc.unEmpty(bt)) {
            map.put("beginTime", PublicFunc.paseStringToDate(bt));
        }
        if (PublicFunc.unEmpty(et)) {
            map.put("endTime", PublicFunc.paseStringToDate(et));
        }

        setSearchPage(map);
        totalRows = sCGLService.getCPKJApplyCount(map);
        List<BCPKJ_Apply> rows = sCGLService
                .findCPKJApplyByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findCPKJApplyByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getBCPKJApplyInfoJSON(rows));
        return result;
    }
    /**
     * 质检报告查询
     *
     * @param result
     * @return
     */
    private Result query_ZHIJIANREPORT(Result result) {
        int totalRows = 0;
        String re = request.getParameter("report_id");
        String xh = request.getParameter("xinghao");
        String am = request.getParameter("apply_man");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(re)) {
            map.put("report_id", re);
        }
        if (PublicFunc.unEmpty(xh)) {
            map.put("xinghao", xh);
        }
        if (PublicFunc.unEmpty(am)) {
            map.put("apply_man", am);
        }
        setSearchPage(map);
        totalRows = sCGLService.getZhiJianReportCount(map);
        List<zhiJianReport> rows = sCGLService.findZhiJianReportByPage(page,
                rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findZhiJianReportByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getZJReportInfoJSON(rows));
        return result;
    }

    private Result query_ZHIJIANLIST(Result result) {
        int totalRows = 0;
        String type_num = request.getParameter("type_num");
        String zhijiantype = "采购质检";
        if(null != request.getParameter("zhijiantype")){
            zhijiantype  =request.getParameter("zhijiantype") ;
        }
        String dateStartText = request.getParameter("dateStartText");
        String dateEndText = request.getParameter("dateEndText");
        String cgid = null;
        if(null != request.getParameter("cgid"))
        {
            cgid = request.getParameter("cgid");
        }

        Map<String, Object> map = new HashMap<String, Object>();

        if (PublicFunc.unEmpty(zhijiantype)) {
            map.put("zhijiantype", zhijiantype);
        }
        setSearchPage(map);
        log.info("zhijiantype"+zhijiantype);
        if(zhijiantype.equals("采购质检"))
        {
            if (PublicFunc.unEmpty(cgid)) {
                map.put("caigou_id", cgid);
            }
            if (PublicFunc.unEmpty(type_num)) {
                map.put("type_num", type_num);
            }
            if (PublicFunc.unEmpty(dateStartText)) {
                map.put("beginTime", dateStartText);
            }
            if (PublicFunc.unEmpty(dateEndText)) {
                map.put("endTime", dateEndText);
            }
            totalRows = cggLService.getDJGLCount(map);
            List  rows = cggLService.findDJGLByPage(page, rp, map);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = cggLService.findDJGLByPage(page, rp, map);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getCGZJInfoJSON(rows));
        } else if(zhijiantype.equals("自加工质检"))
        {
            if (PublicFunc.unEmpty(type_num)) {
                map.put("Up_typeNum", type_num);
            }
            if (PublicFunc.unEmpty(cgid)) {
                map.put("bianhao", cgid);
            }
            totalRows = sCGLService.getSCGYDZJGCount(map);
            List  rows = sCGLService.findSCGYDZJGByPage(page, rp, map);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = sCGLService.findSCGYDZJGByPage(page, rp, map);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getSCZJGZJInfoJSON(rows));
        }else if(zhijiantype.equals("外加工质检"))
        {
            if (PublicFunc.unEmpty(type_num)) {
                map.put("UP_typeNum", type_num);
            }
            if (PublicFunc.unEmpty(cgid)) {
                map.put("bianhao", cgid);
            }
            totalRows = sCGLService.getSCGYDWJGCount(map);
            List  rows = sCGLService.findSCGYDWJGByPage(page, rp, map);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = sCGLService.findSCGYDWJGByPage(page, rp, map);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getSCWJGZJInfoJSON(rows));
        }else if(zhijiantype.equals("销售退货质检"))
        {

        }

        return result;
    }

    private Result query_RUKULIST(Result result) {
        int totalRows = 0;
        String zhuangtai = PublicFunc.ORDER_STATE_WATINGRK;
        String zhijiantype = "采购入库";
        if(null != request.getParameter("zhijiantype")){
            zhijiantype  =request.getParameter("zhijiantype") ;
        }
        if(null != request.getParameter("type_num")){
            zhuangtai  =request.getParameter("type_num") ;
        }
        String dateStartText = request.getParameter("dateStartText");
        String dateEndText = request.getParameter("dateEndText");
        String cgid = null;
        if(null != request.getParameter("cgid"))
        {
            cgid = request.getParameter("cgid");
        }

        Map<String, Object> map = new HashMap<String, Object>();

        if (PublicFunc.unEmpty(zhijiantype)) {
            map.put("zhijiantype", zhijiantype);
        }
        setSearchPage(map);
        log.info("zhijiantype"+zhijiantype);
        if(zhijiantype.equals("采购入库"))
        {
            if (PublicFunc.unEmpty(cgid)) {
                map.put("caigou_id", cgid);
            }
            if (PublicFunc.unEmpty(zhuangtai) && !zhuangtai.equals("--请选择--")) {
                log.info("state:"+zhuangtai);
                if(zhuangtai.equals("采购中/生产中"))
                {
                    map.put("zhuangtai", PublicFunc.ORDER_STATE_WATINGCG);
                }
                else
                {
                    map.put("zhuangtai", zhuangtai);
                }

            }
            if (PublicFunc.unEmpty(dateStartText)) {
                map.put("beginTime", dateStartText);
            }
            if (PublicFunc.unEmpty(dateEndText)) {
                map.put("endTime", dateEndText);
            }
            totalRows = cggLService.getDJGLCount(map);
            List  rows = cggLService.findDJGLByPage(page, rp, map);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = cggLService.findDJGLByPage(page, rp, map);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getCGRK2InfoJSON(rows));
        } else if(zhijiantype.equals("自加工入库"))
        {
            if (PublicFunc.unEmpty(zhuangtai) && !zhuangtai.equals("--请选择--")) {
                if(zhuangtai.equals("生产中/采购中"))
                {
                    map.put("zhuangtai", PublicFunc.SC_STATE_WATINGSC);
                }
                else
                {
                    map.put("zhuangtai", zhuangtai);
                }

            }

            if (PublicFunc.unEmpty(cgid)) {
                map.put("bianhao", cgid);
            }
            totalRows = sCGLService.getSCGYDZJGCount(map);
            List  rows = sCGLService.findSCGYDZJGByPage(page, rp, map);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = sCGLService.findSCGYDZJGByPage(page, rp, map);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getSCZJGZJInfoJSON(rows));
        }else if(zhijiantype.equals("外加工入库"))
        {
            if (PublicFunc.unEmpty(zhuangtai) && !zhuangtai.equals("--请选择--")) {
                if(zhuangtai.equals("生产中/采购中"))
                {
                    map.put("zhuangtai", PublicFunc.SC_STATE_WATINGSC);
                }
                else
                {
                    map.put("zhuangtai", zhuangtai);
                }

            }
            if (PublicFunc.unEmpty(cgid)) {
                map.put("bianhao", cgid);
            }
            totalRows = sCGLService.getSCGYDWJGCount(map);
            List  rows = sCGLService.findSCGYDWJGByPage(page, rp, map);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = sCGLService.findSCGYDWJGByPage(page, rp, map);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getSCWJGZJInfoJSON(rows));
        }else if(zhijiantype.equals("销售退货入库"))
        {

        }

        return result;
    }



    /**
     * 生产入库查询
     *
     * @param result
     * @return
     */
    private Result query_SCRuKu(Result result) {
        int totalRows = 0;
        String gy = request.getParameter("gongyidan_id");
        String bp = request.getParameter("bupi_id");
        String zt = request.getParameter("zhuangtai");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(gy)) {
            map.put("gongyidan_id", gy);
        }
        if (PublicFunc.unEmpty(bp)) {
            map.put("bupi_id", bp);
        }
        totalRows = sCGLService.getSCRuKuCount(map);
        List<SCRuKu> rows = sCGLService.findSCRuKuByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = sCGLService.findSCRuKuByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getSCRuKuInfoJSON(rows));
        return result;
    }

    /**
     * 查询模块
     *
     * @param type
     * @param result
     */
    private void manager(String type, Result result) {
        int totalRows = 0;
        if (PublicFunc.unEmpty(type) && type.equals("SCGLZJG")) {
            result = query_SCGLZJG(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLWJG")) {
            result = query_SCGLWJG(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLYB")) {
            result = query_SCGLYB(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SGZLGL")) {
            result = query_SGZLGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCDCHECK")) {
            result = query_SCDCHECK(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("CangKuChaXun")) {
            totalRows = sCGLService.getCangKuCount();
            List<cangKuChaXun> rows = sCGLService.findCangKuByPage(page, rp);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = sCGLService.findCangKuByPage(page, rp);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getCangKuInfoJSON(rows));
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCRuKu")) {
            result = query_SCRuKu(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHIJIANLIST")) {
            result = query_ZHIJIANLIST(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("RUKULIST")) {
            result = query_RUKULIST(result);
        }

        if (PublicFunc.unEmpty(type) && type.equals("ZHIJIANREPORT")) {
            result = query_ZHIJIANREPORT(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
            result = query_BCPKJAPPLY(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("CPKJAPPLY")) {
            result = query_CPKJAPPLY(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            totalRows = sCGLService.getGYSCount();
            List<gongYingShang> rows = sCGLService.findGYSByPage(page, rp);
            if (rows.size() == 0 && page > 1) {
                page -= 1;
                rows = sCGLService.findGYSByPage(page, rp);
            }
            result.setTotal(totalRows);
            result.setPage(page);
            result.setRows(JsonUtil.getGYSInfoJSON(rows));
        }
        if (PublicFunc.unEmpty(type) && type.equals("WJGDWGL")) {
            result = query_WJGDWGL(result);
        }
        json = JsonUtil.getResponseJson(result);
        onResponse(json);
    }


    /**
     * 删除模块
     *
     * @param type
     */
    private void delete(String type) {
        String[] id = request.getParameterValues("id");
        if (PublicFunc.unEmpty(type) && type.equals("SCGLZJG")) {
            sCGLService.deleteSCGYDZJGByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLWJG")) {
            sCGLService.deleteSCGYDWJGByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCGLYB")) {
            sCGLService.deleteSCGYDYBByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("SGZLGL")) {
            sCGLService.deleteCGZLGLByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCDCHECK")) {

        }
        if (PublicFunc.unEmpty(type) && type.equals("CangKuChaXun")) {
            sCGLService.deleteCangKuByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCRuKu")) {
            sCGLService.deleteSCRuKuByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHIJIANLIST")) {

        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHIJIANREPORT")) {
            sCGLService.deleteZhiJianReportByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("BCPKJAPPLY")) {
//            sCGLService.deleteBCPKJApplyByIds(PublicFunc
//                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("GYSGL")) {
            sCGLService.deleteGYSByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("WJGDWGL")) {
            sCGLService.deleteWJGDWGLByIds(PublicFunc
                    .paseStringListTOIntegerList(id));
        }
    }

}
