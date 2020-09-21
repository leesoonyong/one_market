package com.honjok.app.interior;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.honjok.app.vo.LikesVO;
import com.honjok.app.vo.CommReplyVO;

@Controller
@RequestMapping("/interior")
public class InteriorController {
	
		@Autowired
		private InteriorService interiorService;
		
		//게시물 전체 조회 페이지
		@RequestMapping("/interiorAllList.do")
		/*public String interiorAllList(Model model) {
			System.out.println("===>인테리어게시판 전체 조회");
			List<CommInteriorVO> CommInteri orList = interiorService.BoardAllList();
			model.addAttribute("interiorList", CommInteriorList);
			System.out.println(CommInteriorList.toString());
			return "InBoardList.jsp";*/
			public String interiorAllList(Model model, @RequestParam(required = false) String section,
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
	
				// community 조회
				List<CommInteriorVO> list = interiorService.BoardAllList(pagingMap);
				System.out.println(">> 게시물 전체 목록: "+list);
				
				// 페이징 처리위해 전체 조회
				int countList = interiorService.selectAllCount();
				System.out.println(">> 총 게시글수: " + countList);
				
				model.addAttribute("pageNum", pageNum_);
				model.addAttribute("section", section_);
				model.addAttribute("interiorList", list);
				model.addAttribute("countList", countList);
				
				return "inBoardList.jsp";
	
			}
	
		//게시물 상세 조회 페이지
		@RequestMapping("/getInterior.do")
		public String getinteriorSelect(Model model, CommInteriorVO cvo, LikesVO livo) {			
			System.out.println("컨트롤러 cvo: " + cvo);
			System.out.println("컨트롤러 livo: " + livo);
			
			//댓글 전체 조회
			List<CommReplyVO> commentList = interiorService.commentList(Integer.parseInt(cvo.getcomSeq()));
			System.out.println(commentList);
			model.addAttribute("commentSelect", commentList);
			
			//댓글 전체 갯수
			int countList = interiorService.reAllCount();
			model.addAttribute("countReList", countList);
			
			//게시물 상세조회
			CommInteriorVO commInterior = interiorService.getBoardList(cvo);
			model.addAttribute("interiorSelect", commInterior);
			
			System.out.println("===> 게시물 상세 조회: " + commInterior);
			System.out.println("회원아이디: " + commInterior.getId());
			
			//게시물 조회수 증가
			int board_hit = 0;
	        interiorService.boardHitsUpdate(Integer.parseInt(cvo.getcomSeq()));
	/*        model.addAttribute("Board_Hit", board_hit);*/
	        
	        //게시물 좋아요 조회
	    /*    int likeCount = interiorService.selectLikes(Integer.parseInt(cvo.getcomSeq()));
	        model.addAttribute("likesCount" + likeCount);
	        System.out.println("해당 게시물 좋아요 총 갯수: " + likeCount);*/
	        
			return "inBoardDetail.jsp";
		}
	
		//게시물 입력 페이지
		@RequestMapping(value="/insertInteriorB.do", method=RequestMethod.POST)
		public String insertBoard(CommInteriorVO cvo) {
			System.out.println("전체목록: " + cvo);
			interiorService.insertBoard(cvo);
			
			System.out.println(">>> 글 등록 처리 - insertBoard(): " + cvo);
			return "interiorAllList.do";
		}

	//파일 업로드
	@RequestMapping(value="fileupload.do", method=RequestMethod.POST)
	   @ResponseBody
	   public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
	                MultipartHttpServletRequest multiFile) throws Exception {
	      JsonObject json = new JsonObject();
	      PrintWriter printWriter = null;
	      OutputStream out = null;
	      MultipartFile file = multiFile.getFile("upload");
	      if(file != null){
	         if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
	            if(file.getContentType().toLowerCase().startsWith("image/")){
	               try{
	                  String fileName = file.getName();
	                  byte[] bytes = file.getBytes();
	                  String uploadPath = req.getServletContext().getRealPath("/img");
	                  System.out.println(req.getServletContext().getRealPath("/img"));
	                  File uploadFile = new File(uploadPath);
	                  if(!uploadFile.exists()){
	                     uploadFile.mkdirs();
	                  }
	                  fileName = UUID.randomUUID().toString();
	                  uploadPath = uploadPath + "/" + fileName;
	                  out = new FileOutputStream(new File(uploadPath));
	                       out.write(bytes);
	                       
	                       printWriter = resp.getWriter();
	                       resp.setContentType("text/html");
	                       String fileUrl = req.getContextPath() + "/img/" + fileName;
	                       System.out.println(req.getContextPath() + "/img/" + fileName);
	                       
	                       json.addProperty("uploaded", 1);
	                       json.addProperty("fileName", fileName);
	                       json.addProperty("url", fileUrl);
	                       
	                       printWriter.println(json);
	                   }catch(IOException e){
	                       e.printStackTrace();
	                   }finally{
	                       if(out != null){
	                           out.close();
	                       }
	                       if(printWriter != null){
	                           printWriter.close();
	                       }      
	                       
	               }
	            }
	         }
	      }
	      return null;
	   }
	
	//게시물 수정 페이지
	@RequestMapping("/updateInterior.do")
	public String updateBoard(Model model, CommInteriorVO cvo) {		
        interiorService.updateBoard(cvo);
        System.out.println(">>> 게시물 수정 처리: " + cvo);

        return "getInterior.do";
    }
	
	//게시물 삭제 페이지
	@RequestMapping("/deleteArticle.do")
	public String deleteBoard(CommInteriorVO cvo) {
		System.out.println(">>> 글 삭제 처리 - deleteBoard()");
		interiorService.deleteBoard(cvo);
		return "interiorAllList.do";
	}
	
	//게시물 좋아요 증가
	@RequestMapping("/updateLike.do")
	@ResponseBody
	public void upLike(String comSeq, String id) {		
		System.out.println(">>> 좋아요 게시물 조회");
		
		Map<String,String> map = new HashMap<String, String>(); 
		map.put("comSeq", comSeq);
		map.put("id", id);
		System.out.println(map);
		
		//커뮤니티 like+1
		interiorService.upLike(comSeq);
		
	}
	
	//게시물 좋아요 취소
	/*@RequestMapping("/updateLike.do")
	public String downLikes(String comSeq) {
		interiorService.downLike(comSeq);
		System.out.println(">>> 글 좋아요 취소 처리");
		
		return "getInterior.do";
	}*/
	
	//댓글 입력
	@RequestMapping("/addComment.do")
	public String insertComment(CommReplyVO rvo) {
		System.out.println(">> 댓글 입력 실행");
		interiorService.insertComment(rvo);
		
		return "getInterior.do";
				
	}
	
	//댓글 수정
	@RequestMapping("/upComment.do")
	@ResponseBody
	public void updateComment(CommReplyVO rvo) {
		System.out.println(">> 댓글 수정 처리");
		interiorService.updateComment(rvo);
	}
}
