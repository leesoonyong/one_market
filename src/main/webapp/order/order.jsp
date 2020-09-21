<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
    
.wrap {
    min-width: 1084px;
    min-height: 10%;
    position: relative;
}   
    
/* container CSS*/
::placeholder {
    color: #c3c3c3;
    opacity: 1;
}
.container .container_inner .contents_wrap .content_main {
    position: relative;
    width: 1084px;
    margin: 0 auto;
    height: 100%;
}
.order, .header_wrap, .fusion-order-tab {
    width: 1084px;
    margin-left: auto;
    margin-right: auto;
}    
.container .container_inner {
    position: relative;
    width: 100%;
    min-width: 1084px;
} 
.container .container_inner .contents_wrap .content_main {
    position: relative;
    width: 1084px;
    margin: 0 auto;
    height: 100%;
}
.container.order .container_inner .contents_wrap {
    width: 100%;
    min-height: auto;
    padding-bottom: 100px;
}
    
.container {
    min-height: 100%;
}    

body {
    word-break: break-all;
}

body, input, textarea, select, button, table {
    font-family: "Apple SD Gothic Neo",'돋움',Dotum,sans-serif;
    font-size: 12px;
    color: #333;
}
    
/* order_wrap CSS*/
.order_wrap {
    padding-bottom: 145px;
}
/* order_pay_info CSS*/    
.order_pay_info, .order_info {
    position: relative;
}
    
    
h4.tit.shipps_info {
    background-position: -206px -402px;
    width: 98px;
    height: 24px;
}
    
h4.tit {
    margin-top: 50px;
    margin-bottom: 16px;
    font-size: 20px;
    font-family: 'Nanum Barun Gothic';
}
.tit {
    display: inline-block;
    overflow: hidden;
    vertical-align: top;
}
    
body, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, table, th, td, form, fieldset, legend, input, textarea, button, select {
    margin: 0;
    padding: 0;
}
    
/* table CSS*/    
.table_info.type1 {
    border-top: 1px solid #333;
    border-bottom: 1px solid #ddd;
}
.table_info {
    width: 100%;
}  
    
table {
    border-collapse: collapse;
    border-spacing: 0;
}
    
.table_info tr:first-child > th, .table_info tr:first-child > td {
    border-top: 0;
}    
    
order_info .table_info th {
    padding: 23px 0 19px 20px;
    width: 144px;
    line-height: 16px;
}
    
.table_info.type1 th {
    font-size: 12px;
    vertical-align: top;
}    
.table_info th {
    background: #f9f9f9;
    color: #666;
}
    
    
::placeholder {

    color: #c3c3c3;

}
::placeholder {

    color: #c3c3c3;
    opacity: 1;

}

.table_info tr:first-child > th, .table_info tr:first-child > td {

    border-top: 0;

}
.order_info .table_info th {

    padding: 23px 0 19px 20px;
    width: 144px;
    line-height: 16px;

}
.table_info.type1 th {

    padding: 23px 15px 22px 20px;
    font-size: 12px;
    vertical-align: top;

}
.table_info th {

    padding: 18px 15px 16px 20px;
    border-top: 1px solid #ededed;
    background: #f9f9f9;
    color: #666;
    vertical-align: middle;

}
th, td {
    text-align: left;
}
    
.order_info .table_info td {
    padding: 0 0 0 20px;
    font-size: 12px;
    vertical-align: top;
    color: #666;
}
.table_info .info_order_user {
    padding-top: 21px;
    padding-bottom: 17px;
}
    
