package com.honjok.app.order;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honjok.app.vo.UserVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public void updateCartCount(Map<String, Object> map) {
		orderDAO.updateCartCount(map);	
	}

	@Override
	public Map<String, Object> getProductCartData(Map<String, Object> map) {
		return orderDAO.getProductCartData(map);
	}

	@Override
	public UserVO getUserData(Map<String, Object> map) {
		return orderDAO.getUserData(map);
	}

	@Override
	public void insertOrderInfo(Map<String, Object> order) {
		orderDAO.insertOrderInfo(order);
	}

	@Override
	public void insertOrderDetail(Map<String, Object> map) {
		orderDAO.insertOrderDetail(map);
	}

	@Override
	public void updateProductStock(Map<String, Object> map) {
		orderDAO.updateProductStock(map);
	}

	@Override
	public int deleteCartList(Map<String, Object> map) {
		return orderDAO.deleteCartList(map);
	}

}
