<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>글상세보기</title>
<style>
.profile {
    width: auto; height: auto;
    max-width: 50px;
    max-height: 50px;
}
</style>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">

<script>
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
}

</script>
</head>
<body>
      


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">${cookDetail.title }
        </h1>

        <!-- Blog Post -->
        <div class="card mb-4">
          <div class="card-body">
            <p class="card-text">${cookDetail.content }</p>
          </div>
          <div class="card-footer">
            Posted on ${cookDetail.regdate } by
            <a href="#">${cookDetail.nickName }</a>
          </div>
        </div>


<!-- Post Content -->

        <div>위 레시피에 나온 제품을 구매하시려면 정원e샵을 방문하세요~
        	<a href="http://localhost:8080/app/interior/interiorAllList.do" target="_blank" title="새창 열림">
        	<img src="${contextPage.request.contextPath}/app/resources/img/market.png" alt="One마켓 바로가기">
        	</a>
        </div>

        <div id="container">
			<input type="hidden" name="comSeq" value="${cookDetail.comSeq }">
		
		 <a href="insert.jsp">글등록</a><a href="${contextPage.request.contextPath}/app/cook/CookAll.do">글목록</a>
		 <a href="update.jsp">수정</a>
		 <a href="delete.do?comSeq=${cookDetail.comSeq}" id="deleteform">삭제</a>
		 
		 
<!-- 		<form class="update" action="update.jsp"> -->
<%-- 		   <c:set value="${cookDetail}" var="ckvo" scope="session"></c:set> --%>
<!-- 		   <input type="submit" value="수정"> -->
<!-- 		</form> -->
		
<%-- 		<form action="delete.do?comSeq=${cookDetail.comSeq}" id="deleteform"> --%>
<!-- 		   <input type="submit" onclick="fn_delete()" value="삭제"> -->
<%-- 		   <input type="hidden" name="comSeq" id="comSeq" value="${cookDetail.comSeq }"> --%>
<!-- 		</form> -->
</div>
        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form method="post" action="addComment.do">
            <input type="hidden" name="id" value="${sessionScope.userSession.id }"> 
		    <input type="hidden" name="nickName" value="${sessionScope.userSession.nickName }"> 
			<input type="hidden" name="comSeq" value="${interiorSelect.comSeq }">
					
              <div class="form-group">
              <c:if test="${sessionScope.userSession.id == null }">
                <textarea class="form-control" 
                placeholder="의견을 남겨주세요. " id="comment" name="content" rows="3"></textarea>
              </div>
              </c:if>
              <button type="submit" class="btn btn-primary">Submit</button>
              
              
              
            </form>
          </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="profile" src="https://lh3.googleusercontent.com/proxy/rkRvMyGYwN3r6uHi-HIrqYOHbgpXa0jfzkI7fBw6f_mXtr98liuxMD7ts3ouGumBZl8noFVxQhL2-_r8nfrZ1VFAcAr4YscOfaLPyUk_JoY" alt="">
          <div class="media-body">
            <h5 class="mt-0">  Jackson Michael</h5>
           	꿀조합이네요. 식감도 좋고 맛도 좋을 것 같아요.
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">지향 강</h5>
             			개인 블로그에 올리고 싶습니다. 가져가도 될까요 ? 

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Admin</h5>
                	상업 용도의 저작권 문의는 Admin@riotgames.com 으로 문의바랍니다. 
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">지향 강</h5>
                	네 메일 확인 부탁드려요!
              </div>
            </div>

          </div>
        </div>

      </div>
      

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">간편식</a>
                  </li>
                  <li>
                    <a href="#">보양식</a>
                  </li>
                  <li>
                    <a href="#">Junk Food</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">한식</a>
                  </li>
                  <li>
                    <a href="#">일식</a>
                  </li>
                  <li>
                    <a href="#">양식</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Side Widget</h5>
          <div class="card-body" align="center">
          	<a href="http://yellow.contentsfeed.com/RealMedia/ads/click_lx.ads/jobkorea/sub/L12/1808089633/TopRight/jobkorea/200309_seoul_newdeal_ssky/200101_kotra_ssky.html/634b6e4566563530565141414356786a" target="_blank"><img src="//apple.contentsfeed.com/RealMedia/ads/Creatives/jobkorea/200309_seoul_newdeal_ssky/200306_seoul_naw_120x600.png" border="0" alt="민간기업 맞춤형 뉴딜사업 참여자 모집 교육수당 2만원/일 인턴십급여 222만원/일"></a>
             
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>