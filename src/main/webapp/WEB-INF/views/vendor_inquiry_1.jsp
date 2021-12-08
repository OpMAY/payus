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
    <title>공급자 문의 내역</title>
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
<body onresize="listenResize()">

<!-- partial:partials/_footer.jsp -->
<jsp:include page="partials/vendor_sidebar.jsp" flush="true"/>
<!-- partial -->
<div class="main-wrapper sidemain">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center " style="flex-direction: column">
            <jsp:include page="partials/vendor_nav.jsp" flush="true"/>
            <div class="payus-modal" id="reject-reason-modal">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between">
                            <h3 style="color: #8668d0;">문의 내역</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-2 row-cols-lg-1 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="inquiry-modal-title">제목</label>
                            <textarea class="payus-modal-textarea" id="inquiry-modal-title" rows="1" readonly>상점 등록은 어떻게 하나요?</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="inquiry-modal-category">카테고리</label>
                            <textarea class="payus-modal-textarea" id="inquiry-modal-category" rows="1"
                                      readonly>포인트 적립 취소</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="inquiry-modal-reg-date">문의 일자</label>
                            <textarea class="payus-modal-textarea" id="inquiry-modal-reg-date" rows="1"
                                      readonly>2021.11.26</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="inquiry-modal-answer-status">답변 여부</label>
                            <textarea class="payus-modal-textarea" id="inquiry-modal-answer-status" rows="1"
                                      readonly>답변 완료</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="inquiry-modal-content">문의 내용</label>
                            <textarea class="payus-modal-textarea" id="inquiry-modal-content" rows="5" readonly>문의 내용문의 내용문의 내용문의 내용문의 내용문의 내용문의 내용문의 내용문의 내용문의 내용문의 내용</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="inquiry-modal-images">첨부 이미지</label>
                            <div class="row row-cols-1 row-cols-xl-5 row-cols-lg-3 row-cols-md-2 row-cols-sm-1"
                                 id="inquiry-modal-images">
                                <div class="col modal-image-div">
                                    <div class="img-container">
                                        <img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; height: 100%; object-fit: fill">
                                    </div>
                                </div>
                                <div class="col modal-image-div">
                                    <div class="img-container">
                                        <img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; height: 100%; object-fit: fill">
                                    </div>
                                </div>
                                <div class="col modal-image-div">
                                    <div class="img-container">
                                        <img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; height: 100%; object-fit: fill">
                                    </div>
                                </div>
                                <div class="col modal-image-div">
                                    <div class="img-container">
                                        <img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; height: 100%; object-fit: fill">
                                    </div>
                                </div>
                                <div class="col modal-image-div">
                                    <div class="img-container">
                                        <img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; height: 100%; object-fit: fill">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="inquiry-modal-answer">답변</label>
                            <textarea class="payus-modal-textarea" id="inquiry-modal-answer" rows="5" readonly>공급자 회원가입 후 승인 시 등록이 가능합니다.
                            </textarea>
                        </div>
                    </div>
                    <div>
                        <div class="row modal-btn-div"
                             style="margin-bottom: 1rem; display: flex; justify-content: flex-end;">
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal cancel">
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 2rem;">
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">문의 내역</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">

                    <div class="row" style="margin-bottom: 1rem;justify-content: right">
                        <div class="col-12 col-xl-6 col-lg-6 col-md-6 col-sm-6"
                             style="display: flex; align-items: center;justify-content: right">
                            <button type="button"
                                    class="btn btn-payus inquiry" id="go-inquiry"
                                    style="margin-right: 2rem">
                                문의하기
                            </button>
                            <select class="payus-select inquiry" id="review-data-type-select"
                                    style="color: black;" onchange="alert('바뀜')">
                                <option selected value="1">전체</option>
                                <option value="2">답변 완료</option>
                                <option value="3">미답변</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" id="table-div" style="overflow-x: auto;">
                        <%--      TODO 데이터 리스트로 연동                  --%>
                        <div class="col-12" id="table-col"
                             style="display: flex; justify-content: center; flex-direction: column">
                            <div class="tab">
                                <button class="tablinks active">전체</button>
                                <button class="tablinks">이용 방법</button>
                                <button class="tablinks">페이백</button>
                                <button class="tablinks">이벤트</button>
                                <button class="tablinks">불만</button>
                                <button class="tablinks">신고</button>
                                <button class="tablinks">기타</button>
                            </div>
                            <table class="payus-table" style="border-top: 3px solid #8668d0;">
                                <thead>
                                <tr>
                                    <th style="width: 5%">번호</th>
                                    <th style="width: 20%">문의 종류</th>
                                    <th style="width: 40%">문의 제목</th>
                                    <th style="width: 10%">문의 일자</th>
                                    <th style="width: 10%">답변 상태</th>
                                    <th style="width: 15%">상세보기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr inquiry="1">
                                    <td>1</td>
                                    <td>
                                        이용방법
                                    </td>
                                    <td>
                                        회원 탈퇴를 진행하고 싶습니다.
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>
                                        답변 완료
                                    </td>
                                    <td>
                                        <button type="button" style="display: block;"
                                                class="btn btn-payus-table">
                                            상세 보기
                                        </button>
                                    </td>
                                </tr>
                                <tr inquiry="2">
                                    <td>1</td>
                                    <td>
                                        페이백
                                    </td>
                                    <td>
                                        회원 탈퇴를 진행하고 싶습니다.
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>
                                        미답변
                                    </td>
                                    <td>
                                        <button type="button" style="display: block;"
                                                class="btn btn-payus-table">
                                            상세 보기
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="charge-table-pagination">
                                <a href="#">&laquo;</a>
                                <a data-order="1" style="cursor: pointer" class="active">1</a>
                                <a data-order="2" style="cursor: pointer">2</a>
                                <a data-order="3" style="cursor: pointer">3</a>
                                <a data-order="4" style="cursor: pointer">4</a>
                                <a data-order="5" style="cursor: pointer">5</a>
                                <a data-order="6" style="cursor: pointer">6</a>
                                <a data-order="7" style="cursor: pointer">7</a>
                                <a data-order="8" style="cursor: pointer">8</a>
                                <a data-order="9" style="cursor: pointer">9</a>
                                <a data-order="10" style="cursor: pointer">10</a>
                                <a href="#">&raquo;</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/date-formatter.js"></script>
