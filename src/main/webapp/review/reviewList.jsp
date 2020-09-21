<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%><!-- trimDirectiveWhitespaces 는 빈공간을 최대한 안보여준다 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript">

function fn_search(page) {
	
	var frm = document.searchForm;
	
	frm.currentPage.value = page;
	
	if(frm.searchType.value != "" && frm.searchWord.value == ""){
		alert("검색어를 입력하세요.");
		return;
	}
	
	frm.submit();
}

</script>

</head>
<body>

<h3 align="center">상품문의 내역</h3>

<!-- <div align="right"><input type="button" class="btn btn-primary" value="글쓰기" onclick="location.href='reviewForm'"></div> -->

<!-- 190822 -->
<form name="searchForm" action="reviewList" method="post" class="form-inline">
	<p>
		<!-- 셀렉트에서 밸류값은 보통 의미보다는 숫자로 주는경우가 많다(넘버링) -->
		<!-- 현재 페이지. -->
		<input type="hidden" name="currentPage">
		<select name="searchType" class="form-control">
 			<option value="">전체</option>
			<option value="01" ${param.searchType == '01' ? 'selected' : '' }>제목</option>
			<option value="02" ${param.searchType == '02' ? 'selected' : '' }>내용</option>
			<option value="03" ${param.searchType == '03' ? 'selected' : '' }>제목 + 내용</option>
			<option value="04" ${param.searchType == '04' ? 'selected' : '' }>글쓴이</option>
		</select>
		
		<input type="text" class="form-control" name="searchWord" value="${param.searchWord}">
		<!-- fn_search(1) 현재페이지.. -->
		<input type="button" class="btn btn-primary" value="검색" onclick="fn_search('1');">
	</p>
	
	<p>
		<div style="display: inline">
			<label>총 게시물 : ${pagingUtil.totalCount}</label>
		</div>
		
		<div style="float: right;">
			<label>페이지 수 : </label>
			<select name="pageSize" class="form-control">
				<option value="10" ${param.pageSize == 10 ? 'selected' : ''}>10개</option>
				<option value="20" ${param.pageSize == 20 ? 'selected' : ''}>20개</option>
				<option value="50" ${param.pageSize == 50 ? 'selected' : ''}>50개</option>
				<option value="100" ${param.pageSize == 100 ? 'selected' : ''}>100개</option>
			</select>
		</div>

	

</form>





<p/>

<table class="table table-bordered table-striped table-hover">
	<thead>
		<tr style="vertical-align: middle">
			<th width="5%" style="text-align: center">번호</th>
			<th width="20%" style="text-align: center">품명</th>
			<th style="text-align: center">썸네일</th>
			<th style="text-align: center">제목</th>
			<th width="10%" style="text-align: center">작성자</th>
			<th width="5%" style="text-align: center">조회</th>
			<th width="20%" style="text-align: center">작성일자</th>
		</tr>
	</thead>
	
	<tbody>
	
		<c:if test="${not empty reviewList}">
			
			<c:forEach var="review" items="${reviewList}">
				<tr>
					<td style="vertical-align:middle" align="center">${review.rev_num}</td>
					<td style="vertical-align:middle" align="center">${review.rev_title}</td>
					<c:if test="${not empty review.rev_prod_img}">
						<td style="vertical-align:middle" width="62px" height="52px" align="center"><img src="${review.rev_prod_img}" width="60px" height="50px"></td>
					</c:if>
					<c:if test="${empty review.rev_prod_img}">
						<td style="vertical-align:middle" width="62px" height="52px" align="center"><img src="https://t1.daumcdn.net/cfile/tistory/993B604F5D8D802419" width="60px" height="50px"></td>
					</c:if>
					<td style="vertical-align:middle"><a href="reviewView/${review.rev_num}">${review.rev_title}</a></td>
					<td style="vertical-align:middle" align="center">${review.rev_mfg_co}</td>
					<td style="vertical-align:middle" align="center">${review.rev_hit}</td>
					<td style="vertical-align:middle" align="center">${review.reg_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty reviewList}">
			<tr>
				<td colspan="7" style="text-align: center;">조회된 결과가 없습니다.</td>
			</tr>
		</c:if>
		
	</tbody>
	
</table>

<div align="center">
	<ul class="pagination">
		${pagingUtil.pageHtml}
	</ul>
</div>

</body>
</html>