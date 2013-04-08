package com.jiang.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jiang.bean.*;
import com.jiang.service.SCGLService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiang.service.CGGLService;
import com.jiang.service.CKGLService;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;

/***
 * 仓库管理模块
 *
 * @author jxq
 *
 */
@SuppressWarnings("serial")
public class CKGLAction extends BaseAction {
    Logger log = Logger.getLogger(CKGLAction.class);

    @Autowired
    private CKGLService ckGLService;

    @Autowired
    private CGGLService cgGLService;

    @Autowired
    private SCGLService scGLService;

    public String dolist() {
        Result result = new Result();
        String hidden = request.getParameter(HIDDEN);
        String type = request.getParameter(TYPE);
        log.info("parm hidden =" + hidden);
        log.info("parm type =" + type);
        if (PublicFunc.unEmpty(hidden) && hidden.equals("manage")) {
            manager(type, result);
        }
        if (PublicFunc.unEmpty(hidden) && hidden.equals("add")) {
            return add(type);
        }
        if (PublicFunc.unEmpty(hidden) && hidden.equals("delete")) {
            return delete(type);
        }
        return SUCCESS;
    }

    // 判断有没有这个单号
    // 如果有取出单号根据类型将详细信息放到session
    private String add(String type) {
        if (PublicFunc.unEmpty(type) && type.equals("RKSQ")) {
            return add_RKSQ();
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGRKSQ")) {
            return add_CGRKSQ();
        }

        return SUCCESS;
    }

