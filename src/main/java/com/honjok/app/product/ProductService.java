package com.honjok.app.product;


import java.util.List;
import java.util.Map;

import com.honjok.app.vo.ProductQnaVO;
import com.honjok.app.vo.ProductReviewVO;
import com.honjok.app.vo.ProductVO;

public interface ProductService {

	ProductVO ProductVO(String pNum);

	List<ProductReviewVO> ProductreviewVOList(String pNum);

	void insertReview(ProductReviewVO productreviewvo);

	
	int getTotalCount(String pNum);

	List<ProductReviewVO> getreviewList(Map map);

	void inserQnaReview(ProductQnaVO productqnavo);
	
	//ONA 리뷰
	List<ProductQnaVO> productqnavoList(String pNum);

	int getQnaTotalCount(String pNum);

	List<ProductQnaVO> ProductQna(Map<String, Integer> map);

	List<ProductVO> ProductList(Map<String, Object> map);

	int ProductListCount();

	int ProductListSerchCount(String topSearchKeyword);

	
}
