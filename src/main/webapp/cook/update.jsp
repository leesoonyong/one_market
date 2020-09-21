<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿡 게시판 수정 화면</title>

<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: skyblue; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
<div id="container">
	<h1>글 상세</h1>
	<form action="update.do" method="post">
		<input type="hidden" name="comSeq" value="${ckvo.comSeq }">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" value="${ckvo.title }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="nickName" value=${ckvo.nickName }></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea  name="content" >${ckvo.content }</textarea> 
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><input type="text" name="regdate" value=${ckvo.regdate }></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="hit" value=${ckvo.hit }></td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td><input type="text" name="likes" value=${ckvo.likes }></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="image" value=${ckvo.image }></td>
		</tr> 
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>

</div>

</body>
</html>