<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>간단한 지도 표시하기</title>
    <!-- 다음 지도  -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69f7448811fd57d29b7398b4045f65df&libraries=services"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://kit.fontawesome.com/73d0df04d6.js" crossorigin="anonymous"></script>
</head>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 일 -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/app/resources/css/hojokinfo/get.css">

<!-- 섬네일이미지 출력  -->

<!-- 일반 평션  -->
<script>
    /*  파일 미리보기 태그 만들기  */

    $().ready(function () {
        var cnt = 1;
        var reply = 0;
        var contentimg = '${CommInfoVO.content}';
        var firstimg = $(contentimg).find('img:first').attr(
            'src');
        var image = document.createElement("IMG");
        image.src = firstimg;
        image.height = 300;
        image.width = 300;
        image.alt = "이미지가없습니다.";
        console.log(image);
        $('.card:first').html(image);


        $('#hart').click(function () {

            if ("${sessionScope.userSession.id}" != "") {

                var className = $(this).attr('class');
                if (className == "far fa-heart fa-5x") {

                    $(this).removeClass();
                    $(this).addClass("fas fa-heart fa-5x");

                    var comSeq = '${CommInfoVO.comSeq}';
                    var id = '${sessionScope.userSession.id}';

                    $.ajax({
                        type: 'post',
                        url: "likesUp.do",
                        data: {
                            comSeq: comSeq,
                            id: id
                        },
                        success: function (json) {

                            var puls = parseInt($('.hart-count').html());
                            $('.hart-count').html(puls + 1);
                            console.log("성공");

                        }, error: function (jqXHR, textStatus, errorThrown) { alert("오류가 발생하였습니다."); }
                    });
                } else {
                    $(this).removeClass();
                    $(this).addClass("far fa-heart fa-5x");

                    var comSeq = '${CommInfoVO.comSeq}';
                    var id = '${sessionScope.userSession.id}';
                    $.ajax({
                            type: 'post',
                            url: "likesDown.do",
                            data: {
                                comSeq: comSeq,
                                id: id
                            },
                            success: function (json) {

                                var puls = parseInt($('.hart-count').html());
                                $('.hart-count').html(puls - 1);
                                console.log("성공");

                            },
                            error: function (jqXHR,textStatus,errorThrown) {
                                alert("오류가 발생하였습니다.");
                            }
                        });

                }
                
            } else {
                var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")
                if (result) {
                    window .open(
                            '/app/loginModal.jsp',
                            'pop01',
                            'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no'
                            );
                }
            }

        });

        $('#book-mark').click(function () {

            if ("${sessionScope.userSession.id}" != "") {
                var className = $(this).attr('class');
                if (className == "far fa-bookmark fa-5x") {
                    $(this).removeClass();
                    $(this).addClass("fas fa-bookmark fa-5x");
                } else {
                    $(this).removeClass();
                    $(this).addClass("far fa-bookmark fa-5x");
                }
            } else {

                var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")
                if (result) {
                    location.href = "/app/login.jsp";
                }
            }
        });

        $(document).on("click",".comment_item_list button",function (){
                
            console.log(this)
            console.log(this.innerText);
            console.log(this.value);
            
            if (this.innerText == "답글") {
                    
                var form = document.querySelectorAll('#reply');
                    
                console.log(form.length);
                    
                if (form.length == 2) {
                        $("button:contains('답글취소')").text('답글');
                        $(form)[0].remove();
                }
                
                var reply = document.querySelector('#reply').cloneNode(true);
                    var puls = $(this).parent().parent();
                    $(puls).after(reply);
                    console.log(reply);
                    this.innerText = "답글취소";

            } else {
                
                this.innerText = "답글";
                var form = document.querySelector('#reply');
                $(form).remove();
            }
                //clone();						
        });

    });
</script>



