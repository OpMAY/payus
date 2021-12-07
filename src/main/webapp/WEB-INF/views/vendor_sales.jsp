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
    <title>매출 현황</title>
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
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row" style="margin-bottom: 5rem;">
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">매출 현황</h3>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-4 row-cols-lg-2 row-cols-md-1 row-cols-sm-1" style="display: flex; margin-bottom: 2rem">
                        <div class="col">
                            <label for="total-sales">총 매출</label>
                            <textarea class="payus-textarea sales" id="total-sales" rows="1" readonly>13,000,000원</textarea>
                        </div>
                        <div class="col">
                            <label for="monthly-sales">금월 매출</label>
                            <textarea class="payus-textarea sales" id="monthly-sales" rows="1" readonly>5,000,000원</textarea>
                        </div>
                        <div class="col">
                            <label for="total-point-usage">총 포인트 사용</label>
                            <textarea class="payus-textarea sales" id="total-point-usage" rows="1" readonly>1,300,000원</textarea>
                        </div>
                        <div class="col">
                            <label for="monthly-point-usage">금월 포인트 사용</label>
                            <textarea class="payus-textarea sales" id="monthly-point-usage" rows="1" readonly>500,000원</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row" style="margin-bottom: 1rem;justify-content: right">
                        <div class="col-12 col-xl-4 col-lg-6 col-md-6 col-sm-6"
                             style="flex-direction: column; display: flex; justify-content: flex-end">
                            <button type="button" class="btn btn-payus"
                                    id="excel-btn" style="margin-bottom: 0">
                                엑셀 다운로드
                            </button>
                        </div>
                        <div class="col-12 col-xl-3 col-lg-6 col-md-6 col-sm-6"
                             style="padding-top: 2rem; justify-content: right;">
                            <select class="review-select" id="review-data-type-select"
                                    style="color: black;" onchange="alert('바뀜')">
                                <option selected value="1">전체</option>
                                <option value="2">결제 완료</option>
                                <option value="3">결제 취소</option>
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
                                    <th style="width: 15%">사용자</th>
                                    <th style="width: 20%">결제 금액</th>
                                    <th style="width: 10%">페이백률</th>
                                    <th style="width: 20%">적립 포인트</th>
                                    <th style="width: 15%">결제 일자</th>
                                    <th style="width: 15%">결제 상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr accumulate="1">
                                    <td>1</td>
                                    <td>한지우</td>
                                    <td>
                                        23,000원
                                    </td>
                                    <td>
                                        10%
                                    </td>
                                    <td>
                                        2,300P
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>결제 완료
                                    </td>
                                </tr>
                                <tr accumulate="2">
                                    <td>2</td>
                                    <td>한지우</td>
                                    <td>
                                        23,000원
                                    </td>
                                    <td>
                                        10%
                                    </td>
                                    <td>
                                        2,300P
                                    </td>
                                    <td>
                                        2021.11.23
                                    </td>
                                    <td>결제 취소
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
