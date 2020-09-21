package com.honjok.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.honjok.app.vo.UserVO;



@Controller
public class UserController {

	
	
	@Autowired
	private UserMailSendService mailsender;
	@Autowired
	private UserService userService;


	//회원가입 컨트롤러
	@RequestMapping(value="/signUp.do", method=RequestMethod.POST)
	public String signUp(UserVO vo, @RequestParam("email1") String email1, @RequestParam("email2") String email2 
			, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = email1 +"@"+ email2;
		System.out.println("비밀번호 암호화 전 확인 : " + vo.getPassword());
		//비밀번호 암호화
		String encrypassword = UserSha256.encrypt(vo.getPassword());
		vo.setPassword(encrypassword);
		System.out.println("비밀번호 암호화  후 확인 : " + vo.getPassword());
		vo.setEmail(email);
		//회원가입
		userService.insertUser(vo);
		//이메일 보내기
		mailsender.mailSendWithUserKey(vo.getEmail(), vo.getId(), request);
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('계정이 등록 되었습니다, 이메일을 확인해주세요'); location.href='/app/main/getMainList.do';</script>");
		 
		out.flush();

		return "index.jsp";
		
	}
	
	//아이디 중복체크
	@RequestMapping(value = "/userIdCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("Id : "+ id);
		return userService.userIdCheck(id);
	}
	
	//이메일 중복 체크
	@RequestMapping(value = "/userEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		System.out.println("email");
		return userService.emailCheck(email);
	}
	//닉네임 중복 체크
	@RequestMapping(value = "/userNickCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int nickCheck(@RequestParam("nick") String nick) {
		System.out.println("nick");
		return userService.emailCheck(nick);
	}
	
	//핸드폰 중복체크
	@RequestMapping(value = "/userPhoneCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int phoneCheck(@RequestParam("phone") String phone) {
		System.out.println("nick");
		return userService.emailCheck(phone);
	}
	
	//이메일 인증 후 Key값 변경
	@RequestMapping(value = "/userKeyAlter.do", method = RequestMethod.GET)
	public String keyAlterConfirm(@RequestParam("userId") String userId, @RequestParam("userKey") String key) {

		mailsender.alterUserKeyService(userId, key); // mailsender의 경우 @Autowired

		return "EmailCheck.jsp";
	}
	
	//로그인 과정
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public int login(UserVO vo, HttpSession httpSession, HttpServletRequest request,
						HttpServletResponse response) {
		
		//아이디 기억하기 name값 가져오기
		String userCheck = request.getParameter("rememberUserId");
		//암호화 비밀번호 확인
		System.out.println(vo.getPassword());
		
		// 비밀번호 암호화
		String userPassword = vo.getPassword();
		vo.setPassword(UserSha256.encrypt(userPassword));
		
		//암호화확인 
		System.out.println("userPassword : " + vo.getPassword());
		
		int result = userService.userLoginService(vo, httpSession, userCheck, response);
		System.out.println(result);

		return result;
	}
	
	//로그아웃 과정
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) throws Exception{
		
		httpSession.invalidate();
		
		return "/main/getMainList.do";
	}
}