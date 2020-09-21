package com.honjok.app.info;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommunityVO;
import com.honjok.app.vo.UploadVO;
import com.honjok.app.vo.CommReplyVO;
import com.honjok.app.vo.ReplyUploadVO;



@Service("honjokinfoService")
public class HonjokinfoServiceImpl implements HonjokinfoService {

   @Autowired
   private HonjokInfoDAO Mapper;

   
   //댓글 insert
   @Override
	public void insertReview(CommReplyVO commreplyvo) {
		Mapper.insertReview(commreplyvo);
	}
   
   
   //댓글 이미지 업로드
	@Override
	public void reviewUpload(ReplyUploadVO replyuploadvo) {
		System.out.println("reviewUpload 실행");
		Mapper.insertReviewImage(replyuploadvo);
	}

   
   //글 등록
	@Override
	public void insertCommInfoVO(CommInfoVO comI) {
		   System.out.println(comI);
		      System.out.println("implement  전");
		      Mapper.insertCommInfoVO(comI);
		      System.out.println("implement  후");
		
	}
	
	
	//메뉴 파일 insert
	@Override
	public void FileUpload(UploadVO uploadvo) {
		System.out.println(uploadvo);
		Mapper.insertFileUpload(uploadvo);
	}

	
	//좋아요 ID저장
	@Override
	public void inserLikesId(Map<String, String> map) {
		Mapper.inserLikesId(map);
		
	}

	//insert끝
	
	//select시작

	//페이징 처리 갯수 selectAll
	@Override
	public List<CommunityVO> selectAll(Map<String, Integer> pagingMap) {
		
		 List<CommunityVO> list = Mapper.selectAll(pagingMap);
		return list;
	}
	
	
	//페이징처리 개숫 select
	@Override
	public List<CommInfoVO> selectInfo(Map<String, Integer> pagingMap) {
		List<CommInfoVO> list = Mapper.selectInfo(pagingMap);
		return list;
	}
	
	//페이징 처리 위한 총 갯수 
	@Override
	public int selectAllCount() {
		
		return Mapper.selectAllCount();
	}
	
	// 메뉴 사진 select
	@Override
	public List<UploadVO[]> getFileName(String comSeq) {
			
		return Mapper.getFileName(comSeq);
	}



	//info테이블 조회
	@Override
	public CommInfoVO select(String comSeq) {
		
		CommInfoVO CommInfoVO = Mapper.select(comSeq);
		return CommInfoVO;
	}
	
	//리뷰데이터 조회
	@Override
	public List<CommReplyVO> getReview(String comSeq) {
			List<CommReplyVO> getReview = Mapper.getReview(comSeq);
		return getReview;
	}
	
	//리뷰 이미지 조회 
	@Override
	public List<ReplyUploadVO> getReviewImg(String idx) {

		List<ReplyUploadVO> getReviewImt = Mapper.getReviewImg(idx);
			
		return getReviewImt;
	}
	
	//베스트 5 조회
	@Override
	public List<CommunityVO> selectBest5() {
		 List<CommunityVO> selectBest5 = Mapper.selectBest5();
		 
		return selectBest5;
	}



	
	//select 끝
	
	
	//update 시작
	
	// community 업데이트 
	@Override
	public void uptate(CommInfoVO comI) {
		Mapper.uptate(comI);
		
	}

	//likes업데이트
	@Override
	public void inserLikesUp(String comSeq) {
		Mapper.insertLikesUP(comSeq);
		
	}
	
	
	@Override
	public void updateLikesDown(String comSeq) {
		Mapper.updateLikesDown(comSeq);
	}
	
	@Override
	public void updateReview(Map<String, String> map) {
		Mapper.updateReview(map);
	}
	
	//update 끝
	
	
	

	// community 삭제
		@Override
		public void delete(String comSeq) {
			Mapper.delete(comSeq);
		}

		//리뷰 업로드 삭제 
		@Override
		public void delReviewUpload(String fileName) {
			Mapper.delReviewUpload(fileName);
		}

		//조회수 업데이트
		@Override
		public void hitUpdate(String comSeq) {
			Mapper.hitUpdate(comSeq);
		}


		@Override
		public List<CommunityVO> selectSearch(Map<String, Object> pagingMap) {
			 List<CommunityVO> list = Mapper.selectSearch(pagingMap);
				return list;
		}


		@Override
		public int selectAllCount(Map<String, Object> pagingMap) {
			
			return Mapper.selectAllCount(pagingMap);
		}


		

	

	

	
		




	








	












	

	



	


   
   
}