    private String delete(String type) {
        String[] id = request.getParameterValues("id");
        String  cgid = request.getParameter("cgid");
        if (PublicFunc.unEmpty(type) && type.equals("CGRKSQ")) {
            ckGLService.deleteCGRKSQById(Arrays.asList(id));
            Float nums = ckGLService.getTotalNum(cgid);
            String result = nums+"";
            try {
                response.getWriter().write(result);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
        return SUCCESS;
    }

    private String add_CGRKSQ() {
        String mishu = request.getParameter("mishu"); //得到米数
        String huojia = request.getParameter("huojia"); //得到货架
        String tiaoma = request.getParameter("danhao"); //得到条码
        String price = request.getParameter("price"); //得到条码
        String cgid = (String) request.getSession().getAttribute("cgdid");//采购单ID
        String laiyuandanwei = (String) request.getSession().getAttribute("laiyuandanwei");//供应商
        RKQR rkrq = new RKQR();

        if (PublicFunc.unEmpty(mishu)) {
            rkrq.setMishu(new BigDecimal(mishu));
        }
        if (PublicFunc.unEmpty(price)) {
            rkrq.setPrice(new BigDecimal(price));
        }
        if (PublicFunc.unEmpty(cgid)) {
            rkrq.setCaigou_id(cgid);
        }
        if (PublicFunc.unEmpty(tiaoma)) {
            rkrq.setBupi_id(tiaoma);
        }

        if (PublicFunc.unEmpty(laiyuandanwei)) {
            rkrq.setGongyingname(laiyuandanwei);
        }
        if (rkrq != null) {
            boolean unique = ckGLService.checkCGRKQRUniqueness(rkrq);
            if (unique) {
                log.info("TIAOMA:"+request.getSession().getAttribute("TTPP"));
                if(request.getSession().getAttribute("TTPP") == null || !request.getSession().getAttribute("TTPP").equals(tiaoma))
                {
                    log.info("insert:"+ tiaoma);
                    ckGLService.insertCGRKQR(rkrq);
                    request.getSession().setAttribute("TTPP", tiaoma);
                    request.setAttribute("modifycgrkqrerror", "添加成功!");
                }
                Float nums = ckGLService.getTotalNum(cgid);
                request.getSession().setAttribute("nums", nums);
                return "rkqr_cg";
            } else {
                request.setAttribute("cgrkqr", rkrq);
                request.setAttribute("modifycgrkqrerror", "");
                return "rkqr_cg";
            }
        }
        return SUCCESS;
    }

    private String add_RKSQ() {

        String danhao = request.getParameter("danhao"); //入库单号
        String rukutype = request.getParameter("rukutype");//入库类型
        String pingzhengnum = "请点击后输入";//凭证
        if(null != request.getParameter("pingzhengnum"))
        {
            pingzhengnum = request.getParameter("pingzhengnum");
            if(pingzhengnum.contains("请点击后输入"))
            {
                request.setAttribute("modifyrksqlerror", "无效凭证");
                return "rkqr";
            }
        }
        else
        {
            request.setAttribute("modifyrksqlerror", "无效凭证");
            return "rkqr";
        }

        Float nums = ckGLService.getTotalNum(pingzhengnum);
        if(nums != null && nums != 0)
        {
            request.getSession().setAttribute("nums", nums);
        }
        if(request.getSession().getAttribute("rukutype") != null)
        {
             String type =   (String)request.getSession().getAttribute("rukutype");

            if(type.equals("采购入库"))
            {
                return "rkqr_cg";
            }
            else if(type.equals("自加工生产入库"))
            {
                return "rkqr_zjg";
            }else if(type.equals("外加工生产入库"))
            {
                return "rkqr_wjg";
            }
        }



        if (PublicFunc.unEmpty(danhao)) {
            String olddanhao = ckGLService.getRuKuDanIDByMudiID(pingzhengnum);
            if(olddanhao == null)
            {
                boolean isuniq = ckGLService.checkUniquessRKDanhao(danhao);
                if (!isuniq) {
                    // 入库单随机单号重复
                    return "rkqr";
                }
                request.getSession().setAttribute("rukudanhao", danhao);
            }
            else
            {
                request.getSession().setAttribute("rukudanhao", olddanhao);
                danhao = olddanhao;
            }
        }
        if (PublicFunc.unEmpty(rukutype)) {
            request.getSession().setAttribute("rukutype", rukutype);
        }
        if (PublicFunc.unEmpty(pingzhengnum)) {
            request.getSession().setAttribute("cgdid", pingzhengnum);
        }
        boolean  isOk = false;
        Map<String, List<String>> strs = new HashMap<String, List<String>>();
        if (null != request.getSession().getAttribute("dhids")) {
            strs = (Map<String, List<String>>) request.getSession().getAttribute("dhids");
        }
        List<String> str1 = strs.get("cgids");
        List<String> str2 = strs.get("zjgids");
        List<String> str3 = strs.get("wjgids");
        isOk = str1.contains(pingzhengnum);
        if(!isOk)
        {
            isOk = str2.contains(pingzhengnum);
        }
        if(!isOk)
        {
            isOk = str3.contains(pingzhengnum);
        }
        if(!isOk)
        {
            request.setAttribute("modifyrksqlerror", "无效凭证");
            return "rkqr";
        }
        if (PublicFunc.unEmpty(rukutype) && rukutype.equals(PublicFunc.RK_TYPE_CG)) {
            CGGLDJGL dj = cgGLService.getDJGLByCGId(pingzhengnum);
            if(dj == null)
            {
                request.setAttribute("modifyrksqlerror", "无效凭证");
                return "rkqr";
            }
            else
            {
                GYS gys = cgGLService.getGYSById(Integer.valueOf(dj.getGongyingshangid()));
                String gysname = gys.getGongyingname();
                request.getSession().setAttribute("xinghao", dj.getType_num());
                request.getSession().setAttribute("laiyuandanwei", gysname);
                request.getSession().setAttribute("leixing", dj.getLeixing());
                request.getSession().setAttribute("zongmishu", dj.getCG_totalnum()+"");
                RuKuDan rkd = new RuKuDan();
                rkd.setRuku_id(danhao);
                rkd.setRuku_leixing(PublicFunc.RK_TYPE_CG);
                rkd.setMudidanhao(dj.getCaigou_id());
                rkd.setType_num(dj.getType_num());
                rkd.setNum(dj.getCG_totalnum());
                String olddanhao = ckGLService.getRuKuDanIDByMudiID(pingzhengnum);
                if(olddanhao == null)
                {
                    ckGLService.insertRuKuDan(rkd);
                }
           }
            return "rkqr_cg";
        } else if (PublicFunc.unEmpty(rukutype) && rukutype.equals(PublicFunc.RK_TYPE_ZJG)) {
            ZJGgongyidan dj = scGLService.getSCGLZJGBySCId(pingzhengnum);
            if(dj == null)
            {
                request.setAttribute("modifyrksqlerror", "无效凭证");
                return "rkqr";
            }
            else
            {

                //
            }
            return "rkqr_zjg";
        }  else if (PublicFunc.unEmpty(rukutype) && rukutype.equals(PublicFunc.RK_TYPE_WJG)) {
             WJGgongyidan  dj = scGLService.getSCGLWJGBySCId(pingzhengnum);
            if(dj == null)
            {
                request.setAttribute("modifyrksqlerror", "无效凭证");
                return "rkqr";
            }
            else
            {

                //
            }
            return "rkqr_wjg";
        }
        return "rkqr_cg";
    }

    /**
     * 仓库管理查询
     *
     * @param result
     * @return
     */
    private Result query_CKGL(Result result) {
        int totalRows = 0;
        Map<String, Object> map = new HashMap<String, Object>();
        String tn = request.getParameter("type_num");
        totalRows = cgGLService.getCKCXCount(map);
        List<CangKu> rows = cgGLService.findCKCXByPage(page, rp, map);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = cgGLService.findCKCXByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getCKGLInfoJSON(rows));
        return result;
    }

    /**
     * 开剪管理查询
     *
     * @param result
     * @return
     */
    private Result query_KJGL(Result result) {
        int totalRows = 0;
        totalRows = ckGLService.getKJGLCount();
        List rows = ckGLService.findKJGLByPage(page, rp);
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = ckGLService.findKJGLByPage(page, rp);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getKJGLInfoJSON(rows));
        return result;
    }

