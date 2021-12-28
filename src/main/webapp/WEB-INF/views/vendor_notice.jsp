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
    <title>공지 사항</title>
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
            <div class="payus-modal" id="notice-modal">
                <div class="modal-body" style="height: auto">
                    <div class="row">
                        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between">
                            <h3 style="color: #8668d0;">공지사항</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row"
                         style="margin-top: 2rem">
                        <div class="col-12 col-xl-8 col-lg-12 col-md-12 col-sm-12 payus-modal-textarea-form">
                            <label for="notice-modal-title">제목</label>
                            <textarea class="payus-modal-textarea" id="notice-modal-title" rows="1" readonly></textarea>
                        </div>
                        <div class="col-12 col-xl-4 col-lg-12 col-md-12 col-sm-12 payus-modal-textarea-form">
                            <label for="notice-modal-reg-date">등록 일자</label>
                            <textarea class="payus-modal-textarea" id="notice-modal-reg-date" rows="1"
                                      readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="notice-modal-content">공지 내용</label>
                            <textarea class="payus-modal-textarea" id="notice-modal-content" rows="5"
                                      readonly></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="content-image">공지 이미지</label>
                            <div class="row"
                                 id="content-image">
                                <div class="col-12 modal-image-div">
                                    <div class="img-container" id="notice_img_container">
                                        <img class="clickable_img"
                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/api/test/sample_hotel_img_2.jpg"
                                             alt style="width: 30%; object-fit: fill">
                                    </div>
                                </div>
                            </div>
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
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">공지사항</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row" style="margin-bottom: 1rem;justify-content: right">
                        <div class="col-12 col-xl-6 col-lg-6 col-md-6 col-sm-6"
                             style="padding-top: 2rem;display: flex; align-items: center;justify-content: right">
                            <label class="container" style="font-size: 18px">제목
                                <input type="checkbox" id="notice-search-title"/>
                                <span class="checkmark"></span>
                            </label>
                            <label class="container" style="font-size: 18px">내용
                                <input type="checkbox" id="notice-search-content"/>
                                <span class="checkmark"></span>
                            </label>
                            <input type="text" placeholder="검색" class="payus-search-input">
                            <button class="btn" style="padding: 10px 1rem;background-color: #8668d0; margin-left: 10px"
                                    type="button" id="search-btn"><i
                                    class="fa fa-search"></i></button>
                            <button class="btn" style="padding: 10px 1rem;background-color: white; color: #8668d0; border: 1px solid #8668d0; margin-left: 10px"
                                    type="button" id="reset-btn"><i
                                    class="fa fa-refresh"></i></button>
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
                                    <th style="width: 60%">제목</th>
                                    <th style="width: 10%">등록 일자</th>
                                    <th style="width: 10%">조회 수</th>
                                    <th style="width: 25%">상세보기</th>
                                </tr>
                                </thead>
                                <tbody id="pagination_layout">
                                <c:forEach var="i" begin="1" end="${notice.size()}">
                                    <tr notice="${notice[i-1].notice_no}">
                                        <td>${i}</td>
                                        <td style="text-align: left">
                                            <div class="overflow">
                                                <div class="overflow-space">
                                                    <div class="overflow-text">${notice[i-1].title}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="td-date">${notice[i-1].reg_date}</td>
                                        <td class="td-comma">${notice[i-1].view_num}</td>
                                        <td>
                                            <button type="button" style="display: block;"
                                                    class="btn btn-payus-table">
                                                상세보기
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="notice-table-pagination">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script src="/js/payus-pagination.js"></script>
<script src="/js/date-formatter.js"></script>
<script>
    let paginationDivId = 'notice-table-pagination';
    let paginationDiv = $('#' + paginationDivId);
    let totalNoticeNum = ${noticeNum};
    let sTitleSelected = false;
    let sContentSelected = false;
    let sKeyword = null;
    $(".pagination").on("click", 'a', function () {
        let selectedPage = $(this);
        let data_order = selectedPage.attr('data-order');
        console.log(data_order);
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (data_order === '-1') {
            if (tablePaginationChange(totalNoticeNum, paginationDivId, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, sKeyword, sTitleSelected, sContentSelected, false);
            }
        } else if (data_order === '0') {
            if (tablePaginationChange(totalNoticeNum, paginationDivId, true)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, sKeyword, sTitleSelected, sContentSelected, false);
            }
        } else {
            console.log("else");
            if (active_page !== data_order) {
                paginationDiv.children('.active').removeClass('active');
                selectedPage.addClass('active');
                dataCallFunction(data_order, sKeyword, sTitleSelected, sContentSelected, false);
            }
        }
    });

    $('#search-btn').on('click', function () {
        sTitleSelected = $('#notice-search-title').is(':checked');
        sContentSelected = $('#notice-search-content').is(':checked');
        let keyword = $('.payus-search-input').val();
        if(keyword === ''){
            alert('검색어를 입력하세요.');
            return false;
        } else if(keyword.length < 2){
            alert('검색어는 최소 2자 이상 입력해주세요.');
            return false;
        } else {
            sKeyword = keyword;
            dataCallFunction(1, sKeyword, sTitleSelected, sContentSelected, true);
        }
    });

    $('#reset-btn').on('click', function() {
        sTitleSelected = false;
        sContentSelected = false;
        sKeyword = null;
        $('.payus-search-input').val('');
        dataCallFunction(1, sKeyword, sTitleSelected, sContentSelected, true);
    });

    function dataCallFunction(page, searchKeyword, sTitle, sContent, isReset) {
        let data = {
            "page": page,
            "search_keyword": searchKeyword,
            "sTitle": sTitle,
            "sContent": sContent
        };
        let selectedPageIndex = (page * 10) - 10;
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/customer/notice/paging',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $("#pagination_layout *").remove();
            console.log(result);
            console.log("length : " + result.noticeList.length);
            for (let i = 0; i < result.noticeList.length; i++) {
                let data = result.noticeList[i];
                let thisIndex = selectedPageIndex + i + 1;
                $('#pagination_layout').append('<tr notice="' + data.notice_no + '">\n' +
                    '                                        <td>' + thisIndex + '</td>\n' +
                    '                                        <td style="text-align: left">\n' +
                    '                                            <div class="overflow">\n' +
                    '                                                <div class="overflow-space">\n' +
                    '                                                    <div class="overflow-text">' + data.title + '</div>\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                        </td>\n' +
                    '                                        <td class="td-date">' + SplitDateFunction(data.reg_date) + '</td>\n' +
                    '                                        <td class="td-comma">' + comma(data.view_num) + '</td>\n' +
                    '                                        <td><button type="button" style="display: block;" class="btn btn-payus-table">상세보기</button></td>\n' +
                    '                                    </tr>');
                totalNoticeNum = result.notice_num;
            }
            if(isReset) {
                tablePagination(totalNoticeNum, paginationDivId);
            }
        }).fail(function (error) {
            console.log(error);
        });
    }

    $(document).ready(function () {
        listenResize();
        tablePagination(${noticeNum}, 'notice-table-pagination');
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

    $(body).on("click", ".btn-payus-table", function () {
        let notice_no = $(this).parent().parent().attr('notice');
        console.log(notice_no);
        let data = {"notice_no": notice_no};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/customer/notice/detail',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $('#notice_img_container').children().remove();
            $('#notice-modal-title').val(result.title);
            $('#notice-modal-reg-date').val(SplitDateFunction(result.reg_date));
            $('#notice-modal-content').val(result.content);
            if (result.img !== null)
                $('#notice_img_container').append('<img class="clickable_img" \n' +
                    '                                             src="https://payus.s3.ap-northeast-2.amazonaws.com/' + result.img + '"\n' +
                    '                                             alt style="width: 30%; object-fit: fill">');


            modal.addClass('show');

            if (modal.hasClass('show')) {
                body.css("overflow", "hidden");
                modal.focus();
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
