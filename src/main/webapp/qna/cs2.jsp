<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Bootstrap FAQ Accordion - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
<!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="https://www.superstari.co.kr/design/superstari/inc/15_re/demo-style.css" />
	<link rel="stylesheet" type="text/css" href="https://www.superstari.co.kr/design/superstari/inc/15_re/search_component.css" />
	<link rel="stylesheet" type="text/css" href="https://www.superstari.co.kr/design/superstari/inc/15_re/search_default.css" />
	<link rel="stylesheet" type="text/css" href="https://www.superstari.co.kr/design/superstari/inc/15_re/css2.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href='https://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet' type='text/css'>  
	<link rel="stylesheet" href="https://www.superstari.co.kr/design/superstari/inc/15_re/normalize.css">
	<link rel="stylesheet" href="https://www.superstari.co.kr/design/superstari/inc/15_re/cate_test.css">
	<script src="https://www.superstari.co.kr/design/superstari/inc/15_re/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="https://www.superstari.co.kr/design/superstari/inc/girl_gallery/fresco.js"></script>  
	<script type="text/javascript" src="https://www.superstari.co.kr/design/superstari/inc/15_re/common.js"></script>
	    
    <style type="text/css">
        </style>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
    </script>
</head>
<body>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/lazyload.min.js"></script>

<jsp:include page="/header.jsp"></jsp:include>
    <div id="faqWrap">
                    <div class="join_sub_title" style="margin-top: -62px;"><h1>FAQ</h1></div>
                    <div class="page-body">
                        <div class="faq-search">
                                                        <div class="search-wrap">
                                <fieldset>
                                    <legend>FAQ 검색 폼</legend>
                                    <h4></h4>
                                                <select  class="MS_input_select select-category" id="search-category">
                <option value="">전체검색</option>                <option value="4" >기타문의</option>                <option value="5" >회원/정보관리</option>                <option value="6" >주문관련</option>                <option value="7" >결제/입금확인</option>                <option value="8" >교환/반품</option>                <option value="1" >배송관련</option>                <option value="9" >취소/환불</option>                <option value="10" >해외배송</option>            </select>                                    <!--/end_select/-->
                                    <span class="keyword">
                                    <input id='faqSearch'  class="MS_input_txt" onKeyPress='javascript:faqEnter(event);' type='text' value='' />                                    </span>
                                    <a href="javascript:faqSearch('keyword')"><img alt="검색" src="http://superstari.cdn.smart-img.com/00/2020/icon/btn_faq_search.gif" class="btn-submit" /></a>
                                </fieldset>
                                <dl class="best-keyword">
                                    <dt><strong>BEST검색어</strong> :</dt>
                                    <dd>
                                        <ul class="list">
                                                                                        <li><a href="javascript:faqSearch('best', '주문');">주문</a></li>
                                                                                        <li><a href="javascript:faqSearch('best', '교환');">교환</a></li>
                                                                                        <li><a href="javascript:faqSearch('best', '배송');">배송</a></li>
                                                                                        <li><a href="javascript:faqSearch('best', '취소');">취소</a></li>
                                                                                        <li><a href="javascript:faqSearch('best', '환불');">환불</a></li>
                                                                                    </ul>
                                    </dd>
                                </dl>
                            </div><!-- .search-wrap -->
                            </form>                        </div><!-- .faq-search-->
                        <div id="faq-category">
                            <ul class="faq-menu">
                                                                <li><a href="javascript:faqSearch('category','ALL');">전체보기</a></li>
                                                                <li><a href="javascript:faqSearch('category','4');">기타문의</a></li>
                                                                <li><a href="javascript:faqSearch('category','5');">회원/정보관리</a></li>
                                                                <li><a href="javascript:faqSearch('category','6');">주문관련</a></li>
                                                                <li><a href="javascript:faqSearch('category','7');">결제/입금확인</a></li>
                                                                <li><a href="javascript:faqSearch('category','8');">교환/반품</a></li>
                                                                <li><a href="javascript:faqSearch('category','1');">배송관련</a></li>
                                                                <li><a href="javascript:faqSearch('category','9');">취소/환불</a></li>
                                                                <li><a href="javascript:faqSearch('category','10');">해외배송</a></li>
                                                            </ul><!-- .faq-menu-->
                        </div><!-- .faq-category-->
                        <div id="faqTable">
                            <table summary="분류 제목">
                                <caption>질문/답변</caption>
                                <colgroup>
                                    <col width="55" />
                                    <col width="150" />
                                    <col width="*" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="tb-center">번호</div>
                                        </th>
                                        <th scope="col">
                                            <div class="tb-center">분류</div>
                                        </th>
                                        <th scope="col">
                                            <div class="tb-center">제목</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <tr uid="33">
                                        <td>
                                            <div class="tb-center">27</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">교환/반품</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">상품은 어디로 보내야 하나요?</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>상품은 어디로 보내야 하나요?</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd>철회요청서에 고객님 정보와 처리 사항을 적으신 후<br>
