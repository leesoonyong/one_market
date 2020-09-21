<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>

</script>

 </head>
<body>





<div id="container">
	<h1>글등록</h1>

	<form action="InsertCook.do" method="post">

	<select name="category">
	<option value="3분요리">3분 요리</option>
	<option value="5분요리">5분 요리</option>
	<option value="10분 이상">10분 이상</option>
	</select>
	
	<table>
<!-- 		<tr> -->
<!-- 			<th width="70">제목</th> -->
<!-- 			<td> -->
<!-- 				<input type="text" name="title" size="30"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>작성자</th> -->
<!-- 			<td> -->
<!-- 				<input type="text" name="nick_name" > -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>내용</th> -->
<!-- 			<td> -->
<!-- 				<textarea id="editor1" name="content" rows="10" cols="40"></textarea> -->
<tr>
<td>
				<h2 style="text-align: center;">글 작성</h2><br><br><br>
<!-- 				썸머노트 -->
				<div style="width: 60%; margin: auto;">
					
						<input type="text" name="nickName" style="width: 20%;" placeholder="작성자"/><br>
						<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
						<br><br> 
						<textarea id="description" name="content"></textarea>
						<input id="subBtn" type="submit" value="글 등록" style="float: right;"/>
					
				</div>
							</td>					
		</tr>
		<tr>
			<th>파일이미지</th>
			<td>
				<input type="file" name="image">
			</td>					
		</tr>
		<tr>
			<th>조리시간</th>
			<td>
				<input type="text" name="cooktime">
			</td>					
		</tr>
		
		
<!-- 		<tr> -->
<!-- 			<td colspan="2" class="center"> -->
<!-- 				<input type="submit" value="새글 등록"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>
	</form>
	<p><a href="CookAll.do">글 목록 가기</a></p>
</div>





 <script>

//  CKEDITOR.replace('editor1', {
//      extraPlugins: 'image2,uploadimage',


//      // Configure your file manager integration. This example uses CKFinder 3 for PHP.
//      filebrowserBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html',
//      filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images',
//      filebrowserUploadUrl: '/fileupload.do',
//      filebrowserImageUploadUrl: 'fileupload.do',

//      // Upload dropped or pasted images to the CKFinder connector (note that the response type is set to JSON).
//      uploadUrl: 'fileupload.do',

//      // Reduce the list of block elements listed in the Format drop-down to the most commonly used.
//      format_tags: 'p;h1;h2;h3;pre',
//      // Simplify the Image and Link dialog windows. The "Advanced" tab is not needed in most cases.
//      removeDialogTabs: 'image:advanced;link:advanced',

//      height: 450
//    });
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
	/* 			$(editor).summernote('editor.insertImage', '../shop/storage/mint/product/'+data); */
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
 </script>



</body>
</html>