    /**
     * 查询模块
     *
     * @param type
     * @param result
     */
    private void manager(String type, Result result) {
        if (PublicFunc.unEmpty(type) && type.equals("CKGL")) {
            result = query_CKGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("KJGL")) {
            result = query_KJGL(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGRK")) {
            result = query_CGRK(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("CGRKZJ")) {
            result = query_CGRKZJ(result);
        }
        if (PublicFunc.unEmpty(type) && type.equals("SCZJGRKZJ")) {
            result = query_SCZJGRKZJ(result);
        }

        json = JsonUtil.getResponseJson(result);
        onResponse(json);

    }

    private Result query_CGRK(Result result) {
        int totalRows = 0;
        Map<String, Object> map = new HashMap<String, Object>();
        String cgid = (String) request.getSession().getAttribute("cgdid");
        System.out.println("cgid"+cgid);
        //	String cgid = "CG1112314617";
        map.put("cgid", cgid);
        totalRows = ckGLService.getCGRKCount(map);
        log.info(totalRows);
        List rows = ckGLService.findCGRKByPage(page, rp, map);
        log.info("ckGLService.findCGRKByPage(page, rp, map)");
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = ckGLService.findCGRKByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getCGRKInfoJSON(rows));
        return result;
    }
    private Result query_CGRKZJ(Result result) {
        int totalRows = 0;
        Map<String, Object> map = new HashMap<String, Object>();
        String cgid = (String) request.getSession().getAttribute("cgdid");
        System.out.println("cgid"+cgid);
        //	String cgid = "CG1112314617";
        map.put("cgid", cgid);
        totalRows = ckGLService.getCGRKCount(map);
        log.info(totalRows);
        List rows = ckGLService.findCGRKByPage(page, rp, map);
        log.info("ckGLService.findCGRKByPage(page, rp, map)");
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = ckGLService.findCGRKByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getCGRKZJInfoJSON(rows));
        return result;
    }
    private Result query_SCZJGRKZJ(Result result) {
        int totalRows = 0;
        Map<String, Object> map = new HashMap<String, Object>();
        String cgid = (String) request.getSession().getAttribute("scdid");
        System.out.println("scdid"+cgid);
        //	String cgid = "CG1112314617";
        map.put("scdid", cgid);
        totalRows = ckGLService.getSCZJGRKCount(map);
        log.info(totalRows);
        List rows = ckGLService.findSCZJGRKByPage(page, rp, map);
        log.info("ckGLService.findSCZJGRKByPage(page, rp, map)");
        if (rows.size() == 0 && page > 1) {
            page -= 1;
            rows = ckGLService.findSCZJGRKByPage(page, rp, map);
        }
        result.setTotal(totalRows);
        result.setPage(page);
        result.setRows(JsonUtil.getSCZJGRKZJInfoJSON(rows));
        return result;
    }
}
