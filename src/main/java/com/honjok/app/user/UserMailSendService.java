package com.honjok.app.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.UserVO;;


@Service("UserMailSendService")
public class UserMailSendService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private UserDAO UserDAO;
	
	private boolean lowerCheck;
	private int size;
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		
		do {
			num = ran.nextInt(75) + 48;
			if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) ||
					(num>= 97 && num <= 122)) {
				sb.append((char) num);
			}else {
				continue;
			}
		}while(sb.length() < size);
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	public void mailSendWithUserKey(String email, String userId, HttpServletRequest request) {
		String key = getKey(false,20);
		UserVO vo = new UserVO();
		vo.setUserKey(key);
		UserDAO.getkey(userId, key);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 [혼족]입니다</h2><br><br>" 
					   + "<h3>" + userId + "님</h3>" 
				       + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				       + "<a href='http://localhost:8080" + request.getContextPath() + 
				       "/userKeyAlter.do?userId="+ userId +"&userKey="+key+"'>인증하기</a></p>"
				       + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";	
		
		try {
			mail.setSubject("[본인인증] 혼족 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	public int alterUserKeyService(String userId, String userKey) {
		
		int resultCnt = 0;
		
		resultCnt = UserDAO.alterUserKey(userId,userKey);
		
		return resultCnt;
	}
	
	

}
