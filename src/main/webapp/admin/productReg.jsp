<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap)-->
<!-- summernote홈페이지에서 받은 summernote를 사용하기 위한 코드를 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<!-- 이 css와 js는 로컬에 있는 것들을 링크시킨 것이다. -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="/app/resources/css/admin/productReg.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>
<div class="container">
	<div class="title-wrap">
		<h2>상품등록</h2>
	</div>	
			
<form id="product" action = "productWrite.do" method="POST" enctype="multipart/form-data" >
	<div class="content_wrap">
		<div class="title-wrap summaryArea">
			<h3>카테고리</h3>			
		</div>
		<div class="content">
			<div class="table-wrap horizontal">
				<table class="table type1">
					<colgroup>
						<col style="width: 250px">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
							<td>
								<div class="depth1">
									<div class="cate-title">
										<strong>대분류</strong>
									</div>
									<div class="cate-list" id="setCateCd1">
										<select id="upperCategory" name="upperCategory"
											onchange="category1(this.value);" size="10"
											style="width: 100 px;">
											<option value="">카테고리::</option>
											<option value="가구">가구</option>
											<option value="수납정리">수납정리</option>
											<option value="인테리어 소품">인테리어 소품</option>
											<option value="가전제품">가전제품</option>
											<option value="패브릭">패브릭</option>
											<option value="주방용품">주방용품</option>
											<option value="생활용품">생활용품</option>
											<option value="반려동물">반려동물</option>
										</select>
									</div>
								</div>
							</td>		
							<td>	
								<div class="depth2 depth">
									<div class="cate-title">
										<strong>중분류</strong>
									</div>
									<div class="cate-list" id="setCateCd2">
										<select name="subCategory" id="subCategory"
											onchange="category2(this.value);" size="10"
											style="width: 100 px;">
											<option value="">카테고리::</option>
										</select>
									</div>
								</div>
								</td>
								<td>		
									<div class="depth3 depth">
										<div class="cate-title">
											<strong>소분류</strong>
										</div>
										<div class="cate-list" id="setCateCd2">
											<select name="subCategory2" id="subCategory2" size="10"
												style="width: 100 px;">
												<option value="">카테고리::</option>
											</select>
										</div>
									</div>
								</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
        </div>
		<!-- 판매정보 여기서 부터 시작 -->
		<div class="content_wrap">
			<div class="title-wrap">
				<h3>판매 정보</h3>
			</div>
			<div class="content">
				<div class="table-wrap horizontal">
					<table class="table type1" >
						<colgroup>
							<col style="width:250px;">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>
									<span class="title">상품명</span>
								</th>
								<td>
									<input type="text" name="pName" id="pName" required>
									<div class="checkFont" id="productCheck"></div>
								</td>
							</tr>
							<tr>
								<th>
									<span class="promotion">홍보문구</span>
								</th>
								<td>
									<input type="text" name="promotion" id="promotion" required>
									<div class="checkFont" id="productCheck"></div>
								</td>
							</tr>
							<tr>
								<th>
									<span class="title star">판매가격	</span>
								</th>
								<td class="cautionArea">
									<div class="inline num-box">
									<input type="text" name="price" id="price">
									<div class="checkFont" id="productCheck"></div>	
									</div>
								</td>
							</tr>
							<tr>
								<th>
									<div>
										<span class="title star">
											할인
										</span>
									</div>
								</th>
								<td>
									<input type="radio" name="sale" id="sale" value="설정"onclick="display()" />설정함 
									<input type="radio" name="sale"id="sale2" value="설정안함" checked="checked" onclick="hideDisplay()" />설정안함
									<div id="saleDiv">
									<table>
											<tr>
												<th>
													<label>할인</label>
													<input type="text" name="discountRate" id="discountRate"maxlength="2"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />%
												</th>
											</tr>
											<tr>
												<th>
													<label>할인 판매가격</label>
													<input type="text" name="salePrice" id="salePrice" value="" readonly/>
												</th>
											</tr>
									</table>
									</div>
								</td>
							</tr>
							<tr>
								<th>
									<div class="title-box">
										<span class="title star">
											재고수량
										</span>
									</div>									
								</th>
								<td>
									<div class="form inline">
										<div class="inline num-box">
											<input type="text" name="stock" id="stock"/>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>
									<div class="title-box">
										<span class="title star">
											배송비
										</span>
									</div>									
								</th>
								<td>
									<div class="form inline">
										<div class="inline num-box">
											<input type="text" name="shippingfee" id="shippingfee"/>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>
									<div class="title-box">
										<span class="title star">
											브랜드명
										</span>
									</div>	
								</th>
								<td>
									<div class="inline brand-box">
									<input type="text" name="brandName" id="brandName"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			<!-- 옵션은 추후 업데이트 하기로함 -->
			<!--  <div class="content_wrap">
				<div class="title-wrap">	
					<h3>옵션</h3>
				</div>
			<div class="content">
				<div class="table-wrap horizontal">
					<table>
						<colgroup>
							<col style="width:250px">
							<col width="*">						
						</colgroup>
						<tbody>
							<tr>
								<th><span class="title">옵션 선택</span></th>
								<td>
									<div class="radio-wrap yn">
										<label> <input type="radio" name="option" value="Y">
											<span class="check">설정함</span>
										</label> <label> <input type="radio" name="option" value="N">
											<span class="check">설정안함</span>
										</label>
									</div>
								</td>
							</tr>
							<tr class="tr-bg setOptFormAll">
								<th><span class="title">옵션 안내</span></th>
								<td>
									<div class="help_style" style="margin-top: 20px">
										<div class="box1"></div>
										<div class="box2"></div>
										<div class="box3"></div>
										<div class="box4"></div>
										<span class="help">도움말</span>
										<p class="font-s">
											상품의 옵션이 여러개 있거나, 각 상품별 금액/재고가 각각 다를 경우 옵션을 설정해주세요 <br>
											해당옵션은 상품의 상세화면에서 콤보박스로 자동생성됩니다. <br> <br> <img
												src="/app/resources/img/옵션.png" />
										</p>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="title">옵션등록</span></th>
								<td>
									<div class="content">
										<div class="productOptions">
											<div class="title">
												<h6>
													<span>옵션 제목</span> <span>옵션 값 <span
														style="font-weight: normal; color: #999;"> (쉼표를
															입력해서 구분해주세요) </span>
													</span>
												</h6>
											</div>
											<div id="optionVariationList" class="content_field">
												<div class="productOptionVariation row">
													<input type="text" id="text1"
														class="input_addOption optionName optionNameList"
														placeholder="예시)색상">
													<div class="input_addOption optionValueDiv">
														<div class="optionValue"></div>
														<input type="text" id="text2" class="optionValueInput"
															placeholder="예시)빨강, 파랑, 노랑">
													</div>
												</div>
											</div>
											<div class="row addOptionValue">
												<button id="addOptionVariation" >옵션추가하기</button>
											</div>
											<div class="optionPrice">
												<div class="title">
													<h6>
														<span style="margin-right: 64px;">항목</span> <span>상품코드</span>
														<span>추가 금액</span> <span>상품 금액</span> <span>수량</span>
													</h6>
												</div>
											<div id="optionTypeList" class="content_field"></div>
												<input type="hidden" name="productOptionVariations"
													id="productOptionVariations">
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>			
				</div>
			</div>						
		  </div> -->
		<div class="content_wrap">
			<div class="title-wrap">
				<h3>상세 설명</h3>
			</div>
			<div class="content">
				<div id="prodImgDiv" class="table-wrap horizontal">
					<table class="table type1">
						<colgroup>
							<col style="width:250px;">
							<col width="*">
						</colgroup>					
					<tbody>
						<tr>
							<th>
								<div class="title-box">
									<span class="title star">
										대표이미지
									</span>
								</div>
							</th>
							<td>
								<div class="dealadd-notice">
									<strong class="text-red">꼭 확인하세요</strong>
									<ul>
										<li>
											상품 메인에 등록될 대표이미지를 업로드 해주세요
										</li>
										<li>
											첨부된 이미지에 따라 상품등록에 제한이 생길수있습니다.
										</li>
									</ul>
								</div>
                                <div id="imgMNDiv" class="img-upload-wrap">
                                    <div class="preview-image">
                                        <div class="text-wrap">
                                            <h4>
                                              	  대표 이미지
                                                <div class="tooltip-wrap">
                                                    <button class="button round red">예시</button>	
                                                    <!--<div class="tooltip-box">   
                                                        <div class="img-box">
                                                            <img id="mainProdSampleImg" src="#">
                                                        </div>
                                                    </div>-->
                                                </div>
                                            </h4>
                                        <p class="text">
                                            	판매 상품의 대표이미지입니다.
                                            <br>
                                          	  보기 쉬운 간결한 이미지를 활용해주세요.
                                        </p>
                                    </div>
                                    <div class="imgDisplay">
                                        <img id="previewImg" src="/app/resources/img/default_image.png" width="150px;" height="150px;"/>
                                        <div class="filebox bs3-primary">
                                            <label for="thumnail">업로드</label>
                                            <input type="file" name="thumnail" id="thumnail"accept="image/jpeg,image/gif,image/png" onchange="preview(this)"/>
                                        </div>
                                    </div>
                                    <div class="preview-image">
                                        <div id="sub"class="text-wrap">
                                            <h4>서브 이미지</h4>
                                        </div>
                                    </div>
                                    <p class="text">
                                     	  상품의 다양한 이미지컷을
                                        <br>
                                    	    최대 2장까지 넣을 수 있습니다.
                                    </p>
                                    <div class="imgDisplay">
                                        <div class="view_area" style="display: flex;"></div>
                                        <img class="subImage"  src="/app/resources/img/default_image.png" width="150px;" height="150px;"/>
                                        <div class="filebox bs3-primary">
                                            <label for="subImage">업로드</label>
                                            <input type="file" name="subImage" id="subImage"accept="image/jpeg,image/gif,image/png" multiple>		
                                        </div>
                                    </div> 
                                </div>
                                </div>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title star">상품 상세 설명</span>							
							</th>
							<td>
								<div id="textArea">
									<textarea rows="5" cols="60" name="description" id="description"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<div class="button">
								<input type="submit" value="등록"/>
								</div>
							</td>
						</tr>
					</tbody>
					</table>
				</div>
			</div>
		</div>
		</form>
    </div>
	</body>
