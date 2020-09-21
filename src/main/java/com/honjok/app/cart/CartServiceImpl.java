package com.honjok.app.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.CartVO;

@Service("CartService")
public class CartServiceImpl implements CartService {
		
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public int getSameCart(Map<String, String> map) {
		System.out.println("서비스임플에서 map값 여기는세임:" + map);
		return cartDAO.getSameCart(map);
	}

	@Override
	public int addCartProduct(Map<String, String> map) {
		System.out.println("서비스임플에서 map값 여기는 값넣는곳:" + map);
		return cartDAO.addCartProduct(map);
	}

	@Override
	public List<Map<String,String>>getCartList(Map<String, String> map) {
		return cartDAO.getCartList(map);
	}

	@Override
	public void cartDelete(CartVO vo) {
		cartDAO.cartDelete(vo);
	}

}
