package com.honjok.app.vo;

import java.util.List;

public class CommReplyVO {

private String id,lev,step,content,regdate,nickName,comSeq,idx;
private List<ReplyUploadVO> replyuploadvo;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getLev() {
	return lev;
}
public void setLev(String lev) {
	this.lev = lev;
}
public String getStep() {
	return step;
}
public void setStep(String step) {
	this.step = step;
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
public String getNickName() {
	return nickName;
}
public void setNickName(String nickName) {
	this.nickName = nickName;
}
public String getComSeq() {
	return comSeq;
}
public void setComSeq(String comSeq) {
	this.comSeq = comSeq;
}
public String getIdx() {
	return idx;
}
public void setIdx(String idx) {
	this.idx = idx;
}
public List<ReplyUploadVO> getReplyuploadvo() {
	return replyuploadvo;
}
public void setReplyuploadvo(List<ReplyUploadVO> replyuploadvo) {
	this.replyuploadvo = replyuploadvo;
}


@Override
public String toString() {
	return "commReplyVO [id=" + id + ", lev=" + lev + ", step=" + step + ", content=" + content + ", regdate=" + regdate
			+ ", nickName=" + nickName + ", comSeq=" + comSeq + ", idx=" + idx + ", replyuploadvo=" + replyuploadvo
			+ "]";
}


	
	
}
