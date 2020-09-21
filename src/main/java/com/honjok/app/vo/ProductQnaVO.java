package com.honjok.app.vo;

public class ProductQnaVO {
	
private String	seq,
	commentProc,
	idx,
	title,
	content,
	regdate,
	lev,
	pProc,
	pName,
	buyInfo,
	id;

public String getSeq() {
	return seq;
}

public void setSeq(String seq) {
	this.seq = seq;
}

public String getCommentProc() {
	return commentProc;
}

public void setCommentProc(String commentProc) {
	this.commentProc = commentProc;
}

public String getIdx() {
	return idx;
}

public void setIdx(String idx) {
	this.idx = idx;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getRegdate() {
	return regdate;
}

public void setRegdate(String regdate) {
	this.regdate = regdate;
}

public String getLev() {
	return lev;
}

public void setLev(String lev) {
	this.lev = lev;
}

public String getpProc() {
	return pProc;
}

public void setpProc(String pProc) {
	this.pProc = pProc;
}

public String getpName() {
	return pName;
}

public void setpName(String pName) {
	this.pName = pName;
}

public String getBuyInfo() {
	return buyInfo;
}

public void setBuyInfo(String buyInfo) {
	this.buyInfo = buyInfo;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

@Override
public String toString() {
	return "productQna [seq=" + seq + ", commentProc=" + commentProc + ", idx=" + idx + ", title=" + title
			+ ", content=" + content + ", regdate=" + regdate + ", lev=" + lev + ", pProc=" + pProc + ", pName=" + pName
			+ ", buyInfo=" + buyInfo + ", id=" + id + "]";
}






}
