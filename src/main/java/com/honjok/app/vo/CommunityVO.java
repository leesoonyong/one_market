package com.honjok.app.vo;


public class CommunityVO {
	private String title, id, content, type,comSeq, hit, likes, regdate, nickName;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getComSeq() {
		return comSeq;
	}

	public void setComSeq(String comSeq) {
		this.comSeq = comSeq;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
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

	@Override
	public String toString() {
		return "CommunityVO [title=" + title + ", id=" + id + ", content=" + content + ", type=" + type + ", comSeq="
				+ comSeq + ", hit=" + hit + ", likes=" + likes + ", regdate=" + regdate + ", nickName=" + nickName
				+ "]";
	}

	
	
	
	
}
