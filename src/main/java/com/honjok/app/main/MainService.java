package com.honjok.app.main;

import java.util.List;

import com.honjok.app.vo.AdminVO;
import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.ProductReviewVO;

public interface MainService {
	List<AdminVO>getMainList();
	public AdminVO getMain(AdminVO vo);
	//인테리어 게시글 4개 
	List<CommInteriorVO> interiorList();
	List<CommInfoVO> infoList();
	List<CommInfoVO> cookList();
	List<ProductReviewVO> productReviewList();
}
