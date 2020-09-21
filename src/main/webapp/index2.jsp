<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--CSS 연결 -->
<link
	href="${pageContext.request.contextPath}/resources/css/hojokinfo/style.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<h2>메인페이지</h2>
		</div>
		<hr>
		<h3>${userSession.id}님
			안녕하세요!<a href="logout.do">Log-out</a>	
		</h3>
			<ul>
				<li class="gnb__cart"><img
					src="https://res.kurly.com/pc/ico/1908/ico_cart_x2_v2.png"
					alt="장바구니" onclick="location.href='getCartList.do?memId=${userSession.id}';" />
					<c:if test="${memCart != null }">
						<span class="gnb__cart-count">${memCart}</span>
					</c:if>
					<a href="" class="cart_count" role="button"> <span
					class="screen_out">장바구니로 가기</span>
					</a>
				</li>
			</ul>
		<div class="row">
			<div class="col-md-4">
				<c:forEach var="main" items="${mainList}">
					<a href="getMain.do?pNum=${main.pNum}"> <img id="previewImg"
						src="/app/resources/img/${main.thumnailImg}" width="150px;"
						height="150px;" />
					</a>
					<p>${main.upperCategory}>${main.subCategory}>${main.subCategory2}</p>
					<p>${main.pName}</p>
					<p>${main.discountRate}</p>
					<p>${main.salePrice}</p>
				</c:forEach>
			</div>
		</div>
	</div>
<script>
let memId ='${userSession.id}';
</script>
			<h3>${userSession.id}님 안녕하세요!<a href="${contextPage.request.contextPath }/app/logout.do">Log-out</a></h3>
	<ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${contextPage.request.contextPath }/app/interior/interiorAllList.do">인테리어</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPage.request.contextPath }/app/cook/CookAll.do">레시피</a>
      </li>    
      <li class="nav-item">
        <a class="nav-link" href="${contextPage.request.contextPath }/app/honjokInfo/select.do">혼밥정보</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="/app/admin/productReg.jsp">상품등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/app/mypage/myPage.jsp">마이페이지</a>
      	</li>
    </ul>
				<div class="row">
<div class="col-md-4" >
	<c:forEach var="main" items="${mainList}">
				<a href ="getMain.do?pNum=${main.pNum}">				
					<img id="previewImg" src="/app/resources/img/${main.thumnailImg}" width="150px;" height="150px;"/>
				</a> 
				 <p>${main.upperCategory}>${main.subCategory}>${main.subCategory2}</p>
				 <p>${main.pName} </p>
				 <p>${main.discountRate} </p>
				 <p>${main.salePrice} </p>
	</c:forEach>
</div>
</div>
