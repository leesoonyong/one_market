package com.honjok.app.mypage;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.SystemPropertyUtils;

import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.CookVO;
import com.honjok.app.vo.OrderVO;
import com.honjok.app.vo.UserVO;

@Repository("mypageDAOMybatis")
public class MypageDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//id로 회원정보 조회
	//---회원정보 조회
	public UserVO getUser(UserVO uvo) {
		System.out.println("===> mybatis 유저 정보 id 조회");
		return mybatis.selectOne("myPageDAO.userSelect", uvo);
	}
	
	//---회원정보 수정
	public void updateUser(UserVO uvo) {
		System.out.println("===> mybatis 유저 정보 수정");
		mybatis.update("myPageDAO.updateUser", uvo);
	}

	//id로 회원 주문내역 조회
	public List<OrderVO> getOrder(OrderVO ovo) {
		return mybatis.selectList("myPageDAO.ordersSelect", ovo);
	}
	
	//id로 본인 게시물 조회
	//---인테리어 게시판 조회
	public List<CommInteriorVO> interSelectBoard(CommInteriorVO cvo) {
		List<CommInteriorVO> inter = mybatis.selectList("myPageDAO.interiorBoard", cvo);
		System.out.println(inter);
		return inter;
	}

	//--혼놀정보게시판 조회
	public List<CommInfoVO> infoSelectBoard(CommInfoVO ivo) {
		List<CommInfoVO> info = mybatis.selectList("myPageDAO.infoBoard", ivo);
		System.out.println(info);
		return info;
	}

	//--자취레시피 조회
	public List<CookVO> cookSelectBoard(CookVO ckvo) {
		List<CookVO> cook = mybatis.selectList("myPageDAO.cookBoard", ckvo);
		System.out.println(cook);
		return cook;
	}
}