.table_info .info_order_user > span {
    line-height: 20px;
}
em, address {
    font-style: normal;
}
.table_info .info_order_user .desc {
    color: #999;
}    
.tooltip {
    display: inline-block;
}  
.order_info .table_info .tooltip {
    position: relative;
    line-height: 20px;
    vertical-align: middle;
}  
.order_wrap .tooltip_text {
    background: none;
}  
.tooltip .tooltip_text {
    float: left;
    color: #666;
}
.order_info .table_info .tooltip .tooltip_text > span, .order_info .table_info .tooltip .tooltip_text a {
    float: left;
}
.order_info .table_info .tooltip .tooltip_text .btn_link {
    margin-top: -1px;
}
a {
     cursor: pointer;
} 
.order_wrap .btn_link {
    font-size: 11px;
    text-decoration: underline;
    color: #707b92;
}   
.tooltip .i_over {
    position: relative;
    width: 18px;
    height: 18px;
}
.order_info .table_info .tooltip .tooltip_text .i_over {
    margin-left: 6px;
}
.tooltip .i_over .ico {
    float: left;
    width: 18px;
    height: 18px;
    background-position: 0 -30px;
}
table_info .info_order_user .tooltip .layer {
    left: -20px;
    min-width: 170px;
    z-index: 1;
    word-break: break-all;
} 
 .tooltip .layer.left {
    top: 26px;
}
.tooltip .layer {
    display: none;
    position: absolute;
    padding: 13px 15px;
    border: 1px solid #c3c3c3;
    background-color: #fff;
    font-size: 11px;
    line-height: 14px;
    color: #999;
    text-indent: 0;
}
.table_info .info_order_user .bar, .table_info .info_ship_schedule .bar, .order_finish .finish_info .order_info .table_info td .bar, .order_pay_info .pay_way .btn_tab li a.tit_kakao em, .section_btn, .bizform .layer_pop_foot {
    font-size: 0;
}
.table_info .info_order_user .bar {
    margin: 0 5px;
}
.table_info .info_order_user .bar, .table_info .info_ship_schedule .bar, .order_finish .finish_info .order_info .table_info td .bar {
    display: inline-block;
    width: 1px;
    height: 11px;
    background-color: #c3c3c3;
    vertical-align: middle;
}
.table_info .info_deliver {
    padding-top: 10px;
    padding-bottom: 10px;
    vertical-align: top;
}
.table_info .info_deliver > span {
    position: relative;
    float: left;
}    
.table_info .input_area {
    padding: 0;
} 
.table_info .info_deliver input {
    width: 278px;
} 
.input_area .input_default {
    line-height: 38px;
}    
.input_area .input_default {
    display: inline-block;
    height: 36px;
    padding: 0 10px;
    border: 1px solid #ddd;
    color: #666;
}
.order_info .table_info .bd_none th {
    padding-top: 20px;
}
.order_wrap .bd_none th, .order_wrap .bd_none td {
    border: 0;
}    
.table_info .input_txt {
    width: 15px;
    line-height: 38px;
    text-align: center;
}
.table_info .phone .input_area > input {
    width: 68px;
} 

.input_area {
    position: relative;
    padding: 10px 0;
}
.table_info .addr_zip .input_area > input {
    width: 172px;
}   
.table_info .addr_detail {
    margin-top: 15px;
}
.table_info .addr_detail .input_area.detail1 {
    padding-left: 0;
}
.input_area .inpt_default.disabled {
    background-color: #f2f2f2;
    color: #aaa;
}
}
.table_info .addr_detail .input_area .detail2 input {
    width: 497px;
}
.table_info .addr_detail .input_area {
    float: left;
    padding-left: 8px;
}    
#request{
    margin-top: 12px;    
}    
    
/*주문 상품 정보 CSS */
h4.tit.odr_pdct_info {
    background-position: 0px -322px;
    width: 147px;
    height: 24px;
}
    
.table_info.type2 {
    border-bottom: 1px solid #ddd;
}    
caption {
    display: none;
}    
.order_prd .table_info.type2 thead th {
     border-top: 1px solid #333;
    border-bottom-color: #c3c3c3;
}    
.table_info.type2 thead th {
    border-bottom: 1px solid #ddd;
}    
.order_prd .table_info th {
    padding: 16px 0 13px;
    line-height: 20px;
}    
/* 주문 상품 정보 중간 CSS*/
.table_info.type2 th {
    font-size: 12px;
    text-align: center;
}
.order_prd .table_info .td_info {
    width: 560px;
    padding: 20px 0;
    text-align: left;
}
.table_info tr:first-child > th, .table_info tr:first-child > td {
    border-top: 0;
} 
.order_prd .table_info td {
    line-height: 20px;
}
.table_info.type2 td {
    font-size: 14px;
}  
.order_prd .table_info .td_info .basic_type {
    overflow: hidden;
    padding-left: 20px;
}
    
.order_prd .table_info .td_info .basic_type .thum {
    position: relative;
    float: left;
    width: 70px;
    height: 70px;
    margin-right: 20px;
}    

