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


메인화면(rightSide)

쇼핑몰의 주력 상품에 대한 화보를 사이드 최상단에 슬라이드로 보여줍니다.
WEEKLY BEST PRODUCTS로 Product 데이터에서 조회(hit)가 가장 많은 순으로 슬라이드를 만들어 보여줍니다.
NEW ARRIVAL로 Product 데이터를 날짜순으로 정렬하여 나열해 보여줍니다.
로그인과 회원가입

로그인과 회원가입은 장고의 기본 User 모델을 사용하였습니다.
MY PAGE

회원이 주문한 상품의 주문내역을 볼 수 있습니다.
NOTICE

쇼핑몰의 공지사항을 확인할 수 있으며 admin 페이지에서 공지사항을 관리자가 입력할 수 있습니다.
PRODUCT PAGE

카테고리 내에서 조회수(hit)가 많은 순으로 상단에 4개까지 나열해줍니다.
카테고리에 해당하는 상품을 올려진 시간 순으로 나열합니다.
PRODUCT DETAIL

상품의 사진과 관리자가 지정한 상품의 이름, 상품에 대한 설명이 포함됩니다.

상품의 가격과 상품을 구매할 시 적립되는 포인트(10%)가 보여집니다.

수량을 선택할 수 있습니다.

선택한 상품을 장바구니에 담거나 주문페이지로 넘어갈 수 있습니다.

    //장바구니에 담거나 구매할 수 있도록 함.
    @login_required
    def cart_or_buy(request, pk):
        quantity = int(request.POST.get('quantity'))
        product = Product.objects.get(pk=pk)
        user = request.user
        categories = Category.objects.all()
        initial = {'name': product.name, 'amount': product.price, 'quantity': quantity}
        cart = Cart.objects.filter(user=user)
        if request.method == 'POST':
            if 'add_cart' in request.POST:
                for i in cart :
                    if i.products == product:
                        product = Product.objects.filter(pk=pk)
                        Cart.objects.filter(user=user, products__in=product).update(quantity=F('quantity') + quantity)
                        messages.success(request,'장바구니 등록 완료')
                        return redirect('shop:cart', user.pk)

                Cart.objects.create(user=user, products=product, quantity=quantity)
                messages.success(request, '장바구니 등록 완료')
                return redirect('shop:cart', user.pk)

            elif 'buy' in request.POST:
                form = OrderForm(request.POST, initial=initial)
                if form.is_valid():
                    order = form.save(commit=False)
                    order.user = user
                    order.quantity = quantity
                    order.products = product
                    order.save()
                    return redirect('shop:order_list', user.pk)

                else:
                    form = OrderForm(initial=initial)

                return render(request, 'shop/order_pay.html', {
                    'form': form,
                    'quantity': quantity,
                    'iamport_shop_id': 'iamport',  # FIXME: 가맹점코드
                    'user': user,
                    'product': product,
                    'categories': categories,
                })

상품 구매

선택한 상품의 수량에 따른 가격을 정해 구매할 수 있습니다.
선택을 완료하여 구매를 누르면 결제가 이루어지도록 iamport를 연동하였습니다.
