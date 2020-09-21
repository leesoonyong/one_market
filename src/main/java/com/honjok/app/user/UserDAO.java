package com.honjok.app.user;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.honjok.app.vo.UserVO;

@Repository("UserDAO")
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	
	public int userIdCheck(String Id) {
		int set = mybatis.selectOne("UserDAO.userIdCheck", Id);
		System.out.println("set : " + set);
		return set;
	}
	public int emailCheck(String email) {
			int set2 = mybatis.selectOne("UserDAO.emailCheck", email);
			System.out.println("set : " + set2);
			return set2;	
	}
	public int nickCheck(String nick) {
		int set3 = mybatis.selectOne("UserDAO.nickCheck", nick);
		System.out.println("set : " + set3);
		return set3;	
	}
	public int phoneCheck(String phone) {
		int set4 = mybatis.selectOne("UserDAO.phoneCheck", phone);
		System.out.println("set : " + set4);
		return set4;	
	}
	
	public int getkey(String userId, String userKey) {
		HashMap<String, String> Map = new HashMap<>();
		Map.put("userId", userId);
		Map.put("userKey", userKey);
		System.out.println(Map);
		return mybatis.update("UserDAO.getKey", Map);
	}
	
	public int alterUserKey(String userId, String userKey) {
		HashMap<String, String> Map = new HashMap<>();
		Map.put("userId", userId);
		Map.put("userKey", userKey);
		return mybatis.update("UserDAO.alterUserKey", Map);
	}
	
	public UserVO loginCheck(String userId) {
		UserVO vo = mybatis.selectOne("UserDAO.loginCheck", userId);
		System.out.println(" Vo : = " + vo);
		return vo;	
	}


	public int basketCount(String id) {
		int basketCount = mybatis.selectOne("UserDAO.basketCount",id);
		return basketCount;
	}
	
	
	
}
