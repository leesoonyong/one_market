<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="/app/resources/css/cart/cart.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div id=container>
<div class="wrap cart">
    <div class="my-cart__header">
        <div class="my-cart__tit">장바구니</div>
        <div class="my-cart__sub-tit">
         	   주문하실 상품명 및 수량을 정확하게 확인해 주세요.
        </div>
    </div>
    <div class="cart-goods">
        <table class="cart-tb">
            <tr class="cart-tb__header">
                <th>
                    <label for=""class="check-label checked"onclick="change_Allcheckbox($(this))">
                        <input type="checkbox"class="check-box allCheck" name="allCheck"checked/>
                    </label>
                </th>
                <th id="thSelect">
                	전체선택 (<span class="prd_count">0</span>/<span class="prd_total_count">0</span >)
                </th>
	                <td>
	                	<div class="cart-goods__btns">
	            			<button class="cart-goods__btn-del btn_delete selectBtn">선택 삭제</button>
	     				</div>
	                </td>
            </tr>
            <tr>
                <th id="thInfo">상품명</th>
                <th id="thCount">수량</th>
                <th id="thCost">상품금액</th>
                <th id="shippingFee">배송비</th>
            </tr>
            <!-- DB에서 cart 데이터 불러오는 곳 -->
          <c:forEach var="list" items="${list}">
           		<tr class="viewDel">
						<td class="cart-tb__check">
						<input type = "hidden" class="stock" value="${list.STOCK}"/>
						<label for="" class="check-label checked" onclick="change_checkbox($(this))">
							<input type="checkbox" data-pNum="${list.P_NUM}" data-id="${list.ID}"class="prdCheck ico_check" name="prdCheck"
									checked onchange="total_calcul()"/>
					 	</label>
						</td>
						<td class="cart-tb__thumb"><img src="/app/resources/img/${list.THUMNAIL_IMG}"></td>
						<td class="cart-tb__desc">
							<div class="cart-tb__name">${list.P_NAME}</div>
							
							<div class="price_Box">
								<c:if test= "${empty list.SALEPRICE}">
								정가: <span class="product__dc cart-tb__num price1">${list.PRICE}</span>
								</c:if>
								<c:if test="${not empty list.SALEPRICE}">
								정가: <span class="product__dc cart-tb__num price1">${list.PRICE}</span>
								할인가격: <span class="product__price cart-tb__num price2">${list.SALEPRICE}</span>
								</c:if>
							</div>
						</td>
						<td class="cart-tb__shippingFee">
							<div class="cart-tb__num shippingFee">${list.SHIPPINGFEE}</div>
						</td>
						<td class="cart-tb__count">
						 	<span class="goods-count">
								<button class="minus" onClick="BtnMinus($(this));"></button>
								<input type="text" value="${list.P_CNT}" class="qty clk_count" readonly>
								<button type="button" id="${list.P_NUM}"data-saleprice="${list.SALEPRICE}" data-stock="${list.STOCK}" class="plus" onclick="BtnPlus($(this));"></button>
							</span>
						</td>
						<td class="cart-tb__total prd_price">${list.SALEPRICE}</td>
						<td>
							<button type="button" class="btn_delete_point" onclick="seldel($(this))"><img src="https://res.kurly.com/pc/ico/1801/btn_close_24x24_514859.png" alt="삭제"></button>
						</td>
					</tr>
				</c:forEach>	
			
     	</table>
        <div class="cart-amount">
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품 금액</div>
                <div class="cart-amount__price">
                    <span id="amountPrice"></span> 원
                </div>
            </div>
            <div class="cart-amount__deco deco-minus">
                -
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">상품 할인금액</div>
                <div class="cart-amount__price">
                    <span id="amountSale"></span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                +
            </div>
            <div class="cart-amount__item">
                <div class="cart-amount__tit">배송비</div>
                <div class="cart-amount__price">
                    <span id="amountCourier"></span> 원
                </div>
            </div>
            <div class="cart-amount__deco">
                =
            </div>
            <div class="cart-amount__item amount-total">
                <div class="cart-amount__tit">결제예정금액</div>
                <div class="cart-amount__price" style="padding-top: 28px;">
                    <span id="amountTotal"></span> 원
                </div>
            </div>
        </div>
        <input type="button" id="placeAnOrder" class="cart-goods__btn-write"value="주문하기"/>
    </div>
