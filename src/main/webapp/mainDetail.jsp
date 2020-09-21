<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<input type="hidden" id="pNum" value="${mainDetail.pNum}">
	<input type="hidden" id="upperCategoryCategory" value="${mainDetail.upperCategory}">
	<input type="hidden" id="subCategory" value="${mainDetail.subCategory}">
	<input type="hidden" id="subCategory2" value="${mainDetail.subCategory2}">
	<input type="hidden" id="sessionId" value="${userSession.id}">
	<input type="hidden" id="stock" value="${mainDetail.stock}">
	
	<div>${mainDetail.upperCategory}</div>
		<span>>${mainDetail.subCategory}</span>
		<div>>${mainDetail.subCategory2}</div>
	<div>${mainDetail.pName}</div>
		<img id="detailImg" src="/app/resources/img/${mainDetail.thumnailImg}" width="350px;" height="350px;"/>
		<div class="price">${mainDetail.price}원</div>
	<div>${mainDetail.discountRate}%</div>
	<div>${mainDetail.salePrice}원</div>
	 <div>구매수량</div>
     <div>
          <span class="goods-count">
              <button class="minus"></button>
              <input type="text" value="1" class="qty" readonly>
              <button class="plus"></button>
          </span>
     </div>
      <div class="goods-total__price">
            <span class="goods-total__tit">총 상품 금액:</span>
            <span class=total></span>
            <span class=won>원</span>
      </div>
      	     <div class="goods-total__btns">
                <div class="g-btn btn-always">구매하기</div>
                <c:if test="${mainDetail.stock <= 0}">
                	<div class="g-btn btn-save btn-save--off">장바구니 담기</div>
                </c:if>
                <c:if test="${mainDetail.stock != 0}">
                	<div class="g-btn btn-save">장바구니 담기</div>
                </c:if>
            </div>
</div>
      
 <div class="notice-modal hidden">
 <div class="notice-modal__overlay"></div>
 <div class="notice-modal__content">
     <div class="notice-modal__header">
         <span class="notice-modal__tit">알림메시지</span>
         <button class="notice-modal__close-btn"></button>
     </div>
     <div class="notice-modal__message">
         <span></span>
     </div>
     <div class="notice-modal__footer">
         <button class="notice-modal__yes-btn">
             확인
         </button>
     </div>
</div>  
</div>   
</body>
<script>

    const minusBtn =document.querySelector(".minus");
    const plusBtn = document.querySelector(".plus");

    const qty = document.querySelector(".qty");
    const total = document.querySelector(".total");
    
    const price = document.querySelector(".price");
    let qtyCount = qty.value;
      
    const goodsPrice = (parseInt(price.innerHTML));
  
    if(qtyCount == 1 ){
    	total.innerText
    }
   
    
  	plusBtn.addEventListener("click",function(){
    	
        qtyCount++;
        qty.value = qtyCount;   
        total.innerText = goodsPrice * qtyCount;

    });

    minusBtn.addEventListener("click",function(){
        if(qtyCount <= 1) return;

        qtyCount--;
        qty.value = qtyCount;
        total.innerText =  goodsPrice * qtyCount;
        
    });
    

    const saveBtn = document.querySelector(".btn-save");
    const modal = document.querySelector(".notice-modal");
    const overlay = modal.querySelector(".notice-modal__overlay");
    const closeBtn = modal.querySelector(".notice-modal__close-btn");
    const yesBtn = modal.querySelector(".notice-modal__yes-btn");
    
    function closeModal(){
        modal.classList.add("hidden")
    }

   function openModal(){
    	$('.notice-modal__message').html("");
    	if($("#sessionId").val() == ""){
    		$('.notice-modal__message').text("로그인 하신 후 장바구니 등록을 해주세요.")
    	}else{
    		//장바구니 등록하는 당시에 재고보다 장바구니에 넣을 물품이 더 클 경우 방지 
			$.ajax({
        		type : "post",
        		url : "addCartList.do",
        		data : {
        				'pNum' : $('#pNum').val(),
        			    'pCnt' : $('.qty').val(),
        			    'stock' : $('#stock').val()
        				},
        		dataType : "json",
        		success : function(data){
        			console.log(data.gubun);
        			if(data.gubun=='1'){
        				$('.notice-modal__message').text("이미 동일한 상품이 장바구니에 존재합니다.");
        			}else if(data.gubun=='2'){
        				console.log($('#detailImg').prop('src'));
        				$('.notice-modal__message').append($('<img>',{
        					src : $('#detailImg').prop('src'),
        					height : "70px",
        					width : "70px"
        				})).append("&emsp;장바구니에 담겼습니다.");
        				
        				$('.gnb__cart-count').text(data.memCart);
        			}else if(data.gubun=='3'){
        				$('.notice-modal__message').text("재고보다 장바구니에 등록할 갯수가 부족합니다.");
        			}
        		},
        		error : function(error){
        			
        		}
        		
        	});
    	}
    	 modal.classList.remove("hidden");
    }
   
    saveBtn.addEventListener("click",openModal);
    overlay.addEventListener("click",closeModal);
    closeBtn.addEventListener("click",closeModal);
    yesBtn.addEventListener("click",closeModal);
    
    
    
    
    
</script>
<style>
/* 모달 */
.notice-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 300;
}
.notice-modal__overlay {
    background-color: rgba(0, 0, 0, 0.6);
    width: 100%;
    height: 100%;
    position: absolute;
}
.notice-modal__content {
    background-color: white;
    box-sizing: border-box;
    width: 500px;
    text-align: center;
    position: relative;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}

.notice-modal__close-btn {
    all: unset;
    width: 20px;
    height: 20px;
    background-image: url('https://res.kurly.com/pc/etc/old/images/common/icon-close-button.png');
    background-color: transparent;
    border: 0;
    background-repeat: no-repeat;
    cursor: pointer;
}
.notice-modal__header {
    padding: 28px 25px 15px 25px;
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #ddd;
}
.notice-modal__tit {
    font-size: 14px;
    font-weight: bold;
    color: #00666b;
}
.notice-modal__message {
    height: 110px;
    color: #4c4c4c;
    font-size: 13px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 400;
}
.notice-modal__footer {
    height: 100px;
    background-color: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
}
.notice-modal__yes-btn {
    all: unset;
    width: 150px;
    height: 50px;
    background-color: #00666b;
    color: white;
    cursor: pointer;
}

.hidden {
    display: none;
}

.check-label {
    display: inline-block;
    width: 16px;
    height: 20px;
    background: #fff
        url('https://res.kurly.com/pc/service/order/1908/ico_checkbox_off.png')
        no-repeat 0 2px;
    font-size: 14px;
    color: #000;
    cursor: pointer;
    margin-right: 5px;
}
.check-label input {
    position: relative;
    z-index: -1;
}
.checked {
    background: url('/mintProject/shop/storage/mint/icon/checkbox.png')
        no-repeat 0 2px !important;
}
.g-btn {
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    border: #00666b 1px solid;
    color: #00666b;

    height: 52px;
    font-size: 16px;
    font-weight: 250;
    border-radius: 3px;
}

</style>
</html>