<!-- 카카오톡 공유  -->
<script type='text/javascript'>
    //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('69f7448811fd57d29b7398b4045f65df');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLink() {
        Kakao.Link.sendDefault({
                objectType: 'location',
                address: '${CommInfoVO.adr }',
                addressTitle: '${CommInfoVO.title }',
                content: {
                    title: '${CommInfoVO.title }',
                    imageUrl: 'https://developers.kakao.com',
                    link: {
                        mobileWebUrl: 'https://developers.kakao.com',
                        webUrl: 'https://developers.kakao.com'
                    }
                },
                social: {
                    likeCount: 0,
                    commentCount: 0,
                    sharedCount: 0
                },
                buttons: [{
                    title: '웹으로 보기',
                    link: {
                        mobileWebUrl: 'http://localhost:8080/app/honjokInfo/get.do?comSeq=387',
                        webUrl: 'http://localhost:8080/app/honjokInfo/get.do?comSeq=387'
                    }
                }]
            });
    }
	//]]>
</script>

<script>
    $().ready(function () {
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {

            center: new kakao.maps.LatLng(33.450701,126.570667), // 지도의 중심좌표
            level: 3
                        // 지도의 확대 레벨
        };

                // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${CommInfoVO.adr}',function (result, status){

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(
                    result[0].y,
                    result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker(
                    {
                        map: map,
                        position: coords
                    });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow(
                    {
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">${CommInfoVO.placeName }</div>'
                    });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        });
    });
</script>



<style>
    textarea::placeholder {
        font-weight: 300;
    }

    textarea {
        padding-left: 0.8rem;
        resize: vertical;
    }
</style>
</head>

