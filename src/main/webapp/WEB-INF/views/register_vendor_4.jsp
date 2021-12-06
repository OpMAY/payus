<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-27
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공급자 회원가입</title>
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
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="main-wrapper">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center justify-content-center" style="flex-direction: column">
            <div class="row">
                <div class="col-md-12 col-xl-8 d-flex"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <img src="/images/payus_logo.png" width="64px" height="64px" style="margin-right: 8px" alt=""/>
                    <h1 class="hanna-font">PAYUS</h1>
                </div>
            </div>
            <div class="row" style="width: 100%">
                <div class="col-xl-4 offset-xl-4 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="auth-form-wrapper px-4 py-5 noto-font">
                                <div class="row"
                                     style="display: flex; align-content: center; flex-direction: column; margin-bottom: 4rem">
                                    <h3 class="d-block mb-2 noto-font" style="color: #6D29D0">공급자 정보 등록</h3>
                                    <span class="noto-font sub-title">상점 정보 (4 / 4)</span>
                                </div>
                                <form class="forms-sample" id="image-form"
                                      style="margin-top: 1.5rem; margin-bottom: 4rem">
                                    <div class="col-12">
                                        <div class="row row-cols-3" id="image-container">
                                            <input type="file" id="image-add-input-1" name="img1" accept="image/*"
                                                   hidden>
                                            <div class="col image-div" id="img-add-div">
                                                <div class="img-add" id="img-add-btn">
                                                    <img src="/images/Group%20334.svg" alt width="100%" height="100%"
                                                         style="transform: scale(0.45)">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="col-12" style="display: flex; margin-bottom: 2rem">
                                    <div class="form-group" style="width: 45%; margin-right: 10%">
                                        <label for="vendor-register-store-category-1">업종 상위 카테고리</label>
                                        <select class="form-control" id="vendor-register-store-category-1"
                                                style="color: black; height: 60px" onchange="checkSelectedValue()">
                                            <option selected disabled style="display: none">선택</option>
                                            <option id="category-lodgement" value="1">숙박</option>
                                            <option disabled id="category-restaurant" value="2">식당</option>
                                            <option disabled id="category-hospital" value="3">병원</option>
                                            <option disabled id="category-shopping" value="4">쇼핑</option>
                                            <option disabled id="category-grocery" value="5">식료품</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="width: 45%">
                                        <label for="vendor-register-store-category-2">업종 하위 카테고리</label>
                                        <select class="form-control" id="vendor-register-store-category-2"
                                                style="color: black; height: 60px" disabled>
                                            <option selected disabled value="">상위 카테고리 선택 필요</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12" style="margin-bottom: 2rem">
                                    <div class="form-group">
                                        <label for="vendor-register-store-name">상호 명</label>
                                        <input class="form-control" id="vendor-register-store-name"
                                               style="color: black;height: 70px" placeholder="상호 명을 입력해주세요."
                                               readonly/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group" style="position: relative; margin-bottom: 2rem">
                                        <label for="vendor-register-store-address">업체 지번 주소</label>
                                        <input class="form-control" id="vendor-register-store-address" disabled
                                               style="color: black;height: 70px" placeholder="주소 찾기로 정보를 입력해주세요."/>
                                        <button type="button" class="btn btn-business-address-find"
                                                onclick="addressButton()"
                                                id="business-address-button">
                                            주소 찾기
                                        </button>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 2rem">
                                        <label for="vendor-register-store-road-address">업체 도로명 주소</label>
                                        <input class="form-control" id="vendor-register-store-road-address" disabled
                                               style="color: black;height: 70px" placeholder="주소 찾기로 정보를 입력해주세요."/>
                                    </div>
                                </div>
                                <div class="col-12" style="margin-bottom: 2rem">
                                    <div id="map"
                                         style="width:100%;height:300px;margin-top:10px;display:none"></div>
                                </div>
                                <div class="col-12" style="margin-bottom: 2rem">
                                    <div class="form-group" style="display: none" id="rest-address-form">
                                        <label for="vendor-register-store-rest-address">업체 세부 주소</label>
                                        <input class="form-control" id="vendor-register-store-rest-address" disabled
                                               style="color: black;height: 70px;" placeholder="세부 주소를 입력해주세요."/>
                                    </div>
                                </div>
                                <div class="col-12" style="margin-bottom: 4rem">
                                    <div class="form-group">
                                        <label for="vendor-register-payback-rate">페이백률 지정</label>
                                        <select class="form-control" id="vendor-register-payback-rate"
                                                style="color: black; height: 60px">
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
                                <div class="mt-3">
                                    <div class="col-12">
                                        <button type="button" class="btn btn-auth-sign-in d-block"
                                                onclick="submitRegister(false)">
                                            회원가입 요청
                                        </button>
                                        <button type="button" class="btn btn-grey d-block" style="margin-bottom: 1rem"
                                                onclick="if(confirm('상점 정보를 추후에 작성하는 것을 선택하셨습니다.\n일부 내용은 재작성이 필요할 수 있습니다.\n정말로 진행하시겠습니까?')){submitRegister(true);} else {return false;}">
                                            다음에 하기
                                        </button>
                                    </div>
                                </div>

                            </div>
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
    let imageIndex = 1;
    let mapContainer = document.getElementById("map"),
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476),
            level: 2
        };

    // 지도를 미리 생성
    let map = new daum.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성
    let geoCoder = new daum.maps.services.Geocoder();

    // 마커를 미리 생성
    let marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    $(":input").keypress(function (e) {
        if (this.value === '')
            if (e.keyCode === 32)
                e.preventDefault();
    });

    // $(document).ready(function () {
    //     let firstCookie = getCookie("first_step");
    //     let secondCookie = getCookie("second_step");
    //     let thirdCookie = getCookie("third_step");
    //     if (firstCookie === "" || secondCookie === "" || thirdCookie === "") {
    //         alert("올바르지 않은 접근입니다.\n로그인 페이지로 이동합니다.");
    //         deleteCookie("first_cookie");
    //         deleteCookie("second_cookie");
    //         deleteCookie("third_cookie");
    //         window.location.href = '/vendor/login.do';
    //         return false;
    //     }
    //     let obj = JSON.parse(thirdCookie);
    //     $("#vendor-register-store-name").val(obj.store_name);
    // });

    function getCookie(name) {
        let nameOfCookie = name + "=";
        let x = 0;
        while (x <= document.cookie.length) {
            let y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) === nameOfCookie) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) === -1)
                    endOfCookie = document.cookie.length;
                return unescape(document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf(" ", x) + 1;
            if (x === 0)
                break;
        }
        return "";
    }

    let deleteCookie = function (name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
    };

    function checkSelectedValue() {
        let category1 = document.getElementById("vendor-register-store-category-1");
        let category2 = $("#vendor-register-store-category-2");
        let indx = category1.selectedIndex;
        let value = $("#vendor-register-store-category-1 option:selected").val();
        let cate2option = $("#vendor-register-store-category-2 option");
        console.log(value);
        switch (indx) {
            case 1:
                category2.attr("disabled", false);
                cate2option.remove();
                category2.append("<option selected value='1'>모텔</option>");
                category2.append("<option value='2'>호텔</option>");
                category2.append("<option value='3'>펜션</option>");
                category2.append("<option value='4'>게스트하우스</option>");
                category2.append("<option value='5'>글램핑</option>");
                category2.append("<option value='6'>기타</option>");
                return true;
            case 2:
                category2.attr("disabled", false);
                cate2option.remove();
                category2.append("<option selected>한식</option>");
                category2.append("<option>고기류</option>");
                category2.append("<option>찜/탕</option>");
                category2.append("<option>중식</option>");
                category2.append("<option>일식</option>");
                category2.append("<option>양식</option>");
                category2.append("<option>분식</option>");
                category2.append("<option>카페</option>");
                return true;
            case 3:
                category2.attr("disabled", false);
                cate2option.remove();
                category2.append("<option selected>내과</option>");
                category2.append("<option>피부과</option>");
                category2.append("<option>산부인과</option>");
                category2.append("<option>가정의학과</option>");
                category2.append("<option>이비인후과</option>");
                category2.append("<option>비뇨의학과</option>");
                category2.append("<option>소아청소년과</option>");
                category2.append("<option>신경과</option>");
                category2.append("<option>정형외과</option>");
                category2.append("<option>치과</option>");
                category2.append("<option>성형외과</option>");
                category2.append("<option>응급의학과</option>");
                category2.append("<option>한방의학과</option>");
                return true;
            case 4:
                category2.attr("disabled", false);
                cate2option.remove();
                category2.append("<option>출산유아동</option>");
                category2.append("<option>의류</option>");
                category2.append("<option>스포츠</option>");
                category2.append("<option>뷰티</option>");
                category2.append("<option>식품</option>");
                category2.append("<option>생활/주방</option>");
                category2.append("<option>DIY</option>");
                category2.append("<option>도서/문구</option>");
                category2.append("<option>가전/디지털</option>");
                return true;
            case 5:
                category2.attr("disabled", false);
                cate2option.remove();
                category2.append("<option>과일</option>");
                category2.append("<option>채소</option>");
                category2.append("<option>쌀/잡곡/견과</option>");
                category2.append("<option>정육&계란</option>");
                category2.append("<option>수산물</option>");
                category2.append("<option>밀키트</option>");
                category2.append("<option>베이커리</option>");
                category2.append("<option>기타</option>");
                return true;
            default:
                alert("잘못된 접근입니다.");
                return false;
        }
    }

    function addressButton() {
        let roadAddrInput = document.getElementById("vendor-register-store-road-address");
        let jibunAddrInput = document.getElementById("vendor-register-store-address");
        let restAddrInput = document.getElementById("vendor-register-store-rest-address");
        let restAddrForm = document.getElementById("rest-address-form");
        new daum.Postcode({
            oncomplete: function (data) {
                let roadAddr = data.roadAddress;
                let extraRoadAddr = '';
                let jibunAddr = data.jibunAddress;
                roadAddrInput.value = roadAddr;
                jibunAddrInput.value = jibunAddr;
                restAddrInput.removeAttribute("disabled");
                restAddrInput.setAttribute("placeholder", "세부 주소를 입력해주세요.");
                restAddrForm.removeAttribute("style");
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

    function submitRegister(skip) {
        console.log("이미지 index : " + imageIndex);
        let firstCookie = getCookie("first_step");
        let secondCookie = getCookie("second_step");
        let thirdCookie = getCookie("third_step");
        // 이전 페이지 단계에서 작성하여 가져온 데이터
        if (firstCookie === "" || secondCookie === "" || thirdCookie === "") {
            alert("올바르지 않은 접근입니다.");
            window.location.href = "/vendor/login.do";
            return false;
        }

        let firstStep = JSON.parse(firstCookie);
        let secondStep = JSON.parse(secondCookie);
        let thirdStep = JSON.parse(thirdCookie);
        let vendorData = {
            "id": firstStep.email,
            "password": firstStep.password,
            "vendor_name": firstStep.name,
            "phone": firstStep.phone,
            "bank_name": secondStep.bank_name,
            "bank_account": secondStep.bank_account,
            "bank_owner": secondStep.bank_owner,
            "business_code": thirdStep.business_number
        };

        if (!skip) {
            // 해당 페이지에서 작성한 데이터
            let form = $("#image-form")[0];
            let formData = new FormData(form);
            let classFirst = $("#vendor-register-store-category-1 option:selected").val();
            let classSecond = $("#vendor-register-store-category-2 option:selected").val();
            let jibunAddress = $("#vendor-register-store-address").val();
            let roadAddress = $("#vendor-register-store-road-address").val();
            let restAddress = $("#vendor-register-store-rest-address").val();
            let payBackRate = $("#vendor-register-payback-rate option:selected").val();
            if (!checkSelectedValue()) {
                alert("상위 카테고리를 입력해주세요.");
                return false;
            } else if (jibunAddress === "" || roadAddress === "") {
                alert("주소를 먼저 설정해주세요.");
                return false;
            } else if (restAddress === "" || restAddress === null) {
                alert("세부 주소를 입력해주세요.");
                return false;
            } else if (payBackRate === "") {
                alert("페이백률을 설정해주세요.");
            }

            let storeData = {
                "name": thirdStep.store_name,
                "phone": firstStep.phone,
                "class_first": classFirst,
                "class_second": classSecond,
                "address": jibunAddress + " " + restAddress,
                "address_road": roadAddress + " " + restAddress,
                "payback_rate": payBackRate
            };
            formData.append("vendor_data", JSON.stringify(vendorData));
            formData.append("store_data", JSON.stringify(storeData));
            $.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                url: '/vendor/register/done/all',
                contentType: false,
                processData: false,
                data: formData
            }).done(function (result) {
                if (result === 0) {
                    alert("공급자 회원가입 신청이 완료되었습니다.\n공급자 회원 이용은 관리자 승인 이후에 가능하며,\n공급자 승인에는 약 3~5일의 시간이 소요될 예정입니다.");
                    deleteCookie("first_step");
                    deleteCookie("second_step");
                    deleteCookie("third_step");
                    window.location.href = "/vendor/login.do";
                }
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            $.ajax({
                type: 'POST',
                url: '/vendor/register/done/skip',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(vendorData)
            }).done(function (result) {
                if (result === 0) {
                    alert("공급자 회원가입 신청이 완료되었습니다.\n공급자 회원 이용은 관리자 승인 이후에 가능하며,\n공급자 승인에는 약 3~5일의 시간이 소요될 예정입니다.");
                    deleteCookie("first_step");
                    deleteCookie("second_step");
                    deleteCookie("third_step");
                    window.location.href = '/vendor/login.do';
                }
            }).fail(function (error) {
                console.log(error);
            });
        }
    }

    function checkIt() {
        if ($("#image-add-input-" + imageIndex).val().length)
            alert('Files Loaded');
        else
            alert('Cancel clicked');
        document.body.onfocus = null;
        console.log('checked');
    }

    // $("#img-add-btn").on("click", function () {
    //     console.log(imageIndex);
    //     console.log($("#image-add-input-" + imageIndex))
    //     $("#image-add-input-" + imageIndex).click();
    //     //setImageFromFile("#image-add-input-" + imageIndex, "#image-add-input-" + imageIndex);
    //
    //     // $("#image-add-input-" + imageIndex).on("input", function () {
    //     //     if (this.files && this.files[0]) {
    //     //         console.log("ImageIndex before Upload : " + imageIndex);
    //     //         let reader = new FileReader();
    //     //         reader.onload = function (data) {
    //     //             console.log(data);
    //     //             $('<div class="col image-div">\n' +
    //     //                 '<div class="img-container">\n' +
    //     //                 '<img src="' + data.target.result + '" alt style="width: 100%;height:150px;object-fit: contain">\n' +
    //     //                 '</div>\n' +
    //     //                 '</div>').insertBefore("#img-add-div");
    //     //             $('<input type="file" id="image-add-input-' + imageIndex + '" name="img" accept="image/*" hidden>').insertBefore("#img-add-div");
    //     //         };
    //     //         reader.readAsDataURL(this.files[0]);
    //     //         imageIndex++;
    //     //         console.log("ImageIndex After Upload : " + imageIndex);
    //     //     }
    //     // });
    //
    //     // // $("#image-add-input-" + imageIndex).on("click", function () {
    //     // //
    //     // // });
    //     //
    //     //
    //     //
    //     // document.body.onfocus = checkIt;
    // });


    $("#img-add-btn").click(function () {
        console.log(imageIndex);

        $("#image-add-input-" + imageIndex).click();
        console.log("clicked");

        $("#image-add-input-" + imageIndex).change(function () {
            console.log("changed");
            if (this.files && this.files[0]) {
                console.log("ImageIndex before Upload : " + imageIndex);
                let reader = new FileReader();
                reader.onload = function (data) {
                    console.log(data);
                    console.log($("#image-add-input-" + imageIndex).val());
                    let fileValue = $("#image-add-input-" + imageIndex).val().split("\\");
                    let fileName = fileValue[fileValue.length - 1];
                    if (fileName !== "") {
                        $('<div class="col image-div" style="position: relative">\n' +
                            '<div class="img-container">\n' +
                            '<img src="' + data.target.result + '" alt style="width: 100%;height:150px;object-fit: fill">\n' +
                            '</div>\n' +
                            '<button type="button" class="img-delete-btn"><img src="/images/x-button.svg" alt width="90%"></button>\n' +
                            '</div>').insertBefore("#img-add-div");
                        imageIndex++;
                        $('<input type="file" id="image-add-input-' + imageIndex + '" name="img' + imageIndex + '" accept="image/*" hidden>').insertBefore("#img-add-div");
                        console.log("ImageIndex After Upload : " + imageIndex);
                    }
                };
                reader.readAsDataURL(this.files[0]);

            }
        });

    });


    function checkValueEmpty(element) {
        if (element !== undefined) {
            return !(element.value === null || element.value === "");
        } else
            return false;
    }
</script>
</body>
</html>
