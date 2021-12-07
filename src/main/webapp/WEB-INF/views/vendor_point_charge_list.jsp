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
    <title>공급자 포인트 충전 내역</title>
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
<jsp:include page="partials/vendor_sidebar.jsp" flush="true"></jsp:include>
<!-- partial -->
<div class="main-wrapper sidemain">
    <div class="page-wrapper full-page">
        <div class="page-content d-flex align-items-center justify-content-center" style="flex-direction: column">
            <div class="payus-modal" id="reject-reason-modal">
                <div class="modal-body" style="height: auto">
                    <div class="row">
                        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between">
                            <h3 style="color: #8668d0;">반려 사유</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-3 row-cols-lg-1 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="reject-writer">작성자</label>
                            <textarea class="payus-modal-textarea" id="reject-writer" rows="1" readonly>관리자</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="charge-request-point">요청 포인트</label>
                            <textarea class="payus-modal-textarea" id="charge-request-point" rows="1"
                                      readonly>23,000원</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="charge-request-date">신청 일자</label>
                            <textarea class="payus-modal-textarea" id="charge-request-date" rows="1"
                                      readonly>2021.11.26</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="reject-reason">반려 사유</label>
                            <textarea class="payus-modal-textarea" id="reject-reason" rows="5" readonly>송금 내역이 존재하지 않습니다.<br/>송금 내역 확인 후 다시 문의해주시길 바랍니다.</textarea>
                        </div>
                    </div>
                    <div data-type="not-answered">
                        <div class="row modal-btn-div"
                             style="margin-bottom: 1rem; display: flex; justify-content: flex-end;">
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal cancel">
                                    취소
                                </button>
                            </div>
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal submit" id="btn-for-inquiry">
                                    문의하러 가기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="payus-modal" id="cancel-request-modal">
                <div class="modal-body" style="height: auto">
                    <div class="row">
                        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between">
                            <h3 style="color: #8668d0;">충전 취소 요청</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-2 row-cols-lg-1 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="cancel-charge-request-point">요청 포인트</label>
                            <textarea class="payus-modal-textarea" id="cancel-charge-request-point" rows="1"
                                      readonly>23,000원</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="cancel-charge-request-date">신청 일자</label>
                            <textarea class="payus-modal-textarea" id="cancel-charge-request-date" rows="1"
                                      readonly>2021.11.26</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="cancel-reason">취소 사유</label>
                            <textarea class="payus-modal-textarea" id="cancel-reason" rows="5"
                                      placeholder="포인트 충전 취소 사유를 입력해주세요."></textarea>
                        </div>
                    </div>
                    <div class="row modal-btn-div"
                         style="margin-bottom: 1rem; display: flex; justify-content: flex-end;">
                        <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                            <button type="button" class="btn btn-payus-modal cancel">
                                취소
                            </button>
                        </div>
                        <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                            <button type="button" class="btn btn-payus-modal submit" id="btn-for-request">
                                취소 요청
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row" style="margin-bottom: 5rem; flex-direction: column">
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">포인트 충전 내역</h3>
                        <h5 class="d-block"
                            style="color: #979797; padding-left: 10px;margin-top: 1rem; line-height: 170%; word-break: keep-all">
                            페이어스 포인트 적립은 관리자에게 무통장 송금 후 송금 내역을 확인해 이상이 없을 시 포인트가 충전됩니다.</h5>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row" style="margin-bottom: 1rem;justify-content: right">
                        <div class="col-12 col-xl-9 col-lg-12 col-md-12 col-sm-12" style="flex-direction: column">
                            <span class="mypoint">나의 포인트 <strong
                                    style="font-size: 2rem; color: #6D29D0">99,999,999P</strong></span>
                            <span>페이어스 포인트가 10,000P 이하인 경우 앱에 상점이 노출되지 않습니다.</span>
                        </div>
                        <div class="col-12 col-xl-3 col-lg-4 col-md-4 col-sm-4"
                             style="padding-top: 2rem; justify-content: right">
                            <select class="review-select" id="review-data-type-select"
                                    style="color: black;" onchange="alert('바뀜')">
                                <option selected value="1">전체</option>
                                <option value="2">승인</option>
                                <option value="3">미승인</option>
                                <option value="4">요청</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" id="table-div" style="overflow-x: auto;">
                        <%--      TODO 데이터 리스트로 연동                  --%>
                        <div class="col-12" id="table-col"
                             style="display: flex; justify-content: center; flex-direction: column">
                            <table class="payus-table">
                                <thead>
                                <tr>
                                    <th style="width: 5%">번호</th>
                                    <th style="width: 20%">포인트 충전 요청 금액</th>
                                    <th style="width: 20%">충전 후 내 포인트</th>
                                    <th style="width: 10%">신청 일자</th>
                                    <th style="width: 10%">처리 일자</th>
                                    <th style="width: 15%">상태</th>
                                    <th style="width: 15%">취소 요청</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr charge="1">
                                    <td>1</td>
                                    <td>23,000원</td>
                                    <td>
                                        73,000원
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>2021.11.28</td>
                                    <td>미승인
                                        <button type="button" style="display: block; margin-top: 10px"
                                                class="btn btn-payus-table">
                                            반려 사유
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            취소 요청
                                        </button>
                                    </td>
                                </tr>
                                <tr charge="2">
                                    <td>2</td>
                                    <td>23,000원</td>
                                    <td>
                                        73,000원
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>2021.11.28</td>
                                    <td>승인
                                    </td>
                                    <td>
                                        충전 완료 후<br>취소 요청 불가
                                    </td>
                                </tr>
                                <tr charge="3">
                                    <td>3</td>
                                    <td>23,000원</td>
                                    <td>
                                        73,000원
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>관리자가 <br>확인 중 입니다.</td>
                                    <td>요청
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            취소 요청
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

    let rejectReasonModal = $("#reject-reason-modal");
    let cancelRequestModal = $("#cancel-request-modal");
    $(".btn-payus-table").on("click", function () {
        let charge_no = $(this).parent().parent().attr('charge');
        console.log(charge_no);
        // TODO 해당 charge_no로 반려 사유 받아오기
        rejectReasonModal.addClass('show');

        if (rejectReasonModal.hasClass('show')) {
            body.css("overflow", "hidden");
            rejectReasonModal.focus();
        }
    });


    $(".btn-payus-table-report").on("click", function () {
        let charge_no = $(this).parent().parent().attr('charge');
        console.log(charge_no);
        // TODO 해당 room_no로 방 삭제

        cancelRequestModal.addClass('show');

        if (cancelRequestModal.hasClass('show')) {
            body.css("overflow", "hidden");
            cancelRequestModal.focus();
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
            let originalRegDate = body.children('tr:eq(' + i + ')').children('td:eq(5)').text();
            body.children('tr:eq(' + i + ')').children('td:eq(5)').text(SplitDateFunction(originalRegDate));
        }
    });

    $('.payus-modal').on("click", function (event) {
        if (event.target.className === 'payus-modal show') {
            modal.removeClass("show");

            if (!modal.hasClass("show")) {
                body.css("overflow", "auto");
            }
        }
    });
</script>
</body>
</html>
