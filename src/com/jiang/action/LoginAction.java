package com.jiang.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jiang.bean.User;
import com.jiang.service.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class LoginAction extends ActionSupport {
    private static final long serialVersionUID = 1L;

    private Logger log = Logger.getLogger(LoginAction.class);

    private String userName;
    private String passWord;
    private String veryCode;
    private String company;

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Autowired
    private LoginService loginService;

    public String getUserName() {
        return userName;
    }

    public LoginService getLoginService() {
        return loginService;
    }

    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getVeryCode() {
        return veryCode;
    }

    public void setVeryCode(String veryCode) {
        this.veryCode = veryCode;
    }

    public String execute() {

        return SUCCESS;
    }

    public String login() {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        response.setContentType("text/html;charset=utf-8");
        String validateC = (String) ActionContext.getContext().getSession()
                .get("validateCode");
        String veryCode = getVeryCode();
        log.info("登陆验证");

        if (veryCode != null && !"".equals(veryCode)) {
            veryCode = veryCode.toUpperCase();
        }

        if (veryCode == null || "".equals(veryCode)) {
            request.getSession().setAttribute("uname", getUserName());
            request.getSession().setAttribute("upwd", getPassWord());
            request.getSession().setAttribute("message", "验证码为空");
        } else {
            if (validateC != null && validateC.equals(veryCode)) {
                String username = getUserName();
                String password = getPassWord();
                if (username == null || "".equals(username)) {
                    log.info("用户名为空");
                    request.getSession().setAttribute("message", "用户名为空");
                }
                if (password == null || "".equals(password)) {
                    log.info("密码为空");
                    request.getSession().setAttribute("message", "密码为空");
                }

                User user = new User();
                user.setUserName(username);
                user.setPassWord(password);
                user.setCompany(company);
                User hasUser = loginService.queryUserByPWD(user);
                if (hasUser != null) {
                    ActionContext.getContext().getSession()
                            .put("user", hasUser);
                    log.info("用户：" + username + "登录成功");
                    return SUCCESS;
                } else {
                    log.info("用户名或者密码错误，登录失败");
                    request.getSession().setAttribute("uname", "");
                    request.getSession().setAttribute("upwd", "");
                    request.getSession().setAttribute("message", "用户名或者密码错误");
                }

            } else {
                request.getSession().setAttribute("uname", getUserName());
                request.getSession().setAttribute("upwd", getPassWord());
                request.getSession().setAttribute("message", "验证码错误");
                log.info("验证码错误，登录失败");
            }
        }

        return ERROR;
    }

    public String loginOut() {
        System.out.println("loginout");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        response.setContentType("text/html;charset=utf-8");
        ActionContext.getContext().getSession().remove("user");
        ActionContext.getContext().getSession().put("username", "");
        request.getSession().setAttribute("message", "");
        return ERROR;
    }

    public String makeImg() {
        int width = 130;
        int height = 53;
        int codeCount = 4;
        int xx = 0;
        int fontHeight;
        int codeY;

        xx = width / (codeCount + 1);
        fontHeight = height - 2;
        codeY = height - 4;
        /**
         * codeSequence
         */
        /*char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
                  'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
                  'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6',
                  '7', '8', '9' };*/
        char[] codeSequence = {'0', '1', '2', '3', '4', '5', '6',
                '7', '8', '9' };

        // 定义图像buffer
        BufferedImage buffImg = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics2D gd = buffImg.createGraphics();

        // 创建一个随机数生成器类
        Random random = new Random();

        // 将图像填充为白色
        gd.setColor(Color.WHITE);
        gd.fillRect(0, 0, width, height);

        // 创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);
        // 设置字体。
        gd.setFont(font);

        // 画边框。
        gd.setColor(Color.BLACK);
        gd.drawRect(0, 0, width - 1, height - 1);

        // 随机产生10条干扰线，使图象中的认证码不易被其它程序探测到。
        gd.setColor(Color.ORANGE);
        for (int i = 0; i < 20; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            gd.drawLine(x, y, x + xl, y + yl);
        }

        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer();
        int red = 0, green = 0, blue = 0;

        // 随机产生codeCount数字的验证码。
        for (int i = 0; i < codeCount; i++) {
            // 得到随机产生的验证码数字。
            String strRand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
            red = random.nextInt(255);
            green = random.nextInt(255);
            blue = random.nextInt(255);

            // 用随机产生的颜色将验证码绘制到图像中。
            gd.setColor(new Color(red, green, blue));
            gd.drawString(strRand, i * xx, codeY);

            // 将产生的四个随机数组合在一起。
            randomCode.append(strRand);
        }
        // 将四位数字的验证码保存到Session中。

        ActionContext.getContext().getSession()
                .put("validateCode", randomCode.toString());
        HttpServletResponse resp = ServletActionContext.getResponse();
        // 禁止图像缓存。
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);

        resp.setContentType("image/jpeg");

        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos;
        try {
            sos = resp.getOutputStream();
            ImageIO.write(buffImg, "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // return SUCCESS;
        return null;
    }

}