</div>
</div>
</body>
<script>











//페이지 들어오면 바로 실행
total_calcul(); //장바구니 총합 계산
chCount(); // 선택 개수 체크
PriceCntSum(); // 세일 프라이스 값 사승 수량이 올라갈때 체크 1이상인 경우


function total_calcul(){
//장바구니 총 상품금액 계산 - 시작
var prdCnt = $('.price1').length//장바구니에 담긴 개수
var originalArr = new Array(prdCnt); //정가의 배열을 담을 객체
var discountArr = new Array(prdCnt); // 할인가의 배열을 담을 객체
var shippingFee = new Array(prdCnt); // 배송비의 배열을 담을 객체


//변수초기화
let shippingFeeTotPrice = 0;
let originalTotPrice = 0;
let discountTotPrice = 0;

for(var i = 0; i<prdCnt; i++){
	if($(".prdCheck").eq(i).prop("checked")){
		originalArr[i] = $('.price1').eq(i).text() * $('.clk_count').eq(i).val();
		discountArr[i] = $('.price2').eq(i).text() * $('.clk_count').eq(i).val();
		shippingFee[i] = parseInt($('.shippingFee').eq(i).text());
		
		shippingFeeTotPrice += parseInt(shippingFee[i]);
		originalTotPrice += originalArr[i];
		discountTotPrice += originalArr[i] - discountArr[i];
	}
}

$('#amountPrice').text(originalTotPrice); // 정가의 총 합 > [상품금액 div] - span 에 담기
$('#amountSale').text(discountTotPrice);  // 할인금액 총 합 > [상품할인금액 div] - span에 담기
$('#amountCourier').text(shippingFeeTotPrice); //배송비의 총 합 [배송비div] -span에 담기
$('#amountTotal').text(originalTotPrice - discountTotPrice + shippingFeeTotPrice); // 최종 [결제예정금액 div]

}

//페이지 들어오면 바로 실행


//전체 개수 구하기	
chk_total_obj = document.getElementsByClassName('prdCheck');//상품채크박스
chk_total_leng = chk_total_obj.length;//상품채크박스 개수
$('.prd_count').text(chk_total_leng);
$('.prd_total_count').text(chk_total_leng);//상품체크박스 개수 카운트



	
//클릭시 상품개수 체크	
$('.prdCheck').on("click", function(){
	chCount();
});


function PriceCntSum() {
	let salePrice = new Array();
	let cnt = $('.qty').length;
	
	for(i=0; i<cnt; i++) {
		salePrice[i] = $('.price2').eq(i).text() * $('.qty').eq(i).val();
		
		$('.prd_price').eq(i).text(salePrice[i]);
	}
}

	
//상품개수카운트 함수
function chCount() {
	chk_obj = $('.prdCheck');
	chk_leng = chk_obj.length;
	var checked = 0;
	
	for(i=0; i<chk_leng; i++){
		if(chk_obj[i].checked){
			checked += 1;
		}
	}
	console.log(checked);
	
	if(checked == chk_leng) { // 모든 상품이 체크 상태일 때, 상위의 [전체선택] 체크박스 라벨의 아이콘을 체크상태로 바꿈 
		$("input[name=allCheck]").prop("checked",true);
	}else{
		$("input[name=allCheck]").prop("checked",false);
	}
		$('.prd_count').text(checked);
}
//선택 상품 삭제
$('.selectBtn').click(function(){
 	var confirm_val = confirm("정말 삭제하시겠습니까?");
 	let id = $("input[name='prdCheck']:checked").data("id");
 	console.log(id);
 	
 	if(confirm_val){
 		var checkArr = new Array();
 		 
 		 
 		$("input[name='prdCheck']:checked").each(function(){
 			checkArr.push($(this).attr("data-pNum"));
 		});
 		console.log(checkArr);
 		
 		$.ajax({
 			url : "cartDelete.do",
 			type : "post",
 			data : {chbox : checkArr},
 			success : function(result){
 				if(result == 1){				
 					console.log(id);
 					location.href = "getCartList.do?memId=" + id;
 				}else{
 					alert("삭제 실패");
 				}
 			}
 		})
 		
 	}
});

