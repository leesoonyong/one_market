package com.honjok.app.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.CookVO;
import com.honjok.app.vo.OrderVO;
import com.honjok.app.vo.UserVO;


public interface MyPageService {
	
	//id로 회원정보 조회
	public UserVO getUser(UserVO uvo);

	//--회원정보 수정
	public void updateUser(UserVO uvo);

	//id로 주문내역 조회
	public List<OrderVO> getOrder(OrderVO ovo);
	
	//id로 인테리어 게시물 조회
	public List<CommInteriorVO> interSelectBoard(CommInteriorVO cvo);
	public List<CommInfoVO> infoSelectBoard(CommInfoVO ivo);
	public List<CookVO> cookSelectBoard(CookVO ckvo);

}
