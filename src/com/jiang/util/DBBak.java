package com.jiang.util;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBBak {
	/**
	 * 备份SQL Server数据库
	 * 
	 * @author
	 * @param userName
	 *            数据库登录名
	 * @param passWord
	 *            数据库登录密码
	 * @param dataBaseName
	 *            需要备份的数据库名称
	 * @param address
	 *            保存地址;如D:/doc/
	 * @param name
	 *            数据库保存名称
	 * @return 备份的数据库名称
	 */

	public static void main(String[] args) {
		try {
		 backUpDataBaseSQLServer("sa", "123456Rq", "Fabrics", "C:\\ab");
	//		restoreDataBaseSQLServer("sa", "123456Rq", "Fabrics", "C:\\ab");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//restore database db_CSManage from disk='c:\backup.bak'

	public static void backUpDataBaseSQLServer(String userName,
			String passWord, String dataBaseName, String address)
			throws Exception {
		Connection conn;
		Statement st;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+dataBaseName
				+";username="+userName+";password="+passWord);
		conn.setCatalog(dataBaseName);
		st = conn.createStatement();
		// 拼装DOS命令进行数据库备份
		StringBuffer exp = new StringBuffer("backup database ");
		exp.append(dataBaseName);
		exp.append(" to disk =");
		exp.append(" '");
		/*
		 * 得到存储地址的最后一个字符 如果有\就直接拼装地址 如果没有\就加上/然后拼装数据库名称
		 */
		String maxIndex = address.substring(address.length() - 1);
		if ("/".equals(maxIndex) || "\\".equals(maxIndex)) {
			exp.append(address);
		} else {
			address = address + "\\";
			exp.append(address);
		}
		File file = new File(address);
		if (!file.exists()) {
			file.mkdir();
		}
		exp.append(dataBaseName);
		exp.append(".bak");
		exp.append("'");
		System.out.println("开始备份........");
		try {
			st.executeUpdate(exp.toString());
		} catch (SQLException e) {
			e.getMessage();
		} finally {
			try {
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.getMessage();
			}
		}
	}
	public static void restoreDataBaseSQLServer(String userName,
			String passWord, String dataBaseName, String address)
			throws Exception {
		Connection conn;
		Statement st;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+"master"
				+";username="+userName+";password="+passWord);
		conn.setCatalog("master");
		st = conn.createStatement();
		// 拼装DOS命令进行数据库备份
		 
		StringBuffer exp2 = new StringBuffer("DROP DATABASE Fabrics ");
	//	st.executeUpdate(exp2.toString());
		StringBuffer exp = new StringBuffer("restore database ");
		exp.append(dataBaseName);
		exp.append(" from disk =");
		exp.append(" '");
		/*
		 * 得到存储地址的最后一个字符 如果有\就直接拼装地址 如果没有\就加上/然后拼装数据库名称
		 */
		String maxIndex = address.substring(address.length() - 1);
		if ("/".equals(maxIndex) || "\\".equals(maxIndex)) {
			exp.append(address);
		} else {
			address = address + "\\";
			exp.append(address);
		}
		File file = new File(address);
		if (!file.exists()) {
			file.mkdir();
		}
		exp.append(dataBaseName);
		exp.append(".bak");
		exp.append("'");
		System.out.println("开始还原........");
		try {
			System.out.println(exp.toString());
			st.executeUpdate(exp.toString());
		} catch (SQLException e) {
			e.getMessage();
		} finally {
			try {
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.getMessage();
			}
		}
	}
}