.order_prd .table_info .thum img, .section_basket .table_info .thum img {
    width: 100%;
    height: 100%;
    display: block;
}    
img, fieldset, button {
    border: 0;
}
.order_prd .table_info .td_info .basic_type .prd_info {
    position: relative;
    overflow: hidden;
    min-height: 70px;
}
    
.order_prd .table_info .mall {
    display: block;
    margin-right: 80px;
    max-width: 452px;
    font-size: 11px;
    line-height: 14px;
    color: #999;
}  
.order_prd .table_info .mall + .title {
    margin-top: 4px;
}
.order_prd .table_info .title {
    margin-right: 80px;
    max-width: 452px;
    min-height: 37px;
    font-weight: bold;
    color: #666;
}    
.order_prd .none_count .option_price {
    margin-top: 1px;
    margin-bottom: 10px;
}    

.order_prd .table_info .option_price {
    position: relative;
    height: 20px;
}    
.order_prd .table_info .option_price .price {
    font-weight: normal;
}    
.order_prd .table_info .price {
    font-family: tahoma,Dotum;
    vertical-align: -1px;
}    
.order_prd .table_info .won, .order_prd .table_info .disc {
    margin-left: 1px;
    font-size: 11px;
}
ul, ol {
    list-style: none;
}
.order_prd .option_wrap {
    margin-left: 110px;
    margin-bottom: -20px;
}  
.order_prd .option_wrap li {
    position: relative;
    padding: 16px 126px 14px 0;
    border-top: 1px solid #ededed;
    font-size: 12px;
    line-height: 18px;
    color: #666;
    word-break: break-all;
}  
.order_prd .option_qty {
    position: absolute;
    right: 20px;
    bottom: 16px;
    font-size: 12px;
    color: #666;
} 
    
.order_prd .table_info .price {
    font-family: tahoma,Dotum;
    font-weight: bold;
    vertical-align: -1px;
}    
.table_info.type2 td {
    font-size: 14px;
    text-align: center;
}    
    
.order_prd .table_info .disc{
    padding-right: 5px;
}
.order_prd .td_discount {
    color: #e55;
}    
.table_info.type2 td ~ td {
    border-left: 1px solid #ededed;
}
.order_prd .prd_modify {
    margin-top: 11px;
    font-size: 11px;
    text-align: right;
    color: #999;
}   
.order_pay_wrap {
    position: relative;
    z-index: 1;
} 
.order_pay_wrap .order_pay_info {
    float: left;
    width: 716px;
}       
.order_pay_info, .order_info {
    position: relative;
}
    
.table_info.type1 {
    border-top: 1px solid #333;
    border-bottom: 1px solid #ddd;
}    
.order_pay_wrap .order_pay_info .table_info th {
    padding: 21px 19px;
    width: 126px;
    font-size: 12px;
    line-height: 16px;
} 
.order_pay_wrap .order_pay_info .table_info td {
    padding: 10px 20px;
    font-size: 12px;
    line-height: 20px;
} 
.order_pay_info .pay_way .btn_tab {
    overflow: hidden;
    margin: -7px 0 10px -10px;
    height: auto;
}
.order_pay_info .pay_way .btn_tab li {
    margin-top: 7px;
    margin-left: 13px;
    width: 160px;
    text-align: center;
    border-width: 1px 0;
} 
.btn_tab li.on {
    border-color: #4d5d7b;
    background-color: #4d5d7b;
}  
.btn_tab li {
    float: left;
    position: relative;
    border: 1px solid #c3c3c3;
}
/* 결제수단 CSS */ 
.order_pay_info .pay_way .btn_tab li a {
    display: block;
} 
.btn_tab li.on a {
    color: #fff;
} 
a {
    color: #333;
    text-decoration: none;
    cursor: pointer;
}    
.btn_tab li.on a .left_rnd {
    background-position: 0 0;
}
.btn_tab li a .left_rnd {
    left: -3px;
}    
.btn_tab li a .left_rnd, .btn_tab li a .right_rnd {
    display: inline-block;
    position: absolute;
    top: -1px;
    width: 3px;
    height: 38px;
    }
.btn_tab li a .right_rnd {
    right: -3px;
    background-position: 100% -43px;
}    
btn_tab li a em {
    display: inline-block;
    padding: 2px 15px 0;
}    
em, address {
    font-style: normal;
}   
.btn_tab li a {
    line-height: 34px;
}  
    
