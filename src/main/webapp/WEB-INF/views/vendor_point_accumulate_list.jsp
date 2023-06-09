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
    <title>공급자 포인트 적립 내역</title>
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
                            <label for="charge-request-point">포인트</label>
                            <textarea class="payus-modal-textarea" id="charge-request-point" rows="1"
                                      readonly></textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="charge-request-date">적립 일자</label>
                            <textarea class="payus-modal-textarea" id="charge-request-date" rows="1"
                                      readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="cancel-reason">취소 요청 사유</label>
                            <textarea class="payus-modal-textarea" id="cancel-sent-reason" rows="5"
                                      readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="reject-reason">반려 사유</label>
                            <textarea class="payus-modal-textarea" id="reject-reason" rows="5" readonly></textarea>
                        </div>
                    </div>
                    <div>
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
                            <h3 style="color: #8668d0;">적립 취소 요청</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-3 row-cols-lg-1 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="cancel-accumulate-request-user-name">고객 닉네임</label>
                            <textarea class="payus-modal-textarea" id="cancel-accumulate-request-user-name" rows="1"
                                      readonly></textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="cancel-accumulate-request-point">포인트</label>
                            <textarea class="payus-modal-textarea" id="cancel-accumulate-request-point" rows="1"
                                      readonly></textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="cancel-accumulate-request-date">적립 일자</label>
                            <textarea class="payus-modal-textarea" id="cancel-accumulate-request-date" rows="1"
                                      readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="cancel-reason">취소 요청 사유</label>
                            <textarea class="payus-modal-textarea" id="cancel-reason" rows="5"
                                      placeholder="포인트 적립 취소 사유를 입력해주세요."></textarea>
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
            <div class="payus-modal" id="review-content-modal">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between">
                            <h3 style="color: #8668d0;">리뷰 내용</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-4 row-cols-lg-2 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="review-writer">작성자</label>
                            <textarea class="payus-modal-textarea" id="review-writer" rows="1" readonly></textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="review-rate">별점</label>
                            <textarea class="payus-modal-textarea" id="review-rate" rows="1" readonly></textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="review-reg-date">생성 일자</label>
                            <textarea class="payus-modal-textarea" id="review-reg-date" rows="1"
                                      readonly></textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="review-answer-status">답변 여부</label>
                            <textarea class="payus-modal-textarea" id="review-answer-status" rows="1"
                                      readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="review-content">리뷰 내용</label>
                            <textarea class="payus-modal-textarea" id="review-content" rows="5" readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="review-images">리뷰 이미지</label>
                            <div class="row row-cols-1 row-cols-xl-5 row-cols-lg-3 row-cols-md-2 row-cols-sm-1"
                                 id="review-images">
                            </div>
                        </div>
                    </div>
                    <div data-type="answer">
                        <div class="row" style="margin-bottom: 1rem">
                            <div class="col-12">
                                <label for="review-answer">답변 내용</label>
                                <textarea class="payus-modal-textarea" id="review-answer" rows="5"></textarea>
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
                                <button type="button" class="btn btn-payus-modal submit" id="btn-for-submit">
                                    답변 작성
                                </button>
                            </div>
                        </div>
                    </div>
                    <div data-type="answered" style="display: none">
                        <div class="row" style="margin-bottom: 1rem">
                            <div class="col-12 col-lg-4 col-xl-4" style="margin-bottom: 1rem">
                                <label for="review-answered-date">답변 일자</label>
                                <textarea class="payus-modal-textarea" id="review-answered-date" rows="1"
                                          readonly></textarea>
                            </div>
                            <div class="col-12">
                                <label for="review-answered-content">답변 내용</label>
                                <textarea class="payus-modal-textarea" id="review-answered-content" rows="5"
                                          readonly></textarea>
                            </div>
                        </div>
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
                    <div class="row" style="margin-bottom: 5rem; flex-direction: column">
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">포인트 적립 내역</h3>
                        <h5 class="d-block"
                            style="color: #979797; padding-left: 10px;margin-top: 1rem; line-height: 170%; word-break: keep-all">
                            페이어스 포인트 적립 취소 요청은 적립 후 3일동안 가능하고 관리자의 요청 승인 후 취소되며 취소된 내역은 매출에 집계되지 않습니다.</h5>
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
                            <select class="payus-select" id="review-data-type-select"
                                    style="color: black;">
                                <option selected value="1">전체</option>
                                <option value="2">적립 예정</option>
                                <option value="3">적립 완료</option>
                                <option value="4">취소 요청</option>
                                <option value="5">취소됨</option>
                                <option value="6">취소 반려됨</option>
                                <option value="7">답변 미작성</option>
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
                                    <th style="width: 10%">사용자</th>
                                    <th style="width: 20%">결제 금액</th>
                                    <th style="width: 10%">페이백률</th>
                                    <th style="width: 15%">적립 포인트</th>
                                    <th style="width: 10%">적립 일자</th>
                                    <th style="width: 15%">상태</th>
                                    <th style="width: 15%">리뷰 상태</th>
                                </tr>
                                </thead>
                                <tbody id="pagination_layout">
                                <c:forEach var="i" begin="1" end="${accumulate.size()}">
                                    <tr accumulate="${accumulate[i-1].accumulate_no}">
                                        <td>${i}</td>
                                        <td>${accumulate[i-1].user_name}</td>
                                        <td class="td-comma">${accumulate[i-1].price}원</td>
                                        <td>${accumulate[i-1].payback_rate}%</td>
                                        <td class="td-comma">${accumulate[i-1].point}P</td>
                                        <td class="td-date">${accumulate[i-1].reg_date}</td>
                                        <td><c:choose><c:when
                                                test="${accumulate[i-1].status == 1}">적립 예정<button type="button" style="display: block; margin-top: 10px"
                                            class="btn btn-payus-table cancel-point">
                                            취소 요청
                                            </button></c:when><c:when
                                                test="${accumulate[i-1].status == 2}">적립 완료</c:when><c:when
                                                test="${accumulate[i-1].status == 3}">취소 요청됨<button type="button" style="display: block; margin-top: 10px"
                                            class="btn btn-payus-table cancel-request">
                                            요청 철회
                                            </button></c:when><c:when
                                                test="${accumulate[i-1].status == 4}">적립 취소됨</c:when><c:when
                                                test="${accumulate[i-1].status == 5}">적립 취소 반려<button type="button" style="display: block; margin-top: 10px"
                                            class="btn btn-payus-table reject-reason">
                                            반려 사유
                                            </button></c:when></c:choose></td>
                                        <td><c:choose><c:when
                                                test="${accumulate[i-1].review_status == 0 || accumulate[i-1].review_status == 2}">미작성</c:when><c:when
                                                test="${accumulate[i-1].review_status == 1}">작성<c:choose><c:when
                                                test="${accumulate[i-1]._answered == false}">
                                            <button type="button" style="display: block; margin-top: 10px"
                                                    class="btn btn-payus-table answer-review">답변 하기
                                            </button>
                                        </c:when><c:when test="${accumulate[i-1]._answered == true}">
                                            <button type="button" style="display: block; margin-top: 10px"
                                                    class="btn btn-payus-table answered-review">리뷰 보기
                                            </button>
                                        </c:when></c:choose></c:when></c:choose></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="accumulate-table-pagination">
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
    let paginationDivId = 'accumulate-table-pagination';
    let paginationDiv = $('#' + paginationDivId);
    let totalAccumulateNum = ${accumulateNum};
    let thisDataNo = 0;
    $(".pagination").on("click", 'a', function () {
        let selectedPage = $(this);
        let data_order = selectedPage.attr('data-order');
        let data_type = $('.payus-select option:selected').val();
        console.log(data_order);
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (data_order === '-1') {
            if (tablePaginationChange(totalAccumulateNum, paginationDivId, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, data_type);
            }
        } else if (data_order === '0') {
            if (tablePaginationChange(totalAccumulateNum, paginationDivId, true)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, data_type);
            }
        } else {
            console.log("else");
            if (active_page !== data_order) {
                paginationDiv.children('.active').removeClass('active');
                selectedPage.addClass('active');
                dataCallFunction(data_order, data_type);
            }
        }
    });

    function dataCallFunction(page, data_type, selectChange) {
        let data = {"page": page, "data_type": data_type, "select_change": selectChange};
        let selectedPageIndex = (page * 10) - 10;
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/point/accumulate/paging',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $("#pagination_layout *").remove();
            console.log(result);
            console.log("length : " + result.accumulateList.length);
            for (let i = 0; i < result.accumulateList.length; i++) {
                let data = result.accumulateList[i];
                let thisIndex = selectedPageIndex + i + 1;
                let statusString;
                let reviewString;
                switch (data.status) {
                    case 1 :
                        statusString = '적립 예정<button type="button" style="display: block; margin-top: 10px"\n' +
                            '                                            class="btn btn-payus-table cancel-point">\n' +
                            '                                            취소 요청\n' +
                            '                                            </button>';
                        break;
                    case 2 :
                        statusString = '적립 완료';
                        break;
                    case 3 :
                        statusString = '취소 요청됨<button type="button" style="display: block; margin-top: 10px"\n' +
                            '                                            class="btn btn-payus-table cancel-request">\n' +
                            '                                            요청 철회\n' +
                            '                                            </button>';
                        break;
                    case 4 :
                        statusString = '적립 취소됨';
                        break;
                    case 5 :
                        statusString = '적립 취소 반려<button type="button" style="display: block; margin-top: 10px"\n' +
                            '                                            class="btn btn-payus-table reject-reason">\n' +
                            '                                            반려 사유\n' +
                            '                                            </button>';
                        break;
                }
                switch (data.review_status) {
                    case 0:
                    case 2:
                        reviewString = '미작성';
                        break;
                    case 1:
                        reviewString = '작성';
                        if (data.is_answered) {
                            reviewString = reviewString + '<button type="button" style="display: block; margin-top: 10px"\n' +
                                '                                                    class="btn btn-payus-table answered-review">리뷰 보기\n' +
                                '                                            </button>';
                        } else {
                            reviewString = reviewString + '<button type="button" style="display: block; margin-top: 10px"\n' +
                                '                                                    class="btn btn-payus-table answer-review">답변 하기\n' +
                                '                                            </button>';
                        }
                }
                $('#pagination_layout').append('<tr accumulate="' + data.accumulate_no + '">\n' +
                    '                                        <td>' + thisIndex + '</td>\n' +
                    '                                        <td>' + data.user_name + '</td>\n' +
                    '                                        <td class="td-comma">' + comma(data.price) + '원</td>\n' +
                    '                                        <td>' + data.payback_rate + '%</td>\n' +
                    '                                        <td class="td-comma">' + comma(data.point) + 'P</td>\n' +
                    '                                        <td class="td-date">' + SplitDateFunction(data.reg_date) + '</td>\n' +
                    '                                        <td>' + statusString + '</td>\n' +
                    '                                        <td>' + reviewString + '</td>\n' +
                    '                                    </tr>');
                totalAccumulateNum = result.accumulate_num;
                if (selectChange)
                    tablePagination(result.accumulate_num, paginationDivId);
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
        tablePagination(${accumulateNum}, paginationDivId);
        $('#point_strong').text(comma(${point}) + 'P');
    });
