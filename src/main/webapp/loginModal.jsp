<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="/app/resources/css/login/login.css" rel="stylesheet">
<title>로그인</title>
</head>
<body class="bg_grey">
<c:if test="${not empty cookie.userCheck}">
	<c:set var="checked" value="checked"/>
</c:if>
    <div id="wrap_all">
        <nav id="skip_navi">
            <a href="#">본문 바로가기</a>
        </nav>
        <header id="header">
            <h1>
                <a class="logo" href="/app/main/getMainList.do">
                    <img src="/app/resources/img/main/logo3.png" alt="OEN-MARKET">
                </a>
            </h1>
        </header>
        <section id="container" class="LPH10000">
            <section id="contents">
                <section class="join_content">
                    <p class="join_desc">
                       	 회원님만 드리는
                        <em>풍성한 혜택</em>
                        	놓치지 마세요
                    </p>
                    <div class="tab_wrap">
                        <ul>
                            <li class="on">
                                <a href="#">
                                    	회원 로그인
                                </a>
                                <div class="tab_cont">
                                    <section class="login_form">
                                        <div id="loginForm">
                                            <input type="text" id="inputId" name="userId" value="${cookie.userCheck.value}" placeholder="아이디"> <input type="password" class="mt6" id="inputPassword" name="userPassword" placeholder="비밀번호">
                                            <div class="btn_wrap">
                                                <button id="loginBtn" type="button" class="btn_base blue">로그인</button>
                                                <button id="sign-upBtn" onclick="location.href='signUp.jsp'" class="btn_base pink">회원가입</button>
                                            </div>
                                            <div class="pos_rel">
                                                <span class="checkcss">
                                                    <input type="checkbox" id="rememberUs" name="rememberUserId" ${checked}>
                                                    <label for="checkbox">
                                                        <em>아이디 저장</em>
                                                    </label>
                                                </span>
                                                <div class="right">
                                                    <a href="#">아이디 찾기</a>
                                                    <a href="#">비밀번호 찾기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div> 
                            </li>
                            <li class="">
                                <a href="#">판매자 로그인</a>
                                <div class="tab_cont">
                                    <section class="login_form">
                                        <div id="form1" name="form1">
                                            <input type="text" name="ordernum" id="ordernum" title="주문번호 입력란" maxlength="25" placeholder="주문번호">
                                            <input type="text" name="ordername" id="ordername" title="주문자명 입력란" maxlength="10" placeholder="주문자명" class="mt6">
                                        </div>
                                        <div class="btn_wrap">
                                            <button class="btn_base blue dev-adminlogin">로그인</button>
                                        </div>
                                        <ul class="dot_list">
                                            <li>이곳은 판매자 전용 로그인화면입니다.</li>
                                            <li>회원님들께서는 회원로그인을 이용해주시길바랍니다.</li>
                                        </ul>
                                    </section>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </section>
        </section>
    </div>
</body>
<script>
$(".tab_wrap:not(.move) > ul > li > a").on('click', function() {
	$(this).parent().addClass('on').siblings().removeClass('on');
	return false;
});    


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
						$('#spanLoginCheck').css('color', 'red');
					}else if (data == -2){
						$('#spanLoginCheck').text('이메일을 인증 해주셔야합니다')
						$('#spanLoginCheck').css('color', 'red');
					}else{
						 opener.location.reload(); //부모창 리프레쉬
						 self.close(); //현재창 닫기
					}
					
				}
			})
			
	
})
</script>
</html>
