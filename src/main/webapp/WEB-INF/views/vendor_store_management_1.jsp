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

        <div class="page-content d-flex align-items-center justify-content-center" style="flex-direction: column">
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2 s-core-dream" style="color: #8668d0; padding-left: 10px; font-weight: bold">상점 정보</h3>
                    </div>
                </div>
                <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="row row-cols-4" id="image-container" style="margin-bottom: 1rem; height: 236px; overflow: hidden">
                                <c:forEach var="url" items="${store.image_list}">
                                    <div class="col image-div">
                                        <div class="img-container">
                                            <img src="https://payus.s3.ap-northeast-2.amazonaws.com/${url}" alt style="width: 100%; height: 100px; object-fit: fill">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-name">상호명</label>
                                <textarea class="payus-textarea" id="vendor-store-name" rows="1"
                                          disabled>${store.store_name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">상점 간단 설명</label>
                                <textarea class="payus-textarea" id="vendor-store-explain" rows="2"
                                          disabled>${store.explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-jibun-address">상점 지번 주소</label>
                                <textarea class="payus-textarea" id="vendor-jibun-address" rows="1"
                                          disabled>${store.address}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-road-address">상점 도로명 주소</label>
                                <textarea class="payus-textarea" id="vendor-road-address" rows="1"
                                          disabled>${store.address_road}</textarea>
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
                                          disabled>${store.phone}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-category-first">카테고리</label>
                                <div style="display: flex">
                                    <textarea class="payus-small-textarea" style="margin-right: 15px; width: 80px" id="vendor-store-category-first" rows="1"
                                              disabled>숙박</textarea>
                                    <div>
                                        <span><img src="/images/Chevron-Left.svg" alt width="100%" height="100%"></span>
                                    </div>
                                    <textarea class="payus-small-textarea" id="vendor-store-category-second" rows="1" style="margin-left: 15px"
                                              disabled>게스트 하우스</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-payback-rate">페이백률</label>
                                <div>
                                <textarea class="payus-small-textarea" id="vendor-store-payback-rate" rows="1" style="width: 80px"
                                          disabled>${store.payback_rate}%</textarea>
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
    let mapContainer = document.getElementById("map"),
        mapOption = {
            center: new daum.maps.LatLng(${store.address_y}, ${store.address_x}),
            level: 2
        };

    // 지도를 미리 생성
    let map = new daum.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성
    let geoCoder = new daum.maps.services.Geocoder();

    // 마커를 미리 생성
    let marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(${store.address_y}, ${store.address_x}),
        map: map
    });

    console.log(${store.image_list.size()});
    let container = $("#image-container");
    console.log(container.height());
    container.height((204 + 32));
</script>
<script>
    function cutImageContainer() {
        let container = $("#image-container");
        console.log(container.height);
        container.height((204 + 32));
    }
</script>
</body>
</html>
