package com.honjok.app.vo;

public class OrderVO {
	private int oNum, pSeq, price;
	private String oProc, id, payment, regdate;
	
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getpSeq() {
		return pSeq;
	}
	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getoProc() {
		return oProc;
	}
	public void setoProc(String oProc) {
		this.oProc = oProc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "OrdersVO [oNum=" + oNum + ", pSeq=" + pSeq + ", price=" + price + ", oProc=" + oProc + ", id=" + id
				+ ", payment=" + payment + ", regdate=" + regdate + "]";
	}
}
