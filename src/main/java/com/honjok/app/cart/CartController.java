package com.honjok.app.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.honjok.app.vo.CartVO;
import com.honjok.app.vo.UserVO;


@Controller
public class CartController {
	
	

	@Autowired
	private CartService cartService;
	
	
	@RequestMapping(value="/cartList.do", method=RequestMethod.GET)
	public String cartList(Model model) {
		model.addAttribute("display2", "/cart/cart.jsp");
		return "index2.jsp";
	}
	
	
	
	@RequestMapping(value="/addCartList.do", method=RequestMethod.POST)
	@ResponseBody
	public Map addCartList(@RequestParam Map<String,String>map, HttpSession session,Model model) {
		System.out.println("addCartList map : " + map);
		
		
		//카드 담을때 같은 상품이 있나 확인
		//아이디 추가_20191202
		UserVO vo = (UserVO)session.getAttribute("userSession");
		String memId = vo.getId();
		map.put("memId",memId);
		//String memId = (String)session.getAttribute("userSession.id");
		System.out.println("Id체크" + map);
		
		int cnt  = cartService.getSameCart(map);
		System.out.println(cnt);
		
		
		
		Map<String,Integer>map2 = new HashMap<String,Integer>();
		//gubun3 은 재고보다 장바구니에 넣을 수량이 적을 시 return
		if(Integer.parseInt(map.get("stock")) <  Integer.parseInt(map.get("pCnt"))) {
			if(cnt > 0) {
				map2.put("gubun",1);
				return map2;
			}else {
				map2.put("gubun",3);
				return map2;
			}
		}else{
			if(cnt > 0) {
				map2.put("gubun",1);
				return map2;
			}else {
				UserVO vo2 = (UserVO)session.getAttribute("userSession");
				String id = vo2.getId();
				map.put("id", id);
				System.out.println("id체크" + id);
				
				int count = cartService.addCartProduct(map);
				System.out.println(count);
				session.setAttribute("memCart", count);
				
				model.addAttribute("memCart", session.getAttribute("memCart"));
				map2.put("gubun",2);
				
				System.out.println(model);
				System.out.println(map2);

			}
		}
		return map2;
		}
	
	@RequestMapping("/getCartList.do")
	public String getinteriorSelect(Map<String,String> map,@RequestParam("memId") String memId ,HttpSession session,Model model) {
		String id = memId; 
		map.put("id", id);
		List<Map<String,String>> list = cartService.getCartList(map);
		System.out.println(list);
		model.addAttribute("list", list);        	
		return "cart/cart.jsp";
	}
	
	@RequestMapping(value = "/cartDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int cartDelete(HttpSession session, @RequestParam(value= "chbox[]") List<String> checkArr, CartVO vo) {
		UserVO vo2 = (UserVO)session.getAttribute("userSession");
		String id = vo2.getId();
		System.out.println("들어왔다" + id);
		System.out.println("들어왔다" + checkArr);
		int result = 0;
		String cartNum = "0";
		
		if(vo2 != null) {
			vo.setId(id);
		
		for(String i : checkArr) {
			cartNum = i;
			vo.setpNum(cartNum);
			System.out.println(cartNum);
			cartService.cartDelete(vo);
		}
		result = 1;
		
		}
		
		return result;
	}
	
		
	}


