<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원상세페이지</title>
<!-- <style>
	#main {
		border: 1px solid gray;
		padding: 50px;
		margin: 20px;
		text-align: center;
	}
	
	#memberInfo {
		list-style: none;
		margin: 10px;
		padding: 10px;
	}
	
	#community {
		list-style: none;
		margin: 10px;
		padding: 10px;
	}
	
	#qna {
		list-style: none;
		margin: 10px;
		padding: 10px;
	}
	
	.memInfo {
		border-bottom-style: solid;
		border-bottom-color: #6482FF;
	}
	
	.memUp {
		cursor: pointer;
	}
	
	.memUp:hover {
		color: #DCEBFF;
	}
	
	.memDel {
		cursor: pointer;
	}
	
	.memDel:hover {
		color: #DCEBFF;
	}
	
	#intro {
		float: left;
		width : 100%; margin: 20px; padding:-120px;
	}
	
	#orderBox {
		border: 1px solid #8C8CF5;
		padding: 80px;
		margin: 50px;
		width: 50px;
		float: left;
	}
	
	#orderBox:hover {
		background: #D5C2EE;
	}

	.orderInfo {
		cursor:pointer;
	}
	
	.orderInfo:hover {
		color: #DCEBFF;
	}
	
	#orderHistory {
		border: 1px solid black;
	}
	
	#memberBox {
		border: 1px solid #8C8CF5;
		padding: 80px;
		margin: 50px;
		width: 50px;
		float: left;
	}
	
	#memberBox:hover {
		background: #D5C2EE;
	}
	
	#wishBox {
		border: 1px solid #8C8CF5;
		padding: 80px;
		margin: 50px;
		width: 50px;
		float: left;
	}
	
	#wishBox:hover {
		background: #D5C2EE;
	}
	
	.wishList {
		cursor: pointer;
	}
	
	.wishList:hover {
		color: #DCEBFF;
	}
	
	#commBox {
		border: 1px solid #8C8CF5;
		padding: 80px;
		margin: 50px;
		width: 50px;
		float: left;
	}
	
	#commBox:hover {
		background: #D5C2EE;
	}
	
	#commBox {
		border: 1px solid #8C8CF5;
		padding: 80px;
		margin: 50px;
		width: 50px;
		float: left;
	}
	
	#commBox:hover {
		background: #D5C2EE;
	}
	
	.commInfo {
		border-bottom-style: solid;
		border-bottom-color: #6482FF;
	}
	
	.commBoard {
		cursor: pointer;
	}
	
	.commBoard:hover {
		color: #DCEBFF;
	}
	
	.commReply {
		cursor: pointer;
	}
	
	.commReply:hover {
		color: #DCEBFF;
	}
	
	.scrap {
		cursor: pointer;
	}
	
	.scrap:hover {
		color: #DCEBFF;
	}
	
	.question {
		border-bottom-style: solid;
		border-bottom-color: #6482FF;
	}
	
	.qHistory {
		cursor: pointer;
	}
	
	.qHistory:hover {
		color: #DCEBFF;
	}
	
	/* 게시물 조회 페이지 스타일 */
	.interBorder {
		width: 60%;
    	border-top: 1px solid #444444;
    	border-collapse: collapse;
    	valign: left;
	}
	
	.thInter, .tbInter {
    	background-color: #e3f2fd;
  	}
</style> -->
<script>
	
</script>
</head>
<body>
<jsp:include page="/header.jsp"/>	
	스타일이 겹치는거 아님 ? 헤더에있는거랑 
<div style="display:flex; flex-direction: row;">
	<div style="width : 20%;">
	<ol id="memberInfo">
	<li><h5 class="memInfo">회원 정보</h5></li>
	<li class="orderInfo"><p>주문내역</p></li>
	<li class="wishList"><p>찜목록</p></li>
	<li class="memUp"><p>회원정보수정</p></li>
	<li class="memDel"><p>회원탈퇴</p></li>
	</ol>
	
	<ol id="community">
	<li><h5 class="commInfo">커뮤니티 정보</h5></li>
	<li class="commBoard"><p>내가쓴게시물</p></li>
	<li class="commReply"><p>내가쓴댓글</p></li>
	<li class="scrap"><p>스크랩</p></li>
	</ol>
	
	<ol id="qna">
	<li><h5 class="question">상품문의</h5></li>
	<li class="qinquiry">문의하기</li>
	<li class="qHistory">문의내역</li>
	</ol>
	
	</div>

	<div id="intro">
		<div id="orderBox">
			<h3>주문내역</h3>
		</div>
		<div id=memberBox>
			<h3>회원정보</h3>
			<form method="post" action="updateMypage.do">
				<input type="hidden" name="id" value="${user.id}">
			<c:forEach var="userSelect" items="${userSelect}">
				<div class="userBorder">
					<input type="text" name="id" value="${userSelect.id}" readonly>
				</div>
			</c:forEach>
			</form>
			
			<c:forEach var="inter" items="${interiorMypage }">
				<div class="interBorder">
				<ol>
				<li class="userB">${user.id }</li>
				</ol>
				</div>
			</c:forEach>
		</div>
		<div id=wishBox>
			<h3>관심상품</h3>
		</div>
		<div id=commBox>
			<h3>커뮤니티</h3>
			<c:forEach var="inter" items="${interiorMypage }">
				<table class="interBorder">
				<tr>
				<td class="inter">${inter.id }</td>
				</tr>
				</table>
			</c:forEach>
		</div>
	</div>
	
	<input type="hidden" name="userId" id="userId" value="${sessionScope.userSession.id}">
	<input type="hidden" name="passWord" id="passWord" value="">
	<div class="checkFont" id="passwordCheck"></div>
