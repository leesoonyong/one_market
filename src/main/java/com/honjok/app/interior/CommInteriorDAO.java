package com.honjok.app.interior;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.LikesVO;
import com.honjok.app.vo.CommReplyVO;

@Repository("commDAOMybatis")
public class CommInteriorDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//전체 데이터 조회
	public List<CommInteriorVO> BoardAllList(Map<String, Integer> pagingMap) {
		System.out.println("===> MyBatis로 BoardAllList() 실행");
		List<CommInteriorVO> cvo = mybatis.selectList("commInteriorDAO.interiorAll", pagingMap);
		System.out.println("전체 목록조회: " + cvo.toString());
		return cvo;
	}
	
	//글 상세 조회
	public CommInteriorVO getInteriorOne(CommInteriorVO cvo) {
		System.out.println("===> MyBatis로 getInteriorOne() 실행");
		return mybatis.selectOne("commInteriorDAO.getInteriorOne", cvo);
	}
	
	//글 입력
	public void insertBoard(CommInteriorVO cvo) {
		System.out.println("===> MyBatis로 insertBoard() 실행");
		mybatis.insert("commInteriorDAO.insertComm", cvo);
	}
	
	//글 수정
	public void updateBoard(CommInteriorVO cvo) {
		System.out.println("===> MyBatis로 updateBoard() 실행");
		mybatis.update("commInteriorDAO.updateComm", cvo);
	}

	//글 삭제
	public void deleteBoard(CommInteriorVO cvo) {
		System.out.println("===> MyBatis로 deleteBoard() 실행");
		mybatis.delete("commInteriorDAO.deleteComm", cvo);
	}

	//게시물 전체 갯수
	public int selectCount() {
		System.out.println("===> MyBatis로 selectCount() 실행");
		return mybatis.selectOne("commInteriorDAO.selectAllCount");
	}

	//조회수 증가
	public void boardHitsUpdate(int comSeq) {
		System.out.println("===> MyBatis로 boardHitsUpdate() 실행");
		System.out.println("comSeq 조회 : " + comSeq);
		mybatis.update("commInteriorDAO.boardHitsUpdate", comSeq);
	}
	
	//좋아요 증가
	public void upLike(String comSeq) {
		System.out.println("===> MyBatis로 updateLikes() 실행");
		mybatis.update("commInteriorDAO.likesCheck", comSeq);
	}
	
	//좋아요 취소
	public void downLike(String comSeq) {
		System.out.println("===> MyBatis로 updateLikes() 실행");
		mybatis.update("commInteriorDAO.likesCancel", comSeq);
	}
	
	//해당 게시물 좋아요 갯수
	public int selectLikes(int comSeq) {
		System.out.println("===> MyBatis로 selectLikes() 실행");
		
		return mybatis.selectOne("commInteriorDAO.likesCount",comSeq);
	}

	//게시물 댓글 달기
	public void insertComment(CommReplyVO rvo) {
		System.out.println("===> MyBatis로 insertComment() 실행");
		mybatis.insert("commInteriorDAO.insertComment", rvo);
	}

	//게시물 댓글 조회
	public List<CommReplyVO> commentList(int comSeq) {
		System.out.println("===> MyBatis로 commentList() 실행");
		
		return mybatis.selectList("commInteriorDAO.allComment", comSeq);
	}

	//게시물 댓글 수정
	public void updateComment(CommReplyVO rvo) {
		System.out.println("===> MyBatis로 upadateComment() 실행");
		mybatis.update("commInteriorDAO.updateComment", rvo);
	}
	
	//댓글 전체 갯수
	public int reCount() {
		System.out.println("===> MyBatis로 selectCount() 실행");
		return mybatis.selectOne("commInteriorDAO.reAllCount");
	}
}
