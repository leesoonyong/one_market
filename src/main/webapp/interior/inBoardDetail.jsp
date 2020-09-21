<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://kit.fontawesome.com/73d0df04d6.js"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" type="text/css" href="/app/resources/css/interioer/inBoardDetail.css">
<title>인테리어 글 상세</title>
<script>
	//게시물 삭제
	function fn_delete() {
		var frmDel = document.frm;
		/* //비밀번호 일치여부 확인
		if (frmDel.pwd.value == "${bvo.pwd}") {
			//비밀번호 일치하는 경우  */
			var isDelete = confirm("정말 삭제 할까요?");
			if (isDelete) {
/*				frmDel.submit(); 
				location.href="deleteArticle.do?com_seq="+seq; */
				document.getElementById('deleteform').submit();
 
			} else {
				history.back();
			}
/* 		} else {
			//비밀번호 불일치
			
			alert("비밀번호가 일치하지 않습니다.");
			frmDel.pwd.value = "";
			frmDel.pwd.focus();
			return;
		} */
	}
		//게시물 공유하기
	    $('a[href="#ex7"]').click(function(event) {
	      event.preventDefault();
	 
	      var obShareUrl = document.getElementById("ShareUrl");
		  obShareUrl.value = window.document.location.href;
	      $(this).modal({
	        fadeDuration: 250
	      });
	    });
	    
	    function CopyUrlToClipboard()
	    {	var obShareUrl = document.getElementById("ShareUrl");
	    
	    	obShareUrl.value = window.document.location.href;  // 현재 URL 을 세팅해 줍니다.
	    	obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다
	    	document.execCommand("copy"); // 클립보드에 복사합니다. 
	    	obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.
	    	alert("URL이 클립보드에 복사되었습니다");
	    }
		
	    function shareKakaotalk() {
	    	 Kakao.Link.createScrapButton({
	 	        container: '#kakao-link-btn',
	 	        requestUrl: 'https://developers.kakao.com'
	 	      });
	    };
	    
	    $( document ).ready(function() {
	 		
	    	$('.comment-feed__form__submit').on('click',function(){
	    		
	    		var content = $('.comment-content-input__text').html();
	    		console.log(content)
	    		
	    		$('.content').val(content);
	    		$('.comment-feed__form').submit();
	    		
	    	});
	    	
	    });

