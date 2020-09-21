<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>글상세보기</title>
</head>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">
<body>
	<h3>게시판 상세보기</h3>
	  <!-- Page Content -->
  <div class="container">

    <div class="row">

      
      <div class="col-md-8">

        <h1 class="my-4">${qna.title }
        </h1>

        <div class="card mb-4">
          <div class="card-body">
            <p class="card-text">${qna.content }</p>
          </div>
          <div class="card-footer">
            Posted on ${qna.regdate } by
            <a href="#">${qna.nickName }</a>
          </div>
        </div>
	
	<table class="table table-bordered">
		<tr>
			<td width="20%">제목</td>
			<td>${qna.title}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${qna.nickName}</td>
		</tr>
		<tr>
			<td>작성일자</td>
			<td>${qna.regdate}</td>
		</tr>

</body>
</html>