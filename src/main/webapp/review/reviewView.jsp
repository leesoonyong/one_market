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

function fn_modify(rev_num) {
	location.href="${pageContext.request.contextPath}/board/review/reviewEdit?rev_num=" + rev_num;

}

function fn_delete(rev_num) {
	location.href="${pageContext.request.contextPath}/board/review/reviewDelete?rev_num=" + rev_num;		
}

</script>

</head>
<body>
	
<h3>상세보기</h3>

<table class="table">
	<tr>
		<td align="center" style="font-weight:bold">제목</td>
		<td align="center" colspan="3">${review.rev_title}</td>
		<td align="center" style="font-weight:bold">글쓴이</td>
		<td>${review.rev_writer_name}</td>
	</tr>
	
	<tr>
		<td align="center" style="font-weight:bold">품명</td>
		<td>${review.rev_prod_title}</td>
		<td align="center" style="font-weight:bold">상품가격</td>
		<td>${review.rev_prod_price}</td>
		<td align="center" style="font-weight:bold">제조사</td>
		<td>${review.rev_mfg_co}</td>
	</tr>
	
	<tr>
		<td align="center" style="font-weight:bold">상세보기</td>
		<td><a href="${review.rev_prod_url}">상세보기</a></td>
		<td align="center" style="font-weight:bold">작성일자</td>
		<td>${review.reg_date}</td>
		<td align="center" style="font-weight:bold">조회수</td>
		<td>${review.rev_hit}</td>
	</tr>
	
	<tr>
		<td colspan="6" style="white-space: pre-wrap;">${review.rev_content}</td>
	</tr>
	
	<tr>
		<td colspan="6">
			<c:if test="${not empty LOGIN_USER and LOGIN_USER.mem_id == review.mem_id }">

				<input type="button" class="btn btn-default" value="수정" onclick="fn_modify('${review.rev_num}')">
				<input type="button" class="btn btn-default" value="삭제" onclick="fn_delete('${review.rev_num}')">
			</c:if>
			<input type="button" class="btn btn-default" value="목록" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewList'">
		</td>
	</tr>
</table>
	
	
</body>
</html>