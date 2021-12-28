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
    <title>공급자 상점 정보</title>
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
                        <h3 class="d-block mb-2 s-core-dream"
                            style="color: #8668d0; padding-left: 10px; font-weight: bold">상점 정보</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="row row-cols-2 row-cols-xl-4 row-cols-md-3 row-cols-lg-4 row-cols-sm-2" id="image-container"
                                 style="margin-bottom: 1rem; height: 380px; overflow: hidden">
                                <c:forEach var="url" items="${store.image_list}">
                                    <div class="col image-div" style="height: 180px">
                                        <div class="img-container">
                                            <img class="clickable_img"
                                                 src="https://payus.s3.ap-northeast-2.amazonaws.com/${url}" alt
                                                 style="width: 100%; height: 100%; object-fit: fill">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div>
                                <button class="m-btn btn btn-grey" type="button">더 보기</button>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-name">상호명</label>
                                <textarea class="payus-textarea" id="vendor-store-name" rows="1"
                                          readonly>${store.store_name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">상점 간단 설명</label>
                                <textarea class="payus-textarea" id="vendor-store-explain" rows="2"
                                          readonly>${store.explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-jibun-address">상점 지번 주소</label>
                                <textarea class="payus-textarea" id="vendor-jibun-address" rows="1"
                                          readonly>${store.address}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-road-address">상점 도로명 주소</label>
                                <textarea class="payus-textarea" id="vendor-road-address" rows="1"
                                          readonly>${store.address_road}</textarea>
                            </div>
                        </div>
                        <div class="col-12" style="margin-bottom: 2rem">
                            <div id="map"
                                 style="width:100%;height:300px;margin-top:10px;display:block"></div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-phone">상점 연락처</label>
                                <textarea class="payus-textarea" id="vendor-store-phone" rows="1"
                                          readonly>${store.phone}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-category-first">카테고리</label>
                                <div style="display: flex">
                                    <textarea class="payus-small-textarea" style="margin-right: 15px; width: 80px"
                                              id="vendor-store-category-first" rows="1"
                                              readonly><c:choose><c:when
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
                                              readonly><c:choose><c:when
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
                                <label for="vendor-store-payback-rate">페이백률</label>
                                <div>
                                <textarea class="payus-small-textarea" id="vendor-store-payback-rate" rows="1"
                                          style="width: 80px"
                                          readonly>${store.payback_rate}%</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-payus"
                                    id="personal-edit-btn">
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
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4cf906c03295c29420721a730a4ef0b&libraries=services"></script>
<script>
    let imageListSize = ${store.image_list.size()};
    let mapContainer = document.getElementById("map"),
        mapOption = {
            center: new daum.maps.LatLng(${store.address_y}, ${store.address_x}),
            level: 2
        };

    // 지도를 미리 생성
    let map = new daum.maps.Map(mapContainer, mapOption);
    map.setDraggable(false);
    map.setZoomable(false);

    // 주소-좌표 변환 객체를 생성
    let geoCoder = new daum.maps.services.Geocoder();

    // 마커를 미리 생성
    let marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${store.address_y}, ${store.address_x}),
        map: map
    });

    let container = $("#image-container");
    if (imageListSize <= 4)
        container.height(190);
    else if (imageListSize <= 8)
        container.height(380);
    else {
        container.height(380);
        $('.m-btn').css('display', 'block');
    }
</script>
<script>
    $('.m-btn').on('click', function () {
        $('#image-container').css('height', '100%');
        $(this).css('display', 'none');
    });

    $('#personal-edit-btn').on('click', function () {
        // alert('준비 중입니다.\n오류 발생으로 24일 금일 수정 완료 예정');
        if(confirm('상점 정보를 수정하시겠습니까?')){
            window.location.href = '/vendor/manage/store/info/edit.do';
        } else {
            return false;
        }
    });

    $('.clickable_img').on("click", function () {
        if (confirm('해당 이미지를 보시겠습니까?')) {
            let imageUrl = $(this).attr("src");
            window.open(imageUrl);
        } else {
            return false;
        }
    })

</script>
</body>
</html>