</script>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
    <div class="app_wrap height100 v40 gnb_not_border">
        <div id="app" style="">
            <div id="content">
                <div>
                    <div class="pt-5 _container">
                        <section class="product_detail_info">
                            <div class="product_detail_main_thumnail">
                                <img class="width_100" src="/app/resources/img/interior/20200323180000816_obP1iGbndP.jpg">
                            </div>
                            <div class="text_center pt-3 pb-3">
                                <h3 class="f-26 dark_text bold_text pb-2">${interiorSelect.title}</h3>
                                <p class="f-16 drak_text">${interiorSelect.nickName}</p>
                            </div>
                            <div class="product_detail_spec">
                                <ul class="product_detail_spec_list clfix">
                                    <li class="product_detail_spect_item text_center">
                                        <img class="mb-1" src="/app/resources/img/interior/internet.png">
                                        <p class="f14 gray_text pb-1">건물</p>
                                        <p class="f-16 dark_text">빌라</p>
                                    </li>
                                    <li class="product_detail_spect_item text_center">
                                        <img class="mb-1" src="/app/resources/img/interior/iconmonstr-construction-35-240.png">
                                        <p class="f14 gray_text pb-1">평수</p>
                                        <p class="f-16 dark_text">11평</p>
                                    </li>
                                        <li class="product_detail_spect_item text_center">
                                        <img class="mb-1" src="/app/resources/img/interior/hammer.png">
                                        <p class="f14 gray_text pb-1">스타일</p>
                                        <p class="f-16 dark_text">내츄럴</p>
                                    </li> 
                                        <li class="product_detail_spect_item text_center">
                                        <img class="mb-1" src="/app/resources/img/interior/calendar.png">
                                        <p class="f14 gray_text pb-1">기간</p>
                                        <p class="f-16 dark_text">3개월</p>
                                    </li>  
                                        <li class="product_detail_spect_item text_center">
                                        <img class="mb-1" src="/app/resources/img/interior/iconmonstr-coin-2-240.png">
                                        <p class="f14 gray_text pb-1">예산</p>
                                        <p class="f-16 dark_text">150만원</p>
                                    </li>  
                                </ul>    
                            </div>
                        </section>
                        <section class="product_detail_story">
                            <div>
                                <div class="product_detail_content">
                                    <div class="product_detail_content_item relative">
                  						<p>${interiorSelect.content}</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <c:if test="${ sessionScope.userSession.nickName == comment.nickName }">
            				<input type="button" value="수정" onclick="checkLogin()">
				       	</c:if>
						<c:if test="${ sessionScope.userSession.nickName == comment.nickName }">
				            <input type="button" value="삭제" onclick="checkLogin()">
				        </c:if>
                         <div class="comment_panel" class="ui-comment">
                            <div class="wrap">
                                <div class="commentFeed">
                                    <section class="comment-feed width">
                                        <h1 class="comment-feed__header">댓글
                                            <span class="comment-feed__header__count"></span>
                                        </h1>
                                        <form class="comment-feed__form" method="post" action="addComment.do">
                                            <input type="hidden" name="id" value="${sessionScope.userSession.id }"> 
                                            <input type="hidden" name="nickName" value="${sessionScope.userSession.nickName }"> 
                                            <input type="hidden" name="comSeq" value="${interiorSelect.comSeq }">
                                            <input class="content" type="hidden" name="content" value="">
                                            <div class="comment-feed__form__user">
                                                <img src="/app/resources/img/interior/smile.png">
                                            </div>
                                            <div class="comment-feed__form__input">
                                                <div class="comment-feed__form__content">
                                                	<c:if test="${sessionScope.userSession.id == null }">
                                                    <div class="comment-content-input__text comment-feed__form__content__text"
                                                         contenteditable="true">
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${sessionScope.userSession.id != null }">
                                                     <div id="comment-content-input__text" class="comment-content-input__text comment-feed__form__content__text"
                                                         contenteditable="true">
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${empty c_list }">
														<input type="hidden" name="idx" value="0">
													    <input type="hidden" name="lev" value="0">
													</c:if>
													<c:if test="${stepResult >= 1 }">
														<input type="hidden" name="idx" value="${stepResult}">
														<input type="hidden" name="lev" value="0">
													</c:if>
                                                 </div>
                                                 <div class="comment-feed__form__actions">
                                                    <button type="button" class="comment-feed__form__submit" aria-label="등록">등록</button>
                                                </div>
                                            </div>
                                        </form>
                                        <ul class="comment-feed__list">
                                        	<c:forEach var="comment" items="${commentSelect}">
                                            <li class="comment-feed__list__item">
                                                <article class="comment-feed__item">
                                                    <p class="comment-feed__item__content">
                                                        <a class="comment-feed__item__content__author">
                                                            <img class="/app/resources/img/interior/user.png">
                                                            <span class="comment-feed__item__content__author__name">${comment.nickName}</span>
                                                        </a>
                                                        <span class="comment-feed__item__content__content">${comment.content}</span>
                                                    </p>
                                                    <footer class="comment-feed__item__footer">
                                                        <time class="comment-feed__item__footer__time">
                                                            ${comment.regdate}
                                                        </time>
                                                        <c:if test="${ sessionScope.userSession.nickName == comment.nickName }">
															<button class="reply-up">수정</button>
															<button class="comment-feed__item__footer__delete-btn">삭제</button>
														</c:if>
                                                    </footer>
                                                </article>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>	
		<!-- 댓글 목록 
		<div class="comment-add">
			<ol class="comment-list">
				<li>
				<div class="comment-title">댓글</div>
				<c:forEach var="comment" items="${commentSelect }">
					<span class="writer">${comment.nickName }</span>
					<span class="date">${comment.regdate}</span>-->
					<!--<c:if test="${empty c_list }"> 
						<input type="hidden" name="step" value="0">
						<input type="hidden" name="lev" value="0">
					</c:if>
					<c:if test="${stepResult >= 1 }">
						<input type="hidden" name="step" value="${stepResult}">
						<input type="hidden" name="lev" value="0">
					</c:if>
					<button class="reply-re">답글</button>
				<c:if test="${ sessionScope.userSession.nickName == comment.nickName }">
					<button class="reply-up">수정</button>
					<button class="reply-del">삭제</button>
				</c:if>
					<p class="reply-content">${comment.content }</p>
			</c:forEach>
				</li>
			</ol>
		</div>-->
		
		<!-- 댓글 입력창 
		<div class="comment-wri">
                <span><strong>댓글입력</strong></span> <span id="cCnt"></span>
                <hr>
                    <c:if test="${sessionScope.userSession.id == null }">
                    <textarea class="content" placeholder="로그인시 댓글입력이 가능합니다" readonly></textarea>
                    <br>
                    </c:if>
                    <c:if test="${sessionScope.userSession.id != null }">
           		<form method="post" action="addComment.do">
	           		<input type="hidden" name="id" value="${sessionScope.userSession.id }"> 
				    <input type="hidden" name="nickName" value="${sessionScope.userSession.nickName }"> 
					<input type="hidden" name="comSeq" value="${interiorSelect.comSeq }">-->
					
					
					<!--<c:if test="${empty c_list }">
						<input type="hidden" name="idx" value="0">
						<input type="hidden" name="lev" value="0">
					</c:if>
					<c:if test="${stepResult >= 1 }">
						<input type="hidden" name="idx" value="${stepResult}">
						<input type="hidden" name="lev" value="0">
					</c:if>
					
                    <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="content" placeholder="댓글을 입력하세요"></textarea>
                    <br>
                    <div>
                    <input type="submit" class="comment-push" value="등록">
                    </div>
				</form>
                   </c:if>
            </div>-->

