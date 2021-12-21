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
        <div class="page-content d-flex align-items-center " style="flex-direction: column">
            <jsp:include page="partials/vendor_nav.jsp" flush="true"/>
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상품 목록</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <%--                    <div class="row" style="justify-content: right; margin-bottom: 1rem;">--%>
                    <%--                        <div class="col-3">--%>
                    <%--                            <select class="payus-select" id="review-data-type-select"--%>
                    <%--                                    style="color: black;" onchange="alert('바뀜')">--%>
                    <%--                                <option selected value="1">전체</option>--%>
                    <%--                                <option value="2">오픈</option>--%>
                    <%--                                <option value="3">준비중</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <div class="row" id="table-div" style="overflow-x: auto;">
                        <%--      TODO 데이터 리스트로 연동                  --%>
                        <div class="col-12" id="table-col"
                             style="display: flex; justify-content: center; flex-direction: column">
                            <table class="payus-table">
                                <thead>
                                <tr>
                                    <th style="width: 5%">번호</th>
                                    <th style="width: 12%">이미지</th>
                                    <th style="width: 15%">상품명</th>
                                    <th style="width: 20%">상품 옵션</th>
                                    <th style="width: 8%">가격</th>
                                    <th style="width: 10%">등록 일자</th>
                                    <th style="width: 15%">수정</th>
                                    <th style="width: 15%">삭제</th>
                                </tr>
                                </thead>
                                <tbody id="pagination_layout">
                                <c:forEach var="i" begin="1" end="${rooms.size()}">
                                    <c:if test="${i <= 10}">
                                        <tr goods="${rooms[i-1].room_no}">
                                            <td>${i}</td>
                                            <td><img class="clickable_img"
                                                     src="https://payus.s3.ap-northeast-2.amazonaws.com/${rooms[i-1].room_img}"
                                                     alt style="width: 100%; object-fit: fill"></td>
                                            <td>
                                                <div class="overflow">
                                                    <div class="overflow-space">
                                                        <div class="overflow-text"
                                                             title="${rooms[i-1].name}">${rooms[i-1].name}</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="overflow">
                                                    <div class="overflow-space">
                                                        <div class="overflow-text"
                                                             title="${rooms[i-1].room_explain}">${rooms[i-1].room_explain}</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="td-comma">${rooms[i-1].price}원</td>
                                            <td class="td-date">${rooms[i-1].reg_date}</td>
                                            <td>
                                                    <%--      TODO 수정하기 페이지 이동              --%>
                                                <button type="button" class="btn btn-payus-table">
                                                    수정
                                                </button>
                                            </td>
                                            <td>
                                                    <%--      TODO 삭제 AJAX                      --%>
                                                <button type="button" class="btn btn-payus-table-report">
                                                    삭제
                                                </button>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--  TODO 전체 리뷰 갯수로 페이지네이션 리뷰 페이지당 10개씩   --%>
                            <div class="pagination" id="goods-table-pagination">
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
    let totalGoodsNum = ${rooms.size()};
    const paginationDivId = 'goods-table-pagination';
    let GoodsType = ${goodsType};
    let body = $(document.body);

    $(body).on("click", ".btn-payus-table-report", function () {
        let goods_no = $(this).parent().parent().attr('goods');
        console.log(goods_no);
        let goodsName = $(this).parent().parent().children(':eq(2)').children().children().children('.overflow-text').text();
        if (confirm('상품 \'' + goodsName + '\'을 삭제합니다.\n정말 삭제하시겠습니까?')) {
            let data = {"room_no": goods_no, "goods_name": goodsName, "goods_type": GoodsType};
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/goods/delete',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result) {
                    alert("삭제되었습니다.");
                    window.location.reload();
                }
            }).fail(function (error) {
                console.log(error);
            });
        } else {
            return false;
        }
    });

    $(body).on("click", ".btn-payus-table", function () {
        let room_no = $(this).parent().parent().attr('goods');
        console.log(room_no);
        window.location.href = "/vendor/manage/goods/edit.do?goods_no=" + room_no;
    });

    function dataCallFunction(page) {
        let data = {"page": page};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/goods/list/paging',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            $("#pagination_layout *").remove();
            let startIndex = (page - 1) * 10;
            for (let i = startIndex; i < totalGoodsNum; i++) {
                if(i === startIndex + 10)
                    break;
                let thisIndex = i + 1;
                let data = result.goodsList.room_options[i];
                $('#pagination_layout').append('<tr goods="' + data.room_no + '">\n' +
                    '                                        <td>' + thisIndex + '</td>\n' +
                    '                                        <td><img class="clickable_img"\n' +
                    '                                                 src="https://payus.s3.ap-northeast-2.amazonaws.com/' + data.room_img + '"\n' +
                    '                                                 alt style="width: 100%; object-fit: fill"></td>\n' +
                    '                                        <td>\n' +
                    '                                            <div class="overflow">\n' +
                    '                                                <div class="overflow-space">\n' +
                    '                                                    <div class="overflow-text"\n' +
                    '                                                         title="' + data.name + '">' + data.name + '</div>\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                        </td>\n' +
                    '                                        <td>\n' +
                    '                                            <div class="overflow">\n' +
                    '                                                <div class="overflow-space">\n' +
                    '                                                    <div class="overflow-text"\n' +
                    '                                                         title="' + data.room_explain +'">' + data.room_explain +'</div>\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                        </td>\n' +
                    '                                        <td class="td-comma">' + comma(data.price) + '원</td>\n' +
                    '                                        <td class="td-date">' + SplitDateFunction(data.reg_date) + '</td>\n' +
                    '                                        <td>\n' +
                    '                                                <%--      TODO 수정하기 페이지 이동              --%>\n' +
                    '                                            <button type="button" class="btn btn-payus-table">\n' +
                    '                                                수정\n' +
                    '                                            </button>\n' +
                    '                                        </td>\n' +
                    '                                        <td>\n' +
                    '                                                <%--      TODO 삭제 AJAX                      --%>\n' +
                    '                                            <button type="button" class="btn btn-payus-table-report">\n' +
                    '                                                삭제\n' +
                    '                                            </button>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>');
            }
        }).fail(function (error) {
            console.log(error);
        });
    }

    $(".pagination").on("click", 'a', function () {
        let data_order = $(this).attr('data-order');
        console.log(data_order);
        let paginationDiv = $("#goods-table-pagination");
        let active_page = paginationDiv.children('.active').attr('data-order');
        if (data_order === '-1') {
            if (tablePaginationChange(totalGoodsNum, paginationDiv, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange);
            }
        } else if (data_order === '0') {
            if (tablePaginationChange(totalGoodsNum, paginationDiv, false)) {
                let firstPageAfterChange = paginationDiv.children('.active').attr('data-order');
                dataCallFunction(firstPageAfterChange);
            }
        } else {
            if (active_page !== data_order) {
                paginationDiv.children('.active').removeClass('active');
                $(this).addClass('active');
                dataCallFunction(data_order);
            }
        }
    });

    $(document).ready(function () {
        listenResize();
        tablePagination(${roomNum}, 'goods-table-pagination');
    });
</script>
<script>


</script>
</body>
</html>