받는사람 [슈퍼스타아이]<br>
서울특별시 성북구 석관동 58-283 성북 A터미널 슈퍼스타아이로 보내주시면 됩니다.<br><br>

<font color=red><b>※ CJ대한통운 택배가 아닌 타택배로 보내주실 경우에는<br>
선불로 직접 결제후 보내주셔야합니다.</font></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="27">
                                        <td>
                                            <div class="tb-center">26</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">교환/반품</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">교환/반품 택배비는 얼마인가요?</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>교환/반품 택배비는 얼마인가요?</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd>-단순 변심으로 인한 색상 및 사이즈 교환 5,000원<br>
-불량/오배송 상품은 주문하신 동일상품 동일사이즈로 무상교환<br><br>

- 구매한 상품 전부 반품 5,000원<br> 
- 반품하는 상품을 제외한 구매상품의 가격이 5만원 미만일 경우 5,000원<br>
- 반품하는 상품을 제외한 구매상품의 가격이 5만원 이상일 경우 2,500원<br><br>

<font color=red>※ 꼭 CJ대한통운택배(1588-1255) "착불"로 보내주세요.<br>
CJ대한통운 택배 선불 및 타택배로 보낼시에는 더 많은 택배비가 나옵니다.<br>
편의점 택배도 타 택배로 취급 되며, 타 택배 이용시 선불로 보내주세요.</font></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="5">
                                        <td>
                                            <div class="tb-center">25</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">주문관련</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">여러 개의 상품을 구매하려는데 어떻게 해야 할까요?</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>여러 개의 상품을 구매하려는데 어떻게 해야 할까요?</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><font color="red">장바구니를 이용해서 구매</font>해주시면 됩니다.<br><br>

동일상품의 색상은 각각 선택 주문이 불가하니<br>
각각 색상 선택 후 장바구니 담기로 이용해서 주문해주셔야 합니다.<br>
ex) 블랙색상 주문 후 장바구니 담기 -> 계속쇼핑하기 -> 화이트색상 주문 후 장바구니 담기 -> 결제하기<br><br>

<font color="red">고객님 임의로 주문메세지에 남겨주실경우<br>
주문메세지는 택배기사분이 보시는 내용이기때문에 배송시 확인이 불가능</font>합니다.<br>
이로인한 교환시 배송비는 고객님께서 지불하셔야 합니다.</dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="6">
                                        <td>
                                            <div class="tb-center">24</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">회원/정보관리</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">회원/정보 관련 문의</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>회원/정보 관련 문의</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170329_faq.jpg"></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="41">
                                        <td>
                                            <div class="tb-center">23</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">기타문의</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">적립금 관련 문의</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>적립금 관련 문의</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170327_faq.jpg"></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="44">
                                        <td>
                                            <div class="tb-center">22</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">배송관련</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">배송 소요 기간 (부분배송/지연/품절)	</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>배송 소요 기간 (부분배송/지연/품절)	</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/faq_32.jpg"></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="45">
                                        <td>
                                            <div class="tb-center">21</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">배송관련</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">불량, 오배송, 맞교환의 문의내용</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>불량, 오배송, 맞교환의 문의내용</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170307_faq.jpg">
</dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="43">
                                        <td>
                                            <div class="tb-center">20</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">기타문의</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">적립금 소멸 관련한 공지사항</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>적립금 소멸에 관한 공지사항</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170317_faq.jpg">
</dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="50">
                                        <td>
                                            <div class="tb-center">19</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">해외배송</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">해외배송 관련문의</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>해외배송 관련문의</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170314_faq.jpg"></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                        <tr uid="16">
                                        <td>
                                            <div class="tb-center">18</div>
                                        </td>
                                        <td>
                                            <div class="tb-center">배송관련</div>
                                        </td>
                                        <td>
                                            <div class="tb-left">당일출고 및 당일발송이 가능한가요?</div>
                                        </td>
                                    </tr>
                                    <tr class="slide-hide">
                                        <td colspan="3">
                                            <div class="tb-slide">
                                                <dl class="qst">
                                                    <dt><img alt="질문" src="/images/d3/modern_simple/common/icon_faq_qst.gif"></dt>
                                                    <dd>당일출고 및 당일발송이 가능한가요?</dd>
                                                </dl>
                                                <dl class="adv">
                                                    <dt><img alt="답변" src="/images/d3/modern_simple/common/icon_faq_adv.gif"></dt>
                                                    <dd><div id="MS_WritenBySEB" style="margin:0 auto; max-width: 900px;">
<img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170313_faq_01.jpg">
<div id="MS_WritenBySEB" style="margin:0 auto; max-width: 900px;">
<a href="http://www.superstari.co.kr/shop/shopbrand.html?xcode=133&type=P">
<img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170313_faq_02.jpg"></a>
</div>
<img src="http://superstari.cdn.smart-img.com/00/0_canter/FAQ/170313_faq_03.jpg">
</div></dd>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                                                    </tbody>
                            </table>
                        </div>
                    </div>
    <!--/panel-group-->
</div>	<script type="text/javascript">
		</script>
</body>
</html>
