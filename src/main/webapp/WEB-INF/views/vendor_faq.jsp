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
    <title>FAQ</title>
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
                            <h3 style="color: #8668d0;">FAQ</h3>
                            <button type="button" class="btn btn-payus-modal modal-close">
                                닫기
                            </button>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-xl-3 row-cols-lg-1 row-cols-md-1 row-cols-sm-1"
                         style="margin-top: 2rem">
                        <div class="col payus-modal-textarea-form">
                            <label for="faq-modal-question">질문</label>
                            <textarea class="payus-modal-textarea" id="faq-modal-question" rows="1" readonly>상점 등록은 어떻게 하나요?</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="faq-modal-category">카테고리</label>
                            <textarea class="payus-modal-textarea" id="faq-modal-category" rows="1"
                                      readonly>공급자</textarea>
                        </div>
                        <div class="col payus-modal-textarea-form">
                            <label for="faq-modal-reg-date">등록 일자</label>
                            <textarea class="payus-modal-textarea" id="faq-modal-reg-date" rows="1"
                                      readonly>2021.11.26</textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="faq-modal-answer">답변</label>
                            <textarea class="payus-modal-textarea" id="faq-modal-answer" rows="5" readonly>공급자 회원가입 후 승인 시 등록이 가능합니다.
                            </textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 1rem">
                        <div class="col-12">
                            <label for="content-image">FAQ 이미지</label>
                            <div class="row"
                                 id="content-image">
                                <div class="col-12 modal-image-div">
                                    <div class="img-container">
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
                        <h3 class="d-block" style="color: #8668d0; padding-left: 10px">FAQ</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">

                    <div class="row" style="margin-bottom: 1rem;justify-content: right">
                        <div class="col-12 col-xl-6 col-lg-6 col-md-6 col-sm-6"
                             style="display: flex; align-items: center;justify-content: right">
                            <label class="container" style="font-size: 18px">질문
                                <input type="checkbox" id="faq-search-question"/>
                                <span class="checkmark"></span>
                            </label>
                            <label class="container" style="font-size: 18px">답변
                                <input type="checkbox" id="faq-search-answer"/>
                                <span class="checkmark"></span>
                            </label>
                            <input type="text" placeholder="검색" class="payus-search-input">
                            <button class="btn" style="padding: 10px 1rem;background-color: #8668d0; margin-left: 10px"
                                    type="button"><i
                                    class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <div class="row" id="table-div" style="overflow-x: auto;">
                        <%--      TODO 데이터 리스트로 연동                  --%>
                        <div class="col-12" id="table-col"
                             style="display: flex; justify-content: center; flex-direction: column">
                            <div class="tab">
                                <button class="tablinks active" data-type="1">전체</button>
                                <button class="tablinks" data-type="2">공급자</button>
                                <button class="tablinks" data-type="3">결제</button>
                                <button class="tablinks" data-type="4">이용방법</button>
                                <button class="tablinks" data-type="5">리뷰</button>
                                <button class="tablinks" data-type="6">페이백</button>
                                <button class="tablinks" data-type="7">기타</button>
                            </div>
                            <table class="payus-table">
                                <thead>
                                <tr>
                                    <th style="width: 5%">번호</th>
                                    <th style="width: 50%">FAQ 질문</th>
                                    <th style="width: 10%">카테고리</th>
                                    <th style="width: 10%">등록 일자</th>
                                    <th style="width: 10%">조회 수</th>
                                    <th style="width: 15%">상세보기</th>
                                </tr>
                                </thead>
                                <tbody id="pagination_layout">
                                <c:forEach var="i" begin="1" end="${faq.size()}">
                                    <tr faq="${faq[i-1].faq_no}">
                                        <td>${i}</td>
                                        <td>
                                            <div class="overflow">
                                                <div class="overflow-space">
                                                    <div class="overflow-text">${faq[i-1].question}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td><c:choose>
                                            <c:when test="${faq[i-1].type == 1}">공급자</c:when>
                                            <c:when test="${faq[i-1].type == 2}">결제</c:when>
                                            <c:when test="${faq[i-1].type == 3}">이용방법</c:when>
                                            <c:when test="${faq[i-1].type == 4}">리뷰</c:when>
                                            <c:when test="${faq[i-1].type == 5}">페이백</c:when>
                                            <c:when test="${faq[i-1].type == 6}">기타</c:when>
                                        </c:choose></td>
                                        <td class="td-date">${faq[i-1].reg_date}</td>
                                        <td class="td-comma">${faq[i-1].view_num}</td>
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
                            <div class="pagination" id="faq-table-pagination">
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
    let paginationDivId = 'faq-table-pagination';
    let paginationDiv = $('#' + paginationDivId);
    let totalFAQNum = ${faqNum};
    $(".pagination").on("click", 'a', function () {
        let selectedPage = $(this);
        let data_order = selectedPage.attr('data-order');
        let data_type = $('.tab').children('.active').attr('data-type');
        console.log(data_order);
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (data_order === '-1') {
            if (tablePaginationChange(totalFAQNum, paginationDivId, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange, data_type);
            }
        } else if (data_order === '0') {
            if (tablePaginationChange(totalFAQNum, paginationDivId, true)) {
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

    function dataCallFunction(page, data_type, dataTypeChaged, searchKeyword, sTitle, sContent) {
        let data = {"page": page, "data_type": data_type};
        let selectedPageIndex = (page * 10) - 10;
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/customer/faq/paging',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $("#pagination_layout *").remove();
            console.log(result);
            console.log("length : " + result.faqList.length);
            for (let i = 0; i < result.faqList.length; i++) {
                let data = result.faqList[i];
                let thisIndex = selectedPageIndex + i + 1;
                let categoryText;
                switch (data.type) {
                    case 1:
                        categoryText = '공급자';
                        break;
                    case 2:
                        categoryText = '결제';
                        break;
                    case 3:
                        categoryText = '이용방법';
                        break;
                    case 4:
                        categoryText = '리뷰';
                        break;
                    case 5:
                        categoryText = '페이백';
                        break;
                    case 6:
                        categoryText = '기타';
                        break;
                }
                $('#pagination_layout').append('<tr faq="'+ data.faq_no +'">\n' +
                    '                                        <td>' + thisIndex + '</td>\n' +
                    '                                        <td>\n' +
                    '                                            <div class="overflow">\n' +
                    '                                                <div class="overflow-space">\n' +
                    '                                                    <div class="overflow-text">' + data.question + '</div>\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                        </td>\n' +
                    '                                        <td>' + categoryText + '</td>\n' +
                    '                                        <td class="td-date">' + SplitDateFunction(data.reg_date) + '</td>\n' +
                    '                                        <td class="td-comma">' + comma(data.view_num) + '</td>\n' +
                    '                                        <td>\n' +
                    '                                            <button type="button" style="display: block;"\n' +
                    '                                                    class="btn btn-payus-table">\n' +
                    '                                                상세보기\n' +
                    '                                            </button>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>');
                totalFAQNum = result.faq_num;

                if(dataTypeChaged)
                    tablePagination(totalFAQNum, paginationDivId);
            }
        }).fail(function (error) {
            console.log(error);
        });
    }

    $(document).ready(function () {
        listenResize();
        tablePagination(${faqNum}, 'faq-table-pagination');
    });
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

    $('.payus-modal').on("click", function (event) {
        if (event.target.className === 'payus-modal show') {
            modal.removeClass("show");

            if (!modal.hasClass("show")) {
                body.css("overflow", "auto");
            }
        }
    });

    $('.tablinks').on("click", function () {
        if (!$(this).hasClass("active")) {
            const tabDiv = $(this).parent();
            tabDiv.children("button.active").removeClass("active");
            $(this).addClass("active");
            dataCallFunction(1, $(this).attr('data-type'), true);
        }
    });
</script>
</body>
</html>
