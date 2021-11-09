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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4cf906c03295c29420721a730a4ef0b&libraries=services"></script>
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
                            <div class="auth-form-wrapper px-4 py-5">
                                <div class="row" style="display: flex; align-content: center; flex-direction: column">
                                    <h3 class="d-block mb-2 noto-font" style="color: #8668d0">공급자 정보 등록</h3>
                                    <span class="noto-font sub-title">사업자 정보 (3 / 4)</span>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-business-number">사업자 등록 번호</label>
                                            <input class="form-control" id="vendor-register-business-number"
                                                   placeholder="사업자 등록 번호를 입력해주세요."
                                                   oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');"
                                                   onkeyup="checkCorporateRegiNumber(this.value)"
                                                   onfocus="checkCorporateRegiNumber(this.value)"
                                                   style="height: 70px">
                                            <button type="button" class="btn btn-business-verify-text"
                                                    id="password-verification-button" onclick="validationEmail()"
                                                    style="word-break: keep-all">
                                                인증
                                            </button>
                                            <h6 class="vendor-input-warning" id="warning-business-text"
                                                style="margin-top: 10px">
                                                올바른 사업자 등록 번호를 입력해주세요.</h6>
                                        </div>
                                    </div>
                                    <div class="col-12" style="display: flex;">
                                        <div class="form-group" style="width: 45%; margin-right: 10%">
                                            <label for="vendor-register-store-category-1">업종 상위 카테고리</label>
                                            <select class="form-control" id="vendor-register-store-category-1"
                                                    style="color: black; height: 60px" onchange="checkSelectedValue()">
                                                <option selected disabled style="display: none">선택</option>
                                                <option id="category-lodgement">숙박</option>
                                                <option disabled id="category-restaurant">식당</option>
                                                <option disabled id="category-hospital">병원</option>
                                                <option disabled id="category-shopping">쇼핑</option>
                                                <option disabled id="category-grocery">식료품</option>
                                            </select>
                                        </div>
                                        <div class="form-group" style="width: 45%">
                                            <label for="vendor-register-store-category-2">업종 하위 카테고리</label>
                                            <select class="form-control" id="vendor-register-store-category-2"
                                                    style="color: black; height: 60px" disabled>
                                                <option selected disabled>상위 카테고리 선택 필요</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-store-name">상호 명</label>
                                            <input class="form-control" id="vendor-register-store-name"
                                                   style="color: black;height: 70px" placeholder="상호 명을 입력해주세요."/>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="vendor-register-store-owner">대표자 명</label>
                                            <input class="form-control" id="vendor-register-store-owner"
                                                   style="color: black;height: 70px" placeholder="대표자 명을 입력해주세요."/>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="addressButton()">
                                                다음
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    $(":input").keypress(function (e) {
        if (this.value === '')
            if (e.keyCode === 32)
                e.preventDefault();
    });


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
                category2.append("<option selected>모텔</option>");
                category2.append("<option>호텔</option>");
                category2.append("<option>펜션</option>");
                category2.append("<option>게스트하우스</option>");
                category2.append("<option>글램핑</option>");
                break;
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
                break;
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
                break;
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
                break;
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
                break;
            default:
                alert("잘못된 접근입니다.");
                break;
        }
    }


    function checkBusinessNumberValidate() {
        let number = document.getElementById("vendor-register-business-number");
        let numberMap = number.value.replace(/-/gi, '').split('').map(function (d) {
            return parseInt(d, 10);
        });

        if (numberMap.length === 10) {
            let keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
            let chk = 0;

            keyArr.forEach(function (d, i) {
                chk += d * numberMap[i];
            });

            chk += parseInt((keyArr[8] * numberMap[8]) / 10, 10);

            if (Math.floor(numberMap[9]) === ((10 - (chk % 10)) % 10)) {
                alert("인증이 완료되었습니다.");
                number.setAttribute("disabled", true);
                document.getElementById("business-text-button").setAttribute("disabled", true);
                business_number_validation = true;
            } else {
                alert("올바른 사업자 등록번호가 아닙니다.\n사업자 등록번호를 확인해주세요.");
            }
        } else {
            alert("올바른 사업자 등록번호가 아닙니다.\n사업자 등록번호를 확인해주세요.");
        }
    }

    // $('#vendor-register-business-file').on('change', function () {
    //     if (this.files && this.files[0]) {
    //         let reader = new FileReader();
    //         console.log(reader);
    //         console.log(reader.result);
    //         reader.readAsDataURL(this.files[0]);
    //         reader.onload = function (data) {
    //             if (data.total > 10 * 1024 * 1024) {
    //                 alert("파일 용량은 10MB를 넘길 수 없습니다.");
    //                 let agent = navigator.userAgent.toLowerCase();
    //                 if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
    //                     $('#vendor-register-business-file').replaceWith($('#vendor-register-business-file').clone(true));
    //                 } else {
    //                     $('#vendor-register-business-file').val('');
    //                 }
    //                 $('#business-file-name').val('');
    //                 return false;
    //             } else {
    //                 let fileValue = $('#vendor-register-business-file').val().split("\\");
    //                 let fileName = fileValue[fileValue.length - 1];
    //                 console.log(fileName);
    //                 $('#business-file-name').val(fileName);
    //             }
    //         }
    //     }
    // });

    function checkCorporateRegiNumber(number) {
        let numberMap = number.replace(/-/gi, '').split('').map(function (d) {
            return parseInt(d, 10);
        });

        if (numberMap.length === 10) {
            let keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
            let chk = 0;

            keyArr.forEach(function (d, i) {
                chk += d * numberMap[i];
            });

            chk += parseInt((keyArr[8] * numberMap[8]) / 10, 10);
            console.log(chk);
            if (!(Math.floor(numberMap[9]) === ((10 - (chk % 10)) % 10))) {
                document.getElementById('warning-business-text').setAttribute('style', 'display:flex');
            } else {
                document.getElementById('warning-business-text').setAttribute('style', 'display:none');
            }
        } else {
            document.getElementById('warning-business-text').setAttribute('style', 'display:flex');
        }
    }

    function registerDone() {
        let b_number = document.getElementById("vendor-register-business-number");
    }

    function checkValueEmpty(element) {
        if (element !== undefined) {
            return !(element.value === null || element.value === "");
        } else
            return false;
    }
</script>
</body>
</html>
