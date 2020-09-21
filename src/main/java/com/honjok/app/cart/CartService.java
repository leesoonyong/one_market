package com.honjok.app.cart;

import java.util.List;
import java.util.Map;

import com.honjok.app.vo.CartVO;


public interface CartService {
	
	 public int getSameCart(Map<String, String> map);
	 public int addCartProduct(Map<String, String> map);
	 public List<Map<String,String>>getCartList(Map<String, String> map);
	 public void cartDelete(CartVO vo);
}
