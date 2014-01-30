package com.jiang.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileDirsUtil {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		long a = System.currentTimeMillis();
		//refreshFileList("D:\\database\\");
		System.out.println(System.currentTimeMillis() - a);
	}

	public static List<String> getFileList(String strPath) {
		List<String> filelist = new ArrayList<String>();
		File dir = new File(strPath);
		File[] files = dir.listFiles();
		if (files == null)
			return null;
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				//refreshFileList(files[i].getAbsolutePath());
				filelist.add(files[i].getAbsolutePath());
			} else {
			//	String strFileName = files[i].getAbsolutePath().toLowerCase();
			//	System.out.println("---" + strFileName);
			//	filelist.add(files[i].getAbsolutePath());
			}
		}
		return filelist;
	}
}
