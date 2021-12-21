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
        <div class="page-content d-flex align-items-center " style="flex-direction: column">
            <jsp:include page="partials/vendor_nav.jsp" flush="true"/>
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
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 5rem; flex-direction: column">
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">포인트 충전 내역</h3>
                        <h5 class="d-block"
                            style="color: #979797; padding-left: 10px;margin-top: 1rem; line-height: 170%; word-break: keep-all">
                            페이어스 포인트 충전은 관리자에게 무통장 송금 후 송금 내역을 확인해 이상이 없을 시 포인트가 충전됩니다.</h5>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row" style="margin-bottom: 1rem;justify-content: right">
                        <div class="col-12 col-xl-9 col-lg-12 col-md-12 col-sm-12" style="flex-direction: column">
                            <span class="mypoint">나의 포인트 <strong id="point_strong"
                                                                 style="font-size: 2rem; color: #6D29D0"></strong></span>
                            <span>페이어스 포인트가 10,000P 이하인 경우 앱에 상점이 노출되지 않습니다.</span>
                        </div>
                        <div class="col-12 col-xl-3 col-lg-4 col-md-4 col-sm-4"
                             style="padding-top: 2rem; justify-content: right">
                            <select class="payus-select" id="charge-data-type-select"
                                    style="color: black;">
                                <option selected value="1">전체</option>
                                <option value="2">승인</option>
                                <option value="3">미승인</option>
                                <option value="4">요청</option>
                                <option value="5">취소</option>
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
                                    <th style="width: 30%">포인트 충전 요청 금액</th>
                                    <th style="width: 15%">신청 일자</th>
                                    <th style="width: 15%">처리 일자</th>
                                    <th style="width: 15%">상태</th>
                                    <th style="width: 15%">취소 요청</th>
                                </tr>
                                </thead>
                                <tbody id="pagination_layout">
                                <c:forEach var="i" begin="1" end="${charge.size()}">
                                    <tr charge="${charge[i-1].charge_no}">
                                        <td>${i}</td>
                                        <td class="td-comma">${charge[i-1].point}원</td>
                                        <td class="td-date">${charge[i-1].reg_date}</td>
                                        <td class="td-date"><c:choose><c:when
                                                test="${charge[i-1].revise_date == null}">관리자가
                                            <br>확인 중 입니다.</c:when><c:when
                                                test="${charge[i-1].revise_date != null}">${charge[i-1].revise_date}</c:when></c:choose>
                                        </td>
                                        <td><c:choose><c:when test="${charge[i-1].status == 1}">요청됨</c:when><c:when
                                                test="${charge[i-1].status == 2}">승인</c:when><c:when
                                                test="${charge[i-1].status == 3}">미승인<button type="button" style="display: block; margin-top: 10px"
                                            class="btn btn-payus-table">
                                            반려 사유
                                            </button></c:when><c:when
                                                test="${charge[i-1].status == 4}">취소 요청됨</c:when><c:when
                                                test="${charge[i-1].status == 5}">취소됨</c:when></c:choose></td>
                                        <td><c:choose><c:when test="${charge[i-1].status == 1}">
                                            <button type="button" class="btn btn-payus-table-report">
                                                취소 요청
                                            </button>
                                        </c:when><c:when
                                                test="${charge[i-1].status == 2}">충전 완료 후<br>취소 요청 불가</c:when><c:when
                                                test="${charge[i-1].status == 3}">
                                            <button type="button" class="btn btn-payus-table-report">
                                                취소 요청
                                            </button>
                                        </c:when><c:when test="${charge[i-1].status == 4}">
                                            <button type="button" class="btn btn-payus-table-report reason">
                                                취소 요청 확인
                                            </button>
                                        </c:when><c:when test="${charge[i-1].status == 5}">취소 완료 후<br>취소 요청 불가</c:when></c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="charge-table-pagination">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script src="/js/date-formatter.js"></script>
