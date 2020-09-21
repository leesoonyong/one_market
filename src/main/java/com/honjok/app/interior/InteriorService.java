package com.honjok.app.interior;

import java.util.List;
import java.util.Map;

import com.honjok.app.vo.CommInteriorVO;
import com.honjok.app.vo.CommunityVO;
import com.honjok.app.vo.LikesVO;
import com.honjok.app.vo.CommReplyVO;

public interface InteriorService {
	//게시물
	List<CommInteriorVO> BoardAllList(Map<String, Integer> pagingMap);
	CommInteriorVO getBoardList(CommInteriorVO cvo);
	public void insertBoard(CommInteriorVO cvo);
	public void updateBoard(CommInteriorVO cvo);
	public void deleteBoard(CommInteriorVO cvo);
	
	//게시물 페이징, 조회수
	public int selectAllCount();
	public void boardHitsUpdate(int comSeq);
	
	//게시물 좋아요
	void upLike(String comSeq);
	void downLike(String comSeq);
	/*public int selectLikes(int comSeq);*/
	
	//게시물 댓글
	public void insertComment(CommReplyVO rvo);
	List<CommReplyVO> commentList(int comSeq);
	void updateComment(CommReplyVO rvo);
	public int reAllCount();
}
