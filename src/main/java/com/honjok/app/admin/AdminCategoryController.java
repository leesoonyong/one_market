package com.honjok.app.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;



@Controller
public class AdminCategoryController {

	//동적카테고리
	@RequestMapping(value="/admin/categorySelect1.do", produces = "application/json; charset=utf8" , method=RequestMethod.POST)
	public void selectBox(HttpServletRequest req, HttpServletResponse res, String param) {
		String product1 = param;
		System.out.println(product1);
		List<String> product2 = new ArrayList<>();
		if(product1.equals("가구")) {
			product2.add("침대");
			product2.add("매트리스");
			product2.add("화장대");
			product2.add("거울");
			product2.add("책상/테이블");
			product2.add("의자");
			product2.add("거실장");
		}else if(product1.equals("수납정리")) {
			product2.add("드레스룸");
			product2.add("옷장");
			product2.add("행거");
			product2.add("붙박이장");
			product2.add("서랍장");
			product2.add("선반");
			product2.add("신발장");	
			
		}else if(product1.equals("인테리어 소품")) {
			product2.add("조명");
			product2.add("시계");
			product2.add("플라워/식물");
			product2.add("갤러리");
			product2.add("벽장식");
			product2.add("캔들/디퓨저");
			product2.add("장식소품");	
			product2.add("책상/기타꾸미기");	
		
		}else if(product1.equals("가전제품")) {
			product2.add("주방가전");
			product2.add("생활가전");
			product2.add("청소가전");
			product2.add("이미용가전");
			product2.add("음향/영상가전");
			product2.add("계절가전");
		
		}else if(product1.equals("패브릭")) {
			product2.add("침구");
			product2.add("커튼/블라인드");
			product2.add("카페트/러그");
			product2.add("쿠션/방석");
			product2.add("홈패브릭");
			product2.add("주방패브릭");
		
		}else if(product1.equals("주방용품")) {
			product2.add("그릇/홈세트");
			product2.add("수저/커트러리");
			product2.add("컵/잔/텀블러");
			product2.add("냄비/프라이펜");
			product2.add("조리도구/도마");
			product2.add("칼/커팅기구");
			product2.add("주방수납/정리");
			product2.add("식기건조대");
			product2.add("주방/잡화");
			product2.add("커피용품/베이킹");
		
		}else if(product1.equals("생활용품")) {
			product2.add("욕실용품");
			product2.add("수건/타월");
			product2.add("청소용품");
			product2.add("세탁용품");
			product2.add("생필품");
			product2.add("생활잡화");
			product2.add("주방수납/정리");
			product2.add("식기건조대");
			product2.add("주방/잡화");
			product2.add("커피용품/베이킹");
		
		}else if(product1.equals("반려동물")) {
			product2.add("강아지");
			product2.add("고양이");
			product2.add("기타");
		}
		
		JsonArray jsonArray = new JsonArray();
		  for (int i = 0; i < product2.size(); i++) {
			  System.out.println(product2.get(i));
		      jsonArray.add(product2.get(i));
		   }
		  PrintWriter pw;
		try {
			pw = res.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		
		//동적카테고리(소분류)
		@RequestMapping(value="/admin/categorySelect2.do", produces = "application/json; charset=utf8" , method=RequestMethod.POST)
		public void selectBox2(HttpServletRequest req, HttpServletResponse res, String param2) {
			String product2 = param2;
			System.out.println(product2);
			List<String> product3 = new ArrayList<>();
			if(product2.equals("침대")) {
				product3.add("일반침대");
				product3.add("수납형침대");
				product3.add("저상형침대");
				product3.add("이층침대");
				
				
			}else if(product2.equals("매트리스")) {
				product3.add("스프링매트리스");
				product3.add("라텍스매트리스");
				product3.add("폼매트리스");
				product3.add("혼합형매트리스");
				product3.add("토퍼");
				
			}else if(product2.equals("화장대")) {
				product3.add("일반화장대");
				product3.add("수납형화장대");
				product3.add("좌식화장대");
				product3.add("접이식화장대");
	
			}else if(product2.equals("거울")) {
				product3.add("벽거울");
				product3.add("전신거울");
				product3.add("탁상거울");

			}else if(product2.equals("책상/테이블")) {
				product3.add("좌식테이블");
				product3.add("사이드테이블");
				product3.add("접이식테이블");
				product3.add("아웃도어테이블");

			
			}else if(product2.equals("의자")) {
				product3.add("일반의자");
				product3.add("책상의자");
				product3.add("좌식의자");
				product3.add("안락의자/흔들의자");
			
			}else if(product2.equals("거실장")) {
				product3.add("거실장/TV장");
				product3.add("사이드보드");
				product3.add("진열장/장식장");
			
			}else if(product2.equals("행거")) {
				product3.add("스탠드행거");
				product3.add("고정식행거");
				product3.add("이동식행거");
				
			}else if(product2.equals("조명")) {
				product3.add("공간별조명");
				product3.add("LED평판등");
				product3.add("레일조명");
				product3.add("장스탠드");
				product3.add("단스탠드");
				product3.add("데스크스탠드");
				product3.add("벽조명");
				product3.add("무드등/장식조명");
				product3.add("매입등/센서등");
				product3.add("형광등/조명 부속품");
				
			}else if(product2.equals("시계")) {
				product3.add("벽시계");
				product3.add("알람/탁상시계");
				product3.add("욕실방수시계");
				product3.add("타이머/스탑워치");
				
				
			}else if(product2.equals("플라워/식물")) {
				product3.add("식물");
				product3.add("조화");
				product3.add("리스/가랜드");
				product3.add("화병/화분");
				product3.add("기타 가드닝 용품");
				
			}else if(product2.equals("갤러리")) {
				product3.add("액자");
				product3.add("패브릭 포스터");
				product3.add("그림/사진");
				
			}else if(product2.equals("벽장식")) {
				product3.add("데코스티커");
				product3.add("마크라메");
				product3.add("드림캐쳐/썬캐쳐");
				product3.add("기타");
				
			}else if(product2.equals("캔들/디퓨저")) {
				product3.add("캔들");
				product3.add("디퓨저");
				product3.add("홈퍼퓸/사쉐");
				product3.add("향/인센스");
				product3.add("석고방향제");
				product3.add("캔들 홀더/워머");
				product3.add("기타 악세사리");
				
			}else if(product2.equals("장식소품")) {
				product3.add("트레이/보석함");
				product3.add("미너어쳐/DIY");
				product3.add("모빌/가랜드");
				product3.add("장식인형");
				product3.add("앤틱소품");
				product3.add("마그넷/도어벨");
				product3.add("워터볼/스노우볼");
				product3.add("오르골");
				product3.add("도어사인");
				product3.add("파티/이벤트 용품");
				product3.add("기타 장식용품");
				
			}else if(product2.equals("책상/기타꾸미기")) {
				product3.add("디자인문구");
				product3.add("데스크테리어");
				product3.add("디지털/핸드폰");
				product3.add("기타 디자인용품");
				
			}else if(product2.equals("주방가전")) {
				product3.add("냉장고");
				product3.add("전기주전자");
				product3.add("에어프라이어");
				product3.add("토스터/홈베이킹");
				product3.add("전기그릴");
				product3.add("블렌더/믹서");
				product3.add("오븐/전자레인지");
				product3.add("가스레인지/인덕션");
				product3.add("전기밥솥/찜기");
				product3.add("커피메이커/머신");
				product3.add("기타");
				
				
			}else if(product2.equals("생활가전")) {
				product3.add("세탁기/건조기/의류관리기");
				product3.add("미싱/다리미");
				product3.add("멀티탭");
				product3.add("건강가전/비데");
				product3.add("기타");
				
			}else if(product2.equals("청소가전")) {
				product3.add("일반청소기");
				product3.add("로봇청소기");
				product3.add("침구청소기");
				product3.add("스팀청소기");
				product3.add("물걸레청소기");
				
			}else if(product2.equals("이미용가전")) {
				product3.add("드라이기");
				product3.add("고데기/매직기");
				product3.add("면도기/제모기");
				product3.add("전동칫솔/칫솔살균기");
				product3.add("이미용기타");
				
			}else if(product2.equals("음향/영상가전")) {
				product3.add("프로젝터");
				product3.add("TV/모니터");
				product3.add("스피커/라디오");
				product3.add("턴테이블/CDP");
				product3.add("이어폰/헤드셋");
				product3.add("PC악세사리");
				
			}else if(product2.equals("계절가전")) {
				product3.add("가습기");
				product3.add("전기히터/온풍기");
				product3.add("온열매트/온수매트");
				product3.add("공기청정기");
				product3.add("선풍기");
				product3.add("제습기");
				product3.add("에어컨");
				product3.add("기타");
				
			}else if(product2.equals("침구")) {
				product3.add("이불커버");
				product3.add("이불솜");
				product3.add("요/토퍼");
				product3.add("베개커버/솜");
				product3.add("바디필로우/릉쿠션");
				product3.add("매트리스커버");
				product3.add("홀이불/겹이불");
				product3.add("패드/스프레드");
				
			}else if(product2.equals("커튼/블라인드")) {
				product3.add("암막커튼");
				product3.add("일반커튼");
				product3.add("레이스/속커튼");
				product3.add("블라인드/롤스크린");
				product3.add("가리개커튼");
				product3.add("바란스/주방커튼");
				product3.add("커튼부자재");
				product3.add("캐노피");
			
			}else if(product2.equals("카페트/러그")) {
				product3.add("극세사러그");
				product3.add("샤기카페트");
				product3.add("페르시안카페트");
				product3.add("면/라탄/핸드메이드");
				product3.add("발매트");
				product3.add("주방/다용도매트");
				product3.add("PVC/사이잘룩");
				product3.add("피크닉매트");
				product3.add("원목/대자리/쿨매트");
			
			}else if(product2.equals("쿠션/방석")) {
				product3.add("쿠션");
				product3.add("방석/대방석");
				product3.add("쿠션/방석솜");
			
			}else if(product2.equals("홈패브릭")) {
				product3.add("담요/블랭킷");
				product3.add("실내화");
				product3.add("소파패드");
				product3.add("소파커버");
				product3.add("홈웨어");
				product3.add("선풍기/에어컨커버");
				product3.add("티슈커버");
				product3.add("기타");
				
			}else if(product2.equals("주방패브릭")) {
				product3.add("식탁보/러너");
				product3.add("테이블매트");
				product3.add("앞치마/주방장갑 외");
				product3.add("행주/티타올");
				product3.add("기타");
				
			}else if(product2.equals("그릇/홈세트")) {
				product3.add("그릇세트");
				product3.add("공기/대접");
				product3.add("접시/플레이트");
				product3.add("면기/파스타");
				product3.add("식판/나눔접시");
				product3.add("소스볼/찬기");
				product3.add("케이크스탠드");
				product3.add("샐러드볼/다용도볼");
				product3.add("그라탕기/스프볼");
				
			}else if(product2.equals("수저/커트러리")) {
				product3.add("수저/커트러리세트");
				product3.add("스푼/포크/나이프");
				product3.add("수저받침/소품");
			
			}else if(product2.equals("컵/잔/텀블러")) {
				product3.add("머그겁");
				product3.add("유리컵/물컵");
				product3.add("텀블러/보틀");
				product3.add("물병/주전자/티포트");
				product3.add("찻잔/커피잔");
				product3.add("맥주잔/와인잔");
				product3.add("소주/막걸리잔");
				product3.add("컵소품/기타");
				
			}else if(product2.equals("냄비/프라이펜")) {
				product3.add("냄비/프라이팬세트");
				product3.add("냄비/뚝배기");
				product3.add("압력솥/찜솥");
				product3.add("프라이팬/그릴");
		
			}else if(product2.equals("조리도구/도마")) {
				product3.add("조리도구세트");
				product3.add("뒤집개/주걱/국자");
				product3.add("도마");
				product3.add("채반/믹싱볼/바구니");
				product3.add("찜기");
				product3.add("계량도구/타이머");
				product3.add("휴대용 가스레인지");
				product3.add("기타 조리도구");
			
			}else if(product2.equals("칼/커팅기구")) {
				product3.add("채칼/다지기/강판");
				product3.add("칼/가위");
				product3.add("칼세트");
				product3.add("칼갈이/칼꽂이");
			
			}else if(product2.equals("주방수납/정리")) {
				product3.add("주방선반/정리대");
				product3.add("컵걸이/컵꽂이");
				product3.add("수저통");
				product3.add("홀더");
				product3.add("찜기");
				product3.add("수세미걸이/세제통");
				product3.add("주방수납용품");
				product3.add("서랍매트/트레이");
				product3.add("음식물쓰레기통");
			
			}else if(product2.equals("식기건조대")) {
				product3.add("드라잉매트");
				product3.add("미니식기건조대");
				product3.add("식기건조대");
				product3.add("기둥식 식기건조대");
				product3.add("설거지통");
			
			}else if(product2.equals("주방/잡화")) {
				product3.add("얼음트레이/버킷");
				product3.add("수세미/브러쉬");
				product3.add("고무장갑/행주");
				product3.add("물막이/배수구용품");
				product3.add("다용도덮개");
				product3.add("냄비받침/컵받침");
				product3.add("트레이/쟁반/바구니");
				product3.add("아트보드/가스레인지가드");
				product3.add("기타소품/잡화");
			
			}else if(product2.equals("커피용품/베이킹")) {
				product3.add("커피용품");
				product3.add("베이킹용품");
				
			}else if(product2.equals("욕실용품")) {
				product3.add("욕실소품/디스펜서");
				product3.add("욕실정리/수납장");
				product3.add("욕실선반");
				product3.add("양치용품 정리");
				product3.add("비누받침");
				product3.add("샤워기/수전용품");
				product3.add("필터샤워기/연수기");
				product3.add("샤워/목욕용품");
				product3.add("샤워 커튼/봉");
				product3.add("욕실/발 매트");
				product3.add("욕실화");
				product3.add("변기솔");
				product3.add("변기커버");
				product3.add("기타 욕실용품");
			
			}else if(product2.equals("수건/타월")) {
				product3.add("세면타월");
				product3.add("바스타월/가운/기타");
				
			}else if(product2.equals("청소용품")) {
				product3.add("휴지통");
				product3.add("분리수거함");
				product3.add("밀대/청소포");
				product3.add("먼지제거/클리너");
				product3.add("청소솔/브러쉬");
				product3.add("기타 청소용품");
			
			}else if(product2.equals("세탁용품")) {
				product3.add("빨래건조대");
				product3.add("빨래바구니/보관함");
				product3.add("다리미판/기타");
				
			}else if(product2.equals("생필품")) {
				product3.add("세탁세제");
				product3.add("주방세제");
				product3.add("섬유유연제");
				product3.add("제습제");
				product3.add("방향제/탈취제");
				product3.add("청소세제/세정제");
				product3.add("화장지/물티슈");
				product3.add("칫솔/치약/세면");
				product3.add("헤어/바디케어/뷰티");
				product3.add("살충/방충제");
				product3.add("기타 생필품");
				
			}else if(product2.equals("생활잡화")) {
				product3.add("모기장/방충망");
				product3.add("난방텐트/단열용품");
				product3.add("여행용품");
				product3.add("마스크/건강용품");
				product3.add("기타 생활잡화");
				
			}else if(product2.equals("강아지")) {
				product3.add("푸드");
				product3.add("패션");
				product3.add("외출용품");
				product3.add("리빙");
				product3.add("미용/목욕");
				product3.add("위생/배변");
				product3.add("장난감");
				
			}else if(product2.equals("고양이")) {
				product3.add("푸드");
				product3.add("패션");
				product3.add("외출용품");
				product3.add("리빙");
				product3.add("미용/목욕");
				product3.add("위생/배변");
				product3.add("장난감");
				
			}else if(product2.equals("기타")) {
				product3.add("푸드");
				product3.add("패션");
				product3.add("외출용품");
				product3.add("리빙");
				product3.add("미용/목욕");
				product3.add("위생/배변");
				product3.add("장난감");
			}
			
			
			
			JsonArray jsonArray2 = new JsonArray();
			  for (int i = 0; i < product3.size(); i++) {
				  System.out.println(product3.get(i));
			      jsonArray2.add(product3.get(i));
			   }
			  PrintWriter pw;
			try {
				pw = res.getWriter();
				pw.print(jsonArray2.toString());
				pw.flush();
				pw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	@RequestMapping(value = "/admin/salePrice.do", method = RequestMethod.POST)
	@ResponseBody
		public String salePrice(HttpServletRequest req, HttpServletResponse res,  String price, String salePrice) {
			String price1 = price;
			String salePrice1 = salePrice;
			if(salePrice1 == ""){
				salePrice1 = "0";
			}
			if(price1 == "" ) {
				price1 = "0";
			}
			
			
			System.out.println("price:" + price1);
			System.out.println("salePrice:" + salePrice1);
			

			int price2 = Integer.parseInt(price1);
			int salePrice2 = Integer.parseInt(salePrice1);
			int salePrice3 = (int)Math.round(price2 * (salePrice2 * 0.01));
			int sale2 = (price2 - salePrice3);
			String sale3 = Integer.toString(sale2);
			System.out.println("sale3" + sale3);
			return sale3;
		}
	
	
	@RequestMapping(value = "/admin/salePrice2.do", method = RequestMethod.POST)
	@ResponseBody
		public String salePrice2(HttpServletRequest req, HttpServletResponse res,  String price, String salePrice) {
			String price1 = price;
			String salePrice1 = salePrice;
		
			if(price1 == "" ) {
				price1 = "0";
			}
			
			if(salePrice1 == ""){
				salePrice1 = "0";
			}
			System.out.println("price:" + price1);
			System.out.println("salePrice:" + salePrice1);
			
			int price2 = Integer.parseInt(price1);
			int salePrice2 = Integer.parseInt(salePrice1);
			int salePrice3 = (int)Math.round(price2 * (salePrice2 * 0.01));
			int sale2 = (price2 - salePrice3);
			String sale3 = Integer.toString(sale2);
			System.out.println("sale3: " + sale3);
			return sale3;
		}
		
		
	

}