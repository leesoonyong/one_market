<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://kit.fontawesome.com/73d0df04d6.js" crossorigin="anonymous"></script>
  	<link href="/app/resources/css/product/productDetail.css?after" rel="stylesheet">
<style>
</style>

</head>

<body>
<jsp:include page="/header.jsp"></jsp:include>
<!-- 문의 모달 시작 -->
  <div class="react-modal react-modal--center product-question__modal open open-active" style="z-index: 9999">
        <div class="react-modal__content-wrap">
            <div class="react-modal__content product-question">
                <form class="product-question__wrap" action="inserQnaReview.do" method="POST">
                <input type="hidden" name="commentProc" value="상품">
                <input type="hidden" name="seq" value="${productvo.pNum }">
                <input type="hidden" name="id" value="${sessionScope.userSession.id }">
                    <div class="product-question__wrap__close"><button type="button">닫기</button></div>
                    <div class="product-question__wrap__title">상품 문의하기</div>
                    <div class="product-question__wrap__sub-title">문의유형</div>
                    <div class="product-question__wrap__type-select">
                        <div class="product-question__wrap__type-select__box product-question__wrap__type-select__box--select">상품</div>
                        <div class="product-question__wrap__type-select__box">배송</div>
                        <div class="product-question__wrap__type-select__box">반품</div>
                        <div class="product-question__wrap__type-select__box">교환</div>
                        <div class="product-question__wrap__type-select__box">환불</div>
                        <div class="product-question__wrap__type-select__box">기타</div>
                    </div>
                    <div class="product-question__wrap__sub-title product-question__wrap__sub-title--error">상품 및 옵션
                    </div>
                    <div class="product-question__wrap__option-select">
                        <div class="input-group select-input errored product-question__wrap__option-select__input">
                            <select name="pName" class="form-control empty error">
                                <option value="${productvo.pName}">${productvo.pName}</option>
                            </select><span class="select-input__icon"></span></div>
                        <div class="form-check checkbox-input product-question__checkbox"><label
                                class="form-check-label"><input class="form-check" type="checkbox"><span
                                    class="check-img"></span>선택 안함</label></div>
                    </div>
                    <div class="product-question__wrap__sub-title">문의</div>
                    
                    <input type="text" placeholder="제목을 입력하세요" name="title"><br>
                    <textarea placeholder="문의 내용을 입력하세요"
                        maxlength="1000" class="form-control text-area-input product-question__wrap__question"
                        style="height: 40px;" name="content"></textarea>
                    <div class="product-question__wrap__explain">문의내용에 대한 답변은 ‘마이페이지 &gt; 나의 쇼핑 &gt; 나의 문의내역’ 또는 ‘상품
                     	   상세페이지’에서 확인 가능합니다.</div>
                    <div class="product-question__wrap__buttons">
                       <button
                            class="button button--color-blue button--size-50 button--shape-4 product-question__wrap__buttons__submit"
                            type="button">완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<!-- 리뷰 모달 끝 -->


      <!--리뷰모달 시작-->
