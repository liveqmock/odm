package com.jiang.bean;

import java.io.Serializable;

public class Menu   implements Serializable {
		private String code;
		private String name;
		private String href;
		private String iconCls;
		private String parentcode;
		public Menu()
		{
			
		}
		public Menu(String code, String name, String href, String iconCls, String parentcode)
		{
			setCode(code);
			setName(name);
			setHref(href);
			setIconCls(iconCls);
			setParentcode(parentcode);
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getHref() {
			return href;
		}
		public void setHref(String href) {
			this.href = href;
		}
		public String getIconCls() {
			return iconCls;
		}
		public void setIconCls(String iconCls) {
			this.iconCls = iconCls;
		}
		public String getParentcode() {
			return parentcode;
		}
		public void setParentcode(String parentcode) {
			this.parentcode = parentcode;
		}

}
