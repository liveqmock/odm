package com.jiang.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/***
 * 项目中公共的方法
 * 
 * @author jxq
 * 
 */
public class PublicFunc {
 
	public static final String ORDER_STATE_FINISH = "完成";//不能置为无效,不能修改，不能删除
	public static final String ORDER_STATE_WATINGCG = "采购中";
	public static final String ORDER_STATE_WATINGZJ =  "待质检"; //不能置为无效，不能修改，不能删除
	public static final String ORDER_STATE_WATINGRK = "已质检，待入库";//不能置为无效，不能修改，不能删除
	public static final String ORDER_STATE_DELETE =  "无效";//不能置为无效，不能修改，不能删除
	public static final String ORDER_STATE_NOPERSON =  "待接受，待打印";
	public static final String ORDER_STATE_RESEND =  "已变动，待打印";
	
	public static final String SC_STATE_WATINGSC = "生产中";


	public static final String GONGYI_YH = "印花";
	public static final String GONGYI_CX = "刺绣";
	public static final String GONGYI_LH = "烂花";
	public static final String GONGYI_QX = "清洗";
	public static final String GONGYI_HX = "回修";
	public static final String GONGYI_GL = "光定";
	public static final String GONGYI_GB = "割边";
	public static final String GONGYI_JH = "剪花";
	public static final String GONGYI_RS = "染色";


	public static final String STR_BUMEN_JH =  "计划部";
	public static final String STR_BUMEN_CG =  "采购部"; 
	public static final String STR_BUMEN_SC =  "生产部";
	public static final String STR_BUMEN_CK =  "仓库部";
	public static final String STR_BUMEN_XS =  "销售部";
	public static final String STR_BUMEN_SJ =  "设计部";
	public static final String STR_BUMEN_CW =  "财务部";
	public static final String STR_BUMEN_ZH =  "综合部";
	public static final String STR_BUMEN_XT =  "系统管理员";

    public static final String TH_READY = "等待处理";
    public static final String TH_ING = "退货中";
    public static final String TH_FINISH = "完成";

    public static final String RK_TYPE_CG =  "采购入库";
    public static final String RK_TYPE_ZJG =  "自加工入库";
    public static final String RK_TYPE_WJG =  "外加工入库";

    public static final String KJ_STATE_WAITING="等待开剪";
    public static final String KJ_STATE_FINISH = "完成";
    public static final String KJ_STATE_DISABLE ="无效";


    public static final String SALE_TYPE_ZH = "销售开单";
    public static final String SALE_TYPE_YD = "预订单";
    public static final String SALE_TYPE_SURE= "订单";


    public static final String SALE_STATE_INIT= "备货中";
    public static final String SALE_STATE_BFBH= "部分备货";
    public static final String SALE_STATE_BFFH= "部分发货";
    public static final String SALE_STATE_BFBHFH = "部分发货，有新备货";
    public static final String SALE_STATE_QBBH= "全部备货";
    public static final String SALE_STATE_FH= "已发货";


    public static final String SALEDTAIL_STATE_INIT= "备货中";
    public static final String SALEDTAIL_STATE_BH= "备货完成";
    public static final String SALEDTAIL_STATE_FH= "已发货";


    public static final String[] jiageleixing =
    {
     "整卷价","零售价", "300米价", "批发价", "自定义价"
    };

    public static boolean pageChange  = false;
    public static int currentPage  = 0;