<body>
    <jsp:include page="/header.jsp"></jsp:include>
    <div>
        <header>
            <h1>혼밥</h1>
        </header>
    </div>
    <div class="row1">

        <div class="left-column">
            <div class="card"></div>
            <div class="card card-1">
                <p>작성자&nbsp;:&nbsp;${CommInfoVO.nickName }</p>
                <h2>${CommInfoVO.title }</h2>
                <h5></h5>
                <p>메장 대표메뉴</p>
                <c:forEach var="Upload" items="${UploadList }">
                    <img width="100px" height="100px" src="/app/resources/img/menu/${Upload.upImgName }">
                </c:forEach>

                <p>매장이름&nbsp;:&nbsp;${CommInfoVO.placeName}</p>
                <p>매장위치&nbsp;:&nbsp;${CommInfoVO.adr}</p>
                <p>매장 업종&nbsp;:&nbsp;${CommInfoVO.categoryName}</p>
                <p>매장번호&nbsp;:&nbsp;${CommInfoVO.tel }</p>
                <div id="map" style="width: 100%; height: 350px;"></div>

            </div>
            <div class="card card-2">
                <p>${CommInfoVO.content }</p>
                <i id="book-mark" class="far fa-bookmark fa-5x"></i> <span>찜하기</span>
                <i id="hart" class="far fa-heart fa-5x"></i> <span>좋아요</span> <span class="hart-count">${CommInfoVO.likes}</span> 
                <a id="kakao-link-btn" href="javascript:sendLink()"> 
                    <img style="width: 80px; height: 80px;" src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
                </a><span>공유하기</span>
            </div>


            <div class="card">

                <h2>혼밥리뷰</h2>
                <a>전체</a> <a>최신순</a> <a>좋아요순</a> 인생맛집

                <div class="comment_item_list">
                    <c:forEach varStatus="Num" var="reply" items="${reply }">
                        <div class="id_admin" style="width: 100%; display: block;">
                            <span> ${reply.nickName }</span>
                        </div>
                        <div class="comment" style="display: block;">
                            <div class="comment-img" style="display: flex;">
                                <c:forEach var="replyimg" items="${reply.replyuploadvo}">
                                    <img width="100" height="100" src="/app/resources/img/review/${replyimg.upImgName}">
                                </c:forEach>
                            </div>
                            <div style="display: flex; flex-direction: row;">
                                <div class="comment_contents"
                                    style="width: 95%; height: 50px; overflow: hidden; word-wrap: break-word;">
                                    ${reply.content }</div>
                                <div style="width: 5%; height: 50px;">
                                    <button style="" type="button" value="${reply.idx}">답글</button>
                                </div>
                            </div>

                        </div>
                        <hr>
                    </c:forEach>
                </div>

                <%-- ${reply.comSeq } ${reply.idx } ${reply.id }  --%>


                <div class="">
                    <form id="reply" method="post">
                        <textarea class="content" name="content" style="width: 90%; margin-top: 0px; margin-bottom: 0px; height: 56px;"></textarea>

                        <input type="hidden" name="id" value="${sessionScope.userSession.id }">
                        <input type="hidden" name="nickName" value="${sessionScope.userSession.nickName }">
                        <input type="hidden" name="comSeq" value="${CommInfoVO.comSeq }">
                        <input type="button" onclick="insertReview(this.form)" value="댓글 작성">
                    </form>

                    <form id="Review" method="post" enctype="multipart/form-data">
                        <div class="">
                            <div class="preview_area" style="display: block;">
                                <div class="view_area" style="display: flex;"></div>
                            </div>
                        </div>

                        <label for="image"></label>
                        <input multiple="multiple" type="file" name="file" id="image" />
                    </form>
                </div>
                <div style="display: flex; margin-top: 30px;">
                    <form class="update" action="update.jsp">
                        <c:set value="${CommInfoVO }" var="com" scope="session"></c:set>
                        <input type="submit" value="수정">
                    </form>
                    <form action="delete.do">
                        <input type="hidden" name="comSeq" value="${CommInfoVO.comSeq}">
                        <input type="submit" value="삭제">
                    </form>
                    <form action="select.do">
                        <input type="submit" value="목록으로">
                    </form>
                </div>

            </div>
        </div>

        <div class="right-column">

            <div></div>
            <div></div>
            <div></div>

            <div class="product" style="text-align: center;">

                <h3>추천상품</h3>

                <div class="card">
                    <a href="/app/Product/Product.do?pNum=11">
                        <span class="photo">
                            <img width="200" height="200" src="/app/resources/img/3종셋트.jpg" alt="상품명입력">
                        </span>
                        <br>
                        <span class="hash">#저렴하게!</span> <br>
                        <span class="tit">
                            <strong>마이세펴</strong>
                            	밀키트 3종 골라담기
                        </span>
                        <span class="price">
                            18000
                            <i>원</i>
                        </span>
                    </a>
                </div>
                <div class="card">
                    <a href="/app/Product/Product.do?pNum=13">
                        <span class="photo">
                            <img width="200" height="200" src="/app/resources/img/크림파스타1.jpg" alt="상품명입력">
                        </span> <br>
                        <span class="hash">#저렴하게!</span> <br>
                        <span class="tit">
                            <strong>프레시지</strong>
                            [프레시지] 트러플 크림 파스타 (2인분) 밀키트 쿠킹박스
                        </span>
                        <span class="price">
                            9900
                            <i>원</i>
                        </span>
                    </a>
                </div>
                <div class="card">
                    <a href="/app/Product/Product.do?pNum=14">
                        <span class="photo">
                            <img width="200" height="200" src="/app/resources/img/스테이크.jpg" alt="상품명입력">
                        </span> <br>
                        <span class="hash">#저렴하게!</span> <br>
                        <span class="tit">
                            <strong>프레시지</strong>
                            [프레시지] 블랙라벨 스테이크 (2인분) 밀키트 쿠킹박스
                        </span>
                        <span class="price">
                            17900
                            <i>원</i>
                        </span>
                    </a>
                </div>
            </div>

        </div>


    </div>

    <%-- 

	<h1>글번호 : ${CommInfoVO.comSeq }</h1>
	<h1>제목 : ${CommInfoVO.title }</h1> 
	<p>작성자: ${CommInfoVO.id }</p> 
	<p>별점:${CommInfoVO.sumStar }</p>
	<p>메뉴${CommInfoVO.menu }</p>
		<p>ID:${CommInfoVO.id }</p>
	<p>타입:${CommInfoVO.type }</p>
	<p>작성일:${CommInfoVO.regdate }</p>
	
