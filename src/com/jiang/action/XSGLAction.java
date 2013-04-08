package com.jiang.action;

import com.jiang.bean.*;
import com.jiang.service.XSGLService;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * 销售管理模块
 *
 * @author jxq
 *
 */
@SuppressWarnings("serial")
public class XSGLAction extends BaseAction {

    Logger log = Logger.getLogger(XSGLAction.class);

    @Autowired
    private XSGLService xSGLService;

    // 使用Ajax技术执行此方法
    public String dolist() {
        Result result = new Result();
        String hidden = request.getParameter(HIDDEN);
        String type = request.getParameter(TYPE);
        String sortOrder = request.getParameter(SORTORDER);
        String sortName = request.getParameter(SORTNAME);
        /**
         * 自定义查询，获取信息
         */
        if (PublicFunc.unEmpty(hidden) && hidden.equals("query")) {
            query(type);
        }
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
        return SUCCESS;
    }
    private String modify(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("KHGL")) {
            return modify_KHGL();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZHXD"))
        {
            return modify_ZHXD();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZHDDdetail"))
        {
            return modify_ZHDDdetail();
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL_FH")) {
            return modify_KHGL_FH();
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL_FH_CHECK")) {
            return modify_KHGL_FH_CHECK();
        }
        return SUCCESS;
    }

    private String modify_ZHDDdetail(){
        String id = request.getParameter("id");// 客户ID
        String mishu = request.getParameter("mishu");//
        String orderid = "";
        if(null != request.getSession().getAttribute("orderid"))
        {
            orderid  = (String)request.getSession().getAttribute("orderid");
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("mishu", mishu);
        xSGLService.updateDDMXMishu(map);

        float totalnum = xSGLService.getXSGLDingDanTotalNum(orderid);
        float totalprice = xSGLService.getXSGLDingDanTotalPrice(orderid);
        request.getSession().setAttribute("totalnum", totalnum);
        request.getSession().setAttribute("totalprice", totalprice);
        return "OrderDetail";
    }
    /**
     * 保存客户并生产订单信息
     * 如果客户ID 存在，测修改相关字段，否则给出合理提示
     * 然后生成订单信息。返回到订单页面
     * @return
     */
    private String modify_ZHXD(){
        String id = request.getParameter("id");// 客户ID
        String kehu_id = request.getParameter("kehu_id");// 客户ID
        String KeHuname = request.getParameter("KeHuname");// 客户名称
        String suoshuquyu = request.getParameter("suoshuquyu");//所属区域
        String telephone = request.getParameter("telephone");// 办公电话1
        String telephone2 = request.getParameter("telephone2");//  办公电话2
        String phone = request.getParameter("phone");//  移动电话
        String chuanzhen = request.getParameter("chuanzhen");//  传真
        String email = request.getParameter("email");//  E-mail
        String suoxie = request.getParameter("suoxie");// 客户简称
        String jiesuanfangshi = request.getParameter("jiesuanfangshi");// 结算方式
        String qiankuanshangxian = request.getParameter("qiankuanshangxian");// 欠款上限
        String VIPkeHu = request.getParameter("VIPkeHu");// VIP
        String address = request.getParameter("address");// 地址
        String web = request.getParameter("web");// 网址
        String seller = request.getParameter("seller");// 联系人
        String yewuyuan = request.getParameter("yewuyuan");// 业务员


        KHGL tmp = new KHGL();
        tmp.setKehu_id(kehu_id);
        tmp.setKeHuname(KeHuname);
        tmp.setSuoshuquyu(suoshuquyu);
        tmp.setTelephone(telephone);
        tmp.setTelephone2(telephone2);
        tmp.setPhone(phone);
        tmp.setChuanzhen(chuanzhen);
        tmp.setEmail(email);
        tmp.setSuoxie(suoxie);
        tmp.setJiesuanfangshi(jiesuanfangshi);
        tmp.setQiankuanshangxian(qiankuanshangxian);
        tmp.setVIPkeHu(VIPkeHu);
        tmp.setAddress(address);
        tmp.setWeb(web);
        tmp.setSeller(seller);
        tmp.setYewuyuan(yewuyuan);

        //如果客户ID 不等于null 同时不等于"" 则更新相关字段到数据库
        if(null != id && !"".equals(id)){
            tmp.setId(Integer.valueOf(id));
            xSGLService.updateKHGL(tmp);
        }
        else
        {
            boolean isok =  xSGLService.checkKHGLUniqueness(tmp);
            if(isok)
                xSGLService.insertKHGL(tmp);
            else
            {
                request.setAttribute("addhkzlerror", "已存在此编号客户！");
                return "zhxd";
            }
        }
        request.getSession().setAttribute("orderDetail", tmp);
        request.getSession().removeAttribute("totalnum");
        request.getSession().removeAttribute("totalprice");
        return "OrderDetail";
    }

    private String modify_KHGL() {
        String id = request.getParameter("id");
        String kehu_id = request.getParameter("khbh");
        String khmc = request.getParameter("khmc");
        String khjc = request.getParameter("khjc");
        String ssqy = request.getParameter("ssqy");
        String bgdh1 = request.getParameter("bgdh1");
        String bgdh2 = request.getParameter("bgdh2");
        String lxr = request.getParameter("lxr");
        String yddh = request.getParameter("yddh");
        String cz = request.getParameter("cz");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String url = request.getParameter("url");
        String ywy = request.getParameter("ywy");
        String vip = request.getParameter("vip");
        String jsfs = request.getParameter("jsfs");
        String beizhu = request.getParameter("beizhu");

        KHGL yl = new KHGL();
        if (PublicFunc.unEmpty(id)) {
            yl.setId(Integer.valueOf(id));
        }
        if (PublicFunc.unEmpty(kehu_id)) {
            yl.setKehu_id(kehu_id);
        }
        if (PublicFunc.unEmpty(khmc)) {
            yl.setKeHuname(khmc);
        }
        if (PublicFunc.unEmpty(khjc)) {
            yl.setSuoxie(khjc);
        }
        if (PublicFunc.unEmpty(ssqy)) {
            yl.setSuoshuquyu(ssqy);
        }
        if (PublicFunc.unEmpty(bgdh1)) {
            yl.setTelephone(bgdh1);
        }
        if (PublicFunc.unEmpty(bgdh2)) {
            yl.setTelephone2(bgdh2);
        }
        if (PublicFunc.unEmpty(lxr)) {
            yl.setSeller(lxr);
        }
        if (PublicFunc.unEmpty(yddh)) {
            yl.setPhone(yddh);
        }
        if (PublicFunc.unEmpty(cz)) {
            yl.setChuanzhen(cz);
        }
        if (PublicFunc.unEmpty(address)) {
            yl.setAddress(address);
        }
        if (PublicFunc.unEmpty(email)) {
            yl.setEmail(email);
        }
        if (PublicFunc.unEmpty(url)) {
            yl.setWeb(url);
        }
        if (PublicFunc.unEmpty(ywy)) {
            yl.setYewuyuan(ywy);
        }
        if (PublicFunc.unEmpty(vip)) {
            yl.setVIPkeHu(vip);
        }
        if (PublicFunc.unEmpty(jsfs)) {
            yl.setJiesuanfangshi(jsfs);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }

        if (yl != null) {
            xSGLService.updateKHGL(yl);
            return "KHGL";
        }
        return SUCCESS;
}
    private String modify_KHGL_FH_CHECK(){
        String id = request.getParameter("id");
        String ddid = "";
        if(null != request.getSession().getAttribute("ddid"))
        {
            ddid = (String) request.getSession().getAttribute("ddid");
        }
        if (PublicFunc.unEmpty(id) && PublicFunc.unEmpty(ddid)) {
            xSGLService.updateKHGLFH_CHECK(ddid, id);
        }
        return SUCCESS;
    }

    private String modify_KHGL_FH(){
        String kehu_id = request.getParameter("kehu_id");
        String lianxiren = request.getParameter("lianxiren");
        String fahuofangshi = request.getParameter("fahuofangshi");
        String dianhua = request.getParameter("dianhua");
        String yidongdianhua = request.getParameter("yidongdianhua");
        String dizhi = request.getParameter("dizhi");

        KHGL_FH yl = new KHGL_FH();
        if (PublicFunc.unEmpty(kehu_id)) {
            yl.setKehu_id(kehu_id);
        }
        if (PublicFunc.unEmpty(lianxiren)) {
            yl.setLianxiren(lianxiren);
        }
        if (PublicFunc.unEmpty(fahuofangshi) && !fahuofangshi.equals("--请选择--")) {
            yl.setFahuofangshi(fahuofangshi);
        }
        if (PublicFunc.unEmpty(dianhua)) {
            yl.setDianhua(dianhua);
        }
        if (PublicFunc.unEmpty(yidongdianhua)) {
            yl.setYidongdianhua(yidongdianhua);
        }
        if (PublicFunc.unEmpty(dizhi)) {
            yl.setDizhi(dizhi);
        }
        if (yl != null) {
                xSGLService.updateKHGLFH(yl);
            return "khgl_fh";
        }
        return SUCCESS;
    }
    private String preModify(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("KHGL")) {
            return preModify_KHGL();
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL_FH")) {
            return preModify_KHGL_FH();
        }

        return SUCCESS;
    }
    private String preModify_KHGL() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            KHGL tmp = xSGLService.getKHGLById(Integer.valueOf(id));
            request.setAttribute("khgl", tmp);
        }
        return "modifyKHGL";
    }
    private String preModify_KHGL_FH() {
        String id = request.getParameter("id");
        if (PublicFunc.unEmpty(id)) {
            KHGL_FH tmp = xSGLService.getKHGLFHById(Integer.valueOf(id));
            request.setAttribute("khglfh", tmp);
        }
        return "modifyKHGL_FH";
    }
    private String add(String type) {
        if(PublicFunc.unEmpty(type) && type.equals("KHGL"))
        {
            return add_KHGL();
        }
        if(PublicFunc.unEmpty(type) && type.equals("ZHDDdetail"))
        {
            return add_ZHDDdetail();
        }
        if(PublicFunc.unEmpty(type) && type.equals("DDtoOrder"))
        {
            return add_DDtoOrder();
        }
        if(PublicFunc.unEmpty(type) && type.equals("KHGL_FH"))
        {
            return add_KHGL_FH();
        }
        return SUCCESS;
    }
    private String add_DDtoOrder() {

        String ddid = request.getParameter("ddid");
        String khid = request.getParameter("khid");
        String ydjin = request.getParameter("ydjin");
        String zjine = request.getParameter("zjine");
        String kdyuan = request.getParameter("kdyuan");
        String kdtime = request.getParameter("kdtime");
        String yewuyuan = request.getParameter("yewuyuan");

        YDDGL ydd = new YDDGL();

        if(PublicFunc.unEmpty(ddid))
        {
            ydd.setDingdan_id(ddid);
        }
        if(PublicFunc.unEmpty(khid))
        {
            ydd.setDingdan_name(khid);
        }
        if(PublicFunc.unEmpty(zjine))
        {
            ydd.setZongjine(zjine);
        }
        if(PublicFunc.unEmpty(kdyuan))
        {
            try {
                kdyuan = new String(kdyuan.getBytes("ISO8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            ydd.setKaidanren(kdyuan);
        }
        if(PublicFunc.unEmpty(kdtime))
        {
            ydd.setKaidan_time(PublicFunc.paseStringToDate(kdtime));
        }
        if(PublicFunc.unEmpty(ydjin))
        {
            ydd.setDingjin(new BigDecimal(ydjin));
        }
        if(PublicFunc.unEmpty(yewuyuan))
        {
            ydd.setYewuyuan(yewuyuan);
        }
        if (ydd != null) {
               ydd.setFinish_or_not(PublicFunc.SALE_TYPE_ZH);
               ydd.setZhuangtai(PublicFunc.SALE_STATE_INIT);
                xSGLService.insertDDToSale(ydd);
            return "ordersuccess";
        }
        return "ordersuccess";
    }

    private String add_ZHDDdetail() {             ;
        String huohao = request.getParameter("huohao");
        String danjia = request.getParameter("danjia");
        String mishu = request.getParameter("mishu");
        String jiageleixing = request.getParameter("jiageleixing");
        String beizhu = request.getParameter("beizhu");

        DingDanmingxi yl = new DingDanmingxi();
        if(PublicFunc.unEmpty(huohao))
        {
            yl.setType_num(huohao);
        }
        if(PublicFunc.unEmpty(danjia))
        {
            yl.setDanjia(new BigDecimal(danjia));
        }
        if(PublicFunc.unEmpty(mishu))
        {
            yl.setNum(new BigDecimal(mishu));
        }
        if(PublicFunc.unEmpty(jiageleixing))
        {
            yl.setJiageleixing(PublicFunc.jiageleixing[Integer.valueOf(jiageleixing)-1]);
        }
        if(PublicFunc.unEmpty(beizhu))
        {
            yl.setBeizhu(beizhu);
        }

        String orderid = "";
        ZLGLCPZL cp = null;

        if(null != request.getSession().getAttribute("orderid"))
        {
            orderid  = (String)request.getSession().getAttribute("orderid");
            yl.setDingdan_id(orderid);
        }
        else
        {
            request.getSession().setAttribute("ddmxadderror", "获取订单号超时，请重新下单！");
        }

        if(null != request.getSession().getAttribute("ZLGLCPZL_search1"))
        {
            cp  = (ZLGLCPZL)request.getSession().getAttribute("ZLGLCPZL_search1");
        }
        else
        {
            request.getSession().setAttribute("ddmxadderror", "获取货号号超时，请重新添加货号！");
        }

        if (yl != null) {

                int isreplay = xSGLService.getCountByOnlyDD_TypeNum(yl);
                if(isreplay == 0)
                {
                    yl.setColor(cp.getColor());
                    yl.setFinish_or_not(PublicFunc.SALEDTAIL_STATE_INIT);
                    xSGLService.insertDDMX(yl);
                    float totalnum = xSGLService.getXSGLDingDanTotalNum(orderid);
                    float totalprice = xSGLService.getXSGLDingDanTotalPrice(orderid);
                    request.getSession().setAttribute("totalnum", totalnum);
                    request.getSession().setAttribute("totalprice", totalprice);
                }
                else{
                    request.getSession().setAttribute("ddmxadderror", "此货号已添加，如继续添加，请点击修改米数！");
                }

                return SUCCESS;
        }
        return SUCCESS;
    }

    private String add_KHGL() {
        String id = request.getParameter("id");
        String kehu_id = request.getParameter("khbh");
        String khmc = request.getParameter("khmc");
        String khjc = request.getParameter("khjc");
        String ssqy = request.getParameter("ssqy");
        String bgdh1 = request.getParameter("bgdh1");
        String bgdh2 = request.getParameter("bgdh2");
        String lxr = request.getParameter("lxr");
        String yddh = request.getParameter("yddh");
        String cz = request.getParameter("cz");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String url = request.getParameter("url");
        String ywy = request.getParameter("ywy");
        String vip = request.getParameter("vip");
        String jsfs = request.getParameter("jsfs");
        String beizhu = request.getParameter("beizhu");

        KHGL yl = new KHGL();
        if (PublicFunc.unEmpty(kehu_id)) {
            yl.setKehu_id(kehu_id);
        }
        if (PublicFunc.unEmpty(khmc)) {
            yl.setKeHuname(khmc);
        }
        if (PublicFunc.unEmpty(khjc)) {
            yl.setSuoxie(khjc);
        }
        if (PublicFunc.unEmpty(ssqy)) {
            yl.setSuoshuquyu(ssqy);
        }
        if (PublicFunc.unEmpty(bgdh1)) {
            yl.setTelephone(bgdh1);
        }
        if (PublicFunc.unEmpty(bgdh2)) {
            yl.setTelephone2(bgdh2);
        }
        if (PublicFunc.unEmpty(lxr)) {
            yl.setSeller(lxr);
        }
        if (PublicFunc.unEmpty(yddh)) {
            yl.setPhone(yddh);
        }
        if (PublicFunc.unEmpty(cz)) {
            yl.setChuanzhen(cz);
        }
        if (PublicFunc.unEmpty(address)) {
            yl.setAddress(address);
        }
        if (PublicFunc.unEmpty(email)) {
            yl.setEmail(email);
        }
        if (PublicFunc.unEmpty(url)) {
            yl.setWeb(url);
        }
        if (PublicFunc.unEmpty(ywy)) {
            yl.setYewuyuan(ywy);
        }
        if (PublicFunc.unEmpty(vip)) {
            yl.setVIPkeHu(vip);
        }
        if (PublicFunc.unEmpty(jsfs)) {
            yl.setJiesuanfangshi(jsfs);
        }
        if (PublicFunc.unEmpty(beizhu)) {
            yl.setBeizhu(beizhu);
        }

        if (yl != null) {
            boolean unique = xSGLService.checkKHGLUniqueness(yl);
            if (unique) {
                xSGLService.insertKHGL(yl);
                return "KHGL";
            } else {
                request.setAttribute("khgl", yl);
                request.setAttribute("modifykhglerror", "已存在该客户编号!");
                return "addKHGL";
            }
        }
        return SUCCESS;
    }

    private String add_KHGL_FH() {
        String kehu_id = request.getParameter("kehu_id");
        String lianxiren = request.getParameter("lianxiren");
        String fahuofangshi = request.getParameter("fahuofangshi");
        String dianhua = request.getParameter("dianhua");
        String yidongdianhua = request.getParameter("yidongdianhua");
        String dizhi = request.getParameter("dizhi");

        KHGL_FH yl = new KHGL_FH();
        if (PublicFunc.unEmpty(kehu_id)) {
            yl.setKehu_id(kehu_id);
        }
        if (PublicFunc.unEmpty(lianxiren)) {
            yl.setLianxiren(lianxiren);
        }
        if (PublicFunc.unEmpty(fahuofangshi) && !fahuofangshi.equals("--请选择--")) {
            yl.setFahuofangshi(fahuofangshi);
        }
        if (PublicFunc.unEmpty(dianhua)) {
            yl.setDianhua(dianhua);
        }
        if (PublicFunc.unEmpty(yidongdianhua)) {
            yl.setYidongdianhua(yidongdianhua);
        }
        if (PublicFunc.unEmpty(dizhi)) {
            yl.setDizhi(dizhi);
        }

        if (yl != null) {
                boolean isexistKH = xSGLService.isExistKehuId(kehu_id);
               if(isexistKH)
               {
                   xSGLService.insertKHGLFH(yl);
               }
               else
               {
                   request.setAttribute("modifykhglfherror", "不存在该客户编号!");
                   return "addKHGL_FH";
               }
                return "khgl_fh";
        }
        return SUCCESS;
    }


    private void delete(String type) {
        String[] id = request.getParameterValues("id");
        if (PublicFunc.unEmpty(type) && type.equals("KHGL")) {
            xSGLService.deleteKHGLById(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHDDdetail")) {
            xSGLService.deleteZHDDdetail(Arrays.asList(id));
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL_FH")) {
            xSGLService.deleteKHGLFHById(Arrays.asList(id));
        }

    }
    private void query(String type){
        if(PublicFunc.unEmpty(type) && type.equals("findXSGLBykehu_idAndKeHuname")){
            //通过客户ID（精确查询） 和 客户名字（模糊查询） 查询客户信息 ，如果查出多条默认显示第一条。
            KHGL tmp = query_XSGLBykehu_idAndKeHuname();
            onResponse(JsonUtil.getKHGLJson(tmp));
        }
    }
    private void manager(String type, Result result) {

        if (PublicFunc.unEmpty(type) && type.equals("YDDGL")) {
            result = query_DDGL(result, PublicFunc.SALE_TYPE_YD);
        }
        if (PublicFunc.unEmpty(type) && type.equals("XSDGL")) {
            result = query_DDGL(result,  PublicFunc.SALE_TYPE_ZH);
        }
        if (PublicFunc.unEmpty(type) && type.equals("DDGL")) {
            result = query_DDGL(result,  PublicFunc.SALE_TYPE_SURE);
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL")) {
            result = query_KHGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHXDDETAIL")) {
            result = query_ZHXDDETAIL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("ZHXDDETAIL_DDGL")) {
            result = query_ZHXDDETAIL_DDGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL_FH")) {
            result = query_KHGL_FH(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("KHGL_FH_CHECK")) {
            result = query_KHGL_FH_CHECK(result);
        }

        json = JsonUtil.getResponseJson(result);
        onResponse(json);
    }

    /**
     *        展会下单详细
     *        @param result
     * @return
     */
    private Result query_ZHXDDETAIL(Result result) {
        Map<String, Object> map = new HashMap<String, Object>();
        String ddid = "";
        if(null != request.getSession().getAttribute("orderid") )
        {
            ddid = (String)request.getSession().getAttribute("orderid");
        }
        map.put("dingdan_id", ddid);
        setSearchPage(map);
        int totalRows = xSGLService.getXSGLDingDanmingxiCount(map);
        log.info("dingdan_id"+ddid);
        log.info("totalRows"+totalRows);
        List rows = xSGLService.findXSGLDingDanmingxi(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = xSGLService.findXSGLDingDanmingxi(page, rp, map);
        }
        if(null == request.getSession().getAttribute("orderid"))
        {
            totalRows = 0;
        }
        log.info("totalRows"+totalRows);
        float totalnum = xSGLService.getXSGLDingDanTotalNum(ddid);
        float totalprice = xSGLService.getXSGLDingDanTotalPrice(ddid);
        request.getSession().setAttribute("totalnum", totalnum);
        request.getSession().setAttribute("totalprice", totalprice);
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getDingDanmingxiInfoJSON(rows));
        return result;
    }
    /**
     *       订单详细
     *        @param result
     * @return
     */
    private Result query_ZHXDDETAIL_DDGL(Result result) {
        Map<String, Object> map = new HashMap<String, Object>();
        String ddid = "";
        if(null != request.getSession().getAttribute("orderid") )
        {
            ddid = (String)request.getSession().getAttribute("orderid");
        }
        map.put("dingdan_id", ddid);
        String zhuangtai = null;
        String huohao = null;
        if(null != request.getParameter("huohao") )
        {
            huohao= request.getParameter("huohao") ;
        }
        if(null != request.getParameter("zhuangtai") )
        {
            zhuangtai= request.getParameter("zhuangtai");

        }
        log.info("zhuangtai:"+zhuangtai);
        log.info("type_num:"+huohao);
        if (PublicFunc.unEmpty(huohao)) {
            map.put("type_num", huohao);
        }
        if (PublicFunc.unEmpty(zhuangtai) && !zhuangtai.equals("--请选择--")) {
            map.put("finish_or_not", zhuangtai);
        }

        setSearchPage(map);
        int totalRows = xSGLService.getXSGLDingDanmingxiCount_ddgl(map);
        List rows = xSGLService.findXSGLDingDanmingxi_ddgl(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = xSGLService.findXSGLDingDanmingxi_ddgl(page, rp, map);
        }
        if(null == request.getSession().getAttribute("orderid"))
        {
            totalRows = 0;
        }
        log.info("totalRows"+totalRows);
        float totalnum = xSGLService.getXSGLDingDanTotalNum(ddid);
        float totalprice = xSGLService.getXSGLDingDanTotalPrice(ddid);
        request.getSession().setAttribute("totalnum", totalnum);
        request.getSession().setAttribute("totalprice", totalprice);
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getDingDanmingxi_ddglInfoJSON(rows));
        return result;
    }
    /**
     * 通过客户ID（精确查询） 和 客户名字（模糊查询） 查询客户信息 ，如果查出多条默认显示第一条。
     * @return
     */
    private KHGL query_XSGLBykehu_idAndKeHuname(){
        String kehu_id = request.getParameter("kehu_id");
        String KeHuname = request.getParameter("KeHuname");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(kehu_id)) {
            map.put("kehu_id", kehu_id);
        }
        if (PublicFunc.unEmpty(KeHuname)) {
            map.put("KeHuname", KeHuname);
        }
        KHGL kHGL = new KHGL();
        KHGL kHGLtmp= xSGLService.findXSGLBykehu_idAndKeHuname(map);
        if(null != kHGLtmp){
            kHGL = kHGLtmp;
        }
        return kHGL;
    }
    private Result query_KHGL(Result result) {
        String kehu_id = request.getParameter("kehu_id");
        String KeHuname = request.getParameter("kehu_name");
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(kehu_id)) {
            map.put("kehu_id", kehu_id);
        }
        if (PublicFunc.unEmpty(KeHuname)) {
            map.put("KeHuname", KeHuname);
        }
        setSearchPage(map);
        int totalRows = xSGLService.getKHGLCount(map);
        List rows = xSGLService.findKHGLByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = xSGLService.findKHGLByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getKHGLInfoJSON(rows));
        return result;
    }
    private Result query_KHGL_FH_CHECK(Result result) {
        String kehu_id = "";
       if(null != request.getSession().getAttribute("ddid"))
       {
           kehu_id = (String) request.getSession().getAttribute("ddid");
       }
        List rows = xSGLService.findKHGL_FHByDDID(kehu_id);
        result.setTotal(rows.size());
        result.setPage(page);
        result.setRows(JsonUtil.getKHGL_FHInfoJSON(rows));
        return result;
    }

    private Result query_KHGL_FH(Result result) {
        String kehu_id = request.getParameter("kehu_id");
        String lianxiren = request.getParameter("lianxiren");
        log.info("before kehu_id:"+kehu_id);
        if(!PublicFunc.unEmpty(kehu_id))
        {
             if(null != request.getSession().getAttribute("kehuid"))
             {
                 kehu_id = (String) request.getSession().getAttribute("kehuid");
                 request.getSession().removeAttribute("kehuid");
                 log.info("session 's kehu_id:"+kehu_id);
             }
        }
        log.info("getover kehu_id:"+kehu_id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (PublicFunc.unEmpty(kehu_id)) {
            map.put("kehu_id", kehu_id);
        }
        if (PublicFunc.unEmpty(lianxiren)) {
            map.put("lianxiren", lianxiren);
        }
        setSearchPage(map);
        int totalRows = xSGLService.getKHGL_FHCount(map);
        List rows = xSGLService.findKHGL_FHByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = xSGLService.findKHGL_FHByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getKHGL_FHInfoJSON(rows));
        return result;
    }

    private Result query_DDGL(Result result, String ddtype) {
        Map<String, Object> map = new HashMap<String, Object>();
        String kehuname = request.getParameter("kehuname");
        String dingdanhao = request.getParameter("dingdanhao");
        String dateStartText = request.getParameter("dateStartText");
        String dateEndText = request.getParameter("dateEndText");
        String zhuangtai = request.getParameter("zhuangtai");
        if (PublicFunc.unEmpty(kehuname)) {
            map.put("kehuname", kehuname);
        }
        if (PublicFunc.unEmpty(dingdanhao)) {
            map.put("dingdanhao", dingdanhao);
        }
        if (PublicFunc.unEmpty(zhuangtai) && !zhuangtai.equals("--请选择--")) {
            map.put("zhuangtai", zhuangtai);
        }
        if(PublicFunc.unEmpty(ddtype))
        {
            map.put("finish_or_not", ddtype);
        }
        if (PublicFunc.unEmpty(dateStartText)) {
            map.put("dateStartText", PublicFunc.paseStringToDate(dateStartText));
        }
        if (PublicFunc.unEmpty(dateEndText)) {
            map.put("dateEndText", PublicFunc.paseStringToDate(dateEndText));
        }
        setSearchPage(map);
        int totalRows = xSGLService.getYDDGLCount(map);
        List rows = xSGLService.findYDDGLByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = xSGLService.findYDDGLByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getYDDGLInfoJSON(rows));
        return result;
    }

}