/* 결제 금액 CSS */  
.order_price_wrap {
    float: right;
    width: 348px;
}    
.order_price_info {
    width: 100%;
    background-color: #f2f3f6;
    border-top: 1px solid #333;
}
.order_price_info .price_inner {
    padding: 16px 40px 40px;
}    
.order_price_info .price_inner .price_list .price_title {
    float: left;
    font-size: 14px;
    letter-spacing: -1px;
    color: #666;
} 
.order_price_info .price_inner .price_list li > span {
    line-height: 28px;
    font-weight: bold;
}
.order_price_info .price_inner .price_list .price_desc {
    display: block;
    overflow: hidden;
    height: 28px;
    text-align: right;
    color: #333;
}
.order_price_info .price_inner .price_list .price_desc {
    text-align: right;
    color: #333;
}  
.order_price_info .price_inner .price_list .price {
    display: inline-block;
    padding-right: 1px;
    font-family: tahoma,Dotum;
    font-size: 18px;
    vertical-align: -1px;
}    
.order_price_info .price_inner .price_total {
    margin: 36px -10px 0;
    padding: 30px 10px 0;
    border-top: 1px solid #ddd;
} 
.order_price_info .price_inner .price_total dt {
    font-size: 16px;
    line-height: 20px;
    font-weight: bold;
    letter-spacing: -1px;
}    
.order_price_info .price_inner .price_total dd {
    margin-top: 4px;
    font-size: 16px;
    line-height: 40px;
    font-weight: bold;
    text-align: right;
    color: #e55;
}    

.order_price_info .price_inner .price_total a {
    display: block;
    margin: 21px -10px 0 -7px;
}    
    
.btn_sys[class*="big_xxl"], .btns_sys[class*="big_xxl"], .btn_color[class*="big_xxl"] {
    height: 70px;
    line-height: 70px;
}   
.btn_sys[class*="red_"], .btn_sys.guidance, .btns_sys[class*="red_"], .btns_sys.guidance, .btn_color[class*="red_"], .btn_color.guidance {
    border-color: #e55;
    background-color: #e55;
}
.btns_sys.red_big_xxl {
    background-position: 100% -849px;
    font-size: 20px;
    font-weight: bold;
    color: #fff;
}    
.btn_sys, .btns_sys, .btn_color {
    box-sizing: border-box;
    padding: 0 5px;
    border: 1px solid #c3c3c3;
    border-radius: 3px;
    background: #fff;
    text-align: center;
}    
.table_info .info_deliver .btn-default{
    margin-left: 10px;
    width: 150px;
}     

#btnPaymentSubmit{
 padding: 10px;
 padding-right: 10px;
 margin-top:30px;
 text-align: center;
}

#payment{
	font-size: 20px;
	font-weight: bold;	
	text-align: center;
}