<script>


    $(".pagination a").on("click", function () {
        let data_order = $(this).attr('data-order');
        console.log(data_order);
        let paginationDiv = $("#charge-table-pagination");
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (active_page !== data_order) {
            // TODO 페이지 별 데이터 AJAX
            paginationDiv.children('.active').removeClass('active');
            $(this).addClass('active');
        }
    });

    $(document).ready(function () {
        listenResize();
    });

    function listenResize() {
        let screenHeight = $(window).height();
        console.log(screenHeight);

        let tableWidth = $(".payus-table").width();
        console.log("table Width : " + tableWidth);
        let pagination = $(".pagination");
        pagination.width(tableWidth);
    }
</script>
<script>
    let body = $(document.body);
    let modal = $(".payus-modal");

    $(".btn-payus-table").on("click", function () {
        let notice_no = $(this).parent().parent().attr('notice');
        console.log(notice_no);
        // TODO 해당 charge_no로 반려 사유 받아오기
        modal.addClass('show');

        if (modal.hasClass('show')) {
            body.css("overflow", "hidden");
            modal.focus();
        }
    });

    $(".modal-close").on("click", function () {
        modal.removeClass("show");

        if (!modal.hasClass("show")) {
            body.css("overflow", "auto");
        }
    });

    $(".btn-payus-modal.cancel").on("click", function () {
        modal.removeClass("show");

        if (!modal.hasClass("show")) {
            body.css("overflow", "auto");
        }
    });

    $('.clickable_img').on("click", function () {
        if (confirm('해당 이미지를 보시겠습니까?')) {
            let imageUrl = $(this).attr("src");
            window.open(imageUrl);
        } else {
            return false;
        }
    });

    $(document).ready(function () {
        let table = $(".payus-table");
        let body = table.children('tbody');
        for (let i = 0; i < body.children().length; i++) {
            let originalRegDate = body.children('tr:eq(' + i + ')').children('td:eq(3)').text();
            body.children('tr:eq(' + i + ')').children('td:eq(3)').text(SplitDateFunction(originalRegDate));
        }
    });

    $('.payus-modal').on("click", function (event) {
        if (event.target.className === 'payus-modal show') {
            modal.removeClass("show");

            if (!modal.hasClass("show")) {
                body.css("overflow", "auto");
            }
        }
    })

    $('.tablinks').on("click", function () {
        if (!$(this).hasClass("active")) {
            const tabDiv = $(this).parent();
            tabDiv.children("button.active").removeClass("active");
            $(this).addClass("active");

            // TODO AJAX OR URL MOVE - 카테고리에 맞는 FAQ 불러오기
        }
    });


</script>
</body>
</html>
