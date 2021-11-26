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
                                        <div class="form-group" style="position: relative">
                                            <label for="vendor-register-business-number">사업자 등록 번호</label>
                                            <input class="form-control" id="vendor-register-business-number"
                                                   placeholder="사업자 등록 번호를 입력해주세요."
                                                   oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');"
                                                   onkeyup="checkCorporateRegiNumber(this.value)"
                                                   onfocus="checkCorporateRegiNumber(this.value)"
                                                   style="height: 70px">
                                            <button type="button" class="btn btn-business-verify-text"
                                                    id="business-verification-button"
                                                    onclick="checkBusinessNumberValidate()"
                                                    style="word-break: keep-all">
                                                인증
                                            </button>
                                        </div>
                                        <span class="vendor-input-warning" id="warning-business-text">
                                                올바른 사업자 등록 번호를 입력해주세요.</span>
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
                                                   style="color: black;height: 70px" placeholder="대표자 명을 입력해주세요."
                                                   readonly/>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="submitBusiness()">
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

    function setCookie(cookie_name, value, seconds) {
        let exdate = new Date();
        exdate.setDate(exdate.getSeconds() + seconds);

        let cookie_value = escape(value) + ((seconds == null) ? '' : '; expires=' + exdate.toUTCString());
        document.cookie = cookie_name + '=' + cookie_value;
    }

    function submitBusiness() {
        let businessNum = $("#vendor-register-business-number").val();
        // let categoryFirst = $("#vendor-register-store-category-1 option:selected");
        // let categorySecond = $("#vendor-register-store-category-2 option:selected");
        let storeName = $("#vendor-register-store-name").val();
        console.log(businessNum);
        // console.log("first : " + categoryFirst.val() + " text : " + categoryFirst.text());
        // console.log("second : " + categorySecond.val() + " text : " + categorySecond.text());
        console.log(storeName);
        let data = {"business_number" : businessNum, "store_name" : storeName};
        setCookie("third_step", JSON.stringify(data), 9999);
        window.location.href = "/vendor/register/store.do";
    }

    $(document).ready(function () {
        let firstCookie = getCookie("first_step");
        if (firstCookie === "") {
            alert("올바르지 않은 접근입니다.");
        }
        let obj = JSON.parse(firstCookie);
        console.log(obj.name);
        $("#vendor-register-store-owner").val(obj.name);
    });

    function checkBusinessNumberValidate() {
        let business_number = $("#vendor-register-business-number");
        let numberMap = business_number.val().replace(/-/gi, '').split('').map(function (d) {
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
                let data = {"business_number": business_number.val()};
                $.ajax({
                    type: 'POST',
                    url: '/vendor/register/business/validate',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data)
                }).done(function (result) {
                    if (result === 1) {
                        alert("인증이 완료되었습니다.");
                        business_number.attr("readonly", true);
                        $("#business-verification-button").css("display", "none");
                        business_number_validation = true;
                    } else if (result === 2) {
                        alert("휴업 상태의 상점은 등록할 수 없습니다.\n사업자 등록번호를 확인해주세요.");
                    } else if (result === 3) {
                        alert("폐업 상태의 상점은 등록할 수 없습니다.\n사업자 등록번호를 확인해주세요.");
                    } else if (result === 4) {
                        alert("국세청에 등록되지 않은 사업자등록번호입니다.\n사업자 등록번호를 확인해주세요.");
                    } else {
                        alert("사업자 등록번호 확인 API 에러입니다.\n잠시 후 다시 시도해주세요.");
                    }
                }).fail(function (error) {
                    console.log(error);
                });
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


    function checkValueEmpty(element) {
        if (element !== undefined) {
            return !(element.value === null || element.value === "");
        } else
            return false;
    }
</script>
</body>
</html>
