package com.honjok.app.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.AdminVO;
import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.ProductReviewVO;

@Service("MainService")
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<AdminVO> getMainList() {
		return mainDAO.selectMainList();

	}

	@Override
	public AdminVO getMain(AdminVO vo) {
		return mainDAO.selectMain(vo);
	}

	//인테리어 게시글 4개
	@Override
	public List<CommInteriorVO> interiorList() {

		return mainDAO.interiorList();
	}

	@Override
	public List<CommInfoVO> infoList() {
		
		return mainDAO.infoList();
	}

	@Override
	public List<CommInfoVO> cookList() {
		return mainDAO.cookList();
	}
	
	@Override
	public List<ProductReviewVO> productReviewList() {
		return mainDAO.productReviewList();
	}
}

