package com.honjok.app.qna;

import java.util.List;
import java.util.Map;
import com.honjok.app.vo.Qna;

public interface QnaService {
	
	public void insertQna(Qna qna)  ;
	public List<Qna> QnaAll(Map<String, Integer> paramMap);
	public List<Qna> selectInfo(Map<String, Integer> paramMap);
	
	public Qna getBoardList(Qna qna);
	
	public Qna select(String comSeq);
	public Qna selectOne(Qna qna);
	
	public void delete(String comSeq);
	public void update(Qna qna)  ;
	
	public int selectAllCount();
	void boardHitsUpdate(int comSeq);
	
	
	


}
