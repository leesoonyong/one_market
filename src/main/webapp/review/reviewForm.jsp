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

var searchWord = "${v_isbn}";
window.onload = function(){
	var v_ajax = new XMLHttpRequest();
	var v_data =  encodeURI("target=isbn&query=" + searchWord);
	
	v_ajax.open("GET","https://dapi.kakao.com/v3/search/book?"+v_data,true);
	v_ajax.setRequestHeader("Authorization","KakaoAK 610818229a025a47ac471649c5080d15");
	v_ajax.send();
	
	v_ajax.onreadystatechange = function(){
    if(v_ajax.readyState == 4 && v_ajax.status == 200){
      var v_docs = JSON.parse(v_ajax.responseText).documents;
      var v_thumbURL = v_docs[0].thumbnail;
      var v_title = v_docs[0].title;
      var v_contents = v_docs[0].contents;
      var v_authors = v_docs[0].authors;
      var v_publisher = v_docs[0].publisher;
      var v_isbn = v_docs[0].isbn;
      var v_url = v_docs[0].url;
    }
    if(!v_docs){
    	return;
    }else{
    	// attr, prop 모두 리드온리 사용가능
    	$("#id_prod_title").val(v_title).attr("readonly", true);
    	$("#id_prod_au").val(v_authors).prop("readonly", true);
    	$("#id_prod_pub").val(v_publisher).attr("readonly", true);
    	$("#id_prod_url").val(v_url).prop("readonly", true);
    	$("#id_prod_img").val(v_thumbURL).prop("readonly", true);
    	
    	if(v_thumbURL){
    		$("#div_prod_img").prepend("<img src=" + v_thumbURL + " width='90px' height='110'>")    		
    	}else{
    		$("#div_prod_img").prepend("<img src='https://t1.daumcdn.net/cfile/tistory/993B604F5D8D802419' width='90px' height='110'>")    		    		
    	}
    }
	}
}






</script>

</head>
<body>

<h3>리뷰</h3>

<form name="reviewForm" action="reviewInsert" method="post" enctype="multipart/form-data">

	<table class="table table-bordered">
		<tr>
			<td width="10%">리뷰 제목</td>
			<td colspan="5"><input type="text" class="form-control" name="rev_title" value="${review.rev_title}"></td>
			<td rowspan="2" width="100px" height="120px"><div id="div_prod_img" width="90px" height="110"></div></td>
		</tr>	
		
		<tr>
			<td width="10%">제품명</td>
			<td><input type="text" class="form-control" name="rev_prod_title" id="id_prod_title" value="${review.rev_prod_title}" readonly="true"></td>
			<td width="10%">제품가격</td>
			<td><input type="text" class="form-control" name="rev_prod_price" id="rev_prod_price" value="${review.rev_prod_price}" readonly="ture"></td>
			<td width="10%">제조사</td>
			<td><input type="text" class="form-control" name="rev_mfg_co" id="id_mfg_co" value="${review.rev_mfg_co}" readonly="true"></td>
<%-- 			<td><input type="text" class="form-control" name="rev_prod_url" id="id_prod_url" value="${review.rev_prod_url}" readonly="true"></td> --%>
			<input type="hidden" name="rev_prod_url" id="id_prod_url" value="${review.rev_prod_url}">
			<input type="hidden" name="rev_prod_img" id="id_prod_img" value="${review.rev_prod_img}">
		</tr>
		
		<tr>
			<td colspan="7"><textarea class="form-control" rows="10" cols="80" name="rev_content" value="${review.rev_content}"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="7" align="center">
				<input type="button" class="btn btn-default" value="등록" onclick="fn_save()">
				<input type="button" class="btn btn-primary" value="목록" onclick="location.href='reviewList'">
			</td>
		</tr>
		
	</table>
</form>

</body>
</html>