<script>

	//좋아요
	$('#likes').click(function(){
		if("${sessionScope.userSession.id}" != ""){
			var className = $(this).attr('class');
			if(className == "far fa-heart fa-5x" ){
				$(this).removeClass();
				$(this).addClass("far fa-heart fa-5x");
				var comSeq = '${interiorSelect.comSeq}';
				console.log('${interiorSelect.comSeq}');
				var id = '${sessionScope.userSession.id}';
				$.ajax({
					type:'post',
					url:"updateLike.do",
					data:{comSeq :comSeq,
							id:id
						},
					success:function(json){
						console.log("성공");
					},error: function(jqXHR, textStatus, errorThrown) {
						alert("오류가 발생하였습니다.");
					}
				});
			} else{
				$(this).removeClass();
				$(this).addClass("far fa-heart fa-5x");
			}
			} else{
			var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
			if(result){
				location.href = "/app/login.jsp";
			}
			}
		});
	
	
		//댓글 수정
		$('.reply-up').click(function(){
				var form = $('comment-wri');
				var data = new FormData(form);
			$.ajax({
				type:'post',
				url:"upComment.do",
				data:{ comSeq:comSeq,
						idx:idx },
				success:function(form){
					console.log("성공");
					$('.comment-wri').('<span><strong>댓글입력</strong></span> <span id="cCnt"></span>\
			                <hr>\
		                    <c:if test="${sessionScope.userSession.id == null }">\
		                    <textarea class="content" placeholder="로그인시 댓글입력이 가능합니다" readonly></textarea>\
		                    <br>\
		                    </c:if>\
		                    <c:if test="${sessionScope.userSession.id != null }">\
		           		<form method="post" action="addComment.do">\
			           		<input type="hidden" name="id" value="${sessionScope.userSession.id }">\
						    <input type="hidden" name="nickName" value="${sessionScope.userSession.nickName }"> \
							<input type="hidden" name="comSeq" value="${interiorSelect.comSeq }">\
							<c:if test="${empty c_list }">\
								<input type="hidden" name="step" value="0">\
								<input type="hidden" name="lev" value="0">\
							</c:if>\
							<c:if test="${stepResult >= 1 }">\
								<input type="hidden" name="step" value="${stepResult}">\
								<input type="hidden" name="lev" 
								value="0">\
							</c:if>\
		                    <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="content" placeholder="댓글을 입력하세요"></textarea>\
		                    <br>\
		                    <div>\
		                    <input type="submit" class="comment-push" value="등록">\
		                    </div>\
						</form>\
		                   </c:if>');
					
				},error: function(jqXHR, textStatus, errorThrown) {
					alert("오류가 발생하였습니다.");
				}
			});
		})
</script>
</body>
</html>