//수량 + 버튼
function BtnPlus(btn){
	let quan = btn.prev().val();
	let stock = btn.data("stock");
	let discountPrice = btn.data("saleprice");
	quan++;
	let discountTotPrice = discountPrice * quan;

	if(stock < quan){
		alert("선택한 수량이 남은 재고보다 많습니다.");
	}
	
	btn.prev().val(quan);
	btn.parent().parent().next().text(discountTotPrice);
	
	total_calcul();
	
}

//수량 - 버튼

function BtnMinus(btn){
	let quan = btn.next().val();
	let stock = btn.next().next().data("stock"); //상품 
	let discountPrice = btn.next().next().data("saleprice"); //1개가격 할인가
	quan--;
	
	console.log(quan);
	console.log(stock);
	console.log(discountPrice);
	
	if(quan == '0') {
		alert('0 이하로는 설정할 수 없습니다. ');
	}
	
	else if(stock < quan){
		alert("선택한 수량이 남은 재고보다 많습니다.");
	}
	
	let discountTotPrice = discountPrice * quan;

	
	btn.next().val(quan);
	btn.parent().parent().next().text(discountTotPrice);
	total_calcul();
	
}

$('.allCheck').on('change', function(){
 	if($(this).prop('checked')) {
 		$(".prdCheck").prop("checked", true); 
 		$(".prdCheck").parent().attr('class', 'check-label checked'); // 라벨의 아이콘을 체크 상태로 바꿈
 		chCount();
 	}else{
 		$(".prdCheck").prop("checked", false);
 		$(".prdCheck").parent().attr('class', 'check-label'); // 라벨의 아이콘을 체크 상태로 바꿈
 		chCount();
 	}
 	
 	total_calcul();
});


//주문으로 넘어가기전 실행

 document.getElementById('placeAnOrder').onclick = function() {
	
        //전송전 데이터 가공
        var form = document.createElement('form');
        form.setAttribute('id', 'process');
        form.setAttribute('charset', 'UTF-8');
        form.setAttribute('action', 'order.do');

        var prdCnt = $('.price1').length;
        //상품코드
        var input1 = document.createElement('input');
        input1.name = 'pNum';
        input1.type = 'hidden';
        let pNum  = [];
        
        $("input[name='prdCheck']:checked").each(function(){
        	pNum.push($(this).attr("data-pNum"));
 		});
   
        input1.value = pNum;
        form.appendChild(input1);

        //수량
        var input2 = document.createElement('input');
        input2.name = 'pCnt';
        input2.type = 'hidden';
        let pCnt = [];
        for (var i = 0; i < prdCnt; i++) {
            if (
                $('.prdCheck')
                    .eq(i)
                    .prop('checked')
            ) {
                let value = $('.clk_count')
                    .eq(i)
                    .val();
                pCnt.push(value);
            }
        }
        input2.value = pCnt;
        form.appendChild(input2);


        //배송비
        var input4 = document.createElement('input');
        input4.name = 'shippingFee';
        input4.type = 'hidden';
        let shippingFee = $('#amountCourier').text();
        input4.value = shippingFee;
        form.appendChild(input4);

        document.body.appendChild(form);

        var price = parseInt($('#amountTotal').text());
        let stockTest = new Array();
        let cnt = $('.qty').length;
        for (i = 0; i < cnt; i++) {
            stockTest[i] = $('.stock')
                .eq(i)
                .val();
            if (stockTest[i] == 0) {
               	alert('상품 수량을 확인해주세요')
                return;
            }
        }
        
        form.submit();
        
}


</script>
</html>