package com.honjok.app.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.honjok.app.vo.Paging;
import com.honjok.app.vo.ProductQnaVO;
import com.honjok.app.vo.ProductReviewPagingVO;
import com.honjok.app.vo.ProductReviewVO;
import com.honjok.app.vo.ProductVO;

@Controller
@RequestMapping(value = "/Product")
public class ProductController {

	@Autowired
	ProductService service;

	private static String CURR_IMAGE_REPO_PATH = "";
	
	@RequestMapping("/ProductList.do")
	public String ProductList(Model model,String cPage, String searchFiled,String topSearchKeyword){
		System.out.println(cPage);
		System.out.println("searchFiled : "+searchFiled);
		System.out.println("topSearchKeyword : "+topSearchKeyword);
		
		
		if(topSearchKeyword == null) {
		System.out.println("topSearchKeyword 없음");
		//리뷰 페이징 객체 생성
		Paging p  = new Paging();
		p.setNumPerPage(4);

		
		//1. 전체 게시물의 수 구하기 totalRecord 작성한 총 게시물
		p.setTotalRecord(service.ProductListCount());
		System.out.println("전체개시글수 : " + p.getTotalRecord());
		//계산 전체 페이지 토탈 레코드에서 페이지장 표시할 개수 값 나누고 나머니 존재 할씨 1증가 
		
		//전체 게시물수 33 / numperpage 5;setTotalRecord
		p.setTotalPage(); // 6.6
		System.out.println("전체페이지수  : " + p.getTotalPage());
		
		//2.현재 페이지 구하거(default : 1) 현재페이지 9
		if(cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기 
		//현재 페이지  	   9                표시할 페이지 수 5
		p.setEnd(p.getNowPage() * p.getNumPerPage()); // 45
		p.setBegin(p.getEnd() - p.getNumPerPage()+1);  //45 - 5 + 1 = 41
		

		System.out.println("시작번호begin : " + p.getBegin());
		System.out.println("끝번호 end : " + p.getEnd());
		
		
		
		//블록 계산하기(block) 계산하기 
		//4. 블록의 시작 페이지, 끝페이지 구하기 (현재페이 사용) 9
		System.out.println("현재페이지"+p.getNowPage());
		
		int nowPage = p.getNowPage();
		//  블록당 표시 계수 	
		
		//현재 블록 시작 페이지 (9 - 1) /  10 * 10 +1  
		int beginPage = (nowPage - 1) / p.getPagePerBlock() *  p.getPagePerBlock() +1; //9
		
		//현재블록의 시작 페이지 번호  //9 
		p.setBeginPage(beginPage);
		System.out.println("비긴페이지"+p.getBeginPage());
		
		// 현재블록 끝번호   현재 블록의 사작 페이지 9  +   10-1  블록당 표시하는 갯수  
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1); //18
		
		//4-1 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		//   18 보다         >        전체 페이지 갯수 6.6
		if(p.getEndPage() > p.getTotalPage()) {
			//6.6
			p.setEndPage(p.getTotalPage());
			
		}
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		System.out.println(p);
		
		List<ProductVO> productList = service.ProductList(map);
		System.out.println(productList);
		
		
		model.addAttribute("p",p);
		model.addAttribute("productList",productList);
		
		}else {
			
			 System.out.println("topSearchKeyword 있음");
			//리뷰 페이징 객체 생성
			Paging p  = new Paging();
			p.setNumPerPage(4);

			
			//1. 전체 게시물의 수 구하기 totalRecord 작성한 총 게시물
			p.setTotalRecord(service.ProductListSerchCount(topSearchKeyword));
			System.out.println("전체개시글수 : " + p.getTotalRecord());
			//계산 전체 페이지 토탈 레코드에서 페이지장 표시할 개수 값 나누고 나머니 존재 할씨 1증가 
			
			//전체 게시물수 33 / numperpage 5;setTotalRecord
			p.setTotalPage(); // 6.6
			System.out.println("전체페이지수  : " + p.getTotalPage());
			
			//2.현재 페이지 구하거(default : 1) 현재페이지 9
			if(cPage != null) {
				p.setNowPage(Integer.parseInt(cPage));
			}
			
			//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기 
			//현재 페이지  	   9                표시할 페이지 수 5
			p.setEnd(p.getNowPage() * p.getNumPerPage()); // 45
			p.setBegin(p.getEnd() - p.getNumPerPage()+1);  //45 - 5 + 1 = 41
			

			System.out.println("시작번호begin : " + p.getBegin());
			System.out.println("끝번호 end : " + p.getEnd());
			
			
			
			//블록 계산하기(block) 계산하기 
			//4. 블록의 시작 페이지, 끝페이지 구하기 (현재페이 사용) 9
			System.out.println("현재페이지"+p.getNowPage());
			
			int nowPage = p.getNowPage();
			//  블록당 표시 계수 	
			
			//현재 블록 시작 페이지 (9 - 1) /  10 * 10 +1  
			int beginPage = (nowPage - 1) / p.getPagePerBlock() *  p.getPagePerBlock() +1; //9
			
			//현재블록의 시작 페이지 번호  //9 
			p.setBeginPage(beginPage);
			System.out.println("비긴페이지"+p.getBeginPage());
			
			// 현재블록 끝번호   현재 블록의 사작 페이지 9  +   10-1  블록당 표시하는 갯수  
			p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1); //18
			
			//4-1 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			//   18 보다         >        전체 페이지 갯수 6.6
			if(p.getEndPage() > p.getTotalPage()) {
				//6.6
				p.setEndPage(p.getTotalPage());
				
			}
			
			Map<String,Object> map = new HashMap<>();
			
			map.put("begin", p.getBegin());
			map.put("end", p.getEnd());
			map.put("topSearchKeyword",topSearchKeyword);
			System.out.println(p);
			
			List<ProductVO> productList = service.ProductList(map);
			System.out.println(productList);
			
			model.addAttribute("topSearchKeyword",topSearchKeyword);
			model.addAttribute("p",p);
			model.addAttribute("productList",productList);
		}
		
	

