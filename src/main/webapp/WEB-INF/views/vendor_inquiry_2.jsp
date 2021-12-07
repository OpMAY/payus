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
    <title>공급자 문의하기</title>
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
                        <h3 class="d-block mb-2 s-core-dream"
                            style="color: #8668d0; padding-left: 10px; font-weight: bold">문의하기</h3>
                    </div>
                </div>
                <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-inquiry-category">문의 종류</label>
                                <select class="payus-select inquiry-request" id="vendor-inquiry-category">
                                    <option value="1">이용 방법</option>
                                    <option value="2">페이백</option>
                                    <option value="3">이벤트</option>
                                    <option value="4">불만</option>
                                    <option value="5">신고</option>
                                    <option value="6">기타</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-inquiry-name">문의 제목</label>
                                <textarea class="payus-textarea" id="vendor-inquiry-name" rows="1"
                                ></textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-inquiry-explain">문의 내용</label>
                                <textarea class="payus-textarea" id="vendor-inquiry-explain" rows="3"
                                ></textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="row row-cols-4" id="image-container">
                                <input type="file" id="image-add-input-1" name="img1" accept="image/*"
                                       hidden>
                                <div class="col image-div" id="img-add-div" style="height: 200px">
                                    <div class="img-add" id="img-add-btn">
                                        <img src="/images/Group%20334.svg" alt width="100%" height="100%"
                                             style="transform: scale(0.45)">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-2 row-cols-lg-1 row-cols-md-1 row-cols-sm-1">
                        <div class="col">
                            <button type="button" class="btn btn-payus">
                                등록
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
    // $("#img-add-btn").on("click", function () {
    //     console.log("add-btn clicked");
    //     $("#image-add-input").click();
    //
    //     $("#image-add-input").change(function () {
    //         console.log("changed");
    //         if (this.files && this.files[0]) {
    //             let reader = new FileReader();
    //             reader.onload = function (data) {
    //                 $("#img-add-btn").children('img').attr("src", data.target.result);
    //                 $("#img-add-btn").children('img').css("transform", "");
    //                 $(".img-delete-btn").css("display", "block");
    //             };
    //             reader.readAsDataURL(this.files[0]);
    //         }
    //     })
    // });

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

    let imageIndex = 1;

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
                        $('<div class="col image-div" style="position: relative; height: 172px">\n' +
                            '<div class="img-container">\n' +
                            '<img src="' + data.target.result + '" alt style="width: 100%;height:172px;object-fit: fill">\n' +
                            '</div>\n' +
                            '<button type="button" class="img-delete-btn small"><img src="/images/x-button.svg" alt width="90%"></button>\n' +
                            '</div>').insertBefore("#img-add-div");
                        imageIndex++;
                        $('<input type="file" id="image-add-input-' + imageIndex + '" name="img' + imageIndex + '" accept="image/*" hidden>').insertBefore("#img-add-div");
                        $('.img-delete-btn').css("display", "block");
                        console.log("ImageIndex After Upload : " + imageIndex);
                    }
                };
                reader.readAsDataURL(this.files[0]);

            }
        });

    });

</script>
</body>
</html>