--%>

    <script>
        function insertReview(e) {

            if ("${sessionScope.userSession.id}" != "") {

                var form = e.form;
                var data = new FormData(form);
                var imgs = document.querySelectorAll('.view_area img');
                console.log(imgs);
                var img = '';
                var files = '';
                var $file_ = [];

                for (var i in imgs) {

                    console.log(i);
                    img = $(imgs[i]).prop('src');
                    if (img != undefined) {
                        files = img.split('/');
                        $file_[i] = files[7];
                    }
                }

                var objParams = {
                    "content": $('.content').val(),
                    "file": $file_,
                    "comSeq": '${CommInfoVO.comSeq}',
                    "id": '${sessionScope.userSession.id}',
                    "nickName": '${sessionScope.userSession.nickName}'
                };

                $.ajax({
                    type: 'post',
                    url: "reviewInsert.do",
                    data: objParams,
                    success: function (data) {

                        console.log(data);
                        var fileString = "";
                        $('.content').val('');
                        $('.view_area').html('');
                        if ($file_ != null && $file_ != "") {
                            for (var i in $file_) {
                                fileString += "<img width='100' height='100' src='/app/resources/img/review/" + $file_[i] + "' />";
                            }

                        }
                        console.log(fileString);
                        var eParent = $(e).parent();
                        console.log("eParent" + eParent);
                        $('.comment_item_list').append(
                            '<div class="id_admin" style="width: 100%; display: block;"> <span>'
                            + objParams.nickName
                            + '</span></div><div class="comment" style="display: block;"><div class="comment-img" style="display: flex;">'
                            + fileString
                            + '</div><div style="display: flex; flex-direction:row;"><div class="comment_contents"style="width:95%;height:50px; overflow:hidden;word-wrap:break-word;">'
                            + objParams.content
                            + '</div><div style="width:5%; height:50px;"><button type="button">답글</button></div></div></div><hr>');

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("오류가 발생하였습니다.");
                    }
                });

            } else {
                var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")
                if (result) {
                    window.open(
                            '/app/loginModal.jsp',
                            'pop01',
                            'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
                }
            }
        }

        function imgDel(e) {

            var imgs = e.previousElementSibling;
            var src = imgs.src;
            console.log(imgs.src);
            var img = src.split('/');
            var fileName = img[7];
            console.log(fileName);
            $.ajax({
                type: 'post',
                url: "reviewUploadDel.do",
                data: {
                    fileName: fileName
                },
                success: function (e) {
                    console.log(e);

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("오류가 발생하였습니다.");
                }

            });

            var imgtag = $(e).parent();
            imgtag.remove();
        }

        $('#image').on('change', function () {

            if ("${sessionScope.userSession.id}" != "") {
                ext = $(this).val().split('.').pop().toLowerCase(); //확장자

                //배열에 추출한 확장자가 존재하는지 체크
                if ($.inArray(ext, ['gif', 'png', 'jpg',  'jpeg']) == -1) {
                    resetFormElement($(this)); //폼 초기화
                    window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                } else {
                    var form = $("#Review")[0];
                    var data = new FormData(form);
                    $.ajax({
                        type: 'post',
                        enctype: 'multipart/form-data',
                        url: "reviewUpload.do",
                        data: data,
                        processData: false,
                        contentType: false,
                        success: function (json) {
                            for (var i in json) {
                                $('.view_area')
                                    .append(
                                        "<div><img style='width:50px; height:50px;' src=/app/resources/img/review/" + json[i] + "><button type='button' onclick='imgDel(this);'>삭제하기</button></div>")
                            }
                            //alert("업로드 성공");	
                        },
                        error: function (jqXHR,
                            textStatus, errorThrown) {
                            alert("오류가 발생하였습니다.");
                        }

                    });
                }

            } else {

                var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")
                if (result) {
                    window.open(
                            '/app/loginModal.jsp',
                            'pop01',
                            'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
                }
            }
        });

        function resetFormElement(e) {
            e.wrap('<form>').closest('form').get(0).reset();
            //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
            //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
            //DOM에서 제공하는 초기화 메서드 reset()을 호출
            e.unwrap(); //감싼 <form> 태그를 제거
        }
    </script>


</body>

</html>