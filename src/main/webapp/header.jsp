<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/73d0df04d6.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/app/resources/css/main/main.css" rel="stylesheet">
<title>main header</title>
<style>
#wrap.main {
    padding: 182px 0 0px;
}

#wrap {
    position: relative;
    top: 0;
    left: 0;
    right: 0;
    min-width: 1140px;
}

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
  background: white;
  border-bottom: 1px solid silver;
}

	/* 맨위로 */
	a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}

</style>
</head>

        <!--상단 띠배너-->
        <!--//상단 띠배너-->
 <div id="wrap" class="main">
        <nav id="skip_navi">
            <a href="#">본문 바로가기</a>
            <a href="#">메뉴 바로가기</a>
            <a href="#">하단 정보 바로가기</a>
        </nav>
        <!-- 맨위로 -->
        	<a  id="MOVE_TOP_BTN" onclick="">
        	 <i class="fas fa-arrow-alt-circle-up fa-4x" style="color:#4682B4;"></i>
       		</a>
        <header id="header"> 
            <h1 onclick="location.href='/app/main/getMainList.do'">
            </h1>
            <section class="top_nav">
                <nav>
                    <ul>
                        <c:if test="${empty sessionScope.userSession.id}">
                        <li><a href="${contextPage.request.contextPath}/app/login.jsp">로그인</a></li>
                    	</c:if>
                    	<c:if test="${!empty sessionScope.userSession.id}">
                        <li>${userSession.id}님 안녕하세요!<a href="${contextPage.request.contextPath}/app/logout.do">로그 아웃</a></li>
                    	</c:if>
                        <li>
                            <a href="/app/signUp.jsp">회원가입</a>
                        </li>
                        <li>
                            <a href="#">주문/배송조회</a>
                        </li>
                        <li>
                            <a href="#">고객센터</a>
                        </li>
                    </ul>
                    <!-- 로그인후 -->
                </nav>
            </section>
            <section class="cf_side">
                <div class="campain">
                    <a class="btn_campain" href="#">
                       	 혼족을 위한 맞춤형 쇼핑몰 원마켓
                    </a>
                    <!-- 캠페인 배너 -->
                </div>
                <div class="fastinfo">
                    <form id="headersearchForm">
                        <div class="search_cart">
                            <div class="search_faq">
                                <input type="search" title="검색 입력창" name="topSearchKeyword" 
                                       placeholder="지금 꼭! 필요한 안티폴루션 필수템!" maxlength="20">
                                <button type="submit" onclick="topSearchKeyword">
                                    <span>검색</span>
                                </button>
                            </div>
                           <a class="btn-cart" href="/app/getCartList.do?memId=${userSession.id }">
                                <span class="hide">장바구니</span>
                                <span class="count">${basketCount != null? basketCount : 0}</span>
                            </a>
                        </div>
                    </form>
                    <div class="hashtag" style="display: block-inline; width: 308px; height: 20px; overflow: hidden;"> 
                        <div style="float:left; white-space:nowrap;">
                             <a href="#none" onclick="gokey('모든 고객 10%할인가 + 멤버십 쿠폰!'); return false;"> #모든 고객 10%할인가 + 멤버십 쿠폰!</a>
                        </div>
                    </div>  
                </div>
            </section>
            <section class="gnb_nav" id="navbar">
                <nav>
                    <ul class="left">
                        <li>
                            <a href="${contextPage.request.contextPath}/app/Product/ProductList.do">
                                <span>스토어</span>
                               <!--<em></em>-->
                            </a>
                            <div class="sub contain" style="display: none; opacity: 1;">
                                <div class="menu">
                                    <ul>
                                        <li>
                                            <a href="#">베스트</a>
                                        </li>
                                        <li>
                                            <a href="#">단독구성</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="">
                            <a href="${contextPage.request.contextPath}/app/interior/interiorAllList.do">
                                <span>인테리어</span>
                                <!--<em></em>-->
                            </a>
                        </li>
                        <li class="">
                            <a href="/app/honjokInfo/select.do">
                                <span>혼족 정보</span>
                                <!--<em></em>-->
                            </a>
                        </li>
                        <li class="">
                            <a href="/app/cook/CookAll.do">
                                <span>혼족레시피</span>
                                <!--<em></em>-->
                            </a>
                        </li>

                    </ul>
                    <ul class="right">
                       <li class="">
                            <a href="#">
                                <span>이벤트</span>
                                <!--<em></em>-->
                            </a>
                        </li>
                            <li class="">
                            <a href="/app/qna/cs.jsp">
                                <span>고객센터</span>
                                <!--<em></em>-->
                            </a>
                        </li>
                    </ul>
                </nav>
            </section>
        </header>
        </div>

<script>
	window.onscroll = function() {myFunction()};
	
	var navbar = document.getElementById("navbar");
	var sticky = navbar.offsetTop;
	
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 500) {
	            $('#MOVE_TOP_BTN').fadeIn();
	        } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	        }
	    });
	    
	    $("#MOVE_TOP_BTN").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 400);
	        return false;
	    });
	});
</script>
</html>