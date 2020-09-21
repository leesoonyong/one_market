imgName = new Array;
var ReviewBtn = document.querySelector(".ReviewBtn");
var Review = document.querySelector(".review-modal__modal__wrap");
var reviewModalClose = document.querySelector(".review-modal__close");
var reactModalCenterDiv = document.querySelector(".react-modal--center-div")
var body = document.querySelector("body");


var ratingInput = document.querySelector(".rating-group");
ratingInput.onclick = function(e) {
	var ratingValue = document.querySelector("input[name='rating']");

	var ratingInput = document.querySelector(".rating__input--none");
	ratingValue.value = e.target.value;

};

//리뷰페이징 처리
$('.production-review__paginator').on('click',function(e){
	
	if(e.target.nodeName != 'BUTTON') return;
	var cPage = e.target.innerText;
	var pNum = $('input[name="pNum"]').val();
	console.log(cPage);
	console.log(pNum);
	
	$.ajax({
		type : 'post',
		url : "ProductReview.do",
		data : {cPage:cPage,pNum:pNum},
		dataType : 'json',
		success : function(e) {
			console.log(e);
			
			$('.production-review-item__container').html("");
			
			for(var j = 0; j < e.productreviewvo.length; j++){
			
			//작성자 이름 생성  <p>
				var writer =  '<p class="production-review-item__writer__info__name">작성자: '+e.productreviewvo[j].id+'</p>';
			//별점 생성
				var ratings = document.createElement('SPAN');
				$(ratings).addClass('production-review-item__writer__info__total-star');
			for(var i = 0; i < e.productreviewvo[j].rating; i++){
				$(ratings).append('<i class="rating__icon rating__icon--star fa fa-star"></i>');
			}
			// 작성일자 
				var regdate =  '<span class="production-review-item__writer__info__date">'+e.productreviewvo[j].regdate+'</span>';
				var writerInfo = document.createElement('DIV');
				$(writerInfo).addClass('production-review-item__writer__info');
				
				$(writerInfo).append(writer+$(ratings).html()+regdate);
				
			

				
				
				
			

			

				var article = document.createElement('ARTICLE');
				$(article).addClass('production-review-item');
				
				article.append(writerInfo);
				$(article).append('<div>'+e.productreviewvo[j].title+'</div>');
				$(article).append('<img src="/app/resources/img/review/'+e.productreviewvo[j].photoImage1+'"style="width: 120px; height: 100px">');
				$(article).append('<img src="/app/resources/img/review/'+e.productreviewvo[j].photoImage2+'"style="width: 120px; height: 100px">');
				$(article).append('<p class="production-review-item__description">내용: <br>'+e.productreviewvo[j].content+'</p>');
				$('.production-review-item__container').append(article);
				console.log(article);
			}
			
			
			var perBtn = "";
				console.log(e.p.beginPage);
				if(e.p.beginPage != 1){
					perBtn  = '<li><button class="list-paginator__prev" type="button">이전</button></li>';
				}
				
				console.log(perBtn);
				
				var liTag = "";
				for(var i = 0 ; e.p.beginPage > e.p.endPage; i++ ){
					liTag += '<li><button class="list-paginator__page sm selected" type="button">'+i+'</button>';
	                   
				console.log(liTag);
				}
				
				
				var nextBtn = "";
				if(e.p.endPage <= e.p.totalPage){
					var nextBtn  = '<li><button class="list-paginator__next" type="button">다음</button></li>';
				}
				console.log(nextBtn);
				
				
			$('.production-review-item__container').append('<ul class="list-paginator production-review__paginator">'+perBtn+nextBtn+'</ul>');
				
			console.log(perBtn);
			
				
				
		},
		error : function(jqXHR, textStatus, errorThrown) {
			
			alert("오류가 발생하였습니다.");
			
		}
		});

});

$('#image')
		.on(
				'change',
				function() {
					if (this.files.length > 2) {
						alert("사진은 최대 2개 까지 가능 합니다");
						this.form.reset();
						$('.review-modal__section__img').html("");
						return;
					}
					ext = $(this).val().split('.').pop().toLowerCase(); // 확장자

					// 배열에 추출한 확장자가 존재하는지 체크
					if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
						this.form.reset(); // 폼 초기화
						$('.review-modal__section__img').html("");
						window
								.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
						return;
					}

					for (var i = 0; i < this.files.length; i++) {
						var imgDel = document.querySelector('#image');
						var j = 0;
						// 초기화
						$('.review-modal__section__img').html("");
						if (this.files && this.files[i]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$('.review-modal__section__img')
										.append(
												"<img class='review-img' src='"
														+ e.target.result
														+ "' width='200' height='200'> <button type='button' onclick='imgDel(this);' value='"
														+ j + "'>삭제하기</button>");

								if (imgName != null && imgName != "") {
									if (imgName.indexOf(imgDel.files[j].name) != -1) {

										var ss = imgName
												.indexOf(imgDel.files[j].name);
										imgName.splice(ss, 1);

										var imgArray = $('input[name="imgArray"]');

										var myArrayData1 = [];
										myArrayData1 = imgName.toString();

										$(imgArray).val(imgName);
									}
								}
								j++;
							}
							reader.readAsDataURL(this.files[i]);
						}
					}

				});

function imgDel(e) {

	var imgDel = document.querySelector('#image');

	if (imgName.indexOf(imgDel.files[e.value].name) == -1) {
		imgName.push(imgDel.files[e.value].name);
	}

	var imgTag = e.previousElementSibling;

	imgTag.remove();
	e.remove();

	var imgArray = $('input[name="imgArray"]');

	var myArrayData1 = [];
	myArrayData1 = imgName.toString();

	$(imgArray).val(imgName);
}

function reviewForm(e) {
	var form = $(".review-modal__form")[0];
	var data = new FormData(form)

	$.ajax({
		type : 'post',
		enctype : 'multipart/form-data',
		url : "Review.do",
		data : data,
		processData : false,
		contentType : false,
		success : function(e) {
			alert("업로드 성공");
			location.replace('#production-selling-review');
			location.reload();
			reactModalCenterDiv.style.display = "none";
			body.style.overflow = "scroll";
			/*
			 * for ( var i in json) { $('.view_area') .append( "<div><img
			 * style='width:50px; height:50px;'
			 * src=/app/resources/img/review/"+json[i]+"><button type='button'
			 * onclick='imgDel(this);'>삭제하기</button></div>") }
			 */
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("오류가 발생하였습니다.");
		}

	});

}


ReviewBtn.onclick = function() {
	var scrollPosition = window.scrollY;
	reactModalCenterDiv.style.top = scrollPosition;
	reactModalCenterDiv.style.display = "block";
	reactModalCenterDiv.style.overflow = "scroll";
	body.style.overflow = "hidden";
}


reviewModalClose.onclick = function() {
	reactModalCenterDiv.style.display = "none";
	body.style.overflow = "scroll";
}

