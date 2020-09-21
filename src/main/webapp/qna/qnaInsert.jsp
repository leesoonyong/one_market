<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<!-- include libraries(jQuery, bootstrap)-->
<!-- summernote홈페이지에서 받은 summernote를 사용하기 위한 코드를 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<!-- 이 css와 js는 로컬에 있는 것들을 링크시킨 것이다. -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<title>글쓰는 페이지</title>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

</script>

<body>
<form name="qnaForm" action="qnaInsert" method="post" enctype="multipart/form-data" >
	<input type="hidden" size="50" name="qn_type" value="BBS">
	<table class="table table-bordered">
		
		<tr>
			<td width="10%">제목</td>
			<td><input class="form-control" type="text" size="50" name="qna_title" value=""></td>
		</tr>
		
		<tr>
			<td width="10%">첨부파일</td>
			<td>
			<p>
			<button type="button" class="btn btn-primary" id="btnFileAdd">추가</button>
			</p>
			
			<div id="fileList">
				<div class="col-xs-12">
				<input  type="file" name="uploadFiles" value="" multiple="multiple" style="display: inline">
				<button type="button" class="btn btn-danger btn-delete-file">X</button>
				</div>
			</div>
			</td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="2"><textarea  class="form-control" rows="10" cols="50" name="qna_content"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="등록" class="btn btn-default" onclick="fn_save()">
				<input type="reset" value="취소" class="btn btn-default">
				<input type="button" value="목록" class="btn btn-default" onclick="location.href='qnaList'">
			</td>
		</tr>
		
	</table>


</form>



</body>
</html>