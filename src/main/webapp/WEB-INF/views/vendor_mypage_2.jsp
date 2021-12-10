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
    <title>공급자 회원 정보</title>
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
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">사업장 정보</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row noto-font">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-name">상호명</label>
                                <textarea class="payus-textarea" id="vendor-store-name" rows="1"
                                          disabled>${vendor.store_name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem;">
                                <label for="vendor-business-code">사업자 등록 번호</label>
                                <textarea class="payus-textarea" id="vendor-business-code" rows="1"
                                          disabled>${vendor.business_code}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-representative-name">대표</label>
                                <textarea class="payus-textarea" id="vendor-representative-name" rows="1"
                                          disabled>${vendor.vendor_name}</textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btn-payus business-info">
                                수정
                            </button>
                            <button type="button" class="btn btn-grey business-info-cancel" style="display: none">
                                취소
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script>
    const originalStoreName = $("#vendor-store-name").val();
    const originalVendorName = $("#vendor-representative-name").val();

    $(".btn-grey.business-info-cancel").on("click", function () {
        $("#vendor-store-name").attr("disabled", "true");
        $("#vendor-representative-name").attr("disabled", "true");
        $("#vendor-store-name").val(originalStoreName);
        $("#vendor-representative-name").val(originalVendorName);
        $(".btn-payus.business-info").removeClass("active");
        $(".btn-payus.business-info").text("수정");
        $(this).css("display", "none");
    })

    $(".btn-payus.business-info").on("click", function () {
        if ($(this).hasClass("active")) {
            let storeName = $("#vendor-store-name").val();
            let vendorName = $("#vendor-representative-name").val();
            let data = {
                "storeName" : storeName,
                "vendorName" : vendorName
            };
            $.ajax({
                type: 'POST',
                url: '/vendor/mypage/change/business',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result) {
                    alert("사업장 정보가 변경되었습니다.");
                    window.location.reload();
                } else {
                    alert("알 수 없는 오류가 발생했습니다.");
                }
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            $(this).addClass("active");
            $(this).text("확인");
            $(".btn-grey.business-info-cancel").css("display", "block");
            $("#vendor-store-name").removeAttr("disabled");
            $("#vendor-representative-name").removeAttr("disabled");
        }
    });
</script>
</body>
</html>
