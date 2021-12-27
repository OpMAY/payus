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

        <div class="page-content d-flex align-items-center " style="flex-direction: column">
            <jsp:include page="partials/vendor_nav.jsp" flush="true"/>
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2 s-core-dream"
                            style="color: #8668d0; padding-left: 10px; font-weight: bold">문의하기</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
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
                                <label for="vendor-inquiry-title">문의 제목</label>
                                <textarea class="payus-textarea" id="vendor-inquiry-title" rows="1"
                                ></textarea>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-inquiry-content">문의 내용</label>
                                <textarea class="payus-textarea" id="vendor-inquiry-content" rows="3"
                                ></textarea>
                            </div>
                        </div>
                        <div class="col-12" style="margin-bottom: 2rem">
                            <div class="row row-cols-4" id="image-container">
                                <input type="file" id="image-add-input-1" name="img1" accept="image/*"
                                       hidden>
                                <div class="col image-div" id="img-add-div" style="height: 100%">
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
<script src="/js/common.js"></script>
<script>
    let isReviewReport = false;
    let review_no = 0;
    let body = $(document.body);
    const img_add_div_height = $('#img-add-div').height();
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
        console.log('deleting Cookie');
        document.cookie = name + '=; expires=SAT, 01 Jan 2000 00:00:10 GMT; domain=' + window.location.hostname + '; path=/vendor';
        console.log('Cookie Deleted : ' + getCookie(name));
    };

    $(document).ready(function () {
        if(getCookie("report_review") !== undefined && getCookie("report_review") !== null && getCookie("report_review") !== ''){
            isReviewReport = true;
            review_no = getCookie('report_review');
            console.log("review_no : " + review_no);
            $('#vendor-inquiry-category').val(5);
            deleteCookie('report_review');
        }
    });

    $('#vendor-inquiry-category').on("change", function (e) {
        if(isReviewReport) {
            if($(this).val() !== '5'){
                alert('리뷰 신고를 통해서 들어온 경우는 다른 종류를 클릭할 수 없습니다.');
                $(this).val(5);
            }
        } else {
            if($(this).val() === '5') {
                alert("리뷰 신고는 리뷰 목록 페이지에서\n신고 버튼 클릭을 통해 문의하시면 원활한 신고가 가능합니다.");
            }
        }
    });
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

    $(body).on("click", ".img-delete-btn", function () {
        console.log('delete clicked');
        let inputId = $(this).parent().prev().attr('id');
        console.log(inputId);
        let agent = navigator.userAgent.toLowerCase();
        if ((navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (agent.indexOf("msie") !== -1)) {
            $(inputId).replaceWith($(inputId).clone(true));
        } else {
            $(inputId).val('');
        }
        $(this).parent().remove();
        if(imageIndex === 5) {
            $('#img-add-div').css('display', 'block');
        }
        imageIndex--;
    });

    let imageInputIndex = 1;
    let imageIndex = 0;

    $("#img-add-btn").click(function () {
        console.log(imageInputIndex);

        $("#image-add-input-" + imageInputIndex).click();
        console.log("clicked");

        $("#image-add-input-" + imageInputIndex).change(function () {
            console.log("changed");
            if (this.files && this.files[0]) {
                console.log("ImageIndex before Upload : " + imageInputIndex);
                let reader = new FileReader();
                reader.onload = function (data) {
                    console.log(data);
                    console.log($("#image-add-input-" + imageInputIndex).val());
                    let fileValue = $("#image-add-input-" + imageInputIndex).val().split("\\");
                    let fileName = fileValue[fileValue.length - 1];
                    if (fileName !== "") {
                        $('<div class="col image-div" style="position: relative; height: ' + img_add_div_height + 'px">\n' +
                            '<div class="img-container">\n' +
                            '<img src="' + data.target.result + '" alt style="width: 100%;height:' + img_add_div_height + 'px;object-fit: fill">\n' +
                            '</div>\n' +
                            '<button type="button" class="img-delete-btn small"><img src="/images/x-button.svg" alt width="90%"></button>\n' +
                            '</div>').insertBefore("#img-add-div");
                        imageInputIndex++;
                        imageIndex++;
                        $('<input type="file" id="image-add-input-' + imageInputIndex + '" name="img' + imageInputIndex + '" accept="image/*" hidden>').insertBefore("#img-add-div");
                        $('.img-delete-btn').css("display", "block");
                        console.log("ImageIndex After Upload : " + imageInputIndex);
                        if(imageIndex === 5){
                            $('#img-add-div').css('display', 'none');
                        }
                    }
                };
                reader.readAsDataURL(this.files[0]);
            }
        });
    });

    $('.btn-payus').on('click', function () {
        let type = $('#vendor-inquiry-category option:selected').val();
        let title = $('#vendor-inquiry-title').val();
        let content = $('#vendor-inquiry-content').val();
        let data = {"type" : type, "title" : title, "content" : content};
        let formData = new FormData();
        let json = {"type" : type, "review_no" : review_no * 1};
        formData.append('inquiry_data', JSON.stringify(data));
        formData.append('imgs', $('input[type=file]')[0].files[0]);
        formData.append("inquiry_json", JSON.stringify(json));
        $.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            url: '/vendor/manage/customer/inquiry/request',
            contentType: false,
            processData: false,
            data: formData
        }).done(function (result) {
            if(result === 0){
                alert('문의가 등록되었습니다.');
                window.location.href = '/vendor/manage/customer/inquiry/list.do';
            } else {
                alert('오류가 발생했습니다.');
            }
        }).fail(function (error) {
            console.log(error);
        })
    })
</script>
</body>
</html>
