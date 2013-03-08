package com.jiang.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.jiang.bean.User;
import com.jiang.util.PublicFunc;
import com.jiang.util.WebException;
import com.opensymphony.xwork2.ActionSupport;

/***
 * action基类，所以的action都要继承该类  s
 *
 * @author jxq
 *
 */
public class BaseAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(BaseAction.class);
    protected static final String HIDDEN = "hidden";
    protected static final String TYPE = "type";
    protected static final String SORTORDER = "sortorder";
    protected static final String SORTNAME = "sortname";
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();

    protected String json;
    protected int page;
    protected int rp;
    protected String query;
    protected String qtype;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRp() {
        return rp;
    }

    public void setRp(int rp) {
        this.rp = rp;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getQtype() {
        return qtype;
    }

    public void setQtype(String qtype) {
        this.qtype = qtype;
    }

    /**
     * 得到当前登录的用户信息
     *
     * @return
     */
    public User getCurrentUser() {
        User user = (User) request.getSession().getAttribute("user");
        if (null == user) {
            throw new WebException("user has not login!");
        }
        return user;
    }

    public void onResponse(String json) {
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
    /***
     * 得到当前用户的searchMap
     *
     * @return
     */
    public Map<String,Object> getSearchMap()
    {
        Map<String,Object> searchmap = new HashMap<String, Object>();
        if(request.getSession().getAttribute("searchmap") != null)
            searchmap = (Map<String,Object>) request.getSession().getAttribute("searchmap");
        return searchmap;
    }

    /***
     * 设置当期用户的searchMap
     * @param map
     */
    public void setSearchMap(Map<String,Object> map)
    {
        Map<String,Object> globmap = new HashMap<String, Object>();
        if(request.getSession().getAttribute("searchmap") != null)
            globmap = (Map<String,Object>) request.getSession().getAttribute("searchmap");
        globmap.clear();
        for(Map.Entry<String, Object> entry:map.entrySet()){
            globmap.put(entry.getKey(), entry.getValue());
            System.out.println("globmap copy");
        }
        request.getSession().setAttribute("searchmap", globmap);
    }
    /***
     * 设置查询Page页
     */
    public void setSearchPage(Map<String,Object> map){
        if(!PublicFunc.equalsMap(getSearchMap(),map))
        {
            page = 1;
        }
        setSearchMap(map);
    }
}
