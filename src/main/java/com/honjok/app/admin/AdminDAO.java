package com.honjok.app.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.AdminVO;
import com.honjok.app.vo.ReplyUploadVO;

@Repository("AdminDAO")
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertProduct(AdminVO vo) {
		mybatis.insert("adminDAO.insertProduct", vo);
	}
	
}
