package com.jiang.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiang.bean.XTCS;
import com.jiang.bean.YHGL;
import com.jiang.service.XTGLService;
import com.jiang.util.DBBak;
import com.jiang.util.FileDirsUtil;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;

/***
 *销售管理模块
 * 
 * @author jxq
 * 
 */
@SuppressWarnings("serial")
public class XTGLAction extends BaseAction {

	Logger log = Logger.getLogger(XTGLAction.class);

	@Autowired
	private XTGLService xTGLService;
	

	// 使用Ajax技术执行此方法
	@SuppressWarnings("unchecked")
	public String dolist() {
		Result result = new Result();
		String hidden = request.getParameter(HIDDEN);
		String type = request.getParameter(TYPE);
		String sortOrder = request.getParameter(SORTORDER);
		String sortName = request.getParameter(SORTNAME);
		log.info("parm hidden =" + hidden);
		log.info("parm type =" + type);
		/***
		 * 查询功能
		 */
		if (PublicFunc.unEmpty(hidden) && hidden.equals("manage")) {
			int totalRows = 0;
			if (PublicFunc.unEmpty(type) && type.equals("YHGL")) {
				String am = request.getParameter("username");
				String zt = request.getParameter("realName");
				String bm = request.getParameter("bumen");
				String zg = request.getParameter("iszg");
				Map<String, Object> map = new HashMap<String, Object>();
				if (PublicFunc.unEmpty(am)) {
					map.put("username", am);
				}
				if (PublicFunc.unEmpty(zt)) {
					map.put("realName", zt);
				}
				if (PublicFunc.unEmpty(bm) && !bm.equals("--请选择--")) {
					map.put("bumen", bm);
				}
				//map.put("ZGpwd", "NO");
				if (PublicFunc.unEmpty(zg) && zg.equals("是")) {
					map.put("ZGpwd", zg);
				}
				else if(!PublicFunc.unEmpty(zg) )
				{
					map.put("ZGpwd", "@");
				} else if (PublicFunc.unEmpty(zg) && zg.equals("--请选择--")) {
					map.put("ZGpwd", "@");
				}
				
				totalRows = xTGLService.getYHGLCount(map);
				List rows = xTGLService.findYHGLByPage(page, rp,map);
				if (rows.size() == 0 && page > 1) {
					page -= 1;
					rows = xTGLService.findYHGLByPage(page, rp,map);
				}
				result.setTotal(totalRows);
				result.setPage(page);
				result.setRows(JsonUtil.getYHGLInfoJSON(rows));
			}
			
			if (PublicFunc.unEmpty(type) && type.equals("LSJL")) {
				totalRows = xTGLService.getLSJLCount();
				List rows = xTGLService.findLSJLByPage(page, rp,sortOrder,sortName);
				if (rows.size() == 0 && page > 1) {
					page -= 1;
					rows = xTGLService.findLSJLByPage(page, rp,sortOrder,sortName);
				}
				result.setTotal(totalRows);
				result.setPage(page);
				result.setRows(JsonUtil.getLSJLInfoJSON(rows));
			}
			if (PublicFunc.unEmpty(type) && type.equals("XTCS")) {
				String name = request.getParameter("name");
				Map<String, Object> map = new HashMap<String, Object>();
				if (PublicFunc.unEmpty(name) && !name.equals("--请选择--")) {
					map.put("name", name);
				}
				totalRows = xTGLService.getXTCSCount(map);
				List<XTCS> rows = xTGLService.findXTCSByPage(page, rp, map);
				if (rows.size() == 0 && page > 1) {
					page -= 1;
					rows = xTGLService.findXTCSByPage(page, rp, map);
				}
				result.setTotal(totalRows);
				result.setPage(page);
				result.setRows(JsonUtil.getXTCSInfoJSON(rows));
			}
			json = JsonUtil.getResponseJson(result);
			onResponse(json);
		}

		/***
		 * 删除功能
		 */
		if (PublicFunc.unEmpty(hidden) && hidden.equals("delete")) {
			if (PublicFunc.unEmpty(type) && type.equals("XTCS")) {
				String[] id = request.getParameterValues("id");
				xTGLService.deleteXTCSByIds(PublicFunc
						.paseStringListTOIntegerList(id));
			}
			if (PublicFunc.unEmpty(type) && type.equals("YHGL")) {
				String[] id = request.getParameterValues("id");
				xTGLService.deleteYHGLById(PublicFunc
						.paseStringListTOIntegerList(id));
			}
		}
		if (PublicFunc.unEmpty(hidden) && hidden.equals("premodify")) {
			if (PublicFunc.unEmpty(type) && type.equals("XTCS")) {
				String id = request.getParameter("id");
				if (PublicFunc.unEmpty(id)) {
					XTCS tmp = xTGLService.getXTCSById(Integer.valueOf(id));
					request.setAttribute("xtcs", tmp);
				}
				return "modifyXTCS";
			}
			
			if (PublicFunc.unEmpty(type) && type.equals("YHGL")) {
				String id = request.getParameter("id");
				if(PublicFunc.unEmpty(id)){
					YHGL tmp = xTGLService.getYHGLById(Integer.valueOf(id));
					request.setAttribute("yhgl", tmp);
				}
				return "modifyYHGL";
			}
		}
		/***
		 * 修改功能
		 */
		if (PublicFunc.unEmpty(hidden) && hidden.equals("modify")) {
			if (PublicFunc.unEmpty(type) && type.equals("XTCS")) {
				String id = request.getParameter("id");
				String n = request.getParameter("name");
				String zl = request.getParameter("zhonglei");
				if (PublicFunc.unEmpty(n) && PublicFunc.unEmpty(zl)) {
					XTCS tmp = xTGLService.getXTCSByOhter(n, zl);
					if (tmp == null) {
						XTCS tmpXTCS = xTGLService.getXTCSById(Integer
								.valueOf(id));
						tmpXTCS.setName(n.trim());
						tmpXTCS.setZhonglei(zl.trim());
						xTGLService.updateXTCS(tmpXTCS);
						return "xtcs";
					} else {
						return "xtcs";
					}
				} else {
					return "xtcs";
				}
			}
			
			if (PublicFunc.unEmpty(type) && type.equals("YHGL")) {
				
				String id = request.getParameter("id");
				String rname = request.getParameter("realname");
				String nname = request.getParameter("nickname");
				String zl = request.getParameter("pwd");
				String bm = request.getParameter("bumen");
				String zg = request.getParameter("zhuguan");
				String company = request.getParameter("company");
				String zgmm = request.getParameter("zhuguanmima");
				String qx0 = request.getParameter("check0");
				String qx1 = request.getParameter("check1");
				String qx2 = request.getParameter("check2");
				String qx3 = request.getParameter("check3");
				String qx4 = request.getParameter("check4");
				String qx5 = request.getParameter("check5");
				String qx6 = request.getParameter("check6");
				String qx7 = request.getParameter("check7");
				String qx8 = request.getParameter("check8");
				String qx9 = request.getParameter("check9");
				String qx10 = request.getParameter("check10");
				YHGL yhgl = new YHGL();
				if (PublicFunc.unEmpty(id))
				{
					yhgl.setId(Integer.valueOf(id));
				}
				if (PublicFunc.unEmpty(rname))
				{
					yhgl.setRealName(rname);
				}
				if (PublicFunc.unEmpty(nname))
				{
					yhgl.setUsername(nname);
				}
				if (PublicFunc.unEmpty(company))
				{
					yhgl.setCompany(company);
				}
				if (PublicFunc.unEmpty(zl))
				{
					yhgl.setPwd(zl);
				}
				if (PublicFunc.unEmpty(bm))
				{
					yhgl.setBumen(bm);
				}
				if (PublicFunc.unEmpty(zg) && zg.equals("是"))
				{
					if (PublicFunc.unEmpty(zgmm))
						yhgl.setZGpwd(zgmm);
				}
				log.info("zg =" + zg);
				String buf="";
				buf += "on".equals(qx0) ? "1":"0";
				buf += "on".equals(qx1) ? "1":"0";
				buf += "on".equals(qx2) ? "1":"0";
				buf += "on".equals(qx3) ? "1":"0";
				buf += "on".equals(qx4) ? "1":"0";
				buf += "on".equals(qx5) ? "1":"0";
				buf += "on".equals(qx6) ? "1":"0";
				buf += "on".equals(qx7) ? "1":"0";
				buf += "on".equals(qx8) ? "1":"0";
				buf += "on".equals(qx9) ? "1":"0";
				buf += "on".equals(qx10) ? "1":"0";
								
				if (PublicFunc.unEmpty(buf))
				{
					yhgl.setQuanxian(buf);
				}
				if (PublicFunc.unEmpty(id)) {
					boolean unique = xTGLService.checkUniqueness(yhgl);
					if (unique) {
						xTGLService.updateYHGL(yhgl);
						return "yhgl";
					} else {
						request.setAttribute("yhgl", yhgl);
						request.setAttribute("modifyyhglerror", "该部门已存在此用户!");
						return "modifyYHGL";
					}
				} else {
					//return "xtcs";
				}
			}
			
		}

		if (PublicFunc.unEmpty(hidden) && hidden.equals("add")) {
			if(PublicFunc.unEmpty(type) && type.equals("XTBF"))
			{
				try {
					String current =  new SimpleDateFormat("yyMMddHHmmss").format(new Date());
					DBBak.backUpDataBaseSQLServer("sa", "123456Rq", "Fabrics", "D:\\database\\"+current+"\\");
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("modifyxtbferror", "备份完成!");
				List<String> strs = FileDirsUtil.getFileList("D:\\database\\");
				request.getSession().setAttribute("historystrs", strs);
				return "xtbf";
			}
			if(PublicFunc.unEmpty(type) && type.equals("XTHY"))
			{
				String rname = request.getParameter("history")+"\\";
				try {
					DBBak.restoreDataBaseSQLServer("sa", "123456Rq", "Fabrics", rname);
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("modifyxtbferror", "还原完成!");
				List<String> strs = FileDirsUtil.getFileList("D:\\database\\");
				request.getSession().setAttribute("historystrs", strs);
				return "xtbf";
			}
			if (PublicFunc.unEmpty(type) && type.equals("XTCS")) {
				String n = request.getParameter("name");
				String zl = request.getParameter("zhonglei");
				if (PublicFunc.unEmpty(n) && PublicFunc.unEmpty(zl)) {
					XTCS tmp = xTGLService.getXTCSByOhter(n, zl);
					if (tmp == null) {
						tmp = new XTCS();
						tmp.setName(n);
						tmp.setZhonglei(zl);
						xTGLService.addXTCS(tmp);
						return "xtcs";
					} else {
						return "xtcs";
					}
				} else {
					return "xtcs";
				}
			}
			//
			if (PublicFunc.unEmpty(type) && type.equals("YHGL")) {
				
				String id = request.getParameter("id");
				String company = request.getParameter("company");
				String rname = request.getParameter("realname");
				String nname = request.getParameter("nickname");
				String zl = request.getParameter("pwd");
				String bm = request.getParameter("bumen");
				String zg = request.getParameter("zhuguan");
				String zgmm = request.getParameter("zhuguanmima");
				String qx0 = request.getParameter("check0");
				String qx1 = request.getParameter("check1");
				String qx2 = request.getParameter("check2");
				String qx3 = request.getParameter("check3");
				String qx4 = request.getParameter("check4");
				String qx5 = request.getParameter("check5");
				String qx6 = request.getParameter("check6");
				String qx7 = request.getParameter("check7");
				String qx8 = request.getParameter("check8");
				String qx9 = request.getParameter("check9");
				String qx10 = request.getParameter("check10");
				YHGL yhgl = new YHGL();
				if (PublicFunc.unEmpty(id))
				{
					yhgl.setId(Integer.valueOf(id));
				}
				if (PublicFunc.unEmpty(rname))
				{
					yhgl.setRealName(rname);
				}
				if (PublicFunc.unEmpty(nname))
				{
					yhgl.setUsername(nname);
				}
				if (PublicFunc.unEmpty(zl))
				{
					yhgl.setPwd(zl);
				}
				if (PublicFunc.unEmpty(bm))
				{
					yhgl.setBumen(bm);
				}
				if (PublicFunc.unEmpty(company))
				{
					yhgl.setCompany(company);
				}
				if (PublicFunc.unEmpty(zg) && zg.equals("是"))
				{
					if (PublicFunc.unEmpty(zgmm))
						yhgl.setZGpwd(zgmm);
				}
				String buf="";
				buf += "on".equals(qx0) ? "1":"0";
				buf += "on".equals(qx1) ? "1":"0";
				buf += "on".equals(qx2) ? "1":"0";
				buf += "on".equals(qx3) ? "1":"0";
				buf += "on".equals(qx4) ? "1":"0";
				buf += "on".equals(qx5) ? "1":"0";
				buf += "on".equals(qx6) ? "1":"0";
				buf += "on".equals(qx7) ? "1":"0";
				buf += "on".equals(qx8) ? "1":"0";
				buf += "on".equals(qx9) ? "1":"0";
				buf += "on".equals(qx10) ? "1":"0";
								
				if (PublicFunc.unEmpty(buf))
				{
					yhgl.setQuanxian(buf);
				}
				if (PublicFunc.unEmpty(id)) {
					boolean unique = xTGLService.checkUniqueness(yhgl);
					if (unique) {
						xTGLService.addYHGL(yhgl);
						return "yhgl";
					} else {
						request.setAttribute("yhgl", yhgl);
						request.setAttribute("modifyyhglerror", "该部门已存在此用户!");
						return "addYHGL";
					}
				} else {
					return "xtcs";
				}
			}

		}

		return SUCCESS;
	}

}
