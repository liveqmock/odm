package com.jiang.action;

import com.jiang.bean.*;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;
import net.sf.json.JSONArray;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p/>
 *
 * @author <p/>
 * @Date <p>
 */
public class JsonUtil {

    /**
     * @param object 任意对象
     * @return java.lang.String
     */
    public static String objectToJson(Object object) {
        StringBuilder json = new StringBuilder();
        if (object == null) {
            json.append("\"\"");
        } else if (object instanceof String || object instanceof Integer) {
            json.append("\"").append((String) object).append("\"");
        } else {
            json.append(beanToJson(object));
        }
        return json.toString();
    }

    /**
     * 功能描述:传入任意一个 javabean 对象生成一个指定规格的字符串
     *
     * @param bean bean对象
     * @return String
     */
    public static String beanToJson(Object bean) {
        StringBuilder json = new StringBuilder();
        json.append("{");
        PropertyDescriptor[] props = null;
        try {
            props = Introspector.getBeanInfo(bean.getClass(), Object.class)
                    .getPropertyDescriptors();
        } catch (IntrospectionException e) {
        }
        if (props != null) {
            for (int i = 0; i < props.length; i++) {
                try {
                    String name = objectToJson(props[i].getName());
                    String value = objectToJson(props[i].getReadMethod()
                            .invoke(bean));
                    json.append(name);
                    json.append(":");
                    json.append(value);
                    json.append(",");
                } catch (Exception e) {
                }
            }
            json.setCharAt(json.length() - 1, '}');
        } else {
            json.append("}");
        }
        return json.toString();
    }

    /**
     * 功能描述:通过传入一个列表对象,调用指定方法将列表中的数据生成一个JSON规格指定字符串
     *
     * @param list 列表对象
     * @return java.lang.String
     */
    public static String listToJson(List<?> list) {
        StringBuilder json = new StringBuilder();
        json.append("[");
        if (list != null && list.size() > 0) {
            for (Object obj : list) {
                json.append(objectToJson(obj));
                json.append(",");
            }
            json.setCharAt(json.length() - 1, ']');
        } else {
            json.append("]");
        }
        return json.toString();
    }

    public static String getResponseJson(Result result) {
        JSONArray object = JSONArray.fromObject(result);
        String jsonStr = object.toString();
        jsonStr = jsonStr.substring(1, jsonStr.length() - 1);
        return jsonStr;
    }

