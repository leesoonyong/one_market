package com.honjok.app.vo;

import java.util.List;

public class ProductVO {

	private String	pNum,
	price,
	saleprice,
	password,
	upperCategory,
	subCategory,
	stock,
	id,
	pModel,
	brandName,
	pName,
	shippingfee,
	subCategory2,
	promotion,
	discountrate,
	description,
	thumnailImg;
	
	private List<ProductReviewVO> productreviewvo ;

	private List<ProductQnaVO> productqnavo;
	
	public String getpNum() {
		return pNum;
	}

	public void setpNum(String pNum) {
		this.pNum = pNum;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(String saleprice) {
		this.saleprice = saleprice;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUpperCategory() {
		return upperCategory;
	}

	public void setUpperCategory(String upperCategory) {
		this.upperCategory = upperCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpModel() {
		return pModel;
	}

	public void setpModel(String pModel) {
		this.pModel = pModel;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getShippingfee() {
		return shippingfee;
	}

	public void setShippingfee(String shippingfee) {
		this.shippingfee = shippingfee;
	}

	public String getSubCategory2() {
		return subCategory2;
	}

	public void setSubCategory2(String subCategory2) {
		this.subCategory2 = subCategory2;
	}

	public String getPromotion() {
		return promotion;
	}

	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}

	public String getDiscountrate() {
		return discountrate;
	}

	public void setDiscountrate(String discountrate) {
		this.discountrate = discountrate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getThumnailImg() {
		return thumnailImg;
	}

	public void setThumnailImg(String thumnailImg) {
		this.thumnailImg = thumnailImg;
	}

	public List<ProductReviewVO> getProductreviewvo() {
		return productreviewvo;
	}

	public void setProductreviewvo(List<ProductReviewVO> productreviewvo) {
		this.productreviewvo = productreviewvo;
	}

	public List<ProductQnaVO> getProductqnavo() {
		return productqnavo;
	}

	public void setProductqnavo(List<ProductQnaVO> productqnavo) {
		this.productqnavo = productqnavo;
	}

	@Override
	public String toString() {
		return "productVO [pNum=" + pNum + ", price=" + price + ", saleprice=" + saleprice + ", password=" + password
				+ ", upperCategory=" + upperCategory + ", subCategory=" + subCategory + ", stock=" + stock + ", id="
				+ id + ", pModel=" + pModel + ", brandName=" + brandName + ", pName=" + pName + ", shippingfee="
				+ shippingfee + ", subCategory2=" + subCategory2 + ", promotion=" + promotion + ", discountrate="
				+ discountrate + ", description=" + description + ", thumnailImg=" + thumnailImg + ", productreviewvo="
				+ productreviewvo + ", productqnavo=" + productqnavo + "]";
	}

	

	
	
}