<script src="/js/payus-pagination.js"></script>
<script>
    let paginationDivId = 'charge-table-pagination';
    let paginationDiv = $('#' + paginationDivId);
    let totalChargeNum = ${chargeNum};
    $(".pagination").on("click", 'a', function () {
        let selectedPage = $(this);
        let data_order = selectedPage.attr('data-order');
        let data_type = $('.payus-select option:selected').val();
        console.log(data_order);
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (data_order === '-1') {
            if (tablePaginationChange(totalChargeNum, paginationDivId, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, data_type, false);
            }
        } else if (data_order === '0') {
            if (tablePaginationChange(totalChargeNum, paginationDivId, true)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, data_type, false);
            }
        } else {
            console.log("else");
            if (active_page !== data_order) {
                paginationDiv.children('.active').removeClass('active');
                selectedPage.addClass('active');
                dataCallFunction(data_order, data_type, false);
            }
        }
    });

    function dataCallFunction(page, data_type, selectChange) {
        let data = {"page": page, "data_type": data_type, "select_change": selectChange};
        let selectedPageIndex = (page * 10) - 10;
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/point/charge/paging',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $("#pagination_layout *").remove();
            console.log(result);
            console.log("length : " + result.chargeList.length);
            for (let i = 0; i < result.chargeList.length; i++) {
                let data = result.chargeList[i];
                let thisIndex = selectedPageIndex + i + 1;
                let reviseDateString = data.revise_date == null ? '관리자가 <br>확인 중 입니다.' : data.revise_date;
                let statusString;
                let cancelString;
                switch (data.status) {
                    case 1 :
                        statusString = '요청됨';
                        cancelString = '<button type="button" class="btn btn-payus-table-report">\n' +
                            '                                                취소 요청\n' +
                            '                                            </button>';
                        break;
                    case 2 :
                        statusString = '승인';
                        cancelString = '충전 완료 후<br>취소 요청 불가';
                        break;
                    case 3 :
                        statusString = '미승인<button type="button" style="display: block; margin-top: 10px"\n' +
                            '                                            class="btn btn-payus-table">\n' +
                            '                                            반려 사유\n' +
                            '                                            </button>';
                        cancelString = '<button type="button" class="btn btn-payus-table-report">\n' +
                            '                                                취소 요청\n' +
                            '                                            </button>';
                        break;
                    case 4 :
                        statusString = '취소 요청됨';
                        cancelString = '<button type="button" class="btn btn-payus-table-report reason">\n' +
                            '                                                취소 요청 확인\n' +
                            '                                            </button>';
                        break;
                    case 5 :
                        statusString = '취소됨';
                        cancelString = '취소 완료 후<br>취소 요청 불가';
                        break;
                }
                $('#pagination_layout').append('<tr charge="' + data.charge_no + '">\n' +
                    '                                        <td>' + thisIndex + '</td>\n' +
                    '                                        <td class="td-comma">' + comma(data.point) + '원</td>\n' +
                    '                                        <td class="td-date">' + SplitDateFunction(data.reg_date) + '</td>\n' +
                    '                                        <td class="td-date">' + reviseDateString + '</td>\n' +
                    '                                        <td>' + statusString + '</td>\n' +
                    '                                        <td>' + cancelString + '</td>\n' +
                    '                                    </tr>');
                totalChargeNum = result.charge_num;
                if (selectChange)
                    tablePagination(result.charge_num, paginationDivId);
            }
        }).fail(function (error) {
            console.log(error);
        });
    }

    $('.payus-select').on('change', function () {
        let selectedText = $('.payus-select option:selected').val();
        dataCallFunction(1, selectedText, true);
    });

    $(document).ready(function () {
        listenResize();
        tablePagination(${chargeNum}, 'charge-table-pagination');
        $('#point_strong').text(comma(${point}) + 'P');
    });
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
        // TODO 해당 charge_no로 충전 정보 불러옴 AJAX

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
