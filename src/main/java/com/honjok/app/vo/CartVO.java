package com.honjok.app.vo;

public class CartVO {
	String bSeq;
	String pNum;
	String pCnt;
	String id;
	
	
	
	
	@Override
	public String toString() {
		return "CartVO [bSeq=" + bSeq + ", pNum=" + pNum + ", pCnt=" + pCnt + ", id=" + id + "]";
	}
	public String getbSeq() {
		return bSeq;
	}
	public void setbSeq(String bSeq) {
		this.bSeq = bSeq;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public String getpCnt() {
		return pCnt;
	}
	public void setpCnt(String pCnt) {
		this.pCnt = pCnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
