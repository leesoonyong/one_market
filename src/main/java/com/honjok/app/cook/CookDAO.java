package com.honjok.app.cook;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.CookVO;

@Repository("CookDAO")
public class CookDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//mybatis.insert
	public void insertCook(CookVO ckvo) {
		System.out.println("Cook DB에 자료넣기 전");
		mybatis.insert("cookMapper.insertCook", ckvo);
		System.out.println("Cook DB에 자료넣기 후");
	}
	//페이징 처리를위한 게시물 개수 카운트
	public int selectAllCount() {
		return mybatis.selectOne("cookMapper.selectAllCount");
	}
	
	//전체조회
	public List<CookVO> selectAll(Map<String, Integer> pagingMap) {
		
		System.out.println("selectAll 전체조회");
		List<CookVO> list = mybatis.selectList("cookMapper.selectAll", pagingMap);
		
		System.out.println(list);
		return list;
	}
	//게시물 한개 조회
	public CookVO select(CookVO cvo) {
		System.out.println("select 한 건");
		System.out.println(cvo);
		return mybatis.selectOne("cookMapper.selectOne", cvo);
	
	}
	public void delete(String comSeq) {
		System.out.println("delete 실행");
		mybatis.delete("cookMapper.delete",comSeq);
		
		
	}

	public void update(CookVO cvo) {
		System.out.println("update");
		mybatis.update("cookMapper.update",cvo);
		
	}
	//조회수 증가
	public void boardHitsUpdate(int comSeq) {
		mybatis.update("cookMapper.boardHitsUpdate", comSeq);
	}
}