</style>
<title>Insert title here</title>
</head>
<body>
      <div id="wrap" class="wrap">
      	<!-- Header 영역 -->
      	<div class="header wrap fusion-order"></div>
      	<!-- //Header 영역 -->
      	<div class="container order fusion-order">
			<!--  <form action="">-->
				<div class="container_inner">
					<!-- 콘텐츠 영역 -->
					<div class="content_wide">
						<!-- 페이지 타이틀 영역 -->
						<div class="order_header">
							<div class="order_title">
								<h3 class="tit odr_head">주문/결제</h3>
								<div class="order_process"></div>
							</div>
						</div>
					</div>
					<!-- 기본 콘텐츠 영역 -->
					<div class="content main">
						<div class="order_wrap">
							<div class="order_info member">
								<h4 class="tit shipps_info">배송 정보</h4>
								<table class="table_info type1">
									<caption>배송 정보</caption>
									<tbody>
										<tr>
											<th>주문자</th>
											<td>
												<div class="info_order_user">
													<span>
														<em>${vo.name}</em>
														<span class="desc">
															(보내시는 분
															<em id="senderNmGubun"></em>
															<em id="senderNm"></em>
															<span class="tooltip">
																<span class="tooltip_text">
																	<a id="modifysenderNm" class="btn_link"
																		href="javascript:void(0)"
																		onclick="ordDiv.modifySenderName();">
																		입력																
																	</a>
																	<span class="i_over">
																		<span class="ico">?</span>
																	</span>
																</span>
															</span>
															)
														</span>
													</span>
													<span id="memberEmail">
													${vo.email}
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>
												<div class="info_deliver">
													<span class="input_area">
														<input id="receiveName" class="input_default"
																type="text" value="${vo.name}" maxlength="20"/>
													</span>
												</div>
											</td>
										</tr>
										<tr class="bd_none">
											<th class="info">연락처</th>
											<td>
												<div class="info_deliver phone">
													<c:set var="phone" value="${vo.phone}"/>
													<span class="input_area">
														<input type="text" id="mobile1" class="input_default" value="${fn:substring(phone,0,3)}" size="3" maxlength="3" />
													</span>
													<span class="input_txt">-</span>
													<span class="input_area gwnan">
														<input type="text" id="mobile2" class="input_default" value="${fn:substring(phone,3,7)}" size="4" maxlength="4" />
													</span>
													<span class="input_txt">-</span>
													<span class="input_area phone2">
														<input type="text" id="mobile3" class="input_default" value="${fn:substring(phone,7,11)}" size="4" maxlength="4" />
													</span>
												</div>
											</td>
										</tr>
										<tr class="bd_none">
											<th>주소</th>
											<td>
												<div class="info_deliver">
													<div class="addr_zip">
														<span class="input_area">
															<input type="text" id="sample6_postcode" name="adrCode" class="input_default" placeholder="우편번호"
																	value="${vo.adrCode}"> 
														</span>
														<input type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
													</div>
													<div class="addr_detail">
														<span class="input_area detail1">
															<input type="text" id="sample6_address" class="input_default" name="adr1"placeholder="주소"
																	value="${vo.adr1}">
														</span>
														<span class="input_area detail2">
															 <input type="text"id="sample6_detailAddress" name="adr2" class="input_default"placeholder="상세주소"
															 		value="${vo.adr2}">
														</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th class="info">배송시 요청사항</th>
											<td>
												<div class="info_deliver input_area">
													<input type="text" id="request" class="input_default" maxlength="20"/>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<c:if test="${list != null }">
								<!-- 주문상품 정보 회원 -->
									<div class="order_prd">
										<h4 class="tit odr_pdct_info">주문상품 정보</h4>
										<table class="table_info type2">
											<caption>장바구니 상품목록</caption>
											<thead>
												<tr>
													<th>상품정보/수량</th>
													<th>상품금액</th>
													<th>할인금액</th>
													<th>할인적용금액</th>
													<th>배송비</th>
												</tr>
											</thead>
											<tbody>
												<!-- 장바구니 상품 노출 시작 -->
											<c:forEach var="PRODUCT" items="${list}">
												<tr>
													<td class="td_info">
														<input type="hidden" id="pNum" class="pNum" value="${PRODUCT.P_NUM}"/>
														<div class="basic_type none_count">
															<span class="thum">
																<img src = "/app/resources/img/${PRODUCT.THUMNAIL_IMG}">
															</span>
															<div class="prd_info">
																<span class="mall">${PRODUCT.BRAND_NAME}</span>
																<div id="title"class="title">${PRODUCT.P_NAME}</div>
																<div class="option_price">
																	<span class="price">${PRODUCT.PRICE}</span>
																	<span class="won">원</span>
																</div>
																
															</div>
														</div>
														<ul class="option_wrap">
															<li>
															<!-- 텍스트 옵션이 존재할경우 -->
																<div>
																	
																	<em>${PRODUCT.P_NAME}</em>
																
																</div>
																<div class="option_qty">${PRODUCT.P_CNT}</div>
															</li>
														</ul>
													</td>
													<td>
														<span class="price price1">${PRODUCT.PRICE}</span>
														<span class="won">원</span>
													</td>
													<td>
														<span class="disc">(-)</span>
														<span id="prodDiscountPrice" class="price discountPrice">0</span>
														<span class="won">원</span>
													</td>
													<td class="td_discount">
														<span id="applyProdPrice" class="price price2">
														 ${PRODUCT.SALEPRICE}</span>
														 <span class="won">원</span>
													</td>
													<!-- 배송비 노출 시작 -->
													<td id="ship" class="td_delivery" rowspan="1">
														<span id="shippingFee" class="deli_after price">${PRODUCT.SHIPPINGFEE}</span>
													</td>
													<!-- 배송비 노출 종료 -->
												</tr>
												<!-- 장바구니 상품 노출 종료 -->
											</c:forEach>	
											</tbody>
										</table>
										<div class="prd_modify">
											상품/옵션 변경 및 수량 조절은 장바구니 또는 상품 상세페이지에서 가능합니다.
											<a class="btn_sys sml_b" href="#">
											</a>
										</div>
									</div>
							</c:if>
							<!-- 콘텐츠 영역 -->
							<div class="order_pay_wrap">
								<div id="orderPayInfo" class="order_pay_info">
									<h4 class="tit payment_info">결제 정보</h4>
									<table class="table_info type1">
										<caption>결제 정보</caption>
										<tbody>
											<tr id="pgPayMent"class="pay_way">
												<th scope="row">결제수단</th>
												<td>
													<div class="tab_wrap">
														<ul id="paymentTab" class="btn_tab">
															<li id="KAKAO" class="">
																<a href="#none">
																	<span class="left_rnd"></span>
																	<em>카카오페이</em>
																	<span class="right_rnd"></span>
																</a>
															</li>
															<li id="TOSS" class="">
																<a href="#none">
																	<span class="left_rnd"></span>
																	<em>토스</em>
																	<span class="right_rnd"></span>
																</a>
															</li>
															<li id="SAMSUNGPAY" class="">
																<a href="#none">
																	<span class="left_rnd"></span>
																	<em>삼성페이</em>
																	<span class="right_rnd"></span>
																</a>
															</li>
															<li id="PAYCO" class="">
                                                                <a href="#none">
                                                                    <span class="left_rnd"></span>
                                                                    <em>페이코</em>
                                                                    <span class="right_rnd"></span>
                                                                </a>    
															</li>
															<li id="PAYNOW" class="">
                                                                <a href="#none">
																    <span class="left_rnd"></span>
																    <em>페이나우</em>
																    <span class="right_rnd"></span>
                                                                </a>    
															</li>
														</ul>
														<!-- 여기 간편결제 QR코드 들어갈 자리 -->
														<div class="tab_con_wrap"></div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
                                    </div>
									<div class="order_price_wrap">
										<h4 class="tit payment_money">결제 금액</h4>
										<div class="order_price_info">
											<div class="price_inner">
												<div class="price_list">
													<ul>
														<li>
															<span class="price_title">상품금액</span>
															<span class="price_desc">
																<strong id="lastTotPirce" class="price"></strong>
																원
															</span>
														</li>
														<li>
															<span class="price_title">배송비</span>
															<span class="price_desc">
																<strong id="sumShipPrice" class="price">0</strong>
																원
															</span>
														</li>
														<li>
															<span class="price_title">할인금액</span>
															<span class="price_desc">
																<em class="disc">(-)</em>
																<strong id="subDiscountPrice" class="price">
			
																</strong>
																원
															</span>
														</li>
													</ul>
												</div>
												<div class="price_total">
													<dl>
														<dt>최종 결제금액</dt>
														<dd>
															<span id="lastPrice" class="price">
															</span>
															원
														</dd>
													</dl>
													<button id="btnPaymentSubmit" class="btns_sysred_big_xxl settlement btn btn-danger">
														<span id="payment">결제하기</span>
													</button>
												</div>
											</div>
										</div>
									<div class="order_t"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!--  </form>-->    	
      	</div>
      </div>
