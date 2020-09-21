package com.honjok.app.info;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.CommInfoVO;
import com.honjok.app.vo.CommunityVO;
import com.honjok.app.vo.UploadVO;
import com.honjok.app.vo.CommReplyVO;
import com.honjok.app.vo.ReplyUploadVO;

@Repository("HonjokInfoDAO")
public class HonjokInfoDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	//글등록 
	public void insertCommInfoVO(CommInfoVO comI) {
		mybatis.insert("honjokInfoMapper.insert", comI);
	}
	
	//메뉴 파일 업로드 
	public void insertFileUpload(UploadVO uploadvo) {
		mybatis.insert("honjokInfoMapper.menuUplodat",uploadvo);
	}	
	
	
	//리뷰글 등록
		public void insertReview(CommReplyVO commreplyvo) {
			System.out.println(commreplyvo);
			mybatis.insert("honjokInfoMapper.insertReview", commreplyvo);
		}

	//리뷰 이미지등록
		public void insertReviewImage(ReplyUploadVO replyuploadvo) {
			System.out.println("insertReviewImage까지 실행");
			mybatis.insert("honjokInfoMapper.insertReviewImage" , replyuploadvo);
			
		}
		
	
		
		//inset끝
	
	
	public List<CommunityVO> selectAll(Map<String, Integer> pagingMap) {

		System.out.println("selectAll 실행");
		List<CommunityVO> list = mybatis.selectList("honjokInfoMapper.selectAll", pagingMap);

		return list;

	}
	

	public List<CommInfoVO> selectInfo(Map<String, Integer> pagingMap) {
		List<CommInfoVO> list = mybatis.selectList("honjokInfoMapper.selectCommInfoVO",pagingMap);
		return list;
	}
	
	public List<UploadVO[]> getFileName(String comSeq) {
		return mybatis.selectList("honjokInfoMapper.getFileName",comSeq);
	}
	
	

	public int selectAllCount() {
		return mybatis.selectOne("honjokInfoMapper.selectAllCount");
	}

	public CommInfoVO select(String comSeq) {

		System.out.println("select실행" + comSeq);
		CommInfoVO CommInfoVO = mybatis.selectOne("honjokInfoMapper.select", comSeq);
		System.out.println(CommInfoVO);
		return CommInfoVO;

	}
	
	//리뷰 조회
	public List<CommReplyVO> getReview(String comSeq) {
		List<CommReplyVO> getReview = mybatis.selectList("honjokInfoMapper.getReview", comSeq);
		return getReview;
	}

	
	//리뷰이미지 조회
		public List<ReplyUploadVO> getReviewImg(String idx) {
			
			List<ReplyUploadVO>  getReviewImg = mybatis.selectList("honjokInfoMapper.getReviewImg", idx);
			
			System.out.println("뭐지"+getReviewImg);
			return getReviewImg;
		}
	
	
	//select 끝
	


	
	
	
	
	

	

	//좋아요 업데이트 
	//update
	public void uptate(CommInfoVO comI) {
		System.out.println("uptate");
		mybatis.update("honjokInfoMapper.uptate", comI);

	}
			public void insertLikesUP(String comSeq) {
				System.out.println("좋아요 업데이트 Mapper");
				mybatis.update("honjokInfoMapper.likesUp", comSeq);
				
			}

			public void inserLikesId(Map<String, String> map) {
				mybatis.insert("honjokInfoMapper.inserLikesId",map);
			}
			
			public void updateLikesDown(String comSeq) {
				mybatis.update("honjokInfoMapper.updateLikesDown",comSeq);
			}
			
			
			public void updateReview(Map<String, String> map) {
				mybatis.update("honjokInfoMapper.updateReview",map);
			}


			
	//update 끝
			
	//delete 시작
			//리뷰 업로드 파일 삭제
			public void delReviewUpload(String fileName) {
				mybatis.delete("honjokInfoMapper.delReviewUpload",fileName);
			}

			public void delete(String comSeq) {
				
				System.out.println("delete 실행");
				mybatis.delete("honjokInfoMapper.delete", comSeq);

			}

			public List<CommunityVO> selectBest5() {
				System.out.println("베스트게시물 5개 조회");
				List<CommunityVO> selectBest5 =mybatis.selectList("honjokInfoMapper.selectBest5");
				return selectBest5;
			}

			public void hitUpdate(String comSeq) {
				mybatis.update("honjokInfoMapper.hitUpdate",comSeq);
			}

			public List<CommunityVO> selectSearch(Map<String, Object> pagingMap) {
				System.out.println("ss"+pagingMap.get("searchFiled"));
				return mybatis.selectList("honjokInfoMapper.selectSearch",pagingMap);
			}

			public int selectAllCount(Map<String, Object> pagingMap) {
				return mybatis.selectOne("honjokInfoMapper.selectAllCountSerach",pagingMap);
			}

			
	//delete 끝





	



}