package com.honjok.app.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.honjok.app.user.UserDAO;
import com.honjok.app.vo.UserVO;

@Controller
public class OrderController {
	
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value="/order.do", method=RequestMethod.GET)
	public String orderList(@RequestParam String pCnt, @RequestParam String pNum,
							@RequestParam String shippingFee, Map<String, Object> resultMap,
							Model model, HttpSession session,HttpServletResponse response) throws IOException {
		
		System.out.println(pCnt);
		System.out.println(pNum);
		System.out.println(shippingFee);
		System.out.println("여기까지 들어옴 1차");
		UserVO vo = (UserVO)session.getAttribute("userSession");
		String id = vo.getId();
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		//카트 수량 조절
		String[] pCntWord = pCnt.split(",");
		String[] pNumWord = pNum.split(",");
		for (int i = 0; i < pCntWord.length; i++) {
			map.put("pCnt", pCntWord[i]);
			map.put("pNum", pNumWord[i]);
			map.put("id", id);
			System.out.println(map + "map확인");
			orderService.updateCartCount(map);
			
			resultMap = orderService.getProductCartData(map);
			
			list.add(resultMap);
			System.out.println(resultMap + "여기까지 2차");
		}
		
		vo = orderService.getUserData(map);
		
		System.out.println(vo + "여기까지 3차 ");
		
	
		
		model.addAttribute("shippingFee", shippingFee);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		//model.addAttribute("display", "/shop/goods/order.jsp");
		
		

		return "/order/order.jsp";
	}
	
	
	@RequestMapping(value="/orderService.do", method=RequestMethod.POST)
	@ResponseBody
	public void responseSuccess(@RequestBody Map<String, Object> order, Model model, HttpSession session) {
		
		UserVO vo = (UserVO)session.getAttribute("userSession");
		String id = vo.getId(); 
		System.out.println("서버 아이디" + id);
		ArrayList<String> pNum = (ArrayList<String>)order.get("pNum");
		System.out.println("pNum" + pNum);
		
		ArrayList<String> pCnt = (ArrayList<String>)order.get("pCnt");
		System.out.println("pCnt" + pCnt);
		
		ArrayList<String> price = (ArrayList<String>)order.get("price");
		System.out.println("price" + price);
		
		order.remove("pNum");
		order.remove("qty");
		order.remove("price");
		order.put("id", id);
		orderService.insertOrderInfo(order);
		
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i< pNum.size(); i++) {
			map.put("pNum", pNum.get(i));
			map.put("pCnt", pCnt.get(i));
			map.put("price", price.get(i));
			map.put("id", id);
			
			System.out.println(map);
			orderService.insertOrderDetail(map);
			orderService.updateProductStock(map);
			
			int memCart = orderService.deleteCartList(map);
			session.setAttribute("memCart", memCart);
		}
		
		
		
		
		
	}
	
	
	
	

}
