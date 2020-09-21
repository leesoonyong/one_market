package com.honjok.app.vo;

public class ProductReviewVO {

	private String pNum,
	idx,
	rating,
	pName,
	id,
	nickName,
	regdate,
	photoImage1,
	title,
	content,
	photoImage2;

	public String getpNum() {
		return pNum;
	}

	public void setpNum(String pNum) {
		this.pNum = pNum;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPhotoImage1() {
		return photoImage1;
	}

	public void setPhotoImage1(String photoImage1) {
		this.photoImage1 = photoImage1;
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

	public String getPhotoImage2() {
		return photoImage2;
	}

	public void setPhotoImage2(String photoImage2) {
		this.photoImage2 = photoImage2;
	}
	
	

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "productReviewVO [pNum=" + pNum + ", idx=" + idx + ", rating=" + rating + ", pName=" + pName + ", id="
				+ id + ", nickName=" + nickName + ", regdate=" + regdate + ", photoImage1=" + photoImage1 + ", title="
				+ title + ", content=" + content + ", photoImage2=" + photoImage2 + "]";
	}


	
	
	
	
}
