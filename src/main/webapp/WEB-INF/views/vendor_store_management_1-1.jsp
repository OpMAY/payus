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
    <title>공급자 상점 정보 수정</title>
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
                            style="color: #8668d0; padding-left: 10px; font-weight: bold">상점 정보 수정</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="row row-cols-1 row-cols-xl-4 row-cols-md-3 row-cols-lg-4 row-cols-sm-2"
                                 id="image-container"
                                 style="margin-bottom: 1rem; height: 380px; overflow: hidden">
                                <c:forEach var="i" begin="1" end="${store.image_list.size()}">
                                    <div class="col image-div" style="height: 180px">
                                        <div class="img-container" img-idx="${i}" data-type="original">
                                            <img class="clickable_img"
                                                 src="https://payus.s3.ap-northeast-2.amazonaws.com/${store.image_list[i-1]}"
                                                 alt
                                                 style="width: 100%; height: 172px; object-fit: fill">
                                            <button type="button" class="img-delete-btn-multiple"
                                                    style="display: block"><img
                                                    src="/images/x-button.svg" alt width="90%"></button>
                                        </div>
                                    </div>
                                </c:forEach>
                                <input type="file" id="image-add-input-1" name="img1" accept="image/*"
                                       hidden>
                                <div class="col image-div" id="img-add-div"
                                     style="display: flex; justify-content: center; height: 180px; position: relative">
                                    <div class="img-add" id="img-add-btn"
                                         style="display: flex; width: 100%; height: 100%;">
                                        <img src="/images/Group%20334.svg" alt width="100%" height="100%"
                                             style="transform: scale(0.45); border-radius: 5px">
                                    </div>
                                    <button type="button" class="img-delete-btn"><img
                                            src="/images/x-button.svg" alt width="90%"></button>
                                </div>
                            </div>
                            <div>
                                <button class="m-btn btn btn-grey" type="button">더 보기</button>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-name">상호명</label>
                                <textarea class="payus-textarea" id="vendor-store-name" rows="1"
                                >${store.store_name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">상점 간단 설명</label>
                                <textarea class="payus-textarea" id="vendor-store-explain" rows="2"
                                >${store.explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-jibun-address">상점 지번 주소</label>
                                <textarea class="payus-textarea" id="vendor-jibun-address" rows="1"
                                          readonly>${store.address}</textarea>
                            </div>
                            <button type="button" class="btn btn-business-address-find edit"
                                    onclick="if(confirm('상점 주소를 변경하시겠습니까?')){addressButton();} else return false;"
                                    id="business-address-button">
                                주소 찾기
                            </button>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-road-address">상점 도로명 주소</label>
                                <textarea class="payus-textarea" id="vendor-road-address" rows="1"
                                          readonly>${store.address_road}</textarea>
                            </div>
                        </div>
                        <div class="col-12" style="display: none" id="rest-address-div">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-road-address">상점 상세 주소</label>
                                <textarea class="payus-textarea" id="vendor-rest-address" rows="1"
                                ></textarea>
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
                                >${store.phone}</textarea>
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
                                    <select class="form-control" id="vendor-store-payback-rate"
                                            style="color: black; height: 60px; width: 50%">
                                        <option selected disabled value="">선택</option>
                                        <option value="5">5%</option>
                                        <option value="10">10%</option>
                                        <option value="15">15%</option>
                                        <option value="20">20%</option>
                                        <option value="25">25%</option>
                                        <option value="30">30%</option>
                                        <option value="35">35%</option>
                                        <option value="40">40%</option>
                                        <option value="45">45%</option>
                                        <option value="50">50%</option>
                                        <option value="55">55%</option>
                                        <option value="60">60%</option>
                                        <option value="65">65%</option>
                                        <option value="70">70%</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-payus"
                                    id="personal-edit-btn">
                                수정
                            </button>
                            <button type="button" class="btn btn-grey"
                                    id="btn-back">
                                뒤로 가기
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
    let imageInputIndex = 1;
    let imageListSize = ${store.image_list.size()};
    let imageIndex = imageListSize + 1;
    console.log(imageIndex);
    let body = $(document.body);
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

    console.log(${store.image_list.size()});
    let container = $("#image-container");
    if (imageListSize <= 4)
        container.height(190);
    else if (imageListSize <= 8)
        container.height(380);
    else {
        container.height(380);
        $('.m-btn').css('display', 'block');
    }
    let originalPaybackRate = ${store.payback_rate};
    $('#vendor-store-payback-rate').children('option[value="' + originalPaybackRate + '"]').attr('selected', 'true');
</script>
<script>
    let deletedImgIdx = [];
    $(body).on('click', '.img-delete-btn-multiple', function () {
        let img_idx = $(this).parent().attr('img-idx');
        let data_type = $(this).parent().attr('data-type');
        console.log('img_index : ' + img_idx);
        if (confirm('해당 이미지를 삭제하시겠습니까?')) {
            if (data_type === 'original') {
                // 서버에 등록된 이미지면 해당 Index 반환
                deletedImgIdx.push(img_idx - 1);
            } else {
                // 추가로 등록한 이미지면 연결된 Input 값 초기화
                let thisInput = $(this).parent().parent().prev();
                let agent = navigator.userAgent.toLowerCase();
                if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
                    thisInput.replaceWith($("#image-add-input").clone(true));
                } else {
                    thisInput.val('');
                }
            }
            console.log('Array : ' + deletedImgIdx);
            $(this).parent().parent().remove();
            imageIndex--;
        }
    });
    let addressChanged = false;

    function addressButton() {
        let roadAddrInput = $("#vendor-road-address");
        let jibunAddrInput = $("#vendor-jibun-address");
        let restAddrInput = document.getElementById("vendor-rest-address");
        new daum.Postcode({
            oncomplete: function (data) {
                let roadAddr = data.roadAddress;
                let extraRoadAddr = '';
                let jibunAddr = data.jibunAddress;
                roadAddrInput.val(roadAddr);
                jibunAddrInput.val(jibunAddr);
                restAddrInput.removeAttribute("readonly");
                restAddrInput.setAttribute("placeholder", "세부 주소를 입력해주세요.");
                $('#rest-address-div').css('display', 'block');
                addressChanged = true;
                geoCoder.addressSearch(data.address, function (results, status) {
                    if (status === daum.maps.services.Status.OK) {
                        let result = results[0];
                        let coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과 값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                    }
                })
            }
        }).open();
    }

    $(body).on('click', '#img-add-btn', function () {
        console.log('Image Index Start : ' + imageIndex);
        console.log('Image Input Index Start : ' + imageInputIndex);

        $('#image-add-input-' + imageInputIndex).click();
        console.log('input clicked');

        $('#image-add-input-' + imageInputIndex).on('change', function () {
            console.log('changed');
            if (this.files && this.files[0]) {
                console.log('ImageIndex before Upload : ' + imageIndex);
                console.log('ImageInputIndex before Upload : ' + imageInputIndex);
                let reader = new FileReader();
                reader.onload = function (data) {
                    console.log('data : ' + data);
                    console.log($('#image-add-input-' + imageInputIndex).val());
                    let fileValue = $('#image-add-input-' + imageInputIndex).val().split('\\');
                    let fileName = fileValue[fileValue.length - 1];
                    if (fileName !== '') {
                        $('<div class="col image-div" style="height: 180px">\n' +
                            '                                        <div class="img-container" img-idx="' + imageIndex + '" data-type="added">\n' +
                            '                                            <img class="clickable_img"\n' +
                            '                                                 src="' + data.target.result + '"\n' +
                            '                                                 alt\n' +
                            '                                                 style="width: 100%; height: 172px; object-fit: fill">\n' +
                            '                                            <button type="button" class="img-delete-btn-multiple"\n' +
                            '                                                    style="display: block"><img\n' +
                            '                                                    src="/images/x-button.svg" alt width="90%"></button>\n' +
                            '                                        </div>\n' +
                            '                                    </div>').insertBefore('#img-add-div');
                        imageIndex++;
                        imageInputIndex++;
                        $('<input type="file" id="image-add-input-' + imageInputIndex + '" name="img' + imageInputIndex + '" accept="image/*"\n' +
                            '                                       hidden>').insertBefore('#img-add-div');

                        console.log('ImageIndex after Upload : ' + imageIndex);
                        console.log('ImageInputIndex after Upload : ' + imageInputIndex);
                    }
                };
                reader.readAsDataURL(this.files[0]);
            }
        })
    });

    $('#personal-edit-btn').on('click', function () {
        let roadAddress = addressChanged ? $('#vendor-road-address').val() + ' ' + $('#vendor-rest-address').val() : null;
        let jibunAddress = addressChanged ? $('#vendor-jibun-address').val() + ' ' + $('#vendor-rest-address').val() : null;
        let storeName = $('#vendor-store-name').val();
        let storeExplain = $('#vendor-store-explain').val();
        let storePhone = $('#vendor-store-phone').val();
        let paybackRate = $('#vendor-store-payback-rate option:selected').val();
        console.log(roadAddress);
        console.log(jibunAddress);
        console.log(storeName);
        console.log(storeExplain);
        console.log(storePhone);
        console.log(paybackRate);
        let imageInput = $('input[type=file]')[0].files[0];
        console.log("inputs : " + imageInput);
        console.log(deletedImgIdx);
        console.log("sorted : " + deletedImgIdx.sort(function (a, b) {
            return a - b;
        }));

        let formData = new FormData();
        formData.append('imgs', imageInput);

        let data = {
            "store_no" : ${store.store_no},
            "road_address": roadAddress,
            "jibun_address": jibunAddress,
            "store_name": storeName,
            "store_explain": storeExplain,
            "store_phone" : storePhone,
            "payback_rate" : paybackRate,
            "deleted_img_index" : deletedImgIdx
        };
        formData.append('store_data', JSON.stringify(data));

        $.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            url: '/vendor/manage/store/info/edit',
            contentType: false,
            processData: false,
            data: formData
        }).done(function (result) {
            if(result === 0){
                alert('수정이 완료되었습니다');
                window.location.href = '/vendor/manage/store/info.do';
            } else {
                alert('오류가 발생했습니다.');
            }
        }).fail(function (error) {
            console.log(error);
        })
    });

    $(body).on("click", '.clickable_img', function () {
        if (confirm('해당 이미지를 보시겠습니까?')) {
            let imageUrl = $(this).attr("src");
            window.open(imageUrl);
        } else {
            return false;
        }
    });

    $('.m-btn').on('click', function () {
        $('#image-container').css('height', '100%');
        $(this).css('display', 'none');
    });

    $('#btn-back').on('click', function () {
        window.location = document.referrer;
    });

</script>
</body>
</html>
