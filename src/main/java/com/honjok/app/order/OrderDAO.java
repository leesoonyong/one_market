package com.honjok.app.order;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.honjok.app.vo.UserVO;


@Repository("OrderDAO")
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

		public Object updateCartCount(Map<String, Object> map) {
		return mybatis.update("orderDAO.updateCartCount", map);
		}
		
		public Map<String, Object> getProductCartData(Map<String, Object> map) {
			return mybatis.selectOne("orderDAO.getProductCartData", map);
		}
		
		public UserVO getUserData(Map<String, Object> map) {
			return mybatis.selectOne("orderDAO.getUserData", map);
		}

		public void insertOrderInfo(Map<String, Object> order) {
			mybatis.insert("orderDAO.insertOrderInfo", order);
		}
		
		public void insertOrderDetail(Map<String, Object> map) {
			mybatis.insert("orderDAO.insertOrderDetail", map);
		}
		public void updateProductStock(Map<String, Object> map) {
			mybatis.update("orderDAO.updateProductStock",map);
		}
		public int deleteCartList(Map<String, Object> map) {
			mybatis.delete("orderDAO.deleteCartList",map);
			return mybatis.selectOne("cartDAO.getCartCount", map);
		}

}	
