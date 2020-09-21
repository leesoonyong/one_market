package com.honjok.app.vo;


public class CommInteriorVO {
	private String fileImage, id, title, content, comSeq, hit, likes, nickName, show, regdate;
	private int type;

	public String getFileImage() {
		return fileImage;
	}

	public void setFileImage(String fileImage) {
		this.fileImage = fileImage;
	}

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

	public String getcomSeq() {
		return comSeq;
	}

	public void setcomSeq(String comSeq) {
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

//	public String getNickName() {
//		return nickName;
//	}
//
//	public void setNickName(String nickName) {
//		System.out.println("닉네임: " + nickName);
//		this.nickName = nickName;
//	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		System.out.println("제목: " + title);
		this.nickName = nickName;
	}
	
	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String toString() {
		return "CommInteriorVO [fileImage=" + fileImage + ", title=" + title + ", id=" + id +
				", content=" + content + ", comSeq=" + comSeq + ", hit=" + hit + ", likes=" + likes + ", regdate="
				+ regdate + ", nickName= " + nickName + ", show=" + show + "]";
	}
}