		return "/Product/productList.jsp";
	}

	
	@RequestMapping("/Product.do")
	public String ProductVO(String pNum, Model model) {

		System.out.println(pNum);
		ProductVO productvo = service.ProductVO(pNum);
		
		productvo.setProductreviewvo(service.ProductreviewVOList(pNum));

				
		productvo.setProductqnavo(service.productqnavoList(pNum));
		
		System.out.println("리뷰" + productvo.getProductqnavo());
		
		System.out.println(productvo);

		System.out.println(productvo.getProductreviewvo());
		
		
		
				//리뷰 페이징 객체 생성
				ProductReviewPagingVO p  = new ProductReviewPagingVO();
				
				
				//1. 전체 게시물의 수 구하기 totalRecord 작성한 총 게시물
				p.setTotalRecord(service.getTotalCount(pNum));
				System.out.println("전체개시글수 : " + p.getTotalRecord());
				//계산 전체 페이지 토탈 레코드에서 페이지장 표시할 개수 값 나누고 나머니 존재 할씨 1증가 
				
				//전체 게시물수 33 / numperpage 5;
				p.setTotalPage(); // 6.6
				System.out.println("전체페이지수  : " + p.getTotalPage());
				
				//블록 계산하기(block) 계산하기 
				//4. 블록의 시작 페이지, 끝페이지 구하기 (현재페이 사용) 9
				int nowPage = p.getNowPage();
				//  블록당 표시 계수 	
				
				//현재 블록 시작 페이지 (1 - 1) /  10 * 10 +1  
				int beginPage = (nowPage-1) / p.getPagePerBlock() *  p.getPagePerBlock() +1; //9
				
				//현재블록의 시작 페이지 번호  // 1 
				p.setBeginPage(beginPage);
				
				// 현재블록 끝번호   현재 블록의 사작 페이지 1  +   10-1  블록당 표시하는 갯수  
				p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1); //10
				
				//4-1 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
				//   10 보다         >        전체 페이지 갯수 6.6
				if(p.getEndPage() > p.getTotalPage()) {
					//6.6
					p.setEndPage(p.getTotalPage());
					
				}
				
				
				//qna 리뷰 페이징 
				ProductReviewPagingVO p1  = new ProductReviewPagingVO();
				p1.setNumPerPage(10);
				
				//전체 게시물의 수 구하기  totalRecod 작성한 총 게시물
				p1.setTotalRecord(service.getQnaTotalCount(pNum));
				
				//전체 계시물 10 / 10
				p1.setTotalPage();
				
				
				int nowPage1 = p1.getNowPage();
				int beginPage1 = (nowPage1-1) / p1.getPagePerBlock() * p1.getPagePerBlock() +1;
				
				p1.setBeginPage(beginPage1);
				
				p1.setEndPage(p1.getBeginPage() + p1.getPagePerBlock() -1);
				
				if(p1.getEndPage() > p1.getTotalPage()) {
					p1.setEndPage(p1.getTotalPage());
				}
				
				
		System.out.println(p1);
		model.addAttribute("p1",p1);
	    model.addAttribute("p",p);
		model.addAttribute("productvo", productvo);
		
		
		
		
		
		
		

		return "/Product/productDetail.jsp";

	}

	/* , */
	@RequestMapping("/Review.do")
	@ResponseBody
	public void Review(ProductReviewVO productreviewvo, MultipartHttpServletRequest multiFile, String imgArray)
			throws IllegalStateException, IOException {

		String[] imgs = imgArray.split(",");

		System.out.println(productreviewvo);

		CURR_IMAGE_REPO_PATH = "C:/Users/bitcamp/Documents/GitHub/honjok/src/main/webapp/resources/img/review";

		List<MultipartFile> fileList = multiFile.getFiles("file");
		System.out.println("fileList " + fileList);
		int i = 0;
		for (MultipartFile mf : fileList) {
			
			String OriginalFilename = mf.getOriginalFilename();
			  String FileExtension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));

			System.out.println("OriginalFilename " + OriginalFilename);

			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + OriginalFilename);
			if (mf.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
			}
			
			mf.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + OriginalFilename));

			for (String img : imgs) {
				System.out.println(img);
				System.out.println(OriginalFilename);
				if (img.equals(OriginalFilename)) {
					System.out.println("for 실행됨");
					String path = "C:/Users/bitcamp/Documents/GitHub/honjok/src/main/webapp/resources/img/review/"+OriginalFilename;
					file = new File(path);
					System.out.println(path);
					if(file.exists()) {
						file.delete();
						System.out.println("삭제됨");
					}

				} 

			}
			
			
		// 첨부된파일 체크 및 경로에 파일이 없으면 그경로에 해당 하는 디랙토리 만듬

				// 파일 이름 변겅
				file = new File(CURR_IMAGE_REPO_PATH + "\\" + OriginalFilename);
				 if(file.exists()){
					 OriginalFilename = UUID.randomUUID().toString()+FileExtension;
					 file.renameTo(new File(CURR_IMAGE_REPO_PATH + "\\" + OriginalFilename));
					 
						if (i == 0) {
							productreviewvo.setPhotoImage1(OriginalFilename);
						
						} else {
							productreviewvo.setPhotoImage2(OriginalFilename);
						}
						i++;
				 }
		

					System.out.println(productreviewvo);
	

		}
		
			service.insertReview(productreviewvo);
	}



	@RequestMapping("ProductReview.do")
	@ResponseBody
	public Map<String,Object> ProductReview(String cPage, String pNum) {
		System.out.println(cPage);
		System.out.println(pNum);
		
		//리뷰 페이징 
		ProductReviewPagingVO p  = new ProductReviewPagingVO();
		//Onq 페이징 
		ProductReviewPagingVO p1  = new ProductReviewPagingVO();
		
		
		//1. 전체 게시물의 수 구하기 totalRecord 작성한 총 게시물
		p.setTotalRecord(service.getTotalCount(pNum));
		System.out.println("전체개시글수 : " + p.getTotalRecord());
		//계산 전체 페이지 토탈 레코드에서 페이지장 표시할 개수 값 나누고 나머니 존재 할씨 1증가 
		
		//전체 게시물수 33 / numperpage 5;setTotalRecord
		p.setTotalPage(); // 6.6
		System.out.println("전체페이지수  : " + p.getTotalPage());
		
		//2.현재 페이지 구하거(default : 1) 현재페이지 9
		if(cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기 
		//현재 페이지  	   9                표시할 페이지 수 5
		p.setEnd(p.getNowPage() * p.getNumPerPage()); // 45
		p.setBegin(p.getEnd() - p.getNumPerPage()+1);  //45 - 5 + 1 = 41
		

		System.out.println("시작번호begin : " + p.getBegin());
		System.out.println("끝번호 end : " + p.getEnd());
		
		
		
		//블록 계산하기(block) 계산하기 
		//4. 블록의 시작 페이지, 끝페이지 구하기 (현재페이 사용) 9
		System.out.println("현재페이지"+p.getNowPage());
		
		int nowPage = p.getNowPage();
		//  블록당 표시 계수 	
		
		//현재 블록 시작 페이지 (9 - 1) /  10 * 10 +1  
		int beginPage = (nowPage - 1) / p.getPagePerBlock() *  p.getPagePerBlock() +1; //9
		
		//현재블록의 시작 페이지 번호  //9 
		p.setBeginPage(beginPage);
		System.out.println("비긴페이지"+p.getBeginPage());
		
		// 현재블록 끝번호   현재 블록의 사작 페이지 9  +   10-1  블록당 표시하는 갯수  
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1); //18
		
		//4-1 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		//   18 보다         >        전체 페이지 갯수 6.6
		if(p.getEndPage() > p.getTotalPage()) {
			//6.6
			p.setEndPage(p.getTotalPage());
			
		}
		
		Map<String,Integer> map = new HashMap<>();
		
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("pNum", Integer.parseInt(pNum));
		
		
		//리뷰
		List<ProductReviewVO> productreviewvo = service.getreviewList(map);
		
		
		System.out.println(productreviewvo);
		Map<String,Object> review = new HashMap<>();
		
		
		review.put("productreviewvo",productreviewvo);
		review.put("p",p);
		
		return review;

		
	}
	
	//문의글 등록
	@RequestMapping("inserQnaReview.do")
	@ResponseBody
	public String inserQnaReview(ProductQnaVO productqnavo) {
			
		
		
		System.out.println(productqnavo);
		
		service.inserQnaReview(productqnavo);

		
		return "su";
	}
	
	//문의글 페이징
	@RequestMapping("ProductQna.do")
	@ResponseBody
	public Map<String,Object> ProductQna(String cPage, String pNum) {
		System.out.println(cPage);
		System.out.println(pNum);
		
		//리뷰 페이징 
		ProductReviewPagingVO p  = new ProductReviewPagingVO();
		p.setNumPerPage(10);
		
		
		//1. 전체 게시물의 수 구하기 totalRecord 작성한 총 게시물
		p.setTotalRecord(service.getQnaTotalCount(pNum));
		System.out.println("전체개시글수 : " + p.getTotalRecord());
		//계산 전체 페이지 토탈 레코드에서 페이지장 표시할 개수 값 나누고 나머니 존재 할씨 1증가 
		
		//전체 게시물수 33 / numperpage 5;
		p.setTotalPage(); // 6.6
		System.out.println("전체페이지수  : " + p.getTotalPage());
		
		//2.현재 페이지 구하거(default : 1) 현재페이지 9
		if(cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기 
		//현재 페이지  	   9                표시할 페이지 수 5
		p.setEnd(p.getNowPage() * p.getNumPerPage()); // 45
		p.setBegin(p.getEnd() - p.getNumPerPage()+1);  //45 - 5 + 1 = 41
		

		System.out.println("시작번호begin : " + p.getBegin());
		System.out.println("끝번호 end : " + p.getEnd());
		
		
		
		//블록 계산하기(block) 계산하기 
		//4. 블록의 시작 페이지, 끝페이지 구하기 (현재페이 사용) 9
		System.out.println("현재페이지"+p.getNowPage());
		
		int nowPage = p.getNowPage();
		//  블록당 표시 계수 	
		
		//현재 블록 시작 페이지 (9 - 1) /  10 * 10 +1  
		int beginPage = (nowPage - 1) / p.getPagePerBlock() *  p.getPagePerBlock() +1; //9
		
		//현재블록의 시작 페이지 번호  //9 
		p.setBeginPage(beginPage);
		System.out.println("비긴페이지"+p.getBeginPage());
		
		// 현재블록 끝번호   현재 블록의 사작 페이지 9  +   10-1  블록당 표시하는 갯수  
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1); //18
		
		//4-1 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		//   18 보다         >        전체 페이지 갯수 6.6
		if(p.getEndPage() > p.getTotalPage()) {
			//6.6
			p.setEndPage(p.getTotalPage());
			
		}
		
		Map<String,Integer> map = new HashMap<>();
		
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		map.put("pNum", Integer.parseInt(pNum));
		
		
		//리뷰
		List<ProductQnaVO> productQnaList = service.ProductQna(map);
		
		
		System.out.println(productQnaList);
		Map<String,Object> productQna = new HashMap<>();
		
		
		productQna.put("productQnaList",productQnaList);
		productQna.put("p",p);
		
		
		return productQna;

		
	}
	
	
	
	
	
	
	
	
}
