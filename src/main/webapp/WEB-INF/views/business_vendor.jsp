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
    <link rel="shortcut icon" href="/images/favicon.png"/>
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
                            <div class="auth-form-wrapper px-4 py-5">
                                <div class="row justify-content-center">
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">사업자 등록 번호 인증</h3>
                                </div>
                                <form class="forms-sample noto-font">
                                    <div class="col-12">
                                        <div class="form-group" style="position: relative">
                                            <label for="vendor-register-business-number">사업자 등록 번호</label>
                                            <input class="form-control" id="vendor-register-business-number"
                                            <%--                                                   onkeyup="checkBusinessNumber(false)"--%>
                                                   placeholder="사업자 등록 번호를 - 없이 입력해주세요."
                                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                   onkeyup="checkCorporateRegiNumber(this.value)"
                                                   onfocus="checkCorporateRegiNumber(this.value)"
                                                   style="height: 13%">
                                            <button type="button" class="btn btn-business-verify-text" id="business-text-button">
                                                인증하기
                                            </button>
                                            <h6 class="vendor-input-warning" id="warning-business-text"
                                                style="margin-top: 10px">
                                                올바른 사업자 등록 번호를 입력해주세요.</h6>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group" style="position: relative">
                                            <label for="business-file-name">사업자 등록증</label>
                                            <input class="upload-name form-control" id="business-file-name" disabled
                                                   placeholder="사업자 등록증을 등록해주세요." style="height: 13%">
                                            <input type="file" class="form-control" id="vendor-register-business-file"
                                                   hidden>
                                            <button type="button" class="btn btn-business-verify-file"
                                                    onclick="$('#vendor-register-business-file').click()">
                                                등록하기
                                            </button>
                                            <h6 class="vendor-input-file" id="warning-business-file"
                                                style="margin-top: 10px">
                                                첨부한 파일의 전체 크기는 10MB 미만이어야 합니다.<br>용량이 초과될 경우, 문의 접수가 원활하게 진행되지 않을 수
                                                있습니다.</h6>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <div class="col-12">
                                            <button type="button" class="btn btn-auth-sign-in d-block"
                                                    onclick="alert('회원가입 완료')">
                                                회원가입
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
    $('#vendor-register-business-file').on('change', function () {
        if (this.files && this.files[0]) {
            let reader = new FileReader();
            console.log(reader);
            console.log(reader.result);
            reader.readAsDataURL(this.files[0]);
            reader.onload = function (data) {
                if (data.total > 10 * 1024 * 1024) {
                    alert("파일 용량은 10MB를 넘길 수 없습니다.");
                    let agent = navigator.userAgent.toLowerCase();
                    if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
                        $('#vendor-register-business-file').replaceWith($('#vendor-register-business-file').clone(true));
                    } else {
                        $('#vendor-register-business-file').val('');
                    }
                    $('#business-file-name').val('');
                    return false;
                } else {
                    let fileValue = $('#vendor-register-business-file').val().split("\\");
                    let fileName = fileValue[fileValue.length - 1];
                    console.log(fileName);
                    $('#business-file-name').val(fileName);
                }
            }
        }
    });

    function checkCorporateRegiNumber(number){
        let numberMap = number.replace(/-/gi, '').split('').map(function (d){
            return parseInt(d, 10);
        });

        if(numberMap.length === 10){
            let keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
            let chk = 0;

            keyArr.forEach(function(d, i){
                chk += d * numberMap[i];
            });

            chk += parseInt((keyArr[8] * numberMap[8])/ 10, 10);
            console.log(chk);
            if(!(Math.floor(numberMap[9]) === ( (10 - (chk % 10) ) % 10))){
                document.getElementById('warning-business-text').setAttribute('style', 'display:flex');
                document.getElementById('business-text-button').setAttribute('style', 'top:43%');
            } else {
                document.getElementById('warning-business-text').setAttribute('style', 'display:none');
                document.getElementById('business-text-button').setAttribute('style', 'top:50%');
            }
        } else {
            document.getElementById('warning-business-text').setAttribute('style', 'display:flex');
            document.getElementById('business-text-button').setAttribute('style', 'top:43%');
        }
    }
</script>
</body>
</html>
