package com.honjok.app.user;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honjok.app.vo.UserVO;

public interface UserService {
 void insertUser(UserVO vo);
 int userIdCheck(String Id);
 int emailCheck(String email);
 int nickCheck(String nick);
 int phoneCheck(String phone);
 int userLoginService(UserVO vo, HttpSession httpSession, String userCheck, HttpServletResponse response);
 
}
