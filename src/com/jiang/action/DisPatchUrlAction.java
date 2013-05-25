package com.jiang.action;

import com.jiang.bean.*;
import com.jiang.service.CGGLService;
import com.jiang.service.CKGLService;
import com.jiang.service.SCGLService;
import com.jiang.service.XTGLService;
import com.jiang.util.FileDirsUtil;
import com.jiang.util.PublicFunc;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.jiang.bean.KHGL;
import com.jiang.service.XSGLService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class DisPatchUrlAction extends ActionSupport {

	private Logger log = Logger.getLogger(DisPatchUrlAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	private CGGLService cgglService;
	@Autowired
	private SCGLService scglService;
	@Autowired
	private CKGLService ckglService;
	@Autowired
	private XTGLService xtglService;
    @Autowired
    private XSGLService xsglService;


	
	public String getUrl() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String x = request.getParameter("i");
		String j = request.getParameter("j");
		int ii = Integer.valueOf(x);
		int jj = Integer.valueOf(j);
		log.info("选中的菜单ID"+x+"|"+j);
		String retstrs[][] = {
			//	{"xxgl","fsxx"},
				{"xsdcx","jhcgdjgl", "jhzjg1", "jhzjg1","jhwjg", /*"bcpckcx",*/"ckcx", "BCPKJAPPLY"},
				{"djgl", "cgth", "gysgl"},
				{"scgyd_zjg1","scgyd_zjg1","scgyd_wjg","scrk", "zhijian", "danweigl"},
				{"ckcx","rksq","cksq","kjgl","xsthrk"},
				{"yddgl", "zhddgl","xsdgl","zhxd","khgl","cpckcx","cpkjapply", "xsthrk", "OrderDetail",
                "OrderDetail"},
				{"zlgl_yl","zlgl_bcp","zlgl_cp"},
				{"error","error","error","error","error","error","error"},
				{"error"},
				{"yhgl","lsjl","xtbf","error"},
                {"cpckcx","kjgl_cp","cpfh","xsthrk"}
		};
		

		User user = (User) request.getSession().getAttribute("user");
		String bumen = "";
		if(user != null)
			bumen = user.getBumen();
		String zgmm = xtglService.getZGpwdByBumen(bumen);
		request.getSession().setAttribute("zgmima", zgmm);
		
		if(ii == 0 && jj== 1)//采购任务单
		{
			
		}
        if(ii == 0 && (jj== 2 || jj == 3))//自加工时初始化半成品型号，和成品型号
        {
            initAllTypeNum(request);
        }
        if(ii == 0 &&  jj== 4 )//外加工时初始化原料和半成品型号，外加工单位
        {
            initYL_BCP(request);
        }
		if((ii == 0 && jj== 2) || (ii == 2 && jj== 0))//自加工车间1
		{
			request.getSession().setAttribute("zjgchejian", "车间一");
		}
		if((ii == 0 && jj== 3) || (ii == 2 && jj== 1))//自加工车间2
		{
			request.getSession().setAttribute("zjgchejian", "车间二");
		}

		if(ii == 1 &&( jj ==5 || jj == 1))
		{
			initGYS(request);
		}
		if(ii == 2 && jj== 3)//入库申请
		{
			initDHIDS(request);
            request.getSession().removeAttribute("rukutype");

		}
		if(ii == 1 && jj ==2)//采购退货
		{
			List<CGGLDJGL> djs = cgglService.findDJGLAll();
			request.getSession().setAttribute("djs", djs);
		}
		if(ii == 0 && jj ==6)//半成品开剪申请
		{
		 	initBCPIDS(request);
			//得到开剪布匹的信息
		}
		if("X".equals(x) && "X".equals(j))
		{
			return "showdk";
		}
        if(ii == 4 && jj ==3)//初始化展会下单界面
        {
            //初始化展会下单界面 客户名称
            initKHGLList(request);
            request.getSession().removeAttribute("orderid");
        }
        if(ii == 4 && jj ==8) //订单明细
        {
            PublicFunc.STATE_ORDER_DETAIL = PublicFunc.STATE_ORDER_ZHXD;

            String ddid = "";
            if(null != request.getSession().getAttribute("orderid") )
            {
                ddid = (String)request.getSession().getAttribute("orderid");
            }
            float totalnum = xsglService.getXSGLDingDanTotalNum(ddid);
            float totalprice = xsglService.getXSGLDingDanTotalPrice(ddid);
            request.getSession().setAttribute("totalnum", totalnum);
            request.getSession().setAttribute("totalprice", totalprice);
        }
        if(ii == 4 && jj ==9) //查看订单明细
        {
            PublicFunc.STATE_ORDER_DETAIL = PublicFunc.STATE_ORDER_ZHXDMODIFY;
            String ddid = null;
            String kehuid = null;
            if(null != request.getParameter("ddid"))
            {
                ddid = (String)request.getParameter("ddid");
                kehuid = (String) request.getParameter("kehuid");
                request.getSession().setAttribute("orderid", ddid);
                log.info("kehuid:"+kehuid);
                try {
                    kehuid = new String(kehuid.getBytes("ISO8859-1"), "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }

                KHGL tmp = xsglService.getKHGLByName(kehuid);
                //得到订单ID放到SESSION里面去
                //将客户信息放到session里面去。
                request.getSession().setAttribute("orderDetail", tmp);
                float totalnum = xsglService.getXSGLDingDanTotalNum(ddid);
                float totalprice = xsglService.getXSGLDingDanTotalPrice(ddid);
                request.getSession().setAttribute("totalnum", totalnum);
                request.getSession().setAttribute("totalprice", totalprice);
                log.info("ddid:"+ddid);
                log.info("kehuid:"+ kehuid);
                log.info("tmp:"+tmp.getKeHuname());
            }

        }

        if(ii == 8 && jj ==2)//系统备份
        {
            //	initXTBF(request);
            //history历史记录s
            List<String> strs = FileDirsUtil.getFileList("D:\\database\\");
            request.getSession().setAttribute("historystrs", strs);
            //数据库
        }

		return retstrs[ii][jj];

	}
    public void initKHGLList(HttpServletRequest request){
        List<KHGL> KHGLList = xsglService.findAllKHGL();
        request.getSession().setAttribute("KHGLList", KHGLList);
    }
    public void initAllTypeNum(HttpServletRequest request)
    {
        List<ZLGLBCPZL> bcps = cgglService.findBCPByAll();
        List<ZLGLCPZL> cps = cgglService.findCPSByAll();
        List<List<String>> strs = new ArrayList<List<String>>();
        List<String> str1 = new ArrayList<String>();
        List<String> str2 = new ArrayList<String>();
        for(int i=0;i<bcps.size();i++)
        {
            str1.add(((ZLGLBCPZL)(bcps.get(i))).getType_num());
        }
        for(int i=0;i<cps.size();i++)
        {
            str2.add(((ZLGLCPZL)(cps.get(i))).getType_num());
        }

        Map<String, List<String>> map = new HashMap<String, List<String>>();
        Collections.sort(str1);
        Collections.sort(str2);
        map.put("str1", str1);
        map.put("str2", str2);
        request.getSession().setAttribute("bcp_cp_type_nums", map);
    }

	public void initBCPIDS(HttpServletRequest request)
	{
		List<CangKu> bcp = ckglService.findChangKuByCKname("半成品");
		request.getSession().setAttribute("bcpck", bcp);
	}
	public void initGYS(HttpServletRequest request)
	{
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

    /**
     *
     * @param request
     */
    public void initYL_BCP(HttpServletRequest request)
    {
        List<wJGGongYingShang> gys = scglService.findWJGGYSByAll();
        request.getSession().setAttribute("wjggyss", gys);

        List<ZLGLBCPZL> bcps = cgglService.findBCPByAll();
        List<ZLGLCPZL> cps = cgglService.findCPSByAll();
        List<ZLGLYLZL> yls = cgglService.findYLByAll();
        List<String> str1 = new ArrayList<String>();
        List<String> str2 = new ArrayList<String>();
        List<String> str3 = new ArrayList<String>();
        for(int i=0;i<bcps.size();i++)
        {
            str1.add(((ZLGLBCPZL)(bcps.get(i))).getType_num());
        }
        for(int i=0;i<cps.size();i++)
        {
            str2.add(((ZLGLCPZL)(cps.get(i))).getType_num());
        }
        for(int i=0;i<yls.size();i++)
        {
            str3.add(((ZLGLYLZL)(yls.get(i))).getType_num());
        }
        Map<String, List<String>> map = new HashMap<String, List<String>>();
        Collections.sort(str1);
        Collections.sort(str2);
        map.put("str1", str1);
        map.put("str2", str2);
        map.put("str3", str3);
        request.getSession().setAttribute("yl_bcp_cp_type_nums", map);

    }

	/**
	 * 设置采购单状态为无效
	 * @return
	 */
	public void disableDJGL() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		log.info("DisableDJGL"+id);
		String oldstate = cgglService.disableJHD(id);
		String djglerror = "";
		if(oldstate == PublicFunc.ORDER_STATE_WATINGCG)
		{
			 djglerror = "采购单已打印，请联系采购员重新打印采购单";
		}
		else if(oldstate == PublicFunc.ORDER_STATE_NOPERSON ||
				oldstate == PublicFunc.ORDER_STATE_RESEND)
		{
			 djglerror = "采购单当前未打印，成功置为无效!";
		}
		log.info("旧状态"+oldstate);
		request.setAttribute("djglerror", djglerror);
		PublicFunc.pageChange = true;

	}
    /**
     * 设置自加工工艺单状态为无效
     * @return
     */
    public void disableSCZJG() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        log.info("disableSCZJG"+id);
        String oldstate =  scglService.disableSCZJG(id);
        String djglerror = "";
        if(oldstate == PublicFunc.SC_STATE_WATINGSC)
        {
            djglerror = "任务单已打印，请联系业务员重新打印任务单";
        }
        else if(oldstate == PublicFunc.ORDER_STATE_NOPERSON ||
                oldstate == PublicFunc.ORDER_STATE_RESEND)
        {
            djglerror = "任务单当前未打印，成功置为无效!";
        }
        log.info("旧状态"+oldstate);
        request.setAttribute("djglerror", djglerror);
        PublicFunc.pageChange = true;

    }
    /**
     * 设置外加工工艺单状态为无效
     * @return
     */
    public void disableSCWJG()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        log.info("disableSCWJG"+id);
        String oldstate =  scglService.disableSCWJG(id);
        String djglerror = "";
        if(oldstate == PublicFunc.SC_STATE_WATINGSC)
        {
            djglerror = "任务单已打印，请联系业务员重新打印任务单";
        }
        else if(oldstate == PublicFunc.ORDER_STATE_NOPERSON ||
                oldstate == PublicFunc.ORDER_STATE_RESEND)
        {
            djglerror = "任务单当前未打印，成功置为无效!";
        }
        log.info("旧状态"+oldstate);
        request.setAttribute("djglerror", djglerror);
        PublicFunc.pageChange = true;
    }

	/**
	 * 修改单据前检查单据状态
	 */
	public String modifyDJGL()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		CGGLDJGL dj = cgglService.getDJGLById(Integer.valueOf(id));
		String oldstate = dj.getZhuangtai();
		String djglerror = null;

		log.info("得到单据的旧状态："+oldstate);
		
		if(oldstate == PublicFunc.ORDER_STATE_WATINGCG)
		{
			 djglerror = "采购单已打印，修改后请联系采购员重新打印采购单";
			 request.setAttribute("djglerror", djglerror);
			 log.info("采购单已打印，修改后请联系采购员重新打印采购单");
			 return "error";
		}
		else if(oldstate.contains("待打印"))
		{
			 djglerror = "采购单当前未打印，请及时修改!";
			 request.setAttribute("djglerror", djglerror);
			 log.info("采购单当前未打印，请及时修改!");
			 return null;
		}
		return "error";
	}
    /**
     * 修改单据前检查单据状态
     */
    public String modifyZJG()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        ZJGgongyidan dj = scglService.getSCGLZJGById(Integer.valueOf(id));
        String oldstate = dj.getZhuangtai();
        String djglerror = null;

        log.info("得到单据的旧状态："+oldstate);

        if(oldstate == PublicFunc.SC_STATE_WATINGSC)
        {
            djglerror = "自加工生产单已打印，修改后请联系接单人重新打印";
            //request.setAttribute("djglerror", djglerror);
            log.info("自加工生产单已打印，修改后请联系接单人重新打印");
            return "error";
        }
        else if(oldstate.contains("待打印"))
        {
            djglerror = "自加工生产单当前未打印，请及时修改!";
           // request.setAttribute("djglerror", djglerror);
            log.info("自加工生产单当前未打印，请及时修改!");
            return null;
        }
        return "error";
    }
    /**
     * 修改单据前检查单据状态
     */
    public String modifyWJG()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        WJGgongyidan dj = scglService.getSCGLWJGById(Integer.valueOf(id));
        String oldstate = dj.getZhuangtai();
        String djglerror = null;

        log.info("得到单据的旧状态："+oldstate);

        if(oldstate == PublicFunc.SC_STATE_WATINGSC)
        {
            djglerror = "自加工生产单已打印，修改后请联系接单人重新打印";
            //request.setAttribute("djglerror", djglerror);
            log.info("自加工生产单已打印，修改后请联系接单人重新打印");
            return "error";
        }
        else if(oldstate.contains("待打印"))
        {
            djglerror = "自加工生产单当前未打印，请及时修改!";
            // request.setAttribute("djglerror", djglerror);
            log.info("自加工生产单当前未打印，请及时修改!");
            return null;
        }
        return "error";
    }
	public void initDHIDS(HttpServletRequest request)
	{
		List<CGGLDJGL> yls = cgglService.findDJGLAll();
		List<ZJGgongyidan> bcps = scglService.findZJGByAll();
		List<WJGgongyidan> cps = scglService.findWJGByAll();
	//	List<YBgongyidan> sps  = scglService.findYBByAll();
		List<String> str1 = new ArrayList<String>();
		List<String> str2 = new ArrayList<String>();
		List<String> str3 = new ArrayList<String>();
	//	List<String> str4 = new ArrayList<String>();
		for(int i=0;i<yls.size();i++)
		{
			str1.add(yls.get(i).getCaigou_id());
		}
		for(int i=0;i<bcps.size();i++)
		{
			str2.add(bcps.get(i).getBianhao());
		}
		for(int i=0;i<cps.size();i++)
		{
			str3.add(cps.get(i).getBianhao());
		}
//		for(int i=0;i<sps.size();i++)
//		{
//			str4.add(sps.get(i).getyBGongYiId());
//		}
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		Collections.sort(str1);
		Collections.sort(str2);
		Collections.sort(str3);
		//Collections.sort(str4);
		map.put("cgids", str1);
		map.put("zjgids", str2);
		map.put("wjgids", str3);
	//	map.put("ybids", str4);
		request.getSession().setAttribute("dhids", map);
	}
	public String getMenuUrl() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String i = request.getParameter("i");
		String retstrs[] = {"xxgl","djgl","scgl","rksq","error","ydd","error","fhgl","error","yhgl","zhxd"};
		int ii = Integer.valueOf(i);
		return retstrs[ii];
	}
	
	
	public String getPrintDJGLOK()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String m2 = request.getParameter("id");
		int id = 0;
		if(PublicFunc.unEmpty(m2))
		{
			id = Integer.valueOf(m2);
		}
		CGGLDJGL dj = cgglService.getDJGLById(id);
		request.setAttribute("djgl", dj);
		String gysname = cgglService.getGYSById(dj.getGongyingshangid()).getGongyingname();
		request.setAttribute("gysname", gysname);

		return "printdjgl";
	}
    public String getPrintCGRK()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> map = new HashMap<String, Object>();
        String cgid = (String) request.getSession().getAttribute("cgdid");
        map.put("cgid", cgid);
        List rows = ckglService.findCGRKByPage(1, 1000, map);
        log.info("ckGLService.findCGRKByPage(page, rp, map)");
        request.setAttribute("cgrkbupis", rows);
        return "printcgrk";
    }
    public String getPrintCGCR_ZJ()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> map = new HashMap<String, Object>();
        String cgid = (String) request.getSession().getAttribute("cgdid");
        map.put("cgid", cgid);
        //供应商信息
        CGGLDJGL dj = cgglService.getDJGLByCGId(cgid);
        request.setAttribute("djgl", dj);
        String gysname = cgglService.getGYSById(dj.getGongyingshangid()).getGongyingname();
        request.setAttribute("gysname", gysname);
        //所有布匹信息
        List rows = ckglService.findCGRKByPage(1, 1000, map);
        log.info("ckGLService.findCGRKByPage(page, rp, map)");
        log.info("ckGLService.findCGRKByPage(page, rp, map)"+rows.size());
        request.setAttribute("cgrkbupis", rows);
        //型号资料
        map.put("type_num", dj.getType_num());
        ZLGLYLZL ylzl = cgglService.getZLGL_YLBySome(map);
        request.setAttribute("ylzl", ylzl);
        return "printcgrk_zj";
    }

	//打印采购单前查询状态
	public void getPrintDJGL()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String m2 = request.getParameter("id");
		int id = 0;
		if(PublicFunc.unEmpty(m2))
		{
			id = Integer.valueOf(m2);
		}
		CGGLDJGL dj = cgglService.getDJGLById(id);
		String state = request.getParameter("state");
        log.info("STATE1"+state);
        String tmpss=state;
		try {
            state = new String(state.getBytes("iso8859-1"), "utf-8");
            log.info("utf-8"+state);
            List<String> states = new ArrayList<String>();
            states.add(PublicFunc.ORDER_STATE_FINISH);
            states.add(PublicFunc.ORDER_STATE_WATINGCG);
            states.add(PublicFunc.ORDER_STATE_WATINGZJ);
            states.add(PublicFunc.ORDER_STATE_WATINGRK);
            states.add(PublicFunc.ORDER_STATE_DELETE);
            states.add(PublicFunc.ORDER_STATE_NOPERSON);
            states.add(PublicFunc.ORDER_STATE_RESEND);
            states.add(PublicFunc.SC_STATE_WATINGSC);

            if(!states.contains(state))
            {
                state = new String(tmpss.getBytes("iso8859-1"), "GBK");
                log.info("gbk");
            }
            log.info("STATE9"+state+"LL"+state.length());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("STATE"+state);
		log.info("STATE"+dj.getZhuangtai());
		if(dj.getZhuangtai().equals(state))
		{
			request.setAttribute("djgl", dj);
			String gysname = cgglService.getGYSById(dj.getGongyingshangid()).getGongyingname();
			request.setAttribute("gysname", gysname);
			StringBuffer sb = new StringBuffer();
			sb.append("{");
			sb.append("\"result\"");
			sb.append(":");
			sb.append("\"true\"");
			sb.append("}");
			onResponse(sb.toString());
			//return "printdjgl";
		}
		else 
		{
			StringBuffer sb = new StringBuffer();
			sb.append("{");
			sb.append("\"result\"");
			sb.append(":");
			sb.append("\"false\"");
			sb.append("}");
			onResponse(sb.toString());
			//return "djgl";
		}
	}
	
	
	public void onResponse(String json) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("message", "");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		log.info("BASE ACTION 响应请求");
		try {
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
	}
	
	public String getPrintDJGLDOC()
	{
		return "printdjgldoc";
	}
    public String getCPByTypeNum()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        String t_tiaoma = request.getParameter("t_tiaoma");
        ZLGLCPZL  cp = cgglService.findCPSByTypeNum(t_tiaoma);
        request.getSession().setAttribute("ZLGLCPZL_search", cp);
        log.info("getCPByTypeNum::"+cp.getId());
        return "addtypenums" ;
    }
	public String getLevel23Url() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String m2 = request.getParameter("m2");
		String m3 = request.getParameter("m3");
		log.info("dispacher getLeve23Url"+m2+m3);
		String retstrs[][] = {
				{"zlgl_yl","zlgl_bcp","zlgl_cp","zlgl_sp"},
				{"scgyd_zjg","scgyd_wjg","scgyd_yb"},
				{"zhijianlist","zhijianreport"},
				{"gysgl","wjgdwgl"},
				{"scckqr","xsckqr","thckqr"},
				{"gys_gl","gys_xhgl"} ,
                {"khgl_base","khgl_fh"}
		};
		int ii = Integer.valueOf(m2);
		int jj = Integer.valueOf(m3);
		return retstrs[ii][jj];
	}

	public String getAddJsp() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		log.info("dispacher getAddJsp" + a + b);
		String retstrs[][] = { 
				{ "addXTCS" },
				{ "addGYSGL","addDJGL","addGYSXH","addZLGL_YL",
					"addZLGL_BCP" ,"addZLGL_CP" ,"addZLGL_SP", "addCGTH"  },
				{ "addSCGLZJG", "addSCGLWJG", "addSCGLYB", "addWJGDWGL", "addBCPKJAPPLY",
						"addCGZHIJIAN","addBCPKJAPPLY_CKCX", "addSCZJGZHIJIAN", "addSCWJGZHIJIAN", "addXSTHZHIJIAN",
                "addCGRUKU","addSCZJGRUKU","addSCWJGRUKU", "addXSTHRUKU"},
				{ "addXTCS" },//仓库
				{ "addXTCS" },//商品
				{ "addKHGL_BASE", "addKHGL_FH", "addtypenums","editmishu","addCPKJAPPLY_CKCX", "addCPKJAPPLY",
                "addshouhuoaddress"},//销售管理
				{ "addXTCS" },//财务
				{ "addXTCS" },//发货
				{ "addXTCS" },
				{ "addXTCS", "addYHGL" } };
    if("1".equals(a) && "1".equals(b) || "1".equals(a) && "2".equals(b) )
    {
        initGYS(request);
    }
    if("2".equals(a) && "4".equals(b))//半成品开剪申请
    {
        String id = request.getParameter("id");
        if(id != null)
        {
            CangKu  bcp = ckglService.findChangKuById(Integer.valueOf(id));
            request.getSession().setAttribute("bcpbupi", bcp);
            if(bcp!=null && bcp.getKJ_num() != null && bcp.getKJ_num().intValue() > 0)
            {
                request.setAttribute("bcpkjckcxerror", "此布匹处于被开剪状态");
                return "addBCPKJAPPLY_CKCX";
            }
        }
    }
    if("5".equals(a) && "5".equals(b))//成品开剪申请
    {
        String id = request.getParameter("id");
        if(id != null)
        {
            CangKu  bcp = ckglService.findChangKuById(Integer.valueOf(id));
            request.getSession().setAttribute("bcpbupi", bcp);
            if(bcp!=null && bcp.getKJ_num() != null && bcp.getKJ_num().intValue() > 0)
            {
                request.setAttribute("bcpkjckcxerror", "此布匹处于被开剪状态");
                return "addCPKJAPPLY_CKCX";
            }
        }
    }
    if("5".equals(a) && "6".equals(b))//设置收货地址
    {
        //通过订单ID获取客户ID。
        String id = request.getParameter("dingdanid");
        YDDGL ydd = xsglService.findYDDGLByDDID(id);
        String kehuid= ydd.getDingdan_name();
        if(PublicFunc.unEmpty(kehuid))
            request.getSession().setAttribute("kehuid",kehuid);
        if(PublicFunc.unEmpty(id))
            request.getSession().setAttribute("ddid",id);
    }
    if("2".equals(a) && "5".equals(b))//采购质检
    {
        String id = request.getParameter("cgid");
        CGGLDJGL dl = cgglService.getDJGLByCGId(id);
        int count = ckglService.getCountByCGID(id);
        int zjcount = ckglService.getZHIJIANCountByCGID(id);
        request.getSession().setAttribute("cgdid", id);
        request.getSession().setAttribute("xinghao", dl.getType_num());
        request.getSession().setAttribute("mishu", dl.getCG_totalnum()+"");
        request.getSession().setAttribute("totalcount", count+"");
        request.getSession().setAttribute("zhijiancount", zjcount+"");
        log.info("待质检布匹个数："+count);
        if( count == 0)
        {
            request.setAttribute("zhijianlisterror", "无布匹记录");
            return "zhijianlist";
        }
        else
        {
            initZJDID(request, id, dl.getType_num(),dl.getCG_totalnum());
        }
    }
    if("2".equals(a) && "7".equals(b))//自加工质检
        {
            String id = request.getParameter("sczjgid");
            ZJGgongyidan dl = scglService.getSCGLZJGBySCId(id);
            int count = ckglService.getCountBySCZJGID(id);
            int zjcount = ckglService.getZHIJIANCountBySCZJGID(id);
            request.getSession().setAttribute("scdid", id);
            request.getSession().setAttribute("xinghao", dl.getDown_typeNum());
            request.getSession().setAttribute("mishu", dl.getNum()+"");
            request.getSession().setAttribute("totalcount", count+"");
            request.getSession().setAttribute("zhijiancount", zjcount+"");
            log.info("待质检布匹个数："+count);
            if( count == 0)
            {
                request.setAttribute("zhijianlisterror", "无布匹记录");
                return "zhijianlist";
            }
            else
            {
                initZJDID(request, id, dl.getUp_typeNum(),dl.getNum());
            }
       }
        if("2".equals(a) && "8".equals(b))      //外加工质检
        {
            String id = request.getParameter("scwjgid");
            WJGgongyidan dl = scglService.getSCGLWJGBySCId(id);
            int count = ckglService.getCountBySCWJGID(id);
            int zjcount = ckglService.getZHIJIANCountBySCWJGID(id);
            request.getSession().setAttribute("scdid", id);
            request.getSession().setAttribute("xinghao", dl.getDown_typeNum());
            request.getSession().setAttribute("mishu", dl.getNum()+"");
            request.getSession().setAttribute("totalcount", count+"");
            request.getSession().setAttribute("zhijiancount", zjcount+"");
            log.info("待质检布匹个数："+count);
            if( count == 0)
            {
                request.setAttribute("zhijianlisterror", "无布匹记录");
                return "zhijianlist";
            }
            else
            {
                initZJDID(request, id, dl.getUP_typeNum(),dl.getNum());
            }
        }
        if("2".equals(a) && "10".equals(b))
        {
            String id = request.getParameter("cgid");
            CGGLDJGL dl = cgglService.getDJGLByCGId(id);
            String zijianid = ckglService.getRuKuDanIDByMudiID(id);
            if(zijianid == null || "".equals(zijianid))
            {
                request.setAttribute("cgrkerror", "没有对应的入库请求");
                return "rksq";
            }
            request.getSession().setAttribute("cgdid", id);
            request.getSession().setAttribute("xinghao", dl.getType_num());
            request.getSession().setAttribute("mishu", dl.getCG_totalnum()+"");
            request.getSession().setAttribute("zijianid", zijianid);

        }
        /**
         *        展会下单
         *        订单详细
         *        所有成品数据保存到session
         ***/
        if("5".equals(a) && "2".equals(b))
        {
            List<ZLGLCPZL> cps = cgglService.findCPSByAll();
            request.getSession().setAttribute("cpzls", cps);
        }
        if("5".equals(a) && "3".equals(b))
        {
        }

        int i = Integer.valueOf(a);
        int j = Integer.valueOf(b);
        return retstrs[i][j];
    }
    public void initZJDID(HttpServletRequest request, String id, String typeNum, BigDecimal num)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("laiyuan_id", id);
        zhiJianReport zjreport = scglService.getZhiJianReportBySome(map);
        if(null == zjreport)
        {
            zhiJianReport zjr = new zhiJianReport();
            zjr.setLaiyuan_id(id);
            zjr.setXinghao(typeNum);
            zjr.setNum(num);
            Random rdm = new Random(System.currentTimeMillis());
            int intRd = Math.abs(rdm.nextInt())%9999+1;
            SimpleDateFormat formater = new SimpleDateFormat("yyMMdd");
            String zijianid =  "ZJ"+formater.format(new Date())+String.format("%04d", intRd);
            request.getSession().setAttribute("zijianid", zijianid);
            zjr.setReport_id(zijianid);
            scglService.insertZhiJianReport(zjr);
        }
        else
        {
            request.getSession().setAttribute("zijianid", zjreport.getReport_id());
        }
    }
}