</div>
<script>
	/* var empJ = /\s/g; //공백체크 정규표현식
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; */
	function userUpdateCh() { 
	         alert("비밀번호를 다시 입력해주세요"); 
	    }
	
	function update() { 
	         alert("");
	    }
	
	//주문내역 박스를 눌렀을때 기본페이지 주문내역으로 이동
	$(function(){
        //이벤트를 한 번만 연결(한 번만 실행)
        $("#orderBox").one("click", function(){
           location.href = "myPage.jsp";
        });
	});
	
	//회원정보 클릭시 페이지 전환
	//---주문내역 조회 페이지
	$('.orderInfo').on("click",function(){
		var id = $('#userId').val();
		console.log(id);
 	    $.ajax({
	    	method: "GET",
	        url : "selectOrder.do",
	        datatype: "json",
	        data: { id:id },
	        success : function(data){
	        	 console.log(data);
	        	 $("#intro").html("");
	        	 $("#intro").append("");

	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          	alert("전송실패");
	        }
 	    	})
	    });
	
	$('.wishList').on("click",function(){
		$('#intro').html("");
		
		$('#intro').append('<table><thead><tr><th>찜목록</th></tr></thead></table>');	
	})
	
	//---회원정보 수정 페이지
	$('.memUp').on("click",function(){
		$('#intro').html("");
		$('#intro').append('<form><input type="password" name="password" placeholder="비밀번호를 입력해주세요" class="gogo">\
				<input class="memupBtn" type="button" value="확인"></form>');
	})
	$(document).on("click",".memupBtn", function(){
		var password  = $('.gogo').val();
		var id  = '${sessionScope.userSession.id}';
		  $.ajax({
		    	method: "GET",
		        url : "selectMypage.do",
		        data: { password:password,
		        		id:id }, 
		        success : function(data){
		        	console.log(data);
		        	/* String userPassword = vo.getPassword();
		    		vo.setPassword(UserSha256.encrypt(userPassword)); */
		        	
		        },error:function(request,status,error){
		          	alert("전송실패");
		        }
	 	    	}) 
	});
	
	$('#userUp').on("click",function(){
		var id = $('#userId').val();
		console.log(id);
 	    $.ajax({
	    	method: "GET",
	        url : "selectMypage.do",
	        datatype: "json",
	        data: { id:id },
	        success : function(data){
	        	 console.log(data);
	        	 $("#intro").html("");
	        		$('#intro').append('<form action="updateMypage.do" method="post"><div class="userBorder">\
       				<input type="hidden" name="id" value="${UserVO.id}">\
       					<input type="text" name="id" value="'+ data.id + '"readonly>' +
       					'새비밀번호 <input type="text" name="password">' +
       					'새비밀번호 확인 <input type="text" name="password">' +
	        		'<br><input type="submit" value="수정">\
	        		</div></form>');
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          	alert("전송실패");
	        }
 	    	})
	    });
       				/* <c:forEach var="userSelect" items="${userSelect}">\ */
       				/* '</c:forEach>' + */
	
	$('.memDel').on("click",function(){
		$('#intro').html("");
		$('#intro').append('회원탈퇴를 하시기 전에 안내사항을 꼭 확인해주세요');	
	})
	
	//커뮤니티정보 클릭시 페이지 전환	
	$('.commBoard').on("click",function(){
		var id = $('#userId').val();
		console.log(id);
 	    $.ajax({
	    	method: "GET",
	        url : "selectBoard.do",
	        datatype: "json",
	        data: { id:id },
	        success : function(data){
	        	 console.log(data);
	        	 $("#intro").html("");
	        	for(var i in data){
	        	 $("#intro").append("<table class='interBorder'>\
	        	 <thead class='thInter'><th>제목</th><th>날짜</th><th>조회수<th></thead>\
	        	 <tbody class='tbInter'><tr><td>" +
	        	 data[i].title + "</td><td>" +
	        	 data[i].regdate + "</td><td>" +
	        	 data[i].hit + "</td></tr></tbody>\
	        	 </table>");
	        	}

	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          	alert("전송실패");
	        }
 	    	})
	    });
	
	$('.commReply').on("click",function(){
		$('#intro').html("");
		$('#intro').append('<table><thead><tr><th>내가 쓴 댓글 목록</th></tr></thead></table>');	
	})
	
	$('.scrap').on("click",function(){
		$('#intro').html("");
		$('#intro').append('<table><thead><tr><th>스크랩한 게시물</th></tr></thead></table>');	
	});
	마이페이지근데저겆네비;바아직도따라다녀
	//상품문의 클릭시 페이지 전환
	$('.qHistory').on("click",function(){
		$('#intro').html("");
		$('#intro').append('상품문의');
		<jsp:include page="sss" flush="false"/>
	})
	
	function fn_comment(){
			 var form = $('#commentForm')[0];
		     var data = new FormData(form);
		   		console.log("클릭은되나요?");
		   		document.data.action = "location.href='addComment.do'".submit();
		   		
		   		location.reload();
	  	}
	
			/* location.reload(); */
/* 	    $.ajax({
	    	type: "POST",
	        url : "addComment.do",
	        data: data,
	        contentType : false,
	        processData : false ,
	        success : function(e){
	        	location.reload();
	        	
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          	alert("전송실패");
	       }
	        
	    }); */
</script>
</body>
</html>