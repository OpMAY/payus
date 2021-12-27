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
    <title>공급자 상점 리뷰</title>
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
            <div class="payus-modal">
                <div class="modal-body" data-number="0">
                    <div class="row">
                        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between">
                            <h3 style="color: #8668d0;">리뷰 내용</h3>
                            <button type="button" class="btn btn-payus-modal" id="modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-4 row-cols-lg-2 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="review-writer">작성자</label>
                            <textarea class="payus-modal-textarea" id="review-writer" rows="1" readonly>리뷰 내용</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="review-rate">별점</label>
                            <textarea class="payus-modal-textarea" id="review-rate" rows="1" readonly>4</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="review-reg-date">생성 일자</label>
                            <textarea class="payus-modal-textarea" id="review-reg-date" rows="1"
                                      readonly>2021.01.12</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="review-answer-status">답변 여부</label>
                            <textarea class="payus-modal-textarea" id="review-answer-status" rows="1"
                                      readonly>답변 완료</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="review-content">리뷰 내용</label>
                            <textarea class="payus-modal-textarea" id="review-content" rows="5" readonly>리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="review-images">리뷰 이미지</label>
                            <div class="row row-cols-1 row-cols-xl-5 row-cols-lg-3 row-cols-md-2 row-cols-sm-1"
                                 id="review-images">
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
                    <div class="modal-data-div" data-type="not-answered">
                        <div class="row modal-btn-div"
                             style="margin-bottom: 1rem; display: flex; justify-content: flex-end;">
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal cancel">
                                    취소
                                </button>
                            </div>
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal submit" id="btn-for-answer">
                                    답변 하기
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-data-div" data-type="answer" style="display: none">
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
                    <div class="modal-data-div" data-type="answered" style="display: none">
                        <div class="row" style="margin-bottom: 1rem">
                            <div class="col-12 col-xl-4 col-lg-4" style="margin-bottom: 1rem">
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
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상점 리뷰</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row" style="justify-content: right; margin-bottom: 1rem;">
                        <div class="col-3">
                            <select class="payus-select" id="review-data-type-select"
                                    style="color: black;">
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
                            <table class="payus-table">
                                <thead>
                                <tr>
                                    <th style="width: 5%">번호</th>
                                    <th style="width: 30%">리뷰 내용</th>
                                    <th style="width: 5%">별점</th>
                                    <th style="width: 8%">작성자</th>
                                    <th style="width: 12%">생성일자</th>
                                    <th style="width: 10%">답변 상태</th>
                                    <th style="width: 12%">신고</th>
                                    <th style="width: 18%">상세 정보</th>
                                </tr>
                                </thead>
                                <tbody id="pagination_layout">
                                <c:forEach var="i" begin="1" end="${review.size()}">
                                    <tr review="${review[i-1].review_no}">
                                        <td>${i}</td>
                                        <td>
                                            <div class="overflow">
                                                <div class="overflow-space">
                                                    <div class="overflow-text">${review[i-1].content}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${review[i-1].rate}</td>
                                        <td>${review[i-1].user_name}</td>
                                        <td>${review[i-1].reg_date}</td>
                                        <td><c:choose><c:when
                                                test="${review[i-1].answer_status == false}">미답변</c:when><c:when
                                                test="${review[i-1].answer_status == true}">답변 완료</c:when></c:choose></td>
                                        <td>
                                                <%--      TODO 신고하기 페이지 이동              --%>
                                            <button type="button" class="btn btn-payus-table-report">
                                                신고하기
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-payus-table">
                                                자세히보기
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="review-table-pagination">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/date-formatter.js"></script>
<script src="/js/payus-pagination.js"></script>
<script src="/js/common.js"></script>
<script src="/js/text-input-checker.js"></script>
<script>
    let totalReviewNum = ${review_num};
    const paginationDivId = 'review-table-pagination';
    const paginationDiv = $("#" + paginationDivId);
    /*
    * TODO
    * 1. review_no 실어서 리뷰 신고 페이지 이동
    *  */
    $(".btn-payus-table-report").on("click", function () {
        let review_no = $(this).parent().parent().attr('review');
        console.log(review_no);
        setCookie("report_review", review_no, 9999);
        window.location.href = '/vendor/manage/customer/inquiry/request.do';
    });

    function listenResize() {
        let screenHeight = $(window).height();
        console.log(screenHeight);

        let tableWidth = $(".payus-table").width();
        console.log("table Width : " + tableWidth);
        let pagination = $(".pagination");
        pagination.width(tableWidth);
    }

    $(document).ready(function () {
        listenResize();
        tablePagination(totalReviewNum, 'review-table-pagination');
        let table = $(".payus-table");
        let body = table.children('tbody');
        for (let i = 0; i < body.children().length; i++) {
            let originalRegDate = body.children('tr:eq(' + i + ')').children('td:eq(4)').text();
            body.children('tr:eq(' + i + ')').children('td:eq(4)').text(SplitDateFunction(originalRegDate));
        }
    });

    function dataCallFunction(page, data_type, selectChange) {
        let data = {"page": page, "data_type": data_type, "select_change": selectChange};
        let selectedPageIndex = (page * 10) - 10;
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/store/review/paging',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $("#pagination_layout *").remove();
            console.log(result);
            console.log("length : " + result.reviewList.length);
            for (let i = 0; i < result.reviewList.length; i++) {
                let data = result.reviewList[i];
                let thisIndex = selectedPageIndex + i + 1;
                let answerStatusString = data.answer_status ? '답변 완료' : '미답변';
                $("#pagination_layout").append('<tr review="' + data.review_no + '">\n' +
                    '                                        <td>' + thisIndex + '</td>\n' +
                    '                                        <td>\n' +
                    '                                            <div class="overflow">\n' +
                    '                                                <div class="overflow-space">\n' +
                    '                                                    <div class="overflow-text">' + data.content + '\n' +
                    '                                                    </div>\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                        </td>\n' +
                    '                                        <td>' + data.rate + '</td>\n' +
                    '                                        <td>' + data.user_name + '</td>\n' +
                    '                                        <td>' + SplitDateFunction(data.reg_date) + '</td>\n' +
                    '                                        <td>' + answerStatusString + '</td>\n' +
                    '                                        <td>\n' +
                    '                                                <%--      TODO 신고하기 페이지 이동              --%>\n' +
                    '                                            <button type="button" class="btn btn-payus-table-report">\n' +
                    '                                                신고하기\n' +
                    '                                            </button>\n' +
                    '                                        </td>\n' +
                    '                                        <td>\n' +
                    '                                            <button type="button" class="btn btn-payus-table">\n' +
                    '                                                자세히보기\n' +
                    '                                            </button>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>');
            }
            totalReviewNum = result.review_num;
            if (selectChange)
                tablePagination(result.review_num, paginationDivId);
        }).fail(function (error) {
            console.log(error);
        });
    }

    function setCookie(cookie_name, value, seconds) {
        let exdate = new Date();
        exdate.setDate(exdate.getSeconds() + seconds);

        let cookie_value = escape(value) + ((seconds == null) ? '' : '; path=/vendor; expires=' + exdate.toUTCString());
        document.cookie = cookie_name + '=' + cookie_value;
    }

    $(".pagination").on("click", 'a', function () {
        let selectedPage = $(this);
        let data_order = selectedPage.attr('data-order');
        let data_type = $('.payus-select option:selected').val();
        console.log(data_order);
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (data_order === '-1') {
            if (tablePaginationChange(totalReviewNum, paginationDivId, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, data_type);
            }
        } else if (data_order === '0') {
            if (tablePaginationChange(totalReviewNum, paginationDivId, true)) {
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

</script>
<script>
    let body = $(document.body);
    let modal = $(".payus-modal");
    $(body).on("click", ".btn-payus-table", function () {
        let review_no = $(this).parent().parent().attr('review');
        let data = {"review_no": review_no};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/store/review/detail',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            let reviewImageDiv = $('#review-images');
            // 모달 상위 textarea Setting
            modal.children().attr("data-number", result.review_no);
            $("#review-writer").text(result.user_name);
            $('#review-rate').text(result.rate);
            $('#review-reg-date').text(SplitDateFunction(result.reg_date));
            let answerStatusString = result.answer_status === true ? '답변 완료' : '미답변';
            $('#review-answer-status').text(answerStatusString);

            // 리뷰 내용
            $('#review-content').text(result.content);

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
            if (result.answer_status) {
                $('.modal-body .modal-data-div[data-type="answered"]').css('display', 'block');
                $('.modal-body .modal-data-div:not([data-type="answered"])').css('display', 'none');
                $("#review-answered-date").text(SplitDateFunction(result.answer_date));
                $("#review-answered-content").text(result.answer_content);
            } else {
                $('.modal-body .modal-data-div[data-type="not-answered"]').css('display', 'block');
                $('.modal-body .modal-data-div:not([data-type="not-answered"])').css('display', 'none');
            }

            modal.addClass('show');

            if (modal.hasClass('show')) {
                body.css("overflow", "hidden");
                modal.focus();
            }
        }).fail(function (error) {
            console.log(error);
        });

    });

    $(body).on("click", ".btn-payus-modal.cancel", function () {
        modal.removeClass("show");

        if (!modal.hasClass("show")) {
            body.css("overflow", "auto");
        }
    });


    $("#modal-close").on("click", function () {
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
<script>
    modal.on('click', '.btn-payus-modal.submit', function () {

        let nowDataDiv = $(this).parent().parent().parent();
        let nowDataType = nowDataDiv.attr('data-type');
        let answerTextArea = $("#review-answer");
        if (nowDataType === 'not-answered') {
            nowDataDiv.css('display', 'none');
            answerTextArea.val('');
            nowDataDiv.next().css('display', 'block');
        } else {
            if (confirm('답변은 한 번만 등록 가능하며 등록 후 수정이 불가능합니다. 그래도 등록하시겠습니까?')) {
                let answerContent = answerTextArea.val();
                let review_no = modal.children().attr("data-number");
                if (!checkValue(answerContent, 'review_answer')) {
                    return false;
                } else if (review_no === 0) {
                    alert("올바르지 않은 접근입니다.");
                    return false;
                }
                let data = {"review_no": review_no, "answer_content": answerContent};
                $.ajax({
                    type: 'POST',
                    url: '/vendor/manage/store/review/answer',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data)
                }).done(function (result) {
                    if (result) {
                        alert("답변이 등록되었습니다.");
                        window.location.reload();
                    }
                }).fail(function (error) {
                    console.log(error);
                });
            } else return false;
        }
    });

    $('.payus-select').on('change', function () {
        let selectedText = $('.payus-select option:selected').val();
        dataCallFunction(1, selectedText, true);
    })
</script>
</body>
</html>