    public static String sunmenus[][] = {
	/*计划*/		{ "订单查询", "采购跟踪单管理", "自加工跟踪单管理(1车间)",
            "自加工跟踪单管理(2车间)", "外加工跟踪单管理","仓库查询","半成品开剪" },
/*采购*/			{ "采购任务单", "采购退货任务单", "供应商管理"},
/*生产*/			{ "自加工任务单(一车间)", "自加工任务单(二车间)",  "外加工任务单","生产入库","待质检任务单","加工单位管理"},

/*仓库*/	{ "仓库查询", "待入库任务单", "待出库任务单", "半成品开剪任务单",  "成品退货任务单" },
/*销售*/			{ "预订单管理", "展会订单管理","订单管理" ,"展会开单", "客户管理", "成品仓库查询",
            "成品开剪申请", "销售单退货入库"},
/*设计*/			{"原料资料", "半成品资料", "成品资料"},
/*财务*/			{ "采购付款", "销售收款", "工资核算", "费用收支", "对账", "查询", "单位管理" },
/*综合*/			{ "综合管理" },
/*系统*/			{ "用户管理", "历史记录", "系统备份与还原",  "系统日志"  },
            {"成品仓库查询" ,"成品待开剪任务单","成品待发货任务单", "成品退货任务单"}
    };


    /**
    *         自加工工艺类型 */
    public static final String[] zjgGYType=
    {
        GONGYI_YH,  GONGYI_CX,  GONGYI_LH,  GONGYI_QX,
        GONGYI_HX,  GONGYI_GL,  GONGYI_GB,
    };
    /**
     *      外加工工艺类型 */
    public static final String[] wjgGYType=
    {
            GONGYI_QX,  GONGYI_GL,  GONGYI_JH,  GONGYI_RS
    };
    /**
     *     部门*/
    public static final String[] BUMENS=
	{
		STR_BUMEN_JH,STR_BUMEN_CG,
		STR_BUMEN_SC, STR_BUMEN_CK,STR_BUMEN_XS,
		STR_BUMEN_SJ, STR_BUMEN_CW,STR_BUMEN_ZH,
		STR_BUMEN_XT
	};
	public static int getIndexByBumenName(String bumen)
	{
		int index = 0;
		if(bumen.equals(STR_BUMEN_JH))
		{
			return 0;
		}
		else if(bumen.equals(STR_BUMEN_CG))
		{
			return 1;
		}
		else if(bumen.equals(STR_BUMEN_SC))
		{
			return 2;
		}
		else if(bumen.equals(STR_BUMEN_CK))
		{
			return 3;
		}
		else if(bumen.equals(STR_BUMEN_XS))
		{
			return 4;
		}
		else if(bumen.equals(STR_BUMEN_SJ))
		{
			return 5;
		}
		else if(bumen.equals(STR_BUMEN_CW))
		{
			return 6;
		}
		else if(bumen.equals(STR_BUMEN_ZH))
		{
			return 7;
		}
		else if(bumen.equals(STR_BUMEN_XT))
		{
			return 8;
		}
		return index;
	}
	/**
	 * 判断传入的参数是否为空或者是空字符 如果不是空或者空字符的话，返回true 否则false
	 * 
	 * @param str
	 * @return
	 */
	public static Boolean unEmpty(String str) {
		if (null == str || "".equals(str)) {
			return false;
		}
		return true;
	}

	public static List<Integer> paseStringListTOIntegerList(String[] str) {
		List<Integer> tmp = new ArrayList<Integer>();
		for (String s : str) {
			if (unEmpty(s)) {
				tmp.add(Integer.valueOf(s));
			}
		}
		return tmp;
	}

	public static Date paseStringToDate(String str) {
		if (!unEmpty(str)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(str);
		} catch (ParseException e) {
			return null;
		}
	}
	public static Date paseStringToDate(String str,String format) {
		if (!unEmpty(str)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.parse(str);
		} catch (ParseException e) {
			return null;
		}
	}
	

	public static boolean equalsMap(Map<String, Object> globmap,
			Map<String, Object> map) {
		if(globmap == null&&map == null)
			return true;
		if((globmap != null&&globmap == null)||(globmap == null&&globmap != null))
			return false;
		if(map.size() != globmap.size())
			return false;
	    for(Map.Entry<String, Object> entry:map.entrySet()){   
	    	if(globmap.get(entry.getKey()) == null)
	    		return false;
	         if(!globmap.get(entry.getKey()).equals(entry.getValue()))
	        	 return false;
	    }  
		return true;
	}
}
