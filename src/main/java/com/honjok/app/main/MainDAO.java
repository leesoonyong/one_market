package com.honjok.app.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.AdminVO;
import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.ProductReviewVO;

@Repository("MainDAO")
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminVO> selectMainList(){
		List<AdminVO> list = mybatis.selectList("mainDAO.selectMainList");
		return list;
	}
	
	public AdminVO selectMain(AdminVO vo) {
			return mybatis.selectOne("mainDAO.selectMainDetail", vo);
		}

	//게시글 4개 가져오기
	public List<CommInteriorVO> interiorList() {
		return mybatis.selectList("mainDAO.interiorList");
	}

	public List<CommInfoVO> infoList() {
		return mybatis.selectList("mainDAO.infoList");
	}

	public List<CommInfoVO> cookList() {
		return mybatis.selectList("mainDAO.cookList");
	}

	public List<ProductReviewVO> productReviewList() {
		return mybatis.selectList("mainDAO.productReviewList");
	}
	


}
