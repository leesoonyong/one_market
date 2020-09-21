package com.honkok.app.util;
/**
 * 쿠키처리를 쉽게하기위한 유틸리티
 *  
 * @author ssam
 * 
 */

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	
	// 요청한 쿠키정보를 맵에 저장하기위한 변수
	// 동일한 이름의 쿠키가 있다면 ???? 
	Map<String, Cookie> cookieMap = new HashMap<>();
	
	// 해당 사용자의 request 에서 쿠키정보를 cookieMap에 담기  
	public CookieBox(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				cookieMap.put(c.getName() , c);
			}
			
		}
	}
	
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	public String getValue(String name) throws IOException {
		Cookie c = cookieMap.get(name);
		if(c == null) return null; 		
		return URLDecoder.decode( c.getValue() , "utf-8") ;
	}
	
	public boolean exists(String name) {
		return cookieMap.containsKey(name); // cookieMap.get(name) != null;
	}
	
	
	public static Cookie createCookie(String name, String value ) throws IOException {
		return createCookie(name, value, "/", -1);  // -1 브라우저가 살아있는 동안만 
	}
	
	
	
	
	public static Cookie createCookie(String name, String value , String path, int age ) throws IOException {
		Cookie c = new Cookie(name, URLEncoder.encode(value, "utf-8") );
		c.setPath(path);
		c.setMaxAge(age);		
		return c; 
	}
	
}











