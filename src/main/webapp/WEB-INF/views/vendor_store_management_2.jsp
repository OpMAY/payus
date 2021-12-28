<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-27
  Time: 오후 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공급자 상점 상세 페이지</title>
    <!-- core:css -->
    <link rel="stylesheet" href="/vendors/core/core.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- end plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="/vendors/flag-icon-css/css/flag-icon.min.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/css/demo_5/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/images/payus_logo.png"/>
    <!-- Custom layout style for vendor -->
    <link rel="stylesheet" href="/css/vendor_style.css">
    <link rel="stylesheet" href="/css/sidebar.css">
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- partial:partials/_footer.jsp -->
<jsp:include page="partials/vendor_sidebar.jsp" flush="true"></jsp:include>
<!-- partial -->
<div class="main-wrapper sidemain">
    <div class="page-wrapper full-page">

        <div class="page-content d-flex align-items-center " style="flex-direction: column">
            <jsp:include page="partials/vendor_nav.jsp" flush="true"/>
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상점 상세 페이지</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-category-first">카테고리</label>
                                <div style="position: relative; display: flex">
                                    <textarea class="payus-small-textarea" style="margin-right: 15px; width: 80px"
                                              id="vendor-store-category-first" rows="1"
                                              disabled><c:choose><c:when
                                            test="${store.class_first == 1}">숙박</c:when><c:when
                                            test="${store.class_first == 2}">식당</c:when><c:when
                                            test="${store.class_first == 3}">병원</c:when><c:when
                                            test="${store.class_first == 4}">쇼핑</c:when><c:when
                                            test="${store.class_first == 5}">식료품</c:when></c:choose></textarea>
                                    <div>
                                        <span><img src="/images/Chevron-Left.svg" alt width="100%"
                                                   style="padding-top: 13px"></span>
                                    </div>
                                    <textarea class="payus-small-textarea" id="vendor-store-category-second" rows="1"
                                              style="margin-left: 15px"
                                              disabled><c:choose><c:when
                                            test="${store.class_first == 1}"><c:choose><c:when
                                            test="${store.class_second == 1}">모텔</c:when><c:when
                                            test="${store.class_second == 2}">호텔</c:when><c:when
                                            test="${store.class_second == 3}">펜션</c:when><c:when
                                            test="${store.class_second == 4}">게스트 하우스</c:when><c:when
                                            test="${store.class_second == 5}">글램핑</c:when><c:when
                                            test="${store.class_second == 6}">기타</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 2}"><c:choose><c:when
                                            test="${store.class_second == 1}">한식</c:when><c:when
                                            test="${store.class_second == 2}">육류</c:when><c:when
                                            test="${store.class_second == 3}">찜&탕</c:when><c:when
                                            test="${store.class_second == 4}">중식</c:when><c:when
                                            test="${store.class_second == 5}">일식</c:when><c:when
                                            test="${store.class_second == 6}">피자</c:when><c:when
                                            test="${store.class_second == 7}">분식</c:when><c:when
                                            test="${store.class_second == 8}">카페</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 3}"><c:choose><c:when
                                            test="${store.class_second == 1}">내과</c:when><c:when
                                            test="${store.class_second == 2}">피부과</c:when><c:when
                                            test="${store.class_second == 3}">산부인과</c:when><c:when
                                            test="${store.class_second == 4}">가정의학과</c:when><c:when
                                            test="${store.class_second == 5}">이비인후과</c:when><c:when
                                            test="${store.class_second == 6}">비뇨의학과</c:when><c:when
                                            test="${store.class_second == 7}">응급의학과</c:when><c:when
                                            test="${store.class_second == 8}">한방의학과</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 4}"><c:choose><c:when
                                            test="${store.class_second == 1}">출산&유아동</c:when><c:when
                                            test="${store.class_second == 2}">의류</c:when><c:when
                                            test="${store.class_second == 3}">스포츠</c:when><c:when
                                            test="${store.class_second == 4}">뷰티</c:when><c:when
                                            test="${store.class_second == 5}">생활&주방</c:when><c:when
                                            test="${store.class_second == 6}">취미&DIY</c:when><c:when
                                            test="${store.class_second == 7}">도서&문구</c:when><c:when
                                            test="${store.class_second == 8}">가전&디지털</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 5}"><c:choose><c:when
                                            test="${store.class_second == 1}">과일</c:when><c:when
                                            test="${store.class_second == 2}">채소</c:when><c:when
                                            test="${store.class_second == 3}">쌀&잡곡&견과</c:when><c:when
                                            test="${store.class_second == 4}">정육&계란</c:when><c:when
                                            test="${store.class_second == 5}">수산물</c:when><c:when
                                            test="${store.class_second == 6}">밀키트</c:when><c:when
                                            test="${store.class_second == 7}">베이커리</c:when><c:when
                                            test="${store.class_second == 8}">기타</c:when></c:choose></c:when></c:choose></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">상점 소개</label>
                                <textarea class="payus-textarea" id="vendor-store-explain" rows="2"
                                          disabled>${store.explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">서비스</label>
                                <div style="display: flex; align-content: center; flex-direction: column">
                                    <c:forEach var="service" items="${store.service_list}">
                                        <div style="margin-bottom: 1rem">
                                            <button class="accordion">${service.title}</button>
                                            <div class="panel">
                                                <pre class="payus-service">${service.content}</pre>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">이용안내</label>
                                <div style="display: flex; align-content: center; flex-direction: column">
                                    <c:forEach var="information" items="${store.information}">
                                        <div style="margin-bottom: 1rem">
                                            <button class="accordion">${information.title}</button>
                                            <div class="panel">
                                                <pre class="payus-service">${information.content}</pre>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-payus"
                                    id="service-edit-btn">
                                수정
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script>
    $('.accordion').on('click', function () {
        this.classList.toggle("active");

        /* Toggle between hiding and showing the active panel */
        let panel = $(this).next('div');
        console.log(panel);
        console.log(panel.firstChild);
        if (panel.css('display') === 'block') {
            panel.css('display', 'none');
            panel.css('border', 'none');
        } else {
            panel.css('display', 'block');
            panel.css('border-bottom', '1px solid #a3a3a3');
        }
    });

    $('#service-edit-btn').on('click', function () {
        // alert('준비 중입니다.\n오류 발생으로 24일 금일 수정 완료 예정');
        if(confirm('상세 정보를 수정하시겠습니까?')){
            window.location.href = '/vendor/manage/store/detail/edit.do';
        } else {
            return false;
        }
    });
</script>
</body>
</html>
