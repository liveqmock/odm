package com.jiang.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import com.jiang.bean.FHGL;
import com.jiang.service.FHGLService;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;

/***
 * 发货管理模块
 *
 * @author jxq
 *
 */

@SuppressWarnings("serial")
public class FHGLAction extends BaseAction {

    Logger log = Logger.getLogger(FHGLAction.class);

    @Autowired
    private FHGLService fHGLService;

    @SuppressWarnings("unchecked")
    public String dolist() {
        Result result = new Result();
        String hidden = request.getParameter(HIDDEN);
        String type = request.getParameter(TYPE);
        String sortOrder = request.getParameter(SORTORDER);
        String sortName = request.getParameter(SORTNAME);
        log.info("parm hidden =" + hidden);
        log.info("parm type =" + type);
        if (PublicFunc.unEmpty(hidden) && hidden.equals("manage")) {
            int totalRows = 0;
            if (PublicFunc.unEmpty(type) && type.equals("FHGL")) {
                String xxd = request.getParameter("XiaoshoudanId");
                String kdd = request.getParameter("KuaididanId");
                String fhr = request.getParameter("Fahuoren");
                String fht = request.getParameter("FahuoTime");
                String zt = request.getParameter("Zhuangtai");
                Map<String, Object> map = new HashMap<String, Object>();
                if (PublicFunc.unEmpty(xxd)) {
                    map.put("XiaoshoudanId", xxd);
                }
                if (PublicFunc.unEmpty(kdd)) {
                    map.put("KuaididanId", kdd);
                }
                if (PublicFunc.unEmpty(fhr)) {
                    map.put("Fahuoren", fhr);
                }
                if (PublicFunc.unEmpty(fht)) {
                    map.put("FahuoTime", PublicFunc.paseStringToDate(fht));
                }
                if (PublicFunc.unEmpty(zt) && !zt.equals("--请选择--")) {
                    map.put("Zhuangtai", zt);
                }
                setSearchPage(map);
                totalRows = fHGLService.getFHGLCount(map);
                log.info("totolerow"+totalRows);
                List<FHGL> rows = fHGLService.findFHGLByPage(page, rp, map);
                if (rows.size() == 0 && page > 1) {
                    page -= 1;
                    rows = fHGLService.findFHGLByPage(page, rp,map);
                }
                result.setTotal(totalRows);
                result.setPage(page);
                result.setRows(JsonUtil.getFHGLInfoJSON(rows));
            }
            json = JsonUtil.getResponseJson(result);
            onResponse(json);
        }
        if (PublicFunc.unEmpty(hidden) && hidden.equals("delete")) {
            if (PublicFunc.unEmpty(type) && type.equals("FHGL")) {
                String[] id = request.getParameterValues("id");
                fHGLService.deleteFHGLByIds(PublicFunc
                        .paseStringListTOIntegerList(id));
            }
        }
        return SUCCESS;
    }

}