</body>
<script>

function sample6_execDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
      
            
            } 
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

$(function(){
	var cnt = $('.price1').length; //상품 개수
	let pCnt = new Array(cnt); //수량
	
	let stock = new Array(cnt); //재고
	let pName = new Array(cnt); //이름
	
	var price = new Array(cnt); // 상품가격
	var discountPriceMinus = new Array(cnt); // 할인된 금액
	var salePrice = new Array(cnt); // 할인적용금액
	var onePrdPrice = new Array(cnt); // 상품개당가격
	let totDiscountPrice = new Array(cnt); //할인적용가 * 수량
	let totPrice = new Array(cnt); // 상품정가 * 수량
	let totSalePrice = new Array(cnt); // 할인금액 합계 
	let shippingFee = new Array(cnt); // 배송비
	
	
	let lastPrice = 0; //결제금액 합계
	let lastTotPrice = 0; // 정가금액 합계
	let lastTotSalePrice = 0; // 할인금액 합계
	let lastShippingFee = 0;
	
	
	
	dataSet();//상품정보 박스 데이터 가공(할인적용가, 최종결제금액)
	paymentDataSet()//결제창 데이터 가공
	
	function dataSet(){
		for(var i=0; i<cnt; i++){
			
		price[i] = parseInt($('.price1').eq(i).text()); //상품 금액 모음
		salePrice[i] = parseInt($('.price2').eq(i).text()); // 세일 금액 모음
		shippingFee[i] = parseInt($('.deli_after').eq(i).text());// 배송비 모음
		
		
		
		discountPriceMinus[i] = parseInt(price[i] - salePrice[i]); // 할인된 금액 모음
		
		pCnt[i] = parseInt($('.option_qty').eq(i).text());
		pName[i] = $('.title').eq(i).text();
		
		$(".discountPrice").eq(i).text(discountPriceMinus[i]);
		
		totSalePrice[i] = salePrice[i] * pCnt[i]; 
		totPrice[i] = price[i] * pCnt[i];
		
		
		lastTotPrice += totPrice[i]; //정가금액합계
		
		lastTotSalePrice += discountPriceMinus[i]; //할인금액 합계
		
		lastShippingFee += shippingFee[i];
		
		
		lastPrice += totSalePrice[i] ; //최종합계금액
		
		
		lastPrice2 = lastTotPrice - lastTotSalePrice + lastShippingFee;
		
		$('#sumShipPrice').text(lastShippingFee); //배송비
		$('#lastTotPirce').text(lastTotPrice);//정가
		$('#subDiscountPrice').text(lastTotSalePrice); //할인가
		$('#lastPrice').text(lastPrice2);
		}
	}


    
    function paymentDataSet() {
    	let topProductName = $('.title').eq(0).text();
    	console.log(topProductName);
    	let otherCnt = cnt-1;
    	
    	let name = '';
    	var tel1 = $('#mobile1').val();
    	var tel2 = $('#mobile2').val();
    	var tel3 = $('#mobile3').val();
    	let tel = tel1 + tel2 + tel3;

    	let pNum = new Array(cnt);
    	let delevery = $('#lastPrice').text();
    	
    	for(i=0; i<cnt; i++){
    		pNum[i] = $('.pNum').eq(i).val();
    	}
    	
    	lastPriceSet = parseInt($('#sumShipPrice').text());
    	
    	
    	document.getElementById('btnPaymentSubmit').onclick = function(){
    		let requst = $('#request').val();
    		name = $('#receiveName').val();
    		addr1 = $('#sample6_postcode').val();
    		addr2 = $('#sample6_address').val();
    		addr3 = $('#sample6_detailAddress').val();
	    	let request = $('#request').val();	
	        console.log(tel);
    		
	    	IMP.init('iamport');
	        IMP.request_pay({
	            pg : 'html5_inicis',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : topProductName +"외"+ otherCnt,
	            //amount: lastPriceSet, //가격
	            amount : 100, //가격
	            buyer_name : name ,
	            buyer_tel : tel,
	            buyer_addr : addr2,
	            buyer_postcode : addr1
	        }, function(rsp) {
	            if ( rsp.success ) {
	                var msg = '결제가 완료되었습니다.';
	                $.ajax({
	                	type: "POST",
	                	url: "orderService.do",
	                	contentType: 'application/json; charset=utf-8',
	                	data: JSON.stringify({
	                		name : rsp.buyer_name,
	                		phone : rsp.buyer_tel,
	                		adr1 : rsp.buyer_addr,
	                		adrCode : rsp.buyer_postcode,
	                		adr2 : addr3,
	                		request : request,
	                		fprice : lastPriceSet,
	                		dprice : delevery,
	                		pNum : pNum,
	                		pCnt : pCnt,
	                		price : price
	                	})
	                })
	                
	                
	 
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	            }
	            
	            sessionStorage.removeItem("basketCount");
	           
	            alert(msg);
	            location.href="/app/main/getMainList.do"
	        });
    		
  	  }
    }
    
    
});
</script>
</html>