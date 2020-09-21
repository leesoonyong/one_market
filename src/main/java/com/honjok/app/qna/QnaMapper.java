package com.honjok.app.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.Qna;


@Repository("qnamapper")
public class QnaMapper {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//마이바티스 인서트
	public void insertQna(Qna board) {
		System.out.println("qna insert 전");
		mybatis.insert("qnaMapper.insertQna", board);
		System.out.println("qna insert 후");
	}
	//게시물 개수 카운트
	public int selectAllCount() {
		return mybatis.selectOne("qnaMapper.selectAllCount");
	}
	//전체조회
	public List<Qna> selectAll(Map<String, Integer> paramMap){
		List<Qna> list = mybatis.selectList("qnaMapper.selectAll", paramMap);
		return list;
	}
	//한개 조회
	public Qna select(Qna qna) {
		return mybatis.selectOne("qnaMapper.selectOne", qna);
	}
	
	public void update(Qna qna) {
		mybatis.update("qnaMapper.update", qna);
	}
	
	public void delete(String comSeq) {
		mybatis.delete("qnaMapper.delete",comSeq);
	}
	
	public void boardHitsUpdate(int comSeq) {
		mybatis.update("qnaMapper.boardHitsUpdate", comSeq);
	}

}
