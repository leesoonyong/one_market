package com.honjok.app.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.CartVO;

@Repository("CartDAO")
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int getSameCart(Map<String, String> map) {
		System.out.println("CartDAO에서 SAMEmap값:" + map);
		return mybatis.selectOne("cartDAO.getSameCart", map);
	}
	
	public int addCartProduct(Map<String, String> map) {
		System.out.println("CartDAO에서 ADDmap값:" + map);
		mybatis.insert("cartDAO.addCartProduct", map);
		return mybatis.selectOne("cartDAO.getCartCount",map);
	}
	
	public int getCartCount(String id) {
		return mybatis.selectOne("cartDAO.getCartCount", id);
	}
	
	public List<Map<String,String>> getCartList(Map<String,String> map){
		return mybatis.selectList("cartDAO.getCartList",map);
	}
	public void cartDelete(CartVO vo) {
		mybatis.delete("cartDAO.cartDelete",vo);
	}

}