<div class="react-modal react-modal--center review-modal__modal__wrap open open-active">
        <div class="react-modal__content-wrap">
            <div class="react-modal__content review-modal__modal">
                <div class="review-modal">
                    <div class="review-modal__title">리뷰 쓰기
                        <button type="button" class="review-modal__close">취소
                    </button></div>
                    <div class="review-modal__point-explain">포토리뷰&nbsp;<span class="review-modal__point-explain__value">250P</span>,&nbsp;
         	               일반리뷰&nbsp;<span class="review-modal__point-explain__value review-modal__point-explain__value--none">0P</span>
                    </div>

                    <form class="review-modal__form">
                    <input type="hidden" name="id" value="${sessionScope.userSession.id }"> <input
							type="hidden" name="nickName" value="${sessionScope.userSession.nickName }"> <input
							type="hidden" name="pNum" value="${productvo.pNum }">
					<input type="hidden" name="imgArray" value="">
                        <div class="review-modal__form__product">
                            
                            <div class="review-modal__form__product__contents">
                                <div class="review-modal__form__product__contents__brand"></div>
                                <div class="review-modal__form__product__contents__name">
                                </div>
                                <div class="review-modal__form__product__contents__options"></div>
                            </div>
                        </div>
                        <div class="review-modal__section">
                            <div class="review-modal__section__title">별점 평가</div>
                            <div class="review-modal__form__star__wrap">
                                <div class="review-modal__form__star">
                                    <div class="review-modal__form__star__label">만족도</div><br>
                                    <div id="full-stars-example-two">
                                        <div class="rating-group">
                                            <input disabled checked class="rating__input--none" id="rating3-none" value="1" type="radio">
                                            <label aria-label="1 star"   class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                            <input class="rating__input" id="rating3-1" value="1" type="radio">
                                            <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                            <input class="rating__input" id="rating3-2" value="2" type="radio">
                                            <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                            <input class="rating__input" id="rating3-3" value="3" type="radio">
                                            <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                            <input class="rating__input" id="rating3-4" value="4" type="radio">
                                            <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                                            <input class="rating__input" id="rating3-5" value="5" type="radio">
                               				<input class="review-rating" type="hidden" name="rating" value="5">
                                        </div>
                                           
                            
                                    </div>
                                </div>
                            </div>
                        </div>
  								                       
                        <div class="review-modal__section" >
                            <div class="review-modal__section__img">    
                            </div>
                            <div class="review-modal__section__explain">사진을 첨부해주세요. (최대 2장 / 'gif', 'png', 'jpg','jpeg' 형식만 가능)<br>
                            </div>
                            <div class="select-my-card">
                                <div class="select-my-card__content select-my-card__content--select">
                                    <div class="round-checkbox-input round-checkbox-input--blue">
                                        <label class="round-checkbox-input__label">
                                                <span class="round-checkbox-input__icon">
                                                    </span>
                                                </label></div>
                                </div>
                                <div class="select-my-card__content">
                                    <div class="round-checkbox-input round-checkbox-input--blue">
                                        <label
                                            class="round-checkbox-input__label">
                                                <span class="round-checkbox-input__icon">
                                            </span>
                                        </label></div>
                                </div>

                            </div>
                            <input multiple="multiple" type="file"
							name="file" id="image"  style="display:none"/>
                            <button class="button button--color-blue-inverted button--size-50 button--shape-4 upload-button"
                                type="button" onclick="document.all.file.click()" >사진 첨부하기</button><br>
                        </div>
                        <div class="review-modal__section">
                            <div class="review-modal__section__title">리뷰 작성</div><br>
                            <input class="review-title" type="text" name="title" value="제목">
                            <br>
                            <br>
                            <textarea class="review-content" name="content"
                                placeholder="자세하고 솔직한 리뷰는 다른 고객에게 큰 도움이 됩니다. (최소 20자 이상)"
                                class="form-control text-area-input review-modal__form__review-input"
                                style="height: 60px; width: 98%; border: 1px solid #888;"></textarea><br>
                        </div>

                        <div class="review-modal__section">
                            <div class="review-modal__section__title">상품을 직접 사용하고 작성한 리뷰인가요?</div><br>
                            <div class="form-check checkbox-input"><label class="form-check-label">
                                <input class="form-check" type="checkbox"><span class="check-img"></span>
                                <span class="review-modal__form__agree">네. 상품을 직접 사용 후 작성한 리뷰이며,&nbsp;
                                    <span class="review-modal__form__agree__policy-button">정책</span>에동의합니다.</span></label></div><br>
                        </div>
                            <div class="review-modal__explain">
                        <ul>
                            <li>비구매 상품 리뷰 포인트는 심사 후 지급됩니다. (영업일 기준 2~3일 소요)</li>
                            <li>포인트는 최초 작성한 리뷰를 기준으로 지급됩니다.</li>
                            <li>사진 첨부시&nbsp;<span class="review-modal__explain__warning">캡쳐, 도용, 유사상품 촬영, 동일상품 여부 식별이
                          	          불가한 경우</span>에는 등록이 거절되며 사유는 별도 안내되지 않습니다.</li>
                            <li>상품과 무관한 내용이나 사진, 동일 문자 반복 등의 부적합한 리뷰는 사전 경고 없이 삭제 및 포인트 회수될 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
                        <button class="button button--color-blue button--size-50 button--shape-4 review-modal__form__submit"
                            type="button" onclick="reviewForm(this.form)">완료</button>
                    </form>
                 
                
            </div>
        </div>
