package com.honjok.app.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.honjok.app.vo.CookVO;
import com.honjok.app.vo.Qna;
import com.honkok.app.util.PagingUtil;


@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	QnaService qnaservice;
	
	@RequestMapping("/QnaAll.do")
	public String QnaAll(Model model, @RequestParam(required = false) String section,
			@RequestParam(required = false) String pageNum) {
	   	System.out.println(section);
		String section_ = section;
		String pageNum_ = pageNum;

		if (section == null) {
			section_ = ((section == null) ? "1" : section);
			pageNum_ = ((pageNum == null) ? "1" : pageNum);
		}

		System.out.println(section_);
		System.out.println(pageNum_);

		Map<String, Integer> pagingMap = new HashMap<String, Integer>();

		pagingMap.put("section", Integer.parseInt(section_));
		pagingMap.put("pageNum", Integer.parseInt(pageNum_));
	   
		 //cookvo 조회
		   List<Qna> QnaList = qnaservice.QnaAll(pagingMap);
		   
		   //게시글 전체갯수
		   int allcount = qnaservice.selectAllCount();
		   System.out.println("게시글수: "+allcount);
		   
		   model.addAttribute("qnaList", QnaList);
		   model.addAttribute("pageNum", pageNum_);
		   model.addAttribute("section", section_);
		   model.addAttribute("allCount", allcount);
		return "/qna/qnaList.jsp";
	}

	   @RequestMapping("/QnaDetail.do")
		public String qnaDetail(Model model, Qna qna, int comSeq) {
			System.out.println("Qna게시판 상세조회입니다.");
			Qna qnavo = qnaservice.selectOne(qna);
			model.addAttribute("qnaDetail", qnavo);
			
			int board_hit = 0;
	        qnaservice.boardHitsUpdate(comSeq);
	        model.addAttribute("Board_hit", board_hit);
			
			
			return "qnaDetail.jsp";
		}
	   
	   @RequestMapping("/InsertQna.do")
	   public String insert(Qna qna) {
		   	
		   System.out.println(qna);
			  qnaservice.insertQna(qna);
			  System.out.println("게시물 등록이 완료되었습니다.");
			  System.out.println(qna.toString());
			  return "/qna/QnaAll.do";
	   }
	   
	   @RequestMapping("/update.do")   
	   public String updateBoard(/*@ModelAttribute("board")*/ Qna qna) {
			System.out.println(">>> 글 수정 처리 - update()");
			System.out.println("> board vo : " + qna);

	         qnaservice.update(qna);
	       return "/qna/qnaDetail.do";
	   }
	   
	   
	   @RequestMapping("/delete.do")
		public String delete(String comSeq ,Model model) {
			System.out.println(comSeq);
			System.out.println(" 글 삭제");
			qnaservice.delete(comSeq);
			
			return "/qna/QnaAll.do";
		}
}