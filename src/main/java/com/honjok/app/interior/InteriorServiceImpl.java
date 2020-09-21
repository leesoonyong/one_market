package com.honjok.app.interior;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.LikesVO;
import com.honjok.app.vo.CommReplyVO;

@Service("InteriorService")
public class InteriorServiceImpl implements InteriorService {

	@Autowired
	private CommInteriorDAO commDAO;
	
	//게시물 전체조회
	@Override
	public List<CommInteriorVO> BoardAllList(Map<String, Integer> pagingMap) {
		return commDAO.BoardAllList(pagingMap);
	}

	//게시물 상세조회
	@Override
	public CommInteriorVO getBoardList(CommInteriorVO cvo) {
		return commDAO.getInteriorOne(cvo);
	}
	
	//글입력
	public void insertBoard(CommInteriorVO cvo) {
		commDAO.insertBoard(cvo);
	}
	
	//글수정
	public void updateBoard(CommInteriorVO cvo) {
		commDAO.updateBoard(cvo);
	}

	//글삭제
	@Override
	public void deleteBoard(CommInteriorVO cvo) {
		commDAO.deleteBoard(cvo);
	}

	//페이징 전체갯수
	@Override
	public int selectAllCount() {
		return commDAO.selectCount();
	}
	
	//조회수 증가
	public void boardHitsUpdate(int comSeq) {
		commDAO.boardHitsUpdate(comSeq);
	}
	
	//좋아요 증가
	@Override
	public void upLike(String comSeq) {
		commDAO.upLike(comSeq);
	}
	
	
	//좋아요 취소
	public void downLike(String comSeq) {
		commDAO.downLike(comSeq);
	}
	
	//해당 게시물 좋아요 갯수
	public int selectLikes(int comSeq) {
		return commDAO.selectLikes(comSeq);
	}

	//게시물 댓글 달기
	@Override
	public void insertComment(CommReplyVO rvo) {
		commDAO.insertComment(rvo);
	}

	//게시물 댓글 목록
	@Override
	public List<CommReplyVO> commentList(int comSeq) {
		return commDAO.commentList(comSeq);
	}

	//게시물 댓글 수정
	@Override
	public void updateComment(CommReplyVO rvo) {
		commDAO.updateComment(rvo);
	}

	//게시물 댓글 삭제
	@Override
	public int reAllCount() {
		return commDAO.selectCount();
	}
}
