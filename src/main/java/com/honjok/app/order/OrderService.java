package com.honjok.app.order;

import java.util.Map;

import com.honjok.app.vo.UserVO;


public interface OrderService {

	public void updateCartCount(Map<String, Object> map);
	
	public Map<String, Object> getProductCartData(Map<String, Object> map);
	
	public UserVO getUserData(Map<String, Object> map);
	
	public void insertOrderInfo(Map<String, Object> order);

	public void insertOrderDetail(Map<String, Object> map);

	public void updateProductStock(Map<String, Object> map);
	
	public int deleteCartList(Map<String, Object> map);
}
