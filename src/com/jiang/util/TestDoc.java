package com.jiang.util;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.jiang.bean.CGGLDJGL;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.rtf.RtfWriter2;

/**
 * @blog http://reymont.iteye.com/
 * @author reymont.li
 * @version create time：2011-7-21 下午04:02:59
 */
public class TestDoc {
	public static void makeDoc(CGGLDJGL dj, String gggg) throws Exception {
		String allurl = TestDoc.class.getResource("").toString();
		allurl = allurl.substring(6, allurl.length());
		int len = new String("/WEB-INF/classes/com/jiang/util/").length();
		String dir = allurl.substring(0, allurl.length() - len) + "/";
		Document document = new Document(PageSize.A3);
		String filename = dir + "print/" + dj.getCaigou_id() + ".doc";
		//filename = "c:/" + dj.getCaigou_id() + ".doc";
		System.out.println("filename:" + filename);
		File file = new File(filename);
		if (!file.exists())
			file.createNewFile();

		RtfWriter2.getInstance(document, new FileOutputStream(filename));
		document.open();

		// 添加页眉
		/*
		 * HeaderFooter header = new HeaderFooter(new Phrase("header"), false);
		 * header.setAlignment(Rectangle.ALIGN_CENTER);
		 * document.setHeader(header); // 添加页脚 HeaderFooter footer = new
		 * HeaderFooter(new Phrase("footer"), false);
		 * footer.setAlignment(Rectangle.ALIGN_CENTER);
		 * document.setFooter(footer);
		 */
		// 设置中文字体
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light",
				"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		BaseFont fs = BaseFont.createFont("c:\\windows\\fonts\\STCAIYUN.TTF",
				BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

		Font contextFont = new Font(bfChinese, 18, Font.BOLD);
		Font contextFont_gys = new Font(fs, 12, Font.NORMAL);
		Paragraph context = new Paragraph("");
		context.setFont(contextFont);
		// Image png = Image.getInstance("D:/busy.gif");
		// png.setAbsolutePosition(0, 0);
		// png.setAlignment(Image.TEXTWRAP);
		context.add("\t\t\t\t\t\t\t\t森   泰   家   居\n");
		context.add("\t\t\t\t\t\t  原    材   料   采   购   单\n\n");
		context.setFont(contextFont_gys);
		context.add(" 供应商名称："+gggg+"家居有限公司");
		context.add("\t\t\t\t\t\t\t\t\t\t\t");
		context.add("采购单号:" + dj.getCaigou_id() + "");
		Table table = new Table(8);
		table.setBorderWidth(0);
		table.flushContent();
		table.setAlignment(Table.ALIGN_MIDDLE);
		table.setWidth(100);
		// table.setBorderColor(Color.RED);
		table.setPadding(10);
		table.setAlignment(Table.ALIGN_RIGHT);
		table.setSpacing(0);

		Cell title_xinghao = new Cell("          原材料型号：");
		table.setAlignment(Table.ALIGN_CENTER);
		title_xinghao.setColspan(2);
		Cell title_num = new Cell("          采购数量：");
		title_num.setColspan(2);
		Cell title_gysmc = new Cell("         供应商型号：");
		title_gysmc.setColspan(2);
		Cell title_jhtime = new Cell("          交货日期：");
		title_jhtime.setColspan(2);
		Cell title_guige = new Cell("          规格/幅宽：");
		title_guige.setColspan(2);
		Cell title_chenfen = new Cell("          成分：");
		title_chenfen.setColspan(2);
		Cell title_jingmi = new Cell("          经密(根/cm)：");
		title_jingmi.setColspan(2);
		Cell title_zhongliang = new Cell("          重量(克/m)：");
		title_zhongliang.setColspan(2);
		Cell title_weimi = new Cell("          纬密(根/cm)：");
		title_weimi.setColspan(2);

		Cell cell = new Cell("          "+dj.getType_num());
		cell.setColspan(2);
		Cell cell_num = new Cell("          "+dj.getCG_totalnum());
		cell_num.setColspan(2);
		Cell cell_gysxh = new Cell("          "+dj.getGyspinming());
		cell_gysxh.setColspan(2);
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd");
		String a= dateformat.format(dj.getJiaohuo_time());
		Cell cell_jhtime = new Cell("          "+a);
		cell_jhtime.setColspan(2);
		Cell cell_guige = new Cell("          cell_guige");
		cell_guige.setColspan(2);
		Cell cell_chengfen = new Cell("          cell_chengfen");
		cell_chengfen.setColspan(2);
		Cell cell_jingmi = new Cell("          cell_jingmi");
		cell_jingmi.setColspan(2);
		Cell cell_zhongliang = new Cell("          cell_zhongliang");
		cell_zhongliang.setColspan(2);
		Cell cell_weimi = new Cell("          cell_weimi");
		cell_weimi.setColspan(2);

		Cell cell_null = new Cell("          ");
		cell_null.setColspan(2);

		Cell cell_jingdu = new Cell(
				"                                                  经线原料");
		cell_jingdu.setColspan(8);
		Cell jx[] = new Cell[8];
		Cell jxvalue[] = new Cell[8];
		String strjx[] = { "      A", "      B", "      C", "      D",
				"      E", "      F", "      G", "      H" };
		String strjxvalue[] = { "XXXX", "XXXX", "XXXX", "XXXX", "XXXX", "XXXX",
				"XXXX", "XXXX" };
		for (int i = 0; i < strjx.length; i++) {
			jx[i] = new Cell(strjx[i]);
		}
		for (int i = 0; i < strjxvalue.length; i++) {
			jxvalue[i] = new Cell(strjxvalue[i]);
		}

		Cell cell_weixian = new Cell(
				"                                                  经线原料");
		cell_weixian.setColspan(8);
		Cell wx[] = new Cell[8];
		Cell wxvalue[] = new Cell[8];
		String strwx[] = { "      A", "      B", "      C", "      D",
				"      E", "      F", "      G", "      H" };
		String strwxvalue[] = { "XXXX", "XXXX", "XXXX", "XXXX", "XXXX", "XXXX",
				"XXXX", "XXXX" };
		for (int i = 0; i < strwx.length; i++) {
			wx[i] = new Cell(strwx[i]);
		}
		for (int i = 0; i < strwxvalue.length; i++) {
			wxvalue[i] = new Cell(strwxvalue[i]);
		}
		Cell cell_beizhu = new Cell("\t\t\t备  注：\t\t\t\t");

		Cell cell_beizhu_content = new Cell("");
		cell_beizhu_content.setColspan(7);

		table.addCell(title_xinghao);
		table.addCell(cell);
		table.addCell(title_num);
		table.addCell(cell_num);
		table.addCell(title_gysmc);
		table.addCell(cell_gysxh);
		table.addCell(title_jhtime);
		table.addCell(cell_jhtime);
		table.addCell(title_guige);
		table.addCell(cell_guige);
		table.addCell(title_chenfen);
		table.addCell(cell_chengfen);
		table.addCell(title_jingmi);
		table.addCell(cell_jingmi);
		table.addCell(title_zhongliang);
		table.addCell(cell_zhongliang);
		table.addCell(title_weimi);
		table.addCell(cell_weimi);
		table.addCell(cell_null);
		table.addCell(cell_null);
		table.addCell(cell_jingdu);
		for (int i = 0; i < jx.length; i++) {
			table.addCell(jx[i]);
		}
		for (int i = 0; i < jxvalue.length; i++) {
			table.addCell(jxvalue[i]);
		}

		table.addCell(cell_weixian);
		for (int i = 0; i < wx.length; i++) {
			table.addCell(wx[i]);
		}
		for (int i = 0; i < wxvalue.length; i++) {
			table.addCell(wxvalue[i]);
		}
		table.addCell(cell_beizhu);
		table.addCell(cell_beizhu_content);

		document.add(context);
		document.add(table);
		context.clear();
		Font contextFont2 = new Font(bfChinese, 14, Font.NORMAL);
		context.setFont(contextFont2);
		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy/MM/dd");
		String a1 = dateformat1.format(new Date());

		String str = "\n\n复核人：" + "       " + "\t\t\t\t\t" + "采购员：  " + dj.getUserName()
				+ "\t\t\t\t\t\t\t" + "开单日期:   " + a1;
		context.add(str);
		document.add(context);

		document.close();
	}

	public static void main(String[] args) {
		CGGLDJGL dj = new CGGLDJGL();
		dj.setCaigou_id("CG201212129999");
		dj.setCG_totalnum(new BigDecimal(100f));
		dj.setGongyingshangid(12);
		dj.setJiaohuo_time(new Date());
		dj.setGyspinming("品名");
		try {
			makeDoc(dj, "00");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
