<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript">

function fn_search(page) {
	
	frm = document.searchForm;
	
	frm.currentPage.value = page;
	
	if(frm.searchType.value != "" && frm.searchWord.value == ""){
		alert("검색어를 입력하시오");
		return;
	}
	
	frm.submit();
	
}


</script>


<body>
		<jsp:include page="/header.jsp"></jsp:include>
		<hr>
		<h3 align="center">나의 문의내역</h3>
		<hr>
		
		<c:choose>
			<c:when test="${qnaList == null }">
				<p align="center">
					<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
				</p>
			</c:when>
			<c:when test="${qnaList != null }">
					
				<div class="row">

					<c:forEach var="qna" items="${qnaList }"
						varStatus="articleNum">

						<div class="col-md-4" id="select">
							<a class="main-img${articleNum.index}"
								href="qnaDetail.do?comSeq=${qna.comSeq }"
								class="img w-100 mb-3"> 
								 <script>
									var contentimg = '${qna.content}';
									var firstimg = $(contentimg).find(
											'img:first').attr('src');
									console.log(firstimg);
									var image = document.createElement("IMG");
									image.src = firstimg;
									image.height = 300;
									image.width = 300;
									image.alt = "이미지가없습니다.";
									console.log(image);
									$('.main-img${articleNum.index}').html(
											image);
								</script> 
							</a>
							<div class="text w-100 text-center">
								<h3>
									<a href="qnaDetail.do?comSeq=${qna.comSeq }">${qna.title }</a>
								</h3>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>

		</c:choose>
		
		<div class="center">
			<c:if test="${allCount != null}">
				<c:choose>
					<c:when test="${allCount > 60 }">
						<c:set var="endPage" value="${allCount/90 + 1 }" scope="page"></c:set>

						<c:if test="${endPage-(endPage%1) != section}">
							<c:forEach var="page" begin="1" end="10" step="1">

								<c:if test="${section > 1 && page == 1}">
									<a
										href="QnaAll.do?section=${section-1}&pageNum=${(section-1)*10 }">이전</a>
								</c:if>

								<a href="QnaAll.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }
								</a>

								<c:if test="${page == 10 }">
									<c:if test="${section ==1 }">
										<a href="QnaAll.do?section=${section+1}&pageNum=${section }">다음</a>
									</c:if>
									<c:if test="${section != 1 }">
										<a
											href="QnaAll.do?section=${section+1}&pageNum=${section - 1}">다음</a>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>

						<c:if test="${endPage-(endPage%1) == section}">
							<c:forEach var="page" begin="1" end="10" step="1">

								<c:if test="${section > 1 && page == 1}">
									<a
										href="QnaAll.do?section=${section-1}&pageNum=${(section-1)*10-10 }">이전</a>
								</c:if>

								<a href="QnaAll.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }
								</a>

								<c:if test="${page == 10 }">
									<a href="QnaAll.do?section=${section+1}&pageNum=${section - 1}">다음</a>
								</c:if>
							</c:forEach>
						</c:if>

					</c:when>


					<c:when test="${allCount == 90 }">
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="#">${page }</a>
						</c:forEach>
					</c:when>

					<c:when test="${allCount < 90 }">
						<c:forEach var="page" begin="1" end="${allCount/9 + 0.9  }"
							step="1">
							<c:choose>
								<c:when test="${page == pageNum }">
									<a href="QnaAll.do?section=${section}&pageNum=${page}">${page }</a>
								</c:when>
								<c:otherwise>
									<a href="QnaAll.do?section=${section}&pageNum=${page}">${page }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>

				</c:choose>
			</c:if>
		</div>


	<hr>

	<c:remove var="endPage" />





<form action="qnaList" name="searchForm" method="post" class="form-inline">
	<p>
	<input type="hidden" name="currentPage">
	
		<select name="searchType" class="form-control">
			<option value="">전체</option>
		<option value="01" ${param.searchType == '01' ? 'selected' : '' }>제목</option>
			<option value="02" ${param.searchType == '02' ? 'selected' : '' }>내용</option>
			<option value="03" ${param.searchType == '03' ? 'selected' : '' }>제목+내용</option>
			<option value="04" ${param.searchType == '04' ? 'selected' : '' }>글쓴이</option>
		</select>
		<input type="text" class="form-control" name="searchWord" value="${param.searchWord }">
		<input type="button" value="검색" class="btn btn-primary" onclick="fn_search('1')">
	
	</p>
	<p>
<!-- 		<div style="display: inline;"> -->
<%-- 			<label>총 게시물 수 : ${pagingUtil.totalCount}</label> --%>
<!-- 		</div> -->
		<a href="http://localhost:8080/app/qna/qnaInsert.jsp">
        	<img src="${contextPage.request.contextPath}/app/resources/img/write_btn.png" alt="쓰기">
      	</a>
		<div style="float: right;">
			<label>페이지 수 </label>
			<select name="pageSize" class="form-control">
				<option value="10" ${param.pageSize ==10 ?  'selected' : ''}>10개</option>
				<option value="20" ${param.pageSize ==20 ? 'selected' : ''}>20개</option>
				<option value="50" ${param.pageSize ==50 ?  'selected' : ''}>50개</option>
				<option value="100" ${param.pageSize ==100 ? 'selected' : ''}>100개</option>
			</select>
		</div>
		
	
</form>


<p>

<table class="table table-bordered table-striped table-hover">
	<thead>
		<tr>
			<th style="text-align: center;">번호</th>
			<th style="text-align: center; width: 10%">썸네일</th>
			<th style="text-align: center; width: 50%">제목</th>
			<th style="text-align: center;">작성자</th>
			<th style="text-align: center;">조회수</th>
			<th style="text-align: center; width: 20%">등록일</th>
		</tr>
	</thead>
	<tbody>
<%-- 		<c:if test="${not empty qnaList}"> --%>
			<c:forEach var="qna" items="${qnaList}">
				<tr>
					<td>${qna.comSeq}</td>
					<td><img src="upload/${vo.upload }" width="50px" height="50px"></td>
					<td><a href="QnaDetail.do?comSeq=${qna.comSeq}">${qna.title }</a></td>
					<td>${qna.regdate }</td>
					<td>${qna.hit }</td>
					<td>${qna.nickName }</td>
				</tr>
				</c:forEach>
<%-- 			</c:if> --%>
			<c:if test="${empty qnaList}">
				<tr>
					<td colspan="7" style="text-align: center;">조회된 결과가 없습니다.</td>
				</tr>
			</c:if>
		
	</tbody>

</table>



</body>
</html>