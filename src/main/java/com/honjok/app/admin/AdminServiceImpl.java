package com.honjok.app.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.AdminVO;
import com.honjok.app.vo.ReplyUploadVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	

	@Autowired
	private AdminDAO adminDAO;
	

	@Override
	public void insertProduct(AdminVO vo) {
		System.out.println("vo :" + vo);
		adminDAO.insertProduct(vo);
	}

	

}
