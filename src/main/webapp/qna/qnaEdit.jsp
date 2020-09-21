<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%
    	request.setCharacterEncoding("UTF-8");
    %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A수정</title>
</head>
<body>

<h3>글수정</h3>
	<form name="qnaForm"
		action="${pageContext.request.contextPath}/board/qna/qnaUpdate"
		method="post" enctype="multipart/form-data">
		<input type="hidden" size="50" name="qn_type" value="${qna.qn_type}">
		<input type="hidden" size="50" name="qna_num"
			value="${qna.qna_num}">
		<table class="table table-bordered">

			<tr>
				<td width="15%">제목</td>
				<td><input class="form-control" type="text" size="50"
					name="qna_title" value="${qna.qna_title}"></td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td>
					<!--기존파일 (업로드된 파일)  -->
					<p>
						<c:forEach var="fileItem" items="${qna.fileItemList}">
							<div>
							<button type="button" class="btn btn-danger btn-delete-exist" data-file_seq_no=${fileItem.file_seq_no} >X</button>
								<a
									href="${pageContext.request.contextPath}/common/download/${fileItem.file_seq_no}">${fileItem.file_name}</a>
								${fileItem.file_fancy_size}
								
							</div>
						</c:forEach>
					</p> 
					<!--신규업로드 파일  -->
					<p>
						<button type="button" class="btn btn-primary" id="btnFileAdd">추가</button>
					</p>

					<div id="fileList">
						<div class="col-xs-12">
							<input type="file" name="uploadFiles" value=""
								multiple="multiple" style="display: inline">
							<button type="button" class="btn btn-danger btn-delete-file">X</button>
						</div>
					</div>

				</td>
			</tr>

			<tr>
				<td>내용</td>
				<td colspan="2"><textarea class="form-control" rows="10"
						cols="50" name="qna_content">${qna.qna_content}</textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="button" value="수정" class="btn btn-default" onclick="fn_save()"> 
					<input type="reset" value="삭제" class="btn btn-default" onclick="fn_delete()"> 
					<input type="button" value="목록" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/board/qna/qnaList'">
				</td>
			</tr>

		</table>


	</form>


</body>
</html>