package com.honjok.app.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.honjok.app.vo.AdminVO;
import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.ProductReviewVO;


@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/getMainList.do")
	public String getBoardList(AdminVO vo, Model model) {
		/*
		System.out.println(">>> 글 전체 목록 조회 처리-getBoardList()");
		System.out.println("condition : " + vo.getSearchCondition());
		System.out.println("keyword : " + vo.getSearchKeyword());
		
		//null 체크 후 초기값 설정
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리후 condition : " + vo.getSearchCondition());
		System.out.println("null처리후 keyword : -" + vo.getSearchKeyword() + "-");
		
		List<BoardVO> boardList = boardDAO.getBoardList();
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		*/
		System.out.println("겟 메인 들어왔음");
		List<AdminVO> mainList = mainService.getMainList();
		
		//인테리어 리스트 4개 가져옴
		List<CommInteriorVO> CommInteriorVO = mainService.interiorList();
		//공백 제거 
		System.out.println("인테리어 정보 들어옴" + CommInteriorVO);
		for(CommInteriorVO interior : CommInteriorVO) {
			String temp =  interior.getContent().replaceAll("\r\n", "");
			interior.setContent(temp);
		}
		
		//혼족정보 4개 가져오기 
		List<CommInfoVO> CommInfoVO = mainService.infoList();
		//공백 제거 
		for(CommInfoVO info : CommInfoVO) {
			String temp =  info.getContent().replaceAll("\r\n", "");
			info.setContent(temp);
		}
		
		//레시피정보 4개 가져오기 
		List<CommInfoVO> CookVO = mainService.cookList();
		//공백 제거 
		for(CommInfoVO info : CommInfoVO) {
			String temp =  info.getContent().replaceAll("\r\n", "");
			info.setContent(temp);
		}
		
		
		List<ProductReviewVO> productReviewList = mainService.productReviewList();
		
		//장바구니 크기 
		
		
		
		
		
		
		System.out.println(productReviewList);
		
		model.addAttribute("mainList", mainList);
//		model.addAttribute("CommInteriorList", CommInteriorVO);
//		model.addAttribute("CommInfoList", CommInfoVO);
//		model.addAttribute("CommCookList", CookVO);
		model.addAttribute("productReviewList",productReviewList);
		return "/main/main.jsp";
	}
	
	@RequestMapping("/getMain.do")
	public String getinteriorSelect(Model model, AdminVO vo) {
		AdminVO mainVO = mainService.getMain(vo);
		model.addAttribute("mainDetail", mainVO);        	
		return "mainDetail.jsp";
	}
	
	
	
	
}
