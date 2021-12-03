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

        <div class="page-content d-flex align-items-center justify-content-center" style="flex-direction: column">
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상점 상세 페이지</h3>
                    </div>
                </div>
                <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-category-first">카테고리</label>
                                <div style="position: relative; display: flex">
                                    <textarea class="payus-small-textarea" style="margin-right: 15px; width: 80px" id="vendor-store-category-first" rows="1"
                                              readonly>숙박</textarea>
                                    <div>
                                        <span><img src="/images/Chevron-Left.svg" alt width="100%" style="padding-top: 13px"></span>
                                    </div>
                                    <textarea class="payus-small-textarea" id="vendor-store-category-second" rows="1" style="margin-left: 15px"
                                              readonly>게스트 하우스</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">상점 소개</label>
                                <textarea class="payus-textarea" id="vendor-store-explain" rows="2"
                                          readonly>${store.explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">서비스</label>
                                <div style="display: flex; align-content: center; flex-direction: column">
                                    <c:forEach var="service" items="${store.service_list}">
                                        <div style="border: 1px solid black; border-collapse: collapse; margin-bottom: 10px;">
                                            <textarea class="payus-textarea" rows="1" style="margin-bottom: 1rem"
                                                      readonly>${service.title}</textarea>
                                            <textarea class="payus-textarea" rows="2" style="margin-bottom: 1rem"
                                                      readonly>${service.content}</textarea>
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
                                        <textarea class="payus-textarea" rows="1" style="margin-bottom: 1rem"
                                                  readonly>${information.title}</textarea>
                                        <textarea class="payus-textarea" rows="2" style="margin-bottom: 1rem"
                                                  readonly>${information.content}</textarea>
                                    </c:forEach>
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
