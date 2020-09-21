package com.honjok.app.vo;

public class Qna {

	private String 
	comSeq,
	title,
	content,
	regdate,
	hit,
	nickName
	;

	public String getComSeq() {
		return comSeq;
	}

	public void setComSeq(String comSeq) {
		this.comSeq = comSeq;
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

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Qna [comSeq=" + comSeq + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", hit="
				+ hit + ", nickName=" + nickName + "]";
	}

	
	
	
	
}
