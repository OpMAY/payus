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
    <title>공급자 상품 수정</title>
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
                            style="color: #8668d0; padding-left: 10px; font-weight: bold">상품 수정</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="row" id="image-container"
                                 style="margin-bottom: 1rem; overflow: hidden">
                                <input type="file" id="image-add-input" name="img" accept="image/*"
                                       hidden>
                                <div class="col image-div" id="img-add-div"
                                     style="display: flex; justify-content: center; height: 200px; position: relative">
                                    <div class="img-add" id="img-add-btn"
                                         style="display: flex; width: 50%; height: 100%;">
                                        <img src="https://payus.s3.ap-northeast-2.amazonaws.com/${room.room_img}" alt
                                             width="100%" height="100%"
                                             style="border-radius: 5px">
                                    </div>
                                    <button type="button" class="img-delete-btn" style="display: block"><img
                                            src="/images/x-button.svg" alt width="90%"></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-goods-name">상품명</label>
                                <textarea class="payus-textarea" id="vendor-goods-name" rows="1"
                                >${room.name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-goods-explain">상품 옵션</label>
                                <textarea class="payus-textarea" id="vendor-goods-explain" rows="3"
                                >${room.room_explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 col-xl-6" style="position: relative; margin-bottom: 2rem">
                                    <label for="vendor-goods-price">상품 가격</label>
                                    <textarea class="payus-textarea" id="vendor-goods-price" rows="1"
                                    >${room.price}</textarea>
                                    <span class="price-unit">원</span>
                                </div>
                                <div class="col-4 col-xl-2" style="margin-bottom: 2rem">
                                    <label for="vendor-store-payback-rate">페이백률</label>
                                    <textarea class="payus-textarea" id="vendor-store-payback-rate" rows="1"
                                              style="white-space: nowrap"
                                              readonly>${paybackRate}%</textarea>
                                </div>
                                <div class="col-8 col-xl-4" style="margin-bottom: 2rem">
                                    <label for="vendor-point-result">페이백 적립액</label>
                                    <textarea class="payus-textarea" id="vendor-point-result" rows="1" readonly
                                              style="white-space: nowrap"
                                              placeholder="금액을 먼저 입력하세요."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-2 row-cols-lg-1 row-cols-md-1 row-cols-sm-1">
                        <div class="col">
                            <button type="button" class="btn btn-payus">
                                수정
                            </button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-grey">
                                취소
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        let price = $("#vendor-goods-price");
        price.val(comma(unComma(price.val())));

        let result = Math.round(unComma(price.val()) * ${paybackRate} * 0.01);
        $("#vendor-point-result").val(result);
    });

    $("#vendor-goods-price").on("keypress", function (e) {
        if (this.value === "") {
            if ((e.keyCode <= 48) || (e.keyCode > 57))
                e.preventDefault();
        } else {
            if ((e.keyCode < 48) || (e.keyCode > 57))
                e.preventDefault();
        }
    });

    $("#vendor-goods-price").on("keyup", function () {
        console.log(unComma(this.value).length);
        this.value = comma(unComma(this.value));
        let resultArea = $("#vendor-point-result");
        if (unComma(this.value) >= 1000) {
            if (unComma(this.value).length >= 7 && unComma(this.value) >= 1000000) {
                alert("1000원 ~ 100만원 사이의 금액만 입력 가능합니다.");
                this.value = comma(unComma(this.value).substring(0, 6));
            } else {
                let result = Math.round(unComma(this.value) * ${paybackRate} * 0.01);
                resultArea.val(result);
            }
        } else {
            resultArea.val('');
        }
    });

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function unComma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    $("#img-add-btn").on("click", function () {
        console.log("add-btn clicked");
        $("#image-add-input").click();

        $("#image-add-input").change(function () {
            console.log("changed");
            if (this.files && this.files[0]) {
                let reader = new FileReader();
                reader.onload = function (data) {
                    $("#img-add-btn").children('img').attr("src", data.target.result);
                    $("#img-add-btn").children('img').css("transform", "");
                    $(".img-delete-btn").css("display", "block");
                };
                reader.readAsDataURL(this.files[0]);
            }
        })
    });

    $(".img-delete-btn").on("click", function () {
        let agent = navigator.userAgent.toLowerCase();
        if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
            $("#image-add-input").replaceWith($("#image-add-input").clone(true));
        } else {
            $("#image-add-input").val('');
        }
        $("#img-add-btn").children('img').attr("src", '/images/Group%20334.svg');
        $("#img-add-btn").children('img').css("transform", "scale(0.45)");
        $(".img-delete-btn").css("display", "none");
    });

    $('.btn-grey').on("click", function () {
        window.location.replace(window.document.referrer);
    });

</script>
</body>
</html>