</script>
<script>
    let body = $(document.body);
    let modal = $(".payus-modal");

    let rejectReasonModal = $("#reject-reason-modal");
    let cancelRequestModal = $("#cancel-request-modal");
    let cancelRejectModal = $("#canceled-request-modal");
    let reviewContentModal = $("#review-content-modal");
    $(body).on("click", ".btn-payus-table.cancel-point", function () {
        let accumulate_no = $(this).parent().parent().attr('accumulate');
        console.log(accumulate_no);
        thisDataNo = accumulate_no;
        // TODO 해당 accumulate_no로 간단 데이터
        let data = {"accumulate_no": accumulate_no};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/point/accumulate/cancel/info',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            console.log(result);
            // Modal Data Set
            $('#cancel-accumulate-request-user-name').val(result.user_name);
            $('#cancel-accumulate-request-point').val(comma(result.point) + 'P');
            $('#cancel-accumulate-request-date').val(SplitDateFunction(result.reg_date));

            // Modal Open
            cancelRequestModal.addClass('show');
            cancelRequestModal.children("div").scrollTop(0);
            if (cancelRequestModal.hasClass('show')) {
                body.css("overflow", "hidden");
                cancelRequestModal.focus();
            }
        }).fail(function (error) {
            console.log(error);
        });
    });

    $(body).on("click", ".btn-payus-table.cancel-request", function () {
        let accumulate_no = $(this).parent().parent().attr('accumulate');
        console.log(accumulate_no);
        if (confirm('취소 요청한 포인트 적립을 철회하시겠습니까?\n취소 요청을 철회하면 다시 적립 내역을 취소 하실 수 없습니다.')) {
            // 포인트 취소 요청 철회 - status -> 2
            let data = {"accumulate_no": accumulate_no};
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/point/accumulate/cancel/delete',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result === 1) {
                    alert('철회할 수 없는 상태의 내역입니다.\n정보 갱신을 위해 새로고침합니다.');
                    window.location.reload();
                } else {
                    alert('해당 취소 요청을 철회했습니다.');
                    window.location.reload();
                }
            }).fail(function (error) {
                console.log(error);
            });
        } else {
            return false;
        }
    });

    $(body).on("click", ".btn-payus-table.reject-reason", function () {
        let accumulate_no = $(this).parent().parent().attr('accumulate');
        console.log(accumulate_no);
        // TODO 해당 accumulate_no로 반려 사유 받아오기
        let data = {"accumulate_no": accumulate_no};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/point/accumulate/reject',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            console.log(result);
            // Modal Data Set
            $('#charge-request-point').val(result.point);
            $('#charge-request-date').val(SplitDateFunction(result.request_date));
            $('#cancel-sent-reason').val(result.cancel_reason);
            $('#reject-reason').val(result.reject_reason);

            // Modal Open
            rejectReasonModal.addClass('show');
            rejectReasonModal.children("div").scrollTop(0);

            if (rejectReasonModal.hasClass('show')) {
                body.css("overflow", "hidden");
                rejectReasonModal.focus();
            }
        }).fail(function (error) {
            console.log(error);
        });

    });

    $(body).on("click", ".btn-payus-table.answer-review", function () {
        let accumulate_no = $(this).parent().parent().attr('accumulate');
        console.log(accumulate_no);
        thisDataNo = accumulate_no;
        let data = {"accumulate_no": accumulate_no};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/point/accumulate/review',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            let reviewImageDiv = $('#review-images');
            console.log(result);
            // 모달 상위 textArea Setting - 답변 완료 모달
            $('#review-writer').val(result.user_name);
            $('#review-rate').val(result.rate);
            $('#review-reg-date').val(SplitDateFunction(result.reg_date));
            $('#review-answer-status').val('미답변');

            // 리뷰 내용
            $('#review-content').val(result.content);

            // 리뷰 이미지
            reviewImageDiv.children().remove();
            $(result.image_list).each(function (index, object) {
                reviewImageDiv.append('<div class="col modal-image-div">\n' +
                    '                                    <div class="img-container">\n' +
                    '                                        <img class="clickable_img"\n' +
                    '                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/' + object + '"\n' +
                    '                                             alt style="width: 100%; height: 100%; object-fit: fill">\n' +
                    '                                    </div>\n' +
                    '                                </div>');
            });

            // Modal Open
            reviewContentModal.addClass('show');
            reviewContentModal.children("div").children("div:eq(04)").css("display", "block");
            reviewContentModal.children("div").children("div:eq(05)").css("display", "none");
            reviewContentModal.children("div").scrollTop(0);
            if (reviewContentModal.hasClass('show')) {
                body.css("overflow", "hidden");
                reviewContentModal.focus();
            }
        }).fail(function (error) {
            console.log(error);
        });

    });

    $(body).on('click', '#btn-for-request', function () {
        let reason = $('#cancel-reason').val();
        // TODO Input Validation Check
        let data = {"accumulate_no" : thisDataNo, "reason" : reason};
        if(confirm('적립 취소 요청을 하시겠습니까?')){
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/point/accumulate/cancel/request',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if(result === 0) {
                    alert('적립 취소 요청을 전송하였습니다.');
                    window.location.reload();
                } else {
                    alert('적립 취소를 할 수 없는 내역입니다.\n정보 갱신을 위해 새로고침합니다.');
                    window.location.reload();
                }
            }).fail(function (error) {
                console.log(error);
            });
        } else {
            return false;
        }
    });

    $(body).on('click', '#btn-for-submit', function () {
        let answer = $('#review-answer').val();
        // TODO Input Validation Check
        let data = {"accumulate_no" : thisDataNo, "answer" : answer};
        if(confirm('리뷰 답변 작성을 하시겠습니까?')){
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/point/accumulate/review/answer',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if(result === 0) {
                    alert('답변 작성이 완료되었습니다.');
                    window.location.reload();
                } else {
                    alert('답변 작성을 할 수 없는 내역입니다.\n정보 갱신을 위해 새로고침합니다.');
                    window.location.reload();
                }
            }).fail(function (error) {
                console.log(error);
            });
        } else {
            return false;
        }
    });


    $(body).on("click", ".btn-payus-table.answered-review", function () {
        let accumulate_no = $(this).parent().parent().attr('accumulate');
        console.log(accumulate_no);
        let data = {"accumulate_no": accumulate_no};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/point/accumulate/review',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            let reviewImageDiv = $('#review-images');
            console.log(result);
            // 모달 상위 textArea Setting - 답변 완료 모달
            $('#review-writer').val(result.user_name);
            $('#review-rate').val(result.rate);
            $('#review-reg-date').val(SplitDateFunction(result.reg_date));
            $('#review-answer-status').val('답변 완료');

            // 리뷰 내용 및 답변 내용
            $('#review-content').val(result.content);
            $('#review-answered-date').val(SplitDateFunction(result.answer_date));
            $('#review-answered-content').val(result.answer_content);

            // 리뷰 이미지
            reviewImageDiv.children().remove();
            $(result.image_list).each(function (index, object) {
                reviewImageDiv.append('<div class="col modal-image-div">\n' +
                    '                                    <div class="img-container">\n' +
                    '                                        <img class="clickable_img"\n' +
                    '                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/' + object + '"\n' +
                    '                                             alt style="width: 100%; height: 100%; object-fit: fill">\n' +
                    '                                    </div>\n' +
                    '                                </div>');
            });

            // Modal Open
            reviewContentModal.addClass('show');

            reviewContentModal.children("div").children("div:eq(04)").css("display", "none");
            reviewContentModal.children("div").children("div:eq(05)").css("display", "block");
            reviewContentModal.children("div").scrollTop(0);
            if (reviewContentModal.hasClass('show')) {
                body.css("overflow", "hidden");
                reviewContentModal.focus();
            }
        }).fail(function (error) {
            console.log(error);
        });
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

    $(body).on("click", '.clickable_img', function () {
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
