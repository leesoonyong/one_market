# 프로젝트
ONE-MARKET 혼족을 위한 커뮤니티 쇼핑몰 <br/>

기존 쇼핑몰과 달리 커뮤니티 기능을 추가하여 혼족을 위한 맞춤형 쇼핑몰 구성</br>

4인 팀 프로젝트(현재 기능 추가 및 수정 중)<br/>

프로젝트 기간: 2020,03 ~ 2020,04

시연 영상 : https://www.youtube.com/watch?v=p3KoEdVDNf0&t=426s
![원마켓](https://user-images.githubusercontent.com/44168355/93769438-bc4ffd80-fc55-11ea-9ebf-191eaf5565da.png)




# 사용기술

 - Front-End : HTML, CSS, JavaScript, JQuery, json, Ajax, BootStrap
 
 - Back-End : Java, Servlet & JSP, mybatis, ojdbc8, JDK1.8, Apache Tomcat8.5, AWS
 
 - Open API : Daum map API, kakao 주소 API
 
 - Tool : Eclipse, GitHub, Brackets, MAVEN

# 개발일정

![대지 1](https://user-images.githubusercontent.com/44168355/93773248-d7713c00-fc5a-11ea-990f-28f11949166f.png)


# 프로젝트 담당 및 기능

프로젝트에서 메인CSS / 상품등록(Admin) / 로그인 / 회원가입 / 장바구니 / 주문을 맡았습니다 


### 회원가입

회원가입을 할때 아이디 중복 체크 및 개인정보는</br>
자바스크립트 정규식 및 Ajax를 활용해 동적으로 체크하였습니다

![테스트22](https://user-images.githubusercontent.com/44168355/93780490-333fc300-fc63-11ea-8d81-3e5ab6e0598b.png)

```JAVASCRIPT
var pwJ = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; //비밀번호 정규식

//비밀번호 
$('#password').keyup(function() {
		
		if (pwJ.test($('#password').val())) {
			$('#passwordCheck').text("");
		} else {
			$('#passwordCheck').text('숫자와 영문조합으로 8자리 이상 입력해주세요');
			$('#passwordCheck').css('color', 'red');
		}
	});
```





### 로그인

로그인은 3가지 로 나뉘어 
이메일 인증을한회원 / 아이디가 비밀번호가 없는 회원 / 이메일도 있고 아이디도 있는 회원으로<br/>
구분하였습니다
```JAVA
$('#loginBtn').click(function(){
	var id = $('#inputId').val();
	var password = $('#inputPassword').val();
	var rememberUs = $('#rememberUs').is(':checked');
		$.ajax({
		type : "post",
		url : 'login.do',
		data : {
			id : id,
			password : password,
			rememberUserId : rememberUs
		},
				success : function(data){
				
				if(data == 0){
					$('#spanLoginCheck').text('로그인 정보를 정확히 입력해주세요')
				}else if (data == -2){
					$('#spanLoginCheck').text('이메일을 인증 해주셔야합니다')
					$('#spanLoginCheck').css('color', 'red');
				}else{
					location.href="/app/main/getMainList.do"
				}
				
			}
		})
})    
```

로그인이 있는 회원 같은경우 아이디 저장 기능을 체크한 회원과 체크하지 않은 회원을 구분해</br>
체크 한 경우 쿠키에 아이디정보를 추가하였습니다

```JAVA
//로그인 했을때
if(vo != null) {
    if(vo.getId().equals(userId) && vo.getPassword().equals(userPassword)) {


        Cookie cookie = new Cookie("userCheck", userId);

        if(userCheck.equals("true")) {
            response.addCookie(cookie);
            System.out.println("아이디 저장 O");
        }else {
            System.out.println("아이디 저장 X");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        System.out.println("3단계 : 로그인 단계");
        vo.setPassword("");



        httpSession.setAttribute("basketCount",UserDAO.basketCount(vo.getId()));

        httpSession.setAttribute("userSession", vo);
        System.out.println("회원아이디 세션 확인 userSession" + httpSession.getAttribute("userSession"));
        result = 1;

}
```        
### 상품등록

상품등록(proudctReg) 
카테고리/가격/할인%/배송비 브랜드 등 정보를 입력할 수 있으며 </br>

카테고리는 josnArray를 통하여 동적 생성 할 수 있도록 하였으며

썸머노트 에디터를 활용하여 상세페이지를 작성할수 있도록 하였습니다 </br>

대표이미지(썸네일) 이미지와 서브이미지를 추가할 수 있도록 구현하였습니다 </br>


![이미지22](https://user-images.githubusercontent.com/44168355/93786878-c2040e00-fc6a-11ea-8b5b-18b1b0d866ae.png)

### 장바구니

장바구니는 javascript를 활용하여 상품 삭제 및 결제 금액 할인 금액등을 계산하였습니다

버튼을 통하여 상품수량을 수정할 수 있으며 썸네일 이미지를 통하여 상품을 확인 할 수 있도록 하였습니다

![장바구니](https://user-images.githubusercontent.com/44168355/93787023-ee1f8f00-fc6a-11ea-85ae-3a1ed2fea5df.png)

### 결제
결제(order)는

javascipt를 통하여 상품 금액 및 개수를 확인하고

다음 주소찾기API를 통하여 배송지 정보를 입력 할 수 있도록 하였으며

결제 부분은 아임포트API를 통하여 구현하였으며

이니시스를 통하여 카카오 페이 결제를 진행 하도록 하였습니다

![결제33](https://user-images.githubusercontent.com/44168355/93789281-9e41c780-fc6c-11ea-85b1-bac736501897.png)