    /**
     * 数据JSON格式化
     *
     * @param list
     * @param
     * @return
     */
    public static List getReleaseInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            CGGLDJGL cg = (CGGLDJGL) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getXiadan_time());
            if (!PublicFunc.ORDER_STATE_FINISH.equals(cg.getZhuangtai())) {
                xiadantime = "<font color=red>" + xiadantime + "</font>";
            }
            String data = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getJiaohuo_time());

            BigDecimal b2 = cg.getCG_totalnum();

            String rkzj = "共入库：";//
            BigDecimal rukumishu = new BigDecimal("0");
            BigDecimal zhijianmishu = new BigDecimal("0");
            if(cg.getMishu_rk() != null)
            {
                rukumishu =  cg.getMishu_rk();
            }
            if(cg.getMishu_zj() != null)
            {
                zhijianmishu = cg.getMishu_zj();
            }
            rukumishu =  rukumishu.add(zhijianmishu);
            rkzj += rukumishu+"米,质检"+zhijianmishu+"米";
            cellMap.put(
                    "cell",
                    new Object[]{
                            cg.getId(),
//							"<a href='CGGL_dolist?hidden=premodify&type=DJGL&id=" + cg.getId()
//									+ "'><font color=green>"
//									+ cg.getCaigou_id() + "</font></a>",
                            cg.getCaigou_id(),
                            cg.getType_num(), b2+"", data, cg.getGongyingname(),
                             xiadantime, cg.getZhuangtai(), rkzj,
                            cg.getJiedanren(), cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON格式化 消息管理
     *
     * @param list
     * @param
     * @return
     */
    public static List<Map<String, Object>> getXXGLInfoJSON(List<Message> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (Message tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            String data = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                    .getSendTime());
            cellMap.put("cell", new Object[]{tmp.getId(), tmp.getSend_man(),
                    tmp.getLaiyuanbumen(), tmp.getDanhao(), tmp.getXinghao(),
                    tmp.getMessage(), data, tmp.getSendtype()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON 入库确认
     *
     * @param list
     * @param
     * @return
     */
    public static List<Map<String, Object>> getRKQRInfoJSON(List<RKQR> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (RKQR tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            String data1 = null, data2 = null;
            if (tmp.getApply_time() != null) {
                data1 = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getApply_time());
            }
            if (tmp.getQueren_time() != null) {
                data2 = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getQueren_time());
            }
            cellMap.put(
                    "cell",
                    new Object[]{
                            tmp.getId(),
                            tmp.getCaigou_id(),
                            tmp.getBupi_id(), // 型号
                            tmp.getBupi_id(), tmp.getMishu()+"", tmp.getPrice()+"",
                            tmp.getGongyingname(), tmp.getApply_man(), data1,
                            tmp.getQueren_man(), data2});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON 采购退货
     *
     * @param list
     * @param
     * @return
     */
    public static List<Map<String, Object>> getCGTHInfoJSON(List<CGTH> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (CGTH tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            String data1 = null, data2 = null;
            if (tmp.getApply_Time() != null) {
                data1 = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getApply_Time());
            }
            if (tmp.getQueren_Time() != null) {
                data2 = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getQueren_Time());
            }

            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getTuiHuo_Id(),
                            tmp.getCaiGou_Id(),
                            tmp.getTuiHuoDanJia(), tmp.getApply_Man(), data1,
                            tmp.getQueren_Man(), data2, tmp.getZhuangtai()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON 仓库查询
     *
     * @param list
     * @param
     * @return
     */
    public static List<Map<String, Object>> getCKCXInfoJSON(List<CangKu> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (CangKu tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getBupi_id(), tmp.getType_num(),
                            tmp.getCkname(), tmp.getBptype(), tmp.getKY_num()+"", tmp.getKJ_num()+"",
                            tmp.getNum()+"", // 价格
                            tmp.getZhiliangdengji(), tmp.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON 发货管理
     *
     * @param list
     * @param
     * @return
     */
    public static List getFHGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            FHGL fh = (FHGL) list.get(i);
            cellMap.put("id", fh.getId());
            String data1 = null;
            if (fh.getFahuoTime() != null)
                data1 = new SimpleDateFormat("yyyy-MM-dd").format(fh
                        .getFahuoTime());
            cellMap.put(
                    "cell",
                    new Object[]{fh.getId(), fh.getXiaoshoudanId(),
                            fh.getKuaididanId(), fh.getFahuoren(), data1,
                            fh.getZhuangtai()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON 供应商管理
     *
     * @param list
     * @param
     * @return
     */
    public static List getGYSGLInfoJSON(List list) {
        String jsonStr = "";
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            GYS cg = (GYS) list.get(i);
            cellMap.put("id", cg.getId());
            String data1 = null, data2 = null;
            // 名称 类型 联系人 电话 手机 传真 开户行帐号 E_mail 开票名称
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getGongyingname(),
                            cg.getLeixing(), cg.getSeller(), cg.getTelephone(),
                            cg.getPhone(), cg.getChuanzhen(), cg.getKhhzh1(),
                            cg.getEmail(), cg.getKpmc1()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getZLGL_YLInfoJSON(List list) {
        String jsonStr = "";
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            ZLGLYLZL cg = (ZLGLYLZL) list.get(i);
            cellMap.put("id", cg.getId());
            String data1 = null, data2 = null;
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getXilie(), cg.getType_num(),
                            cg.getGuige(), cg.getDanwei(), cg.getXiaxian(),
                            cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getZLGL_BCPInfoJSON(List rows) {
        String jsonStr = "";
        List mapList = new ArrayList();
        for (int i = 0; i < rows.size(); i++) {
            Map cellMap = new HashMap();
            ZLGLBCPZL cg = (ZLGLBCPZL) rows.get(i);
            cellMap.put("id", cg.getId());
            String data1 = null, data2 = null;
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getXilie(), cg.getType_num(),
                            cg.getColor(), cg.getDanwei(), cg.getXiaxian(),
                            cg.getGuige(), cg.getKahao(), cg.getZhenshu(), cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getZLGL_CPInfoJSON(List rows) {
        String jsonStr = "";
        List mapList = new ArrayList();
        for (int i = 0; i < rows.size(); i++) {
            Map cellMap = new HashMap();
            ZLGLCPZL cg = (ZLGLCPZL) rows.get(i);
            cellMap.put("id", cg.getId());
            String data1 = null, data2 = null;
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getTiaoxingma(),
                            cg.getXilie(), cg.getType_num(), cg.getColor(),
                            cg.getXiaxian(), cg.getGuige(), cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getZLGL_SPInfoJSON(List rows) {
        String jsonStr = "";
        List mapList = new ArrayList();
        for (int i = 0; i < rows.size(); i++) {
            Map cellMap = new HashMap();
            ZLGLSPZL cg = (ZLGLSPZL) rows.get(i);
            cellMap.put("id", cg.getId());
            String data1 = null, data2 = null;
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getXilie(), cg.getType_num(),
                            cg.getChengfen(), cg.getWeigh(), cg.getSP_huawei(),
                            cg.getCZ_huawei(), cg.getGuige(), cg.getPicture()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON 仓库管理
     *
     * @param list
     * @param
     * @return
     */
    public static List getCKGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            CangKu cg = (CangKu) list.get(i);
            cellMap.put("id", cg.getId());
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getBupi_id(), cg.getCkname(),
                            cg.getBptype(), cg.getType_num(), cg.getNum()+"",
                            cg.getRuku_leixing(), cg.getRukdan_id(),
                            cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 生产工艺单，自加工工艺单
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getSCGLzjgGongYiDanInfoJSON(
            List<ZJGgongyidan> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (ZJGgongyidan tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            String jiaoHuoTime = null;
            if (tmp.getJiaohuo_time() != null) {
                jiaoHuoTime = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getJiaohuo_time());
            }
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getBianhao(),
                            tmp.getDown_typeNum(), tmp.getUp_typeNum(),
                            tmp.getDibuName(), tmp.getNum()+"", tmp.getGongyi(), tmp.getKahao(), tmp.getZhenshu(),
                            tmp.getChejian(), jiaoHuoTime, tmp.getZhuangtai(), tmp.getJiedanren(),
                            tmp.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 生产工艺单，外加工工艺单
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getSCGLwjgGongYiDanInfoJSON(
            List<WJGgongyidan> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (WJGgongyidan tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            String jiaoHuoTime = null;
            if (tmp.getJiaohuo_time() != null) {
                jiaoHuoTime = new SimpleDateFormat("yyyy-MM-dd").format(tmp.getJiaohuo_time());
            }
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getBianhao(),
                            tmp.getDown_typeNum(), tmp.getUP_typeNum(),
                            tmp.getNum()+"", tmp.getJG_danwei(), jiaoHuoTime,
                            tmp.getGongyi(), tmp.getGuige(), tmp.getZhuangtai(),
                            tmp.getJiedanren(), tmp.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 生产工艺单，样本工艺单
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getSCGLybGongYiDanInfoJSON(
            List<YBgongyidan> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (YBgongyidan tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getyBGongYiId(),
                            tmp.getyBtype(), tmp.getTiaoXingMa(),
                            tmp.getkHoRyB(), tmp.getNum()+"", tmp.getxJType(),
                            tmp.getFinish()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 采购指令管理
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getCGZLGLInfoJSON(
            List<caiGouZhiLing> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (caiGouZhiLing tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            String jiaoHuoTime = null;
            String xiaDanTime = null;
            if (tmp.getJiaoHuoTime() != null) {
                jiaoHuoTime = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getJiaoHuoTime());
            }
            if (tmp.getXiaDanTime() != null) {
                xiaDanTime = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getXiaDanTime());
            }
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getCaiGouId(),
                            tmp.getTypeNum(), tmp.getcGTotalNum(), jiaoHuoTime,
                            tmp.getUserName(), xiaDanTime, tmp.getZhuangTai()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 仓库查询
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getCangKuInfoJSON(
            List<cangKuChaXun> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (cangKuChaXun tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getType_num(),
                            tmp.getCkname(), tmp.getBptype(), tmp.getKY_num()+"", tmp.getKJ_num()+"",
                            tmp.getNum()+"", tmp.getNum()+"", tmp.getPinji()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 生产入库
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getSCRuKuInfoJSON(List<SCRuKu> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (SCRuKu tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getGongyidan_id(),
                            tmp.getBupi_id(), tmp.getBupi_id(), tmp.getMishu()+"",
                            tmp.getPrice(), tmp.getGongyingname(),
                            tmp.getQueren_man(), tmp.getQueren_time(),
                            tmp.getQueren_man(), tmp.getQueren_time()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 质检报告
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getZJReportInfoJSON(
            List<zhiJianReport> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (zhiJianReport tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            int a = 0;
            if (tmp.getJindu() != null || tmp.getJindu() > 0) {
                a = tmp.getJindu();
            }
            int b = 0;
            if (tmp.getAlljindu() != null && tmp.getAlljindu() > 0) {
                b = tmp.getAlljindu();
            }
            String s = a + "/" + b;
            String zjtime = null;
            if (tmp.getApply_time() != null) {
                zjtime = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getApply_time());
            }
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getReport_id(),
                            tmp.getLaiyuan_id(), tmp.getXinghao(),
                            tmp.getNum()+"", tmp.getApply_man(), zjtime, s});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 半成品
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getBCPKJApplyInfoJSON(
            List<BCPKJ_Apply> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (BCPKJ_Apply tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            String applyTime = null;
            String queRenTime = null;
            if (tmp.getApply_time() != null) {
                applyTime = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getApply_time());
            }
            if (tmp.getQueren_time() != null) {
                queRenTime = new SimpleDateFormat("yyyy-MM-dd").format(tmp
                        .getQueren_time());
            }
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getKaijian_id(),
                            tmp.getType_num(), tmp.getBupi_id(),
                            tmp.getYuanmishu()+"", tmp.getNew_bupi_id(),
                            tmp.getJianchumishu()+"", tmp.getShunhao()+"",
                            tmp.getApply_man(), applyTime, tmp.getQueren_man(),
                            queRenTime,tmp.getBeizhu(), tmp.getZhuangtai()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 供应商
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getGYSInfoJSON(
            List<gongYingShang> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (gongYingShang tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getGongyingname(),
                            tmp.getLeixing(), tmp.getSeller(), tmp.getPhone(),
                            tmp.getTelephone(), tmp.getChuanzhen(),
                            tmp.getKaihuhang1(), tmp.getEmail(), tmp.getKpmc1()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 外加工单位供应商
     *
     * @param list
     * @return
     */
    public static List<Map<String, Object>> getWJGDWGLInfoJSON(
            List<wJGGongYingShang> list) {
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        for (wJGGongYingShang tmp : list) {
            Map<String, Object> cellMap = new HashMap<String, Object>();
            cellMap.put("id", tmp.getId());
            cellMap.put(
                    "cell",
                    new Object[]{tmp.getId(), tmp.getDanweiname(),
                            tmp.getJGleixing(), tmp.getSeller(),
                            tmp.getTelephone(), tmp.getPhone(),
                            tmp.getChuanzhen(), tmp.getKpmc(), tmp.getKpaddress(),
                            tmp.getKhhzh(), tmp.getEmail(), tmp.getAddress()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getKJGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            KJGL cg = (KJGL) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getKaijian_time());
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getHis_Tiaoxingma(),
                            cg.getTiaoxingma(), cg.getType_num(),
                            cg.getYuanmishu()+"", cg.getMishu()+"",
                            cg.getShunhao_id(), cg.getKaijian_man(),
                            xiadantime, cg.getZhijian_reasult()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getYDDGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            YDDGL cg = (YDDGL) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getKaidan_time());
            cellMap.put("cell", new Object[]{cg.getId(), cg.getDingdan_id(),
                    cg.getDingdan_name(), cg.getPay_way(), cg.getFh_way(),
                    xiadantime, cg.getZhuangtai(), cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getXSDGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            YDDGL cg = (YDDGL) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getKaidan_time());
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getDingdan_id(),
                            cg.getDingdan_name(), cg.getPay_way(),
                            cg.getFh_way(), xiadantime, cg.getZhuangtai(),
                            cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getKHGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            KHGL cg = (KHGL) list.get(i);
            cellMap.put("id", cg.getId());
            cellMap.put(
                    "cell",// 编号 客户名称 联系人 电话 手机 传真 备注
                    new Object[]{cg.getId(), cg.getKehu_id(),
                            cg.getKeHuname(), cg.getSeller(),
                            cg.getTelephone(), cg.getPhone(),
                            cg.getChuanzhen(), cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getYHGLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            YHGL cg = (YHGL) list.get(i);
            cellMap.put("id", cg.getId());
            String quanxian = "";
            String temp = cg.getQuanxian();

            int index = PublicFunc.getIndexByBumenName(cg.getBumen());
            System.out.println(index);
            System.out.println("权限:" + temp);

            String str[] = PublicFunc.sunmenus[index];
            String msg = "";
            if (cg.getBumen().equals(PublicFunc.STR_BUMEN_XT)) {
                quanxian += "所有权限";
            } else {
                for (int m = 0; m < temp.length(); m++) {
                    if (m >= str.length)
                        break;
                    if (temp.charAt(m) == '1') {
                        quanxian += "<input type='checkbox' disabled='disabled' name='checkbox1' value='"
                                + str[m] + "'checked>" + str[m];
                    } else {
                        quanxian += "<input type='checkbox' disabled='disabled' name='checkbox1' value='"
                                + str[m] + "'>" + str[m];
                    }
                    msg += str[m];
                    if (msg.length() > 60) {
                        msg = "";
                        quanxian += "<br>";
                    }
                }
            }

            String company = cg.getCompany();
            if (company.contains("1")) {
                company = "宜纺集团";
            } else if (company.contains("0")) {
                company = "森泰集团";
            } else {
                company = "系统管理";
            }
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getRealName(),
                            cg.getUsername(), company, cg.getBumen(), quanxian});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getLSJLInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            LSJL cg = (LSJL) list.get(i);
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getOperatetime());
            cellMap.put("id", cg.getId());
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getUsername(),
                            cg.getRealName(), cg.getBumen(), xiadantime,
                            cg.getNeirong()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getXTCSInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            XTCS cg = (XTCS) list.get(i);
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getName(), cg.getZhonglei()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getGYSXHInfoJSON(List<GYSXH> list, Map<Integer, String> gyss) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            GYSXH cg = (GYSXH) list.get(i);
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), gyss.get(cg.getGysid()), cg.getXinghao()});
            mapList.add(cellMap);
        }
        return mapList;
    }


    public static Collection<?> getCGRKInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            RKQR cg = (RKQR) list.get(i);
            String zhijian = "";
            int m = cg.getZhijian_or_not();
            switch (m)
            {
                case PublicFunc.BP_STATE_RUKUPRINT_NOT_INT:
                    zhijian = PublicFunc.BP_STATE_RUKUPRINT_NOT+"<input type=button  value=打入打印  onclick=dayin('" + cg.getBupi_id() + "') />";
                    break;
                case PublicFunc.BP_STATE_RUKUPRINT_PRE_INT:
                    zhijian = PublicFunc.BP_STATE_RUKUPRINT_PRE+"<input type=button  value=取消打印  onclick=quxiaodayin('" + cg.getBupi_id() + "') />";
                    break;
                case PublicFunc.BP_STATE_RUKU_INT:
                    zhijian = PublicFunc.BP_STATE_RUKU;
                    break;
                case PublicFunc.BP_STATE_ZHIJIANP_NOTPASS_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIANP_NOTPASS;
                    break;
                case PublicFunc.BP_STATE_ZHIJIANPRINT_NOT_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIANPRENT_PRE;
                    break;
                case PublicFunc.BP_STATE_ZHIJIANPRENT_PRE_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIANPRENT_PRE;
                    break;
                case PublicFunc.BP_STATE_ZHIJIAN_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIAN;
                default:
                    break;
            }
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getBupi_id(), cg.getMishu()+"",cg.getJitaihao()+"", cg.getBeizhu(), zhijian});
            mapList.add(cellMap);
        }
        return mapList;
    }
    public static Collection<?> getCGRKZJInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            RKQR cg = (RKQR) list.get(i);
            if(cg.getJitaihao() == null)
            {
                cg.setJitaihao(0);
            }

            String zhijian = "";
            int m  = cg.getZhijian_or_not();
            switch (m)
            {
                case PublicFunc.BP_STATE_RUKUPRINT_NOT_INT:
                    zhijian = PublicFunc.BP_STATE_RUKUPRINT_NOT;
                    break;
                case PublicFunc.BP_STATE_RUKUPRINT_PRE_INT:
                    zhijian = PublicFunc.BP_STATE_RUKUPRINT_PRE;
                    break;
                case PublicFunc.BP_STATE_RUKU_INT:
                    zhijian = PublicFunc.BP_STATE_RUKU+"<input type=button  value=质检  onclick=zhijian('" + cg.getBupi_id() + "#" + cg.getMishu()+ "#" + cg.getJitaihao()  + "') />";
                    break;
                case PublicFunc.BP_STATE_ZHIJIANP_NOTPASS_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIANP_NOTPASS+"<input type=button  value=重新质检  onclick=zhijian('" + cg.getBupi_id() + "#" + cg.getMishu()+ "#" + cg.getJitaihao()  + "') />";
                    break;
                case PublicFunc.BP_STATE_ZHIJIANPRINT_NOT_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIANPRENT_PRE+"<input type=button  value=打入打印  onclick=dayin('" + cg.getBupi_id() + "') />";
                    break;
                case PublicFunc.BP_STATE_ZHIJIANPRENT_PRE_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIANPRENT_PRE+"<input type=button  value=取消打印  onclick=quxiaodayin('" + cg.getBupi_id() + "') />";;
                    break;
                case PublicFunc.BP_STATE_ZHIJIAN_INT:
                    zhijian = PublicFunc.BP_STATE_ZHIJIAN;
                    break;
                default:
                    break;
            }


            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getBupi_id(), cg.getJitaihao(), cg.getMishu()+"", cg.getShijimishu()+"", cg.getPinzhi(), cg.getBeizhu(), zhijian});
            mapList.add(cellMap);
        }
        return mapList;
    }

    /**
     * 数据JSON格式化
     *
     * @param list
     * @param
     * @return
     */
    public static List getCGZJInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            CGGLDJGL cg = (CGGLDJGL) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getXiadan_time());
            if (!PublicFunc.ORDER_STATE_FINISH.equals(cg.getZhuangtai())) {
                xiadantime = "<font color=red>" + xiadantime + "</font>";
            }
            String data = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getJiaohuo_time());
            String iszhijian = "";
            if (cg.getZhuangtai().contains("已质检")) {
                iszhijian = "已质检";
            } else {
                iszhijian = "未质检";
            }
            String mm = cg.getCaigou_id();
            cellMap.put(
                    "cell",
                    new Object[]{
                            cg.getId(), cg.getCaigou_id(),
                            cg.getType_num(), cg.getCG_totalnum()+"",
                            cg.getUserName(), xiadantime, iszhijian, "<input type=button  value=质检  onclick=cgzhijian('" + mm + "') />"});
            mapList.add(cellMap);
        }
        return mapList;
    }
    public static List getCGRK2InfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            CGGLDJGL cg = (CGGLDJGL) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getXiadan_time());
            if (!PublicFunc.ORDER_STATE_FINISH.equals(cg.getZhuangtai())) {
                xiadantime = "<font color=red>" + xiadantime + "</font>";
            }
            String data = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getJiaohuo_time());
            String mm = cg.getCaigou_id();
            cellMap.put(
                    "cell",
                    new Object[]{
                            cg.getId(), cg.getCaigou_id(),
                            cg.getType_num(), cg.getCG_totalnum()+"",
                            cg.getUserName(), xiadantime, cg.getZhuangtai(), "<input type=button  value=入库  onclick=cgrukun('" + mm + "') />"});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static List getSCZJGZJInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            ZJGgongyidan cg = (ZJGgongyidan) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg.getKaidantime());
            if (!PublicFunc.ORDER_STATE_FINISH.equals(cg.getZhuangtai())) {
                xiadantime = "<font color=red>" + xiadantime + "</font>";
            }
            String data = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getJiaohuo_time());
            String iszhijian = "";
            if (cg.getZhuangtai().contains("已质检")) {
                iszhijian = "已质检";
            } else {
                iszhijian = "未质检";
            }
            String mm = cg.getBianhao();
            cellMap.put(
                    "cell",
                    new Object[]{
                            cg.getId(), cg.getBianhao(),
                            cg.getDown_typeNum(), cg.getNum()+"",
                            cg.getKaidanren(), xiadantime, iszhijian, "<input type=button  value=质检  onclick=sczjgzhijian('" + mm + "') />"});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static List getSCWJGZJInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            WJGgongyidan  cg = (WJGgongyidan) list.get(i);
            cellMap.put("id", cg.getId());
            String xiadantime = new SimpleDateFormat("yyyy-MM-dd").format(cg.getKaidantime());
            if (!PublicFunc.ORDER_STATE_FINISH.equals(cg.getZhuangtai())) {
                xiadantime = "<font color=red>" + xiadantime + "</font>";
            }
            String data = new SimpleDateFormat("yyyy-MM-dd").format(cg
                    .getJiaohuo_time());
            String iszhijian = "";
            if (cg.getZhuangtai().contains("已质检")) {
                iszhijian = "已质检";
            } else {
                iszhijian = "未质检";
            }
            String mm = cg.getBianhao();
            cellMap.put(
                    "cell",
                    new Object[]{
                            cg.getId(), cg.getBianhao(),
                            cg.getDown_typeNum(), cg.getNum()+"",
                            cg.getKaidanren(), xiadantime, iszhijian, "<input type=button  value=质检  onclick=scwjgzhijian('" + mm + "') />"});
            mapList.add(cellMap);
        }
        return mapList;
    }


    /**
     * 客户发货地址管理
     */
    public static Collection<?> getKHGL_FHInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            KHGL_FH cg = (KHGL_FH) list.get(i);
            cellMap.put("id", cg.getId());
            cellMap.put(
                    "cell",
                    new Object[]{cg.getId(), cg.getKehu_id(),
                            cg.getFahuofangshi(), cg.getLianxiren(), cg.getDianhua(),
                            cg.getYidongdianhua(), cg.getDizhi()});
            mapList.add(cellMap);
        }
        return mapList;
    }
    /**
     * 获取该对象的JSON格式
     * @param tmp
     * @return
     */
    public static String getKHGLJson(KHGL tmp){
        /*{"studno":"122222","studname":"wwww","studsex":"男"}  单个对象的JSON格式
           数据JSON格式
          [{"studno":"122222","studname":"wwww","studsex":"男"} ,
           {"studno":"122222","studname":"wwww","studsex":"男"}]*/

        StringBuffer json = new StringBuffer();
        //id
        json.append("{");
        json.append("\"");
        json.append("id");
        json.append("\":");
        json.append("\"");
        json.append(tmp.getId());
        json.append("\"");

        //kehu_id
        json.append(",");
        json.append("\"");
        json.append("kehu_id");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getKehu_id() && !"".equals(tmp.getKehu_id())){
            json.append(tmp.getKehu_id());
        }
        json.append("\"");

        //KeHuname
        json.append(",");
        json.append("\"");
        json.append("KeHuname");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getKeHuname() && !"".equals(tmp.getKeHuname())){
            json.append(tmp.getKeHuname());
        }
        json.append("\"");

        //suoxie
        json.append(",");
        json.append("\"");
        json.append("suoxie");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getSuoxie() && !"".equals(tmp.getSuoxie())){
            json.append(tmp.getSuoxie());
        }
        json.append("\"");

        //telephone
        json.append(",");
        json.append("\"");
        json.append("telephone");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getTelephone() && !"".equals(tmp.getTelephone())){
            json.append(tmp.getTelephone());
        }
        json.append("\"");
        // telephone2
        json.append(",");
        json.append("\"");
        json.append("telephone2");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getTelephone2() && !"".equals(tmp.getTelephone2())){
            json.append(tmp.getTelephone2());
        }
        json.append("\"");
        // seller
        json.append(",");
        json.append("\"");
        json.append("seller");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getSeller() && !"".equals(tmp.getSeller())){
            json.append(tmp.getSeller());
        }
        json.append("\"");
        // phone
        json.append(",");
        json.append("\"");
        json.append("phone");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getPhone() && !"".equals(tmp.getPhone())){
            json.append(tmp.getPhone());
        }
        json.append("\"");
        //chuanzhen
        json.append(",");
        json.append("\"");
        json.append("chuanzhen");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getChuanzhen() && !"".equals(tmp.getChuanzhen())){
            json.append(tmp.getChuanzhen());
        }
        json.append("\"");
        // email
        json.append(",");
        json.append("\"");
        json.append("email");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getEmail() && !"".equals(tmp.getEmail())){
            json.append(tmp.getEmail());
        }
        json.append("\"");
        //suoshuquyu
        json.append(",");
        json.append("\"");
        json.append("suoshuquyu");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getSuoshuquyu() && !"".equals(tmp.getSuoshuquyu())){
            json.append(tmp.getSuoshuquyu());
        }
        json.append("\"");
        // address
        json.append(",");
        json.append("\"");
        json.append("address");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getAddress() && !"".equals(tmp.getAddress())){
            json.append(tmp.getAddress());
        }
        json.append("\"");
        // web
        json.append(",");
        json.append("\"");
        json.append("web");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getWeb() && !"".equals(tmp.getWeb())){
            json.append(tmp.getWeb());
        }
        json.append("\"");
        // yewuyuan
        json.append(",");
        json.append("\"");
        json.append("yewuyuan");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getYewuyuan() && !"".equals(tmp.getYewuyuan())){
            json.append(tmp.getYewuyuan());
        }
        json.append("\"");
        // VIPkeHu
        json.append(",");
        json.append("\"");
        json.append("VIPkeHu");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getVIPkeHu() && !"".equals(tmp.getVIPkeHu())){
            json.append(tmp.getVIPkeHu());
        }
        json.append("\"");
        // jiesuanfangshi
        json.append(",");
        json.append("\"");
        json.append("jiesuanfangshi");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getJiesuanfangshi() && !"".equals(tmp.getJiesuanfangshi())){
            json.append(tmp.getJiesuanfangshi());
        }
        json.append("\"");
        // qiankuanshangxian
        json.append(",");
        json.append("\"");
        json.append("qiankuanshangxian");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getQiankuanshangxian() && !"".equals(tmp.getQiankuanshangxian())){
            json.append(tmp.getQiankuanshangxian());
        }
        json.append("\"");
        //beizhu
        json.append(",");
        json.append("\"");
        json.append("beizhu");
        json.append("\":");
        json.append("\"");
        if(null != tmp.getBeizhu() && !"".equals(tmp.getBeizhu())){
            json.append(tmp.getBeizhu());
        }
        json.append("\"");

        json.append("}");

        return json.toString();
    }

    public static Collection<?> getSCZJGRKZJInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            SCRK cg = (SCRK) list.get(i);
            String zhijian = cg.getZhijian_or_not();
            if (null != zhijian && zhijian.contains("1")) {
                zhijian = "已质检";
            }else if (null != zhijian && zhijian.contains("2")) {
                zhijian = "不合格 <input type=button  value=重新质检  onclick=zhijian('" + cg.getBupi_id() + "#" + cg.getMishu() + "') />";
            } else {
                zhijian = "<input type=button  value=质检  onclick=zhijian('" + cg.getBupi_id() + "#" + cg.getMishu() + "') />";
            }
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getBupi_id(), cg.getMishu()+"", cg.getBeizhu(), zhijian});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getDingDanmingxiInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            DingDanmingxi cg = (DingDanmingxi) list.get(i);
            BigDecimal b1 =  cg.getNum();
            BigDecimal b2 = cg.getDanjia();
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getType_num(), cg.getType_num(), cg.getGuige(), cg.getNum()+"",
                    cg.getDanjia(),b1.multiply(b2).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()+"", cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }
    public static Collection<?> getDingDanmingxi_ddglInfoJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            DingDanmingxi cg = (DingDanmingxi) list.get(i);
            BigDecimal b1 =  cg.getNum();
            BigDecimal b2 = cg.getDanjia();
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getType_num(), cg.getType_num(), cg.getGuige(), cg.getNum()+"",
                            cg.getDanjia(),b1.multiply(b2).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()+"", cg.getFinish_or_not(),cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }

    public static Collection<?> getDDBupisJSON(List list) {
        List mapList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            Map cellMap = new HashMap();
            DDBupis cg = (DDBupis) list.get(i);
            BigDecimal b1 =  cg.getMishu();
            cellMap.put("id", cg.getId());
            cellMap.put("cell",
                    new Object[]{cg.getId(), cg.getBupi_id(), cg.getType_num(), b1, cg.getBeizhu()});
            mapList.add(cellMap);
        }
        return mapList;
    }
}