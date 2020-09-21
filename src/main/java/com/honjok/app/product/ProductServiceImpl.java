package com.honjok.app.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.ProductQnaVO;
import com.honjok.app.vo.ProductReviewVO;
import com.honjok.app.vo.ProductVO;

@Service()
public class ProductServiceImpl implements ProductService {
   
   
   @Autowired
   private ProductDAO mapper;


@Override
public ProductVO ProductVO(String pNum) {
	ProductVO productVO = mapper.ProductVO(pNum);
	
	return productVO;
}




@Override
public List<ProductReviewVO> ProductreviewVOList(String pNum) {

	List<ProductReviewVO> productReviewVO = mapper.productReviewVO(pNum);
		
	return productReviewVO;
}



//리뷰글 등록
@Override
public void insertReview(ProductReviewVO productreviewvo) {
	mapper.insertReview(productreviewvo);
}



//리뷰 전체 게시물 수 
@Override
public int getTotalCount(String pNum) {
	
	return mapper.getTotalCount(pNum);
}



//ajax 리뷰 글 가져오기 
@Override
public List<ProductReviewVO> getreviewList(Map map) {

	
	
	return mapper.getreviewList(map);
}



//qna 리뷰 글 등록
@Override
public void inserQnaReview(ProductQnaVO productqnavo) {
	System.out.println("");
	mapper.inserQnaReview(productqnavo);
	
}



//Ona 리뷰 조회 
@Override
public List<ProductQnaVO> productqnavoList(String pNum) {
	
	return mapper.productqnavoList(pNum);
}



//Qna 리뷰 카운트
@Override
public int getQnaTotalCount(String pNum) {
	return mapper.getQnaTotalCount(pNum);
}




@Override
public List<ProductQnaVO> ProductQna(Map<String, Integer> map) {
	
	return  mapper.ProductQna(map);
}



//상품리스트 가져오기 
@Override
public List<ProductVO> ProductList(Map<String, Object> map) {
	return mapper.ProductList(map);
}




@Override
public int ProductListCount() {
	return mapper.ProductListCount();
}




@Override
public int ProductListSerchCount(String topSearchKeyword) {
	return mapper.ProductListSerchCount(topSearchKeyword);
}


}

