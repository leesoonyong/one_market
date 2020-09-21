<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<!-- 이 css와 js는 로컬에 있는 것들을 링크시킨 것이다. -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<title>인테리어 게시글 수정</title>
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
	th { background-color: orange; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
<div id="container">
	<h1>글 상세</h1>
	<form action="updateInterior.do" method="post">
		<input type="hidden" name="comSeq" value="${inter.comSeq }">
		<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" value="${inter.title }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
			${inter.nickName }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" id="description">${inter.content }</textarea>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${inter.regdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${inter.hit }</td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td>${inter.likes }</td>
		</tr>
		<tr>
			<th>파일이미지</th>
			<td><input type="text" name="fileImage" value="${inter.fileImage }"></td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	<c:remove var="com" />
	<p>
		<a href="deleteBoard.do?comSeq=${board.getSeq() }">글삭제</a>
		<a href="${contextPage.request.contextPath}/app/interior/interiorAllList.do">글목록</a>
	</p>
</div>
<script type="text/javascript">
	/* function update_form(b_no){
	  $.ajax({
	    url: "./update_form.jsp",
	    type: "POST",
	    cache: false,
	    dataType: "json",
	    data: "b_no=" + b_no,
	    success: function(data){
	      $('#b_no').val(data.b_no);
	      $('#b_type').val(data.b_type);  
	      $('#b_title').val(data.b_title);          
	      $('#b_content').val(data.b_content);
	      $('#b_file').val(data.b_file);
	      $('#b_user').val(data.b_user);
	      
	      $('#btn_proc').html('저장'); 
	      $('#btn_proc').off('click'); 
	      $('#btn_proc').on('click', update_proc);      
	    },
	    
	    error: function (request, status, error){        
	        var msg = "ERROR : " + request.status + "<br>"
	      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	      console.log(msg);              
	    }
	  }); */

	 $(function(){
			    $("#description").summernote({
			    	placeholder:"내용을 입력해주세요",
			    	height: 300,
			    	width : 800,
			    	minHeight: null,
			    	maxHeight: null,
			    	lang : 'ko-KR',
			    	callbacks: {
				          onImageUpload: function(files, editor, welEditable) {
				        	  sendFile(files[0], this); 
				         }
				   	}
			    });
			});

		/* summernote에서 이미지 업로드시 실행할 함수 */
		function sendFile(file, editor){
			/* 파일 전송을 위한 폼생성 */
			data = new FormData();
			data.append('uploadFile', file);
			$.ajax({ // ajax를 통해 파일 업로드 처리
				data : data,
				type : 'POST',
				url : '/app/admin/imageUpload.do',
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				dataType : 'text',
				success : function(data){
					console.log(data);
					$(editor).summernote('editor.insertImage', '/app/resources/img/'+data);
				},
				error : function(err){
					console.log(err);
				}
			});
		}
</script>
</body>
</html>