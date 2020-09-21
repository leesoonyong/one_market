package com.honjok.app.user;

import com.honjok.app.vo.UserVO;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserDAO UserDAO;
	

	@Override
	public void insertUser(UserVO vo) {
		UserDAO.insertUser(vo);
		System.out.println("유저서비스 임플");
	}

	@Override
	public int userIdCheck(String Id) {
		int result =UserDAO.userIdCheck(Id);
		System.out.println(result);
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result2 = UserDAO.emailCheck(email); 
		return result2;
	}

	@Override
	public int nickCheck(String nick) {
		int result3 = UserDAO.nickCheck(nick); 
		return result3;
	}

	@Override
	public int phoneCheck(String phone) {
		int result4 = UserDAO.phoneCheck(phone); 
		return result4;
	}

	@Override
	public int userLoginService(UserVO vo, HttpSession httpSession, String userCheck,
								HttpServletResponse response) {
		System.out.println("로그인vo 값 확인" + vo);
		String userId = vo.getId();
		String userPassword = vo.getPassword();
		vo = UserDAO.loginCheck(userId);
		
		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + vo);
		
		int result = 0;
		//아이디/비밀번호 가 없을때
		if(vo == null) {
			result = 0;
			return result;
		}
		
		String y = "Y";
		
		//인증 안했을때
		if(!(vo.getUserKey().equals(y))) {
			result = -2;
			return result;
		}
		
		//로그인 했을때
		if(vo != null) {
			System.out.println("1단계");
			if(vo.getId().equals(userId) && vo.getPassword().equals(userPassword)) {
				
				System.out.println("2단계");
				
				Cookie cookie = new Cookie("userCheck", userId);
				
				if(userCheck.equals("true")) {
					response.addCookie(cookie);
					System.out.println("3단계 : 아이디 저장 O");
				}else {
					System.out.println("3단계 : 아이디 저장 X");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				
				System.out.println("3단계 : 로그인 단계");
				vo.setPassword("");

				
				
				httpSession.setAttribute("basketCount",UserDAO.basketCount(vo.getId()));
				
				httpSession.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 확인 userSession" + httpSession.getAttribute("userSession"));
				result = 1;

		}
			
	
	}
	
	return result;




	}
}
