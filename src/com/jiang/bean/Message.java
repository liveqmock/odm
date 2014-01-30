package com.jiang.bean;

import java.io.Serializable;
import java.util.Date;

public class Message   implements Serializable {
	private int id;
	private String send_man;
	private String receive_man;
	private Date sendTime;
	private String danhao;
	private String xinghao;
	private String message;
	private String mudibumen;
	private String laiyuanbumen;
	private String sendtype;
	private String duqu_or_not;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSend_man() {
		return send_man;
	}
	public void setSend_man(String send_man) {
		this.send_man = send_man;
	}
	public String getReceive_man() {
		return receive_man;
	}
	public void setReceive_man(String receive_man) {
		this.receive_man = receive_man;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getDanhao() {
		return danhao;
	}
	public void setDanhao(String danhao) {
		this.danhao = danhao;
	}
	public String getXinghao() {
		return xinghao;
	}
	public void setXinghao(String xinghao) {
		this.xinghao = xinghao;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMudibumen() {
		return mudibumen;
	}
	public void setMudibumen(String mudibumen) {
		this.mudibumen = mudibumen;
	}
	public String getLaiyuanbumen() {
		return laiyuanbumen;
	}
	public void setLaiyuanbumen(String laiyuanbumen) {
		this.laiyuanbumen = laiyuanbumen;
	}
	public String getSendtype() {
		return sendtype;
	}
	public void setSendtype(String sendtype) {
		this.sendtype = sendtype;
	}
	public String getDuqu_or_not() {
		return duqu_or_not;
	}
	public void setDuqu_or_not(String duqu_or_not) {
		this.duqu_or_not = duqu_or_not;
	}

}
 