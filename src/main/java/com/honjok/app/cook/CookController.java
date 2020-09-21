package com.honjok.app.cook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.CommunityVO;
import com.honjok.app.vo.CookVO;
import com.honjok.app.vo.CommReplyVO;

@Controller
@RequestMapping("/cook") 
public class CookController {
   
   @Autowired
   CookService cookservice; 

   @RequestMapping("/CookAll.do")
   public String CookAll(Model model,  @RequestParam(required = false) String section,
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
	   List<CookVO> CookList = cookservice.CookAll(pagingMap);

	   //게시글 전체갯수
	   int allcount = cookservice.selectAllCount();
	   System.out.println("게시글수: "+allcount);
	   
	   model.addAttribute("cookList", CookList);
	   model.addAttribute("pageNum", pageNum_);
	   model.addAttribute("section", section_);
	   model.addAttribute("allCount", allcount);
	return "/cook/CookList.jsp";
   }
   
   @RequestMapping("/CookDetail.do")
	public String cookDetail(Model model, CookVO cvo, int comSeq) {
		System.out.println("Cook게시판 하나 조회입니다.");
		CookVO Cook = cookservice.selectOne(cvo);
		model.addAttribute("cookDetail", Cook);
		   //댓글 전체 조회
		   List<CommReplyVO> commentList = cookservice.commentList(Integer.parseInt(cvo.getComSeq()));
			System.out.println(commentList);
			model.addAttribute("commentSelect", commentList);
		int board_hit = 0;
        cookservice.boardHitsUpdate(comSeq);
        model.addAttribute("Board_hit", board_hit);
		
		
		return "CookDetail.jsp";
	}
   
   @RequestMapping("/InsertCook.do")
   public String insert(CookVO ckvo) {
	   	
	   System.out.println(ckvo);
		  cookservice.insertCook(ckvo);
		  System.out.println("게시물 등록이 완료되었습니다.");
		  System.out.println(ckvo.toString());
		  return "/cook/CookAll.do";
   }
   
   @RequestMapping("/update.do")   
   public String updateBoard(/*@ModelAttribute("board")*/ CookVO cvo) {
		System.out.println(">>> 글 수정 처리 - update()");
		System.out.println("> board vo : " + cvo);

         cookservice.update(cvo);
       return "/cook/CookDetail.do";
   }
   
   
   @RequestMapping("/delete.do")
	public String delete(String comSeq ,Model model) {
		System.out.println(comSeq);
		System.out.println(" 글 삭제");
		cookservice.delete(comSeq);
		
		return "/cook/CookAll.do";
	}
   
	//댓글 입력
	@RequestMapping("/addComment.do")
	public String insertComment(CommReplyVO rvo) {
		System.out.println(">> 댓글 입력 실행");
		cookservice.insertComment(rvo);
		
		return "getInterior.do";
				
	}
	
	//댓글 수정
	@RequestMapping("/upComment.do")
	@ResponseBody
	public void updateComment(CommReplyVO rvo) {
		System.out.println(">> 댓글 수정 처리");
		cookservice.updateComment(rvo);
	}

}