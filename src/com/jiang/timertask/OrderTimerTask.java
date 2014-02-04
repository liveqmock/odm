package com.jiang.timertask;

import com.jiang.service.CGGLService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-20
 * Time: 下午6:34
 * 定时处理未处理的订单
 */

@SuppressWarnings("serial")
public class OrderTimerTask {
    @Autowired
    private CGGLService cgglService;

    public void execute(){
        System.out.println("StartUpTimerTask is executed.");
        cgglService.timerResetFPBPstate();
    }
}
