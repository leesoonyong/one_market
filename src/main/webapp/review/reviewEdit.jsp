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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">


function fn_save() {
	var frm = document.reviewForm;
	
	if(!validate()){
		return;
	}
	
	frm.submit();
}

//밸리데이션 체크를 따로 분리하는 경우도 있다. 좀더 간단해지기때문에 편한부분도있다.
function validate() {	
	var frm = document.reviewForm;
	
	if(frm.rev_title.value == ""){
		alert("제목은 필수 입력입니다.");
		
		return false;	//성공했냐 실패했냐를 알려주는..
	}
	
	if(frm.rev_content.value == ""){
		alert("내용은 필수 입력입니다.");
		
		return false;	//성공했냐 실패했냐를 알려주는..
	}
	
	return true;
}

</script>

</head>
<body>

<h3>글쓰기</h3>

<form name="reviewForm" action="reviewUpdate" method="post" enctype="multipart/form-data">

	<input type="hidden" name="rev_num" value="${review.rev_num}">

	<table class="table table-bordered">
		<tr>
			<td width="15%">제목</td>
			<td><input type="text" class="form-control" name="rev_title" value="${review.rev_title}"></td>
		</tr>	
		
		<tr>
			<td colspan="2">
				<textarea class="form-control" rows="10" cols="80"  name="rev_content">${review.rev_content}</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-default" value="수정" onclick="fn_save()">
				<input type="reset" class="btn btn-default" value="취소">
				<input type="button" class="btn btn-default" value="목록" onclick="location.href='reviewList'">
			</td>
		</tr>
		
	</table>
</form>

</body>
</html>