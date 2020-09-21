package com.honjok.app.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.CookVO;
import com.honjok.app.vo.Qna;



@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaMapper qnamapper;

	@Override
	public void insertQna(Qna qna) {
		qnamapper.insertQna(qna);
	}
	
	@Override
	public void delete(String comSeq) {
		// TODO Auto-generated method stub
		qnamapper.delete(comSeq);
	}

	@Override
	public Qna getBoardList(Qna qna) {
		return null;
	}

	@Override
	public int selectAllCount() {
		return qnamapper.selectAllCount();
	}

	@Override
	public void update(Qna qna) {
		qnamapper.update(qna);
	}
	
	@Override
	public Qna selectOne(Qna qna) {
		return qnamapper.select(qna);
	}
	
	@Override
	public List<Qna> QnaAll(Map<String, Integer> paramMap) {
		List<Qna> list = qnamapper.selectAll(paramMap);
		return list;
	}
	
	@Override
	public List<Qna> selectInfo(Map<String, Integer> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Qna select(String comSeq) {
		return null;
	}

	@Override
	public void boardHitsUpdate(int comSeq) {
		qnamapper.boardHitsUpdate(comSeq);
		
	}

	



	
	

	
}
