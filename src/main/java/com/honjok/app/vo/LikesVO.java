package com.honjok.app.vo;

public class LikesVO {
	private String id;
	private int comSeq, likes;

	public int getComSeq() {
		return comSeq;
	}

	public void setComSeq(int comSeq) {
		this.comSeq = comSeq;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "LikesVO [comSeq=" + comSeq + ", likes=" + likes + ", id=" + id + "]";
	}
}
