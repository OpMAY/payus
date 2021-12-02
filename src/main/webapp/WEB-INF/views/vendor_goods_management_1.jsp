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
    <title>공급자 상품 목록</title>
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
            <div class="payus-modal" id="modal-not-answered">
                <div class="modal-body">
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
                    <div data-type="not-answered">
                        <div class="row modal-btn-div"
                             style="margin-bottom: 1rem; display: flex; justify-content: flex-end;">
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal cancel">
                                    취소
                                </button>
                            </div>
                            <div class="col-12 col-xl-3 col-lg-4" style="margin-bottom: 1rem">
                                <button type="button" class="btn btn-payus-modal submit">
                                    답변 하기
                                </button>
                            </div>
                        </div>
                    </div>
                    <div data-type="answer" style="display: none">
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
                                <button type="button" class="btn btn-payus-modal submit">
                                    답변 작성
                                </button>
                            </div>
                        </div>
                    </div>
                    <div data-type="answered" style="display: none">
                        <div class="row" style="margin-bottom: 1rem">
                            <div class="col-12">
                                <label for="review-answered-content">답변 내용</label>
                                <textarea class="payus-modal-textarea" id="review-answered-content" rows="5" readonly>답변 내용입니다.</textarea>
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
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상품 목록</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row" style="justify-content: right; margin-bottom: 1rem;">
                        <div class="col-3">
                            <select class="review-select" id="review-data-type-select"
                                    style="color: black;" onchange="alert('바뀜')">
                                <option selected value="1">전체</option>
                                <option value="2">오픈</option>
                                <option value="3">준비중</option>
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
                                    <th style="width: 12%">이미지</th>
                                    <th style="width: 10%">상품명</th>
                                    <th style="width: 35%">상품 옵션</th>
                                    <th style="width: 8%">가격</th>
                                    <th style="width: 10%">등록 일자</th>
                                    <th style="width: 10%">수정</th>
                                    <th style="width: 10%">삭제</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <tr room="11">
                                    <td>1</td>
                                    <td><img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 100%; object-fit: fill"></td>
                                    <td>패밀리 트윈</td>
                                    <td>
                                        <div class="overflow">
                                            <div class="overflow-space">
                                                <div class="overflow-text">기존 2인 / 최대 2인<br>체크인 15:00 - 체크아웃 11:00
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>23,000원</td>
                                    <td>2021.01.12</td>
                                    <td>
                                        <%--      TODO 신고하기 페이지 이동              --%>
                                        <button type="button" class="btn btn-payus-table">
                                            수정
                                        </button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-payus-table-report">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="review-table-pagination">
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
<script>
    $(".btn-payus-table-report").on("click", function () {
        let review_no = $(this).parent().parent().attr('review');
        console.log(review_no);
        // TODO 해당 review_no 실어서 리뷰 신고 페이지 이동
    });


    $(".pagination a").on("click", function () {
        let data_order = $(this).attr('data-order');
        console.log(data_order);
        let paginationDiv = $("#review-table-pagination");
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
    $(".btn-payus-table").on("click", function () {
        let review_no = $(this).parent().parent().attr('review');
        console.log(review_no);
        // TODO 해당 review_no로 리뷰 상세 내용 AJAX

        modal.addClass('show');

        if (modal.hasClass('show')) {
            body.css("overflow", "hidden");
            modal.focus();
        }
    });

    $("#modal-close").on("click", function () {
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
    })

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
