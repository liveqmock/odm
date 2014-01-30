package com.jiang.util;



import com.jacob.activeX.ActiveXComponent;

import com.jacob.com.Dispatch;

import com.jacob.com.Variant;


public class WordUtil {

    public static final int WORD_HTML = 8;


    public static final int WORD_TXT = 7;


    public static final int EXCEL_HTML = 44;


    /**
     * WORD转HTML
     *
     * @param docfile  WORD文件全路径
     * @param htmlfile 转换后HTML存放路径
     */

    public static void wordToHtml(String docfile, String htmlfile) {

        ActiveXComponent app = new ActiveXComponent("Word.Application"); // 启动word

        try {

            // 设置word不可见

            app.setProperty("Visible", new Variant(false));

            //获得documents对象

            Dispatch docs = (Dispatch) app.getProperty("Documents")

                    .toDispatch();

            //打开文件

            Dispatch doc = Dispatch.invoke(

                    docs,

                    "Open",

                    Dispatch.Method,

                    new Object[]{docfile, new Variant(false),

                            new Variant(true)}, new int[1]).toDispatch();

            //保存新的文件

            Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[]{

                    htmlfile, new Variant(WORD_HTML)}, new int[1]);

            Variant f = new Variant(false);

            Dispatch.call(doc, "Close", f);

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            app.invoke("Quit", new Variant[]{});

        }

    }


    public static void main(String[] args) {
        wordToHtml("F:\\odm\\文档\\ok\\自加工光定工艺单.doc", "自加工光定工艺单.html");
    }
}
