<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-10-27
  Time: 오후 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공급자 아이디 찾기</title>
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
<div class="payus-modal">
    <div class="content">
        <div class="header">
            <span class="title">편의시설 & 서비스 항목</span>
        </div>
        <div class="body">
            <span class="title">편의시설 및 서비스 항목을 체크해주세요.</span>
            <div class="service-options">
                <span class="service-topic">욕실</span>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                헤어드라이기
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                샴푸
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                온수
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                바디워시
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="service-options">
                <span class="service-topic">침실 및 세탁 시설</span>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                수건
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                침구류
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                비누
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                화장지
                            </label>
                        </div>
                    </div>
                </div>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                세탁기
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                건조기
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                옷걸이
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                다리미
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="service-options">
                <span class="service-topic">냉난방</span>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                에어컨
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                보일러
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                전열기구
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="service-options">
                <span class="service-topic">주방 및 식당</span>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                전자레인지
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                냉장고
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                조리도구
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                식기류
                            </label>
                        </div>
                    </div>
                </div>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                조미료
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                식용유
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                가스레인지
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                인덕션
                            </label>
                        </div>
                    </div>
                </div>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                조식
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                커피머신
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="service-options">
                <span class="service-topic">안전</span>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                화재 경보기
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                구급 상자
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                소화기
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                비상대피 안내도
                            </label>
                        </div>
                    </div>
                </div>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                현지 응급 구조기관 안내
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                일산화탄소 경보기
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="service-options">
                <span class="service-topic">인터넷 및 사무공간</span>
                <div class="option-list">
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                무선 인터넷
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                TV
                            </label>
                        </div>
                    </div>
                    <div class="option-area">
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label service-option">
                                <input type="checkbox" class="form-check-input">
                                업무 전용 공간
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="payus-modal-footer">
            <button type="button" class="btn btn-modal-save"
                    onclick="document.getElementsByClassName('payus-modal')[0].setAttribute('style', 'display : none')">
                저장
            </button>
            <button type="button" class="btn btn-modal-cancel"
                    onclick="document.getElementsByClassName('payus-modal')[0].setAttribute('style', 'display : none')">
                모달 닫기
            </button>
        </div>
    </div>
    <div class="payus-modal-layer"></div>
</div>
<div class="main-wrapper">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center " style="flex-direction: column">
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
                                    <h3 class="d-block mb-2 dohyun-font" style="color: #8668d0">모달 테스트</h3>
                                </div>
                                <div class="row noto-font">
                                    <div class="col-12">
                                        <button type="button" class="btn btn-payus d-block"
                                                onclick="document.getElementsByClassName('payus-modal')[0].setAttribute('style', 'display : block')">
                                            모달 테스트
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
<script src="/vendors/core/core.js"></script>
<script src="/vendors/feather-icons/feather.min.js"></script>
<script src="/js/template.js"></script>
</body>
</html>
