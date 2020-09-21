package com.honjok.app.vo;

public class ReplyUploadVO {
	private String comSeq,
		parentNumber,
		upImgName,
		idx;

public String getComSeq() {
	return comSeq;
}

public void setComSeq(String comSeq) {
	this.comSeq = comSeq;
}

public String getParentNumber() {
	return parentNumber;
}

public void setParentNumber(String parentNumber) {
	this.parentNumber = parentNumber;
}

public String getUpImgName() {
	return upImgName;
}

public void setUpImgName(String upImgName) {
	this.upImgName = upImgName;
}

public String getIdx() {
	return idx;
}

public void setIdx(String idx) {
	this.idx = idx;
}

@Override
public String toString() {
	return "replyUploadVO [comSeq=" + comSeq + ", parentNumber=" + parentNumber + ", upImgName=" + upImgName + ", idx="
			+ idx + "]";
}




}
