package com.jiang.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiang.bean.Message;
import com.jiang.bean.User;
import com.jiang.service.XXGLService;
import com.jiang.util.PublicFunc;
import com.jiang.util.Result;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class XXGLAction extends BaseAction {

	Logger log = Logger.getLogger(XXGLAction.class);

	@Autowired
	private XXGLService xxglService;

	public String dolist() {
		Result result = new Result();
		String hidden = request.getParameter(HIDDEN);
		String type = request.getParameter(TYPE);
	
		if (PublicFunc.unEmpty(hidden) && hidden.equals("manage")) {
			String lybm = request.getParameter("laiyuanbumen");
			String bt = request.getParameter("beginTime");
			String et = request.getParameter("endTime");
			String duqu_or_not = request.getParameter("duqu_or_not");
			Map<String, Object> map = new HashMap<String, Object>();
			if (PublicFunc.unEmpty(lybm) && !lybm.equals("--请选择--")) {
				map.put("laiyuanbumen", lybm);
			}
			if (PublicFunc.unEmpty(duqu_or_not) && !duqu_or_not.equals("--请选择--")) {
				duqu_or_not =("是".equals(duqu_or_not)) ? "1" :"0";
				map.put("duqu_or_not", duqu_or_not);
			}
				System.out.println(duqu_or_not);
			if (PublicFunc.unEmpty(bt)) {
				map.put("beginTime", PublicFunc.paseStringToDate(bt));
			}
			if (PublicFunc.unEmpty(et)) {
				map.put("endTime", PublicFunc.formatDateToEnd(et));
			}
			User user = (User) ActionContext.getContext().getSession().get("user");
			if(user != null)
			{
				map.put("receive_man", user.getRealName());
			}
			map.put("sendtype", "群发");
			int totalRows = xxglService.getXXGLCount(map);
			List<Message> rows = xxglService.findXXGLByPage(page, rp, map);
			if (rows.size() == 0 && page > 1) {
				page -= 1;
				rows = xxglService.findXXGLByPage(page, rp, map);
			}
			result.setTotal(totalRows);
			result.setPage(page);
			result.setRows(JsonUtil.getXXGLInfoJSON(rows));
			json = JsonUtil.getResponseJson(result);
			onResponse(json);
		}
		if (PublicFunc.unEmpty(hidden) && hidden.equals("delete")) {
			String[] id = request.getParameterValues("id");
			xxglService.deleteXXGLById(PublicFunc
					.paseStringListTOIntegerList(id));
		}
		if (PublicFunc.unEmpty(hidden) && hidden.equals("readed")) {
			String[] id = request.getParameterValues("id");
			xxglService.setReadedXXGLById(PublicFunc
					.paseStringListTOIntegerList(id));
		}
		
		/***
		 * 修改功能
		 */
		if (PublicFunc.unEmpty(hidden) && hidden.equals("add")) {
			if (PublicFunc.unEmpty(type) && type.equals("XXGL")) {
				String laiyuanbumen = request.getParameter("laiyuan");
				String sendtype = request.getParameter("FaSongTypeDL");
				String MuDiBuMen = request.getParameter("MuDiBuMen");
				String danhao = request.getParameter("danhao");
				String xinghao = request.getParameter("xinghao");
				String fasongtime = request.getParameter("fasongtime");
				String fasongren = request.getParameter("fasongren");
				String recivename = request.getParameter("recivename");
				String xiangxi = request.getParameter("xiangxi");
			    Message msg = new Message();
				if (PublicFunc.unEmpty(laiyuanbumen) ) {
					msg.setLaiyuanbumen(laiyuanbumen);
				}
				if (PublicFunc.unEmpty(sendtype) ) {
					msg.setSendtype(sendtype);
					if ("个人".equals(sendtype) && PublicFunc.unEmpty(recivename) ) {
						msg.setReceive_man(recivename);
					}
					else
					{
						msg.setReceive_man("无");
					}
				}
				if (PublicFunc.unEmpty(MuDiBuMen) ) {
					msg.setMudibumen(MuDiBuMen);
				}
				if (PublicFunc.unEmpty(danhao) ) {
					msg.setDanhao(danhao);
				}
				if (PublicFunc.unEmpty(xinghao) ) {
					msg.setXinghao(xinghao);
				}
				if (PublicFunc.unEmpty(fasongtime) ) {
					msg.setSendTime(PublicFunc.paseStringToDate(fasongtime,"yyyy/MM/dd"));
				}
				if (PublicFunc.unEmpty(fasongren) ) {
					msg.setSend_man(fasongren);
				}
				if (PublicFunc.unEmpty(xiangxi) ) {
					msg.setMessage(xiangxi);
				}
			
				System.out.println(fasongtime);
				System.out.println(msg.getSendTime());
				if(msg != null)
					xxglService.insertXXGL(msg);
				return "xxgl";
			}
		}
		
		return SUCCESS;
	}
}