<script>


	$('#saleDiv').hide();

	function display() {
		if ($('input:radio[id=sale]').is(':checked')) {
			$('#saleDiv').show();
		}
	}

	function hideDisplay() {
		if ($('input:radio[id=sale2]').is(':checked')) {
			$('#saleDiv').hide();
		}
	}

	//숫자만 입력가능 할인율계산 
	function inNumber() {
		if (event.keyCode<48 || event.keyCode>57) {
			event.returnValue = false;
		}
	}

	//AJAX select box
	function category1(upperCategory) {
		$.ajax({
			type : "POST",
			url : "categorySelect1.do",
			dataType : "json",
			data : {
				param : upperCategory
			},
			success : function(result) {
				console.log(result);
				$("#subCategory").find("option").remove().end().append(
						"<option value=''>::카테고리</option>");
				$.each(result, function(i) {
					$("#subCategory").append(
							"<option value='"+result[i]+"'>" + result[i]
									+ "</option>")
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류가 발생하였습니다.");
			}
		});
	}

	function category2(subCategory) {
		$.ajax({
			type : "POST",
			url : "categorySelect2.do",
			dataType : "json",
			data : {
				param2 : subCategory
			},
			success : function(result) {
				console.log(result);
				$("#subCategory2").find("option").remove().end().append(
						"<option value=''>::카테고리</option>");
				$.each(result, function(i) {
					$("#subCategory2").append(
							"<option value='"+result[i]+"'>" + result[i]
									+ "</option>")
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("오류가 발생하였습니다.");
			}
		});
	}

	//할인가 계산

	$('#price').keyup(function() {
		var price = $('#price').val();
		var salePrice = $('#discountRate').val();
		$.ajax({
			type : "POST",
			url : "salePrice.do",
			dataType : "json",
			data : {
				price : price,
				salePrice : salePrice
			},
			success : function(data) {
				console.log(data)
				$('input[name=salePrice]').attr('value', data);
			}
		});
	});
	
	//할인가 계산 2번째 밑에꺼 입력시
	$('#discountRate').keyup(function() {
		var price = $('#price').val();
		var salePrice = $('#discountRate').val();
		$.ajax({
			type : "POST",
			url : "salePrice2.do",
			dataType : "json",
			data : {
				price : price,
				salePrice : salePrice
			},
			success : function(data) {
				console.log(data)
				$('input[name=salePrice]').attr('value', data);
			}
		});
	});
	
	
	$(function(){
	    $("#description").summernote({
	    	placeholder:"내용을 입력해주세요",
	    	height: 300,
	    	width : 800,
	    	minHeight: null,
	    	maxHeight: null,
	    	focus: true,
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
				console.log(data)
				$(editor).summernote('editor.insertImage', '/app/resources/img/'+data);
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
	//파일업로드 미리보기
	function preview(input){
			if (input.files && input.files[0]){
				var reader = new FileReader();//파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#previewImg').attr('src', e.target.result).width(150).height(150); 
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
				//(아래 코드에서 읽어들인 dataURL형식) 
				} 
				//File내용을 읽어 dataURL형식의 문자열로 저장
				reader.readAsDataURL(input.files[0]); 
			}//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		}
	
	/*
	//다중 파일 업로드 미리보기
	$(function(){
		var imagesPreview = function(input, placeToInsertImagePreview){
			if(input.files){
	            var filesAmount = input.files.length;

	            for (i = 0; i < filesAmount; i++) {
	                var reader = new FileReader();
	                
	                reader.onload = function(event) {
	                	$($.parseHTML('<img>')).attr('src',event.target.result).appendTo(placeToInsertImagePreview);
	                }
	                reader.readAsDataURL(input.files[i]);
	            }
			}
		};
	
		$('#subImage').on('change',function() {
			imagesPreview(this, 'div.gallery')	
		});
	});
	*/
	
	//다중 파일 업로드 새로함
	$('#subImage').on('change',function() {
		var form = $("#product")[0];
		console.log(form);
		var data = new FormData(form);
		$.ajax({
			type : 'POST',
			enctype : 'multipart/form-data',
			url : "subImageUpload.do",
			data : data,
			processData : false,
			contentType : false,
			success : function(json){
					console.log(json);
					$('.subImage').remove();
					
				for (var i in json) {
					console.log(json[i])
					$('.view_area').append(
							"<div class='id'><img style='width:150px; height:150px;' src=/app/resources/img/"+json[i]+"><button class='cancel' type='button' onclick='imgDel(this);'><img  src='https://img.icons8.com/metro/26/000000/cancel.png'/></button></div>");
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("오류가 발생하였습니다.");
			}
		});
	});
	
	//서브파일 이미지 업로드 삭제
	function imgDel(e) {
			var imgs = e.previousElementSibling;
			var src = imgs.src;
			console.log(imgs.src);
			var img = src.split('/');
			var fileName = img[6];
			console.log(fileName);
			$.ajax({
				type : 'post',
				url : "subImageUploadDel.do",
				data : {
					fileName : fileName
				},
				success : function(e) {
					console.log(e);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("오류가 발생하였습니다.");
				}
			});
			var imgtag = $(e).parent(); //<div><img></div>태그에서 div태그
			var imgtag2 = $(e).parent().parent();
			imgtag.remove();
			console.log($(".id").length);
			if($('.id').length == 0){
				imgtag2.append('<img class="subImage" src="/app/resources/img/default_image.png" width="150px;" height="150px;"/>');
			}
		};
		
	

</script>
</html>