</div>
<!--리뷰 모달-->





    <div class="production-selling-overview container">
        <!-- 상품 태그 시작-->
                    
        

        <!-- 상품 디테일 페이지 왼쪽 표시 -->
        <div class="production-selling-overview__container row" style="padding-left: 50px">

            <nav class="commerce-category-breadcrumb-wrap production-selling-overview__category">
                <!-- 네비게이션 시작 -->

                <ol class="commerce-category-breadcrumb">
                    <li class="commerce-category-breadcrumb__entry">
                        <a class="link"
                            href="#">${productvo.upperCategory }</a>
                   </li>
                    <li class="commerce-category-breadcrumb__entry">
                        <a class="link"
                            href="#">${productvo.subCategory }</a>
   					</li>
                    <li class="commerce-category-breadcrumb__entry">
                        <a class="link"
                            href="#">${productvo.subCategory2 }</a>
   					</li>
                </ol>
            </nav>

            <div class="production-selling-overview__cover-image-wrap col-12 col-md-6 col-lg-7">


                <div class="carousel production-selling-cover-image production-selling-overview__cover-image"
                    role="region" aria-roledescription="carousel">

                    <div class="carousel__list-wrap production-selling-cover-image__carousel-wrap">

                        <div>
                            <ul class="production-selling-cover-image__list">

                         
                             
                             <!-- 
                                <li class="production-selling-cover-image__list__item"><button
                                        class="production-selling-cover-image__list__btn" type="button"
                                        aria-label="8개 중 2번째 항목">
                                        <img class="image"
                                            src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157898667308487965.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
                                            srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157898667308487965.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157898667308487965.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157898667308487965.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 3x">
                                    </button>
                                </li>
                               <li class="production-selling-cover-image__list__item">
                                    <button class="production-selling-cover-image__list__btn" type="button"
                                        aria-label="8개 중 3번째 항목">
                                        <img class="image"
                                            src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157830626663754284.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c&amp;webp=1"
                                            srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157830626663754284.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157830626663754284.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/157830626663754284.jpg?gif=1&amp;w=240&amp;h=240&amp;c=c&amp;webp=1 3x">
                                    </button>
                                </li> -->
                            </ul>
                        </div>

                        <!-- 상품 메인  이미지 -->
                        <div class="carousel__list" aria-live="polite" style="transform: translateX(0%);">
                            <div class="carousel__list__entry production-selling-cover-image__entry" role="group"
                                aria-roledescription="slide" aria-label="1 of 8" style="width: 100%;">
                                <img class="production-selling-cover-image__entry__image" tabindex="0"
                                    src="/app/resources/img/${productvo.thumnailImg}">
                            </div>
                            <!-- 상품 메인  이미지 끝 -->
                        </div>
                    </div>
                </div>


                <!--상품 디테일 페이지 왼쪽 표시 끝 -->


                <!-- 상품 디테일 페이지 오른쪽 표시 시작-->
                <div class="production-selling-overview__content col-12 col-md-6 col-lg-5">
                    <div class="production-selling-header">
                        <h1 class="production-selling-header__title">
                        
                                <a class="production-selling-header__title__brand" style="margin-bottom:10px; display: block;"
                                    href="">[브랜드명]
                                </a> 
                                <span class="production-selling-header__title__name">${productvo.pName}</span>
                        </h1>


                        <!--별점부터 적립-->
                        <div class="production-selling-header__content">
                            <div class="production-selling-header__action">
                                <!-- 스크랩 -->
                                <button
                                    class="production-selling-header__action__button production-selling-header__action__button-scrap"
                                    type="button">
                                    <span class="count far fa-bookmark fa-2x"></span>
                                </button>
                                <!--스크랩 끝-->

                                <!--스크랩 공유(카톡,페이스북,카스,블로그) 시작-->
                                <div class="drop-down">
                                    <button class="production-selling-header__action__button" type="button">
                                        <span class="count fas fa-share-alt fa-2x"></span>
                                    </button>
                                </div>
                                <!--스크랩 공유(카톡,페이스북,카스,블로그) 끝-->

                            </div>


                            <!-- 종합 리뷰 별점  -->
                            <p class="production-selling-header__review-wrap">
                                <a class="production-selling-header__review" href="#production-selling-review">
                                    <!-- 종합별점 별모양 -->
                                    <span class="production-selling-header__review__icon">
                                        	별5개
                                    </span>
                                    <!--리뷰 갯수-->
                                    <span class="production-selling-header__review__text"><span
                                            class="number">[${p.totalRecord }]</span>
                                        <span class="postfix">개 리뷰</span>
                                    </span>
                                </a>
                            </p>
                            <!-- 종합 리뷰 별점  끝 -->

                            <p class="production-selling-header__price">
                                <span class="production-selling-header__price__row">
                                    <span class="production-selling-header__price__discount">
                                  
                                        <span class="number"><fmt:formatNumber value="${(productvo.price - productvo.saleprice) / productvo.price * 10}" pattern="0" /></span>
                                        <span class="percent">%</span>
                                        &nbsp;
                                    </span>
                                    <span class="production-selling-header__price__price-wrap">
                                        <del class="production-selling-header__price__original">
                                            <span class="price">${productvo.price}</span>
                                            <span class="won">원</span>
                                        </del>
                                        <span class="production-selling-header__price__separator"></span>
                                        <span class="production-selling-header__price__price">
                                            <span class="saleprice">${productvo.saleprice }</span>
                                            <span class="won">원</span>
                                            <span class="production-selling-header__price__badge">
                                            </span>
                                        </span>
                                    </span>
                                </span>
                            </p>
                            
                            <div class="production-selling-header__promotion">
                                <p class="production-selling-header__promotion__entry">
                               
                                </p>
                            </div>
                        </div>
                        
                        <p class="production-selling-header__delivery">
                            <span class="production-selling-header__delivery__type">
                                <span>일반택배</span>
                            </span>

                            <span class="production-selling-header__delivery__fee">
                                <span>택배비 :${productvo.shippingfee}</span>
                            </span>

                            <span class="production-selling-header__delivery__disclaimer-wrap">
                                <span class="production-selling-header__delivery__disclaimer">조건에 따라 추가비용 발생 가능 (상품 상세 정보 참고)</span>
                            </span>
                            <span class="production-selling-header__seller__text">
                          		${productvo.brandName}
                            </span>
                        </p>

    

                        <!--production-selling-header 끝-->
                    </div>

				<form class="add-cart" action="/app/addCartList.do" method="POST">
				    <input type="hidden" name="stock" value="${productvo.stock}"> 
				    <input type="hidden" name="pNum" value="${productvo.pNum }">
				    <input type="hidden" name="pCnt" value="1">
				    <input type="hidden" name="shippingFee" value="${productvo.shippingfee}">
					
                    <div class="production-selling-option-form production-selling-overview__option-form">
                        <section class="selling-option-form-content production-selling-option-form__form">
							<div class="selling-option-form-content__form">
								<span>남은 수량 : <span class="stock">${productvo.stock}</span></span> <select id="product-select">
									<option value="">선택</option>
									<option value="">${productvo.pName}</option>
								</select>

								<div class="optselect_area" style="">
									<ul id="_optionSelectList" class="opt_selectlist">
										
									</ul>
								</div>
							</div>

							<ul class="selling-option-form-content__list"></ul>
                            <p class="selling-option-form-content__price">
                                <span class="selling-option-form-content__price__left">주문금액</span>
                                <span class="selling-option-form-content__price__right">
                                <span class="selling-option-form-content__price__number">0</span>원</span>
                            </p>
                        </section>
                        <div class="production-selling-option-form__footer">
                            <button type="button" id="cart" class="button button--color-blue-inverted button--size-55 button--shape-4"
                               >장바구니</button>
                            <button id="orders" type="button" class="button button--color-blue button--size-55 button--shape-4"
                               >바로구매</button>
                        </div>
                    </div>
                </form>
                </div>

            </div>
            <!--production-selling-overview__container row 끝-->
        </div>


        <!-- 상품 정보 및 리뷰 문의 배송 환불 추천 !-->
        <div data-sticky-enabled="false" data-sticky-always="false" data-direction="top" data-offset="80"
            class="sticky-container production-selling-navigation-wrap" style="width: 100%; height: 100%;">
            <div class="sticky-child production-selling-navigation" style="position: relative;">
                <nav class="production-selling-navigation__content">
                    <ol class="prodproductionuction-selling-navigation__list">
                        <li>
                            <a class="production-selling-navigation__item"
                                href="#production-selling-information">상품정보</a>
                        </li>
                        <li>
                            <a class="production-selling-navigation__item" href="#production-selling-review">리뷰
                                <span class="production-selling-navigation__item__count">${p.totalRecord }</span>
                            </a>
                        </li>
                        <li>
                            <a class="production-selling-navigation__item" href="#production-selling-question">문의
                                <span class="production-selling-navigation__item__count">${p1.totalRecord }</span>
                            </a>
                        </li>
                        <li>
                        <a class="production-selling-navigation__item" href="#production-selling-delivery">배송/환불<a>
                        </li>
                        <li>
                            <a class="production-selling-navigation__item production-selling-navigation__item--active"
                                href="#production-selling-suggestion">추천상품</a>
                        </li>
                        <div class="line"></div>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="production-selling__detail-wrap container">

            <div class="production-selling__detail row">

                <div class="production-selling__detail__content col-12 col-lg-8">
                    <div class="production-selling-content">
                        <a id="production-selling-information"></a>
                        <section class="production-selling-section">
                                <h1 class="production-selling-section__title">상품정보</h1>
                            <div class="production-selling-description">
                              <!--   <div class="production-selling-description__expand-wrap">
                                    <button
                                        class="button button--color-blue button--size-60 button--shape-4 production-selling-description__expand"
                                        type="button">펼치기f
                                    </button>
                                </div> -->
                                <a class="production-selling-description__production-event"
                                    href="#">
                                    <img class="production-selling-description__production-event__image production-selling-description__production-event__image--pc "
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/productions/event/158323970651177877.png?gif=1&amp;w=720&amp;webp=1"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/productions/event/158323970651177877.png?gif=1&amp;w=1080&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/productions/event/158323970651177877.png?gif=1&amp;w=1440&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/admins/productions/event/158323970651177877.png?gif=1&amp;w=2560&amp;webp=1 3x">                               
                                </a>
                                <div class="production-selling-description__content">
                                    <p>&nbsp;</p>
                                    <p>
                                       ${productvo.description}
                                        <br>
                                        <script type="text/javascript">
                                        var contentimg = '${productvo.description}';
										var firstimg = $(contentimg).find('img');
										for (var i = 0; i < firstimg.length; i++) {
											var src = $(firstimg[i]).attr('src');
											$('.production-selling-cover-image__list').append(' <li class="production-selling-cover-image__list__item"><button class="production-selling-cover-image__list__btn production-selling-cover-image__list__btn--selected"type="button"><img class="image" src="' + src + '"></button></li>');
										}
										</script>
                                        
                     <!--    <img src="https://exit.ohou.se/e328923597eb2272d6a991377ec851d5d4a225bc/ai.esmplus.com/saeromi0871/R_9Zone_/02.gif">
                        <br> -->
                                    </p>
                                </div>
                                <table style="padding:50px"
                                    class="production-selling-table production-selling-description__information-noti">
                                    <tbody>
                                        <tr>
                                            <th>품명</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>KC 인증 필 유무</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>색상</th>
                                            <td>상세페이지 참조</td>
                                        </tr>
                                        <tr>
                                            <th>구성품</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>주요 소재</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>제조자, 수입품의 경우 수입자를 함께 표기</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>제조국</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>크기</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>배송, 설치비용</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>품질보증기준</th>
                                            <td>제품 이상시 공정거래위원회 고시 소비자분쟁해결기준에 의거 보상합니다.</td>
                                        </tr>
                                        <tr>
                                            <th>A/S 책임자와 전화번호</th>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                        <!--상품 끝-->


                        <a id="production-selling-review"></a>
                        <section class="production-selling-section">
                            <header class="production-selling-section__header">
                                <h1 class="production-selling-section__title">리뷰
                                    <span class="count">[${p.totalRecord }]</span>
                                </h1>
                                <div class="production-selling-section__right">
                                    <button class="ReviewBtn" type="button">리뷰쓰기</button>
                                </div>
                            </header>


                            <div class="production-review-feed">
                                <div class="production-review-feed__header">
                                    <div class="production-review-feed__header__stars">
                                    </div>
                                </div>

                                <div class="filter">
                                    <div class="production-review-feed__filter-wrap">
                                        <div class="production-review-feed__filter">
                                            <div class="production-review-feed__filter__order-list">
                                     <!--            <button
                                                    class="production-review-feed__filter__order production-review-feed__filter__order--active"
                                                    aria-pressed="true" type="button">베스트순</button>
                                                <button class="production-review-feed__filter__order"
                                                    aria-pressed="false" type="button">최신순</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="production-review-feed__list">
                                    <div class="production-review-item__container">
                                              <c:forEach var="product" items="${productvo.productreviewvo }" >
                                        <article class="production-review-item">
                                            <div class="production-review-item__writer">
                                                <!-- <img src=""
                                                    class="production-review-item__writer__img" alt="작성자 이미지"> -->
                                                <div class="production-review-item__writer__info">
                                                    <p class="production-review-item__writer__info__name">
                                                        	작성자: ${product.id }
                                                    </p>

                                                        <span class="production-review-item__writer__info__total-star">
	                                                     		      	 <i class="rating__icon rating__icon--star fa fa-star"></i>                    		   
	                                                     		     <c:forEach var="i" begin="1" end="5" step="1" >
	                                                     		     	<c:if test="${ i < product.rating }">
	                                                     		    	 <i class="rating__icon rating__icon--star fa fa-star"></i>                    		    	 
	                                                     		    	</c:if>
	                                                     		     </c:forEach>
                                                        </span>
                         
                                                    <span class="production-review-item__writer__info__date">${product.regdate }</span>
                                                </div>
                                            </div>
                                          		  <div>제목 : ${product.title }"</div>
                                          
                                           		
                                           		<img src="/app/resources/img/review/${product.photoImage1 }"  style="width: 120px; height: 100px">
                                           		<img src="/app/resources/img/review/${product.photoImage2 }"  style="width: 120px; height: 100px">
                                                
                                                
                                            <p class="production-review-item__description">
													내용: <br> ${product.content}
                                            </p>
                                            	</article>	
                                            </c:forEach>
                                            
                                 <ul class="list-paginator production-review__paginator">
                                                                            
                                
                                 	<c:choose>
                                 	
                                 		<c:when test="${p.beginPage == 1 }">
	                                		<!-- <button class="list-paginator__prev" type="button">
	                                           	이전
	                                       	</button> -->
                                       </c:when>
                                       <c:otherwise>
                                        	<li>
		                                       <button class="list-paginator__prev" type="button">
		                                           	이전
	                                       		</button>
                                       		</li>
                                       </c:otherwise>
                                    </c:choose>
                                   
                                 	<c:forEach var="i" begin="${p.beginPage }" end="${p.endPage }">
                                 
                                 	<c:choose>
                                 		<c:when test="${i == p.nowPage }">
		                                    <li>
		                                        <button class="list-paginator__page sm selected" type="button">${i }</button>
		                                    </li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	 <li>
		                                        <button class="list-paginator__page sm" type="button">${i }</button>
		                                    </li>
	                                    </c:otherwise>
	                                </c:choose>
	                                
                                    </c:forEach>
                                  
                                  <c:choose>
                                  	<c:when test="${p.endPage >= p.totalPage }">
	                                <!--     <li>
	                                        <button class="list-paginator__next" type="button">
	                                           	다음
	                                        </button>
	                                    </li> -->
	                                    </c:when>
	                                    <c:otherwise>
	                                    <li>
	                                        <button class="list-paginator__next" type="button">
	                                           	다음
	                                        </button> 
	                                    </li>
	                                    </c:otherwise>
                                    </c:choose>
                                </ul>
                                <!--production-review-feed 끝-->           
                                      
                                    </div>


                                </div>
                                
                                
                            </div>
                        </section>

						<a id="production-selling-question"></a>
						<section class="production-selling-section">
							<header class="production-selling-section__header">
								<h1 class="production-selling-section__title">
									문의<span class="count">[${p1.totalRecord }]</span>
								</h1>
								<div class="production-selling-section__right">
									<button type="button">문의하기</button>
								</div>
							</header>
							<div class="production-question-feed">
								<div class="production-question-feed__list">
								<c:forEach var="productqna" items="${productvo.productqnavo}">
										<article class="production-question-feed__item">
									<c:choose>
										<c:when test="${productqna.lev == 0 }">
											<header class="production-question-feed__item__header">
												${productqna.buyInfo } | ${productqna.commentProc } | <span class="answered">${productqna.pProc }</span>
											</header>
											<p class="production-question-feed__item__author">${productqna.id }
												| ${productqna.regdate }</p>
											<div class="production-question-feed__item__question">
												<span class="production-question-feed__item__badge">&nbsp;</span>
												<p class="production-question-feed__item__title">${productqna.title }</p>
												<p class="production-question-feed__item__content">${productqna.content }</p>
											</div>
											</c:when>
											<c:otherwise>
											<div class="production-question-feed__item__answer">
												<span class="production-question-feed__item__badge">A&nbsp;</span>
												<p class="production-question-feed__item__answer__author">
													<span class="author"></span>&nbsp;<span class="date"></span>
												</p>
												<p class="production-question-feed__item__content"></p>
											</div>
											</c:otherwise>
									</c:choose>
										</article>
								</c:forEach>
								 
						  <ul class="list-paginator production-qna__paginator">  
                                 	<c:choose>
                                 		<c:when test="${p1.beginPage == 1 }">
	                                		<!-- <button class="list-paginator__prev" type="button">
	                                           	이전
	                                       	</button> -->
                                       </c:when>
                                       <c:otherwise>
                                        	<li>
		                                       <button class="list-paginator__prev" type="button">
		                                           	이전
	                                       		</button>
                                       		</li>
                                       </c:otherwise>
                                    </c:choose>
                                    
                                    
                                 	<c:forEach var="i" begin="${p1.beginPage }" end="${p1.endPage }">
                                 	<c:choose>
                                 		<c:when test="${i == p1.nowPage }">
		                                    <li>
		                                        <button class="list-paginator__page sm selected" type="button">${i }</button>
		                                    </li>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	 <li>
		                                        <button class="list-paginator__page sm" type="button">${i }</button>
		                                    </li>
	                                    </c:otherwise>
	                                </c:choose>
	                                
                                    </c:forEach>
                                  
                                  <c:choose>
                                  	<c:when test="${p1.endPage >= p1.totalPage }">
	                                <!--     <li>
	                                        <button class="list-paginator__next" type="button">
	                                           	다음
	                                        </button>
	                                    </li> -->
	                                    </c:when>
	                                    <c:otherwise>
	                                    <li>
	                                        <button class="list-paginator__next" type="button">
	                                           	다음
	                                        </button> 
	                                    </li>
	                                    </c:otherwise>
                                    </c:choose>
                                </ul>

								</div>
								
							</div>

						</section> 

						<a id="production-selling-delivery"></a>
                             <section class="production-selling-section">
                            <header class="production-selling-section__header">
                                <h1 class="production-selling-section__title">배송</h1>
                            </header>
                            <table class="production-selling-table">
                                <tbody>
                                    <tr>
                                        <th>배송</th>
                                        <td>일반택배</td>
                                    </tr>
                                    <tr>
                                        <th>배송비</th>
                                        <td>무료배송</td>
                                    </tr>
                                    <tr>
                                        <th>도서산간 추가 배송비</th>
                                        <td>원 </td>
                                    </tr>
                                    <tr>
                                        <th>배송불가 지역</th>
                                        <td>배송불가 지역이 없습니다.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                        <section class="production-selling-section">
                            <header class="production-selling-section__header">
                                <h1 class="production-selling-section__title">교환/환불</h1>
                            </header>
                            <div class="production-selling-refund">
                                <table class="production-selling-table production-selling-refund__table">
                                    <tbody>
                                        <tr>
                                            <th>반품배송비</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>교환배송비</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>보내실 곳</th>
                                            <td>판매자 상호</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h2 class="production-selling-refund__title">반품/교환 사유에 따른 요청 가능 기간</h2>
                                <p class="production-selling-refund__note">반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을
                             	       협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
                                <ol class="production-selling-refund__list">
                                    <li>구매자 단순 변심은 상품 수령 후 7일 이내&nbsp;
                                        <small>(구매자 반품배송비 부담)</small>
                                    </li>
                                    <li>표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.
                                        <br>둘 중 하나 경과 시 반품/교환 불가&nbsp;
                                        <small>(판매자 반품배송비 부담)</small>
                                    </li>
                                </ol>
                                <h2 class="production-selling-refund__title">반품/교환 불가능 사유</h2>
                                <p class="production-selling-refund__note">아래와 같은 경우 반품/교환이 불가능합니다.</p>
                                <ol class="production-selling-refund__list">
                                    <li>반품요청기간이 지난 경우</li>
                                    <li>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우&nbsp;
                                        <small>(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</small>
                                    </li>
                                    <li>포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우&nbsp;
                                        <small>(예: 식품, 화장품)</small>
                                    </li>
                                    <li>구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우&nbsp;
                                        <small>(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</small>
                                    </li>
                                    <li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우&nbsp;
                                        <small>(예: 식품, 화장품)</small>
                                    </li>
                                    <li>고객주문 확인 후 상품제작에 들어가는 주문제작상품</li>
                                    <li>복제가 가능한 상품 등의 포장을 훼손한 경우&nbsp;
                                        <small>(CD/DVD/GAME/도서의 경우 포장 개봉 시)</small>
                                    </li>
                                </ol>
                            </div>
                        </section>

                        <a id="production-selling-suggestion"></a>
                       
               
                      
                    </div>
                </div>

                <div class="production-selling__detail__sidebar col-4">
                    <div data-sticky-enabled="true" data-sticky-always="false" data-direction="top"
                        data-offset="133" class="sticky-container production-selling-sidebar-wrap"
                        style="height: 100%; position: relative;">
                        <div class="sticky-child production-selling-sidebar"
                            style="position: sticky; box-sizing: border-box; height: 477px; width: 100%; top: 100px;">
                     <div class="sticky-child production-selling-sidebar"
                            style="position: sticky; box-sizing: border-box; height: 477px; width: 50%; top: 100px;">
                            <div class="production-selling-option-form production-selling-overview__option-form">
                                <section class="selling-option-form-content production-selling-option-form__form">
                                    <div class="selling-option-form-content__form">
                                        <span>남은 수량 : <span class="stock">${productvo.stock}</span></span> 
                                        <p>
                                            <select id="product-select" style="margin-top:10px;">
                                                <option value="">선택</option>
                                                <option value="">${productvo.pName}</option>
                                            </select>
                                        </p>
                                        
                                        
                                        <div class="optselect_area" style="">
                                            <ul id="_optionSelectList" class="opt_selectlist">
                                            
                                                        
                                            
                                                
                                    
                                            </ul>
                                        </div>
                                    </div>
        
                                    <ul class="selling-option-form-content__list"></ul>
                                    <p class="selling-option-form-content__price">
                                        <span class="selling-option-form-content__price__left">주문금액</span>
                                        <span class="selling-option-form-content__price__right">
                                        <span class="selling-option-form-content__price__number">0</span>원</span>
                                    </p>
                                </section>
                                <div class="production-selling-option-form__footer">
                                    <button type="button" class="button button--color-blue-inverted button--size-55 button--shape-4">장바구니</button>
                                    <button type="button" class="order button button--color-blue button--size-55 button--shape-4">바로구매</button>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    <!--production-selling-overview container 끝-->
<script type="text/javascript">
	var id = "${sessionScope.userSession.id}";

	$('#orders').on("click", function () {
		
		if (id != "") {
			var form = $('.add-cart')[0];
			
			console.log(form);			
			form.action="/app/order.do";
			form.method = "get";
			form.submit();
		
			} else {
				var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")
				if (result) {
					window
						.open(
							'/app/loginModal.jsp',
							'pop01',
							'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
				}
			}

	});
	
</script>

<script type="text/javascript" src="/app/resources/js/ProductDetail/ProductDetail.js"></script>
  
</body>
</html>
      