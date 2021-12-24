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
    <title>공급자 상점 상세 수정</title>
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
<body>
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
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상점 상세 수정 페이지</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-10 offset-1"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-category-first">카테고리</label>
                                <div style="position: relative; display: flex">
                                    <textarea class="payus-small-textarea" style="margin-right: 15px; width: 80px"
                                              id="vendor-store-category-first" rows="1"
                                              disabled><c:choose><c:when
                                            test="${store.class_first == 1}">숙박</c:when><c:when
                                            test="${store.class_first == 2}">식당</c:when><c:when
                                            test="${store.class_first == 3}">병원</c:when><c:when
                                            test="${store.class_first == 4}">쇼핑</c:when><c:when
                                            test="${store.class_first == 5}">식료품</c:when></c:choose></textarea>
                                    <div>
                                        <span><img src="/images/Chevron-Left.svg" alt width="100%"
                                                   style="padding-top: 13px"></span>
                                    </div>
                                    <textarea class="payus-small-textarea" id="vendor-store-category-second" rows="1"
                                              style="margin-left: 15px"
                                              disabled><c:choose><c:when
                                            test="${store.class_first == 1}"><c:choose><c:when
                                            test="${store.class_second == 1}">모텔</c:when><c:when
                                            test="${store.class_second == 2}">호텔</c:when><c:when
                                            test="${store.class_second == 3}">펜션</c:when><c:when
                                            test="${store.class_second == 4}">게스트 하우스</c:when><c:when
                                            test="${store.class_second == 5}">글램핑</c:when><c:when
                                            test="${store.class_second == 6}">기타</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 2}"><c:choose><c:when
                                            test="${store.class_second == 1}">한식</c:when><c:when
                                            test="${store.class_second == 2}">육류</c:when><c:when
                                            test="${store.class_second == 3}">찜&탕</c:when><c:when
                                            test="${store.class_second == 4}">중식</c:when><c:when
                                            test="${store.class_second == 5}">일식</c:when><c:when
                                            test="${store.class_second == 6}">피자</c:when><c:when
                                            test="${store.class_second == 7}">분식</c:when><c:when
                                            test="${store.class_second == 8}">카페</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 3}"><c:choose><c:when
                                            test="${store.class_second == 1}">내과</c:when><c:when
                                            test="${store.class_second == 2}">피부과</c:when><c:when
                                            test="${store.class_second == 3}">산부인과</c:when><c:when
                                            test="${store.class_second == 4}">가정의학과</c:when><c:when
                                            test="${store.class_second == 5}">이비인후과</c:when><c:when
                                            test="${store.class_second == 6}">비뇨의학과</c:when><c:when
                                            test="${store.class_second == 7}">응급의학과</c:when><c:when
                                            test="${store.class_second == 8}">한방의학과</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 4}"><c:choose><c:when
                                            test="${store.class_second == 1}">출산&유아동</c:when><c:when
                                            test="${store.class_second == 2}">의류</c:when><c:when
                                            test="${store.class_second == 3}">스포츠</c:when><c:when
                                            test="${store.class_second == 4}">뷰티</c:when><c:when
                                            test="${store.class_second == 5}">생활&주방</c:when><c:when
                                            test="${store.class_second == 6}">취미&DIY</c:when><c:when
                                            test="${store.class_second == 7}">도서&문구</c:when><c:when
                                            test="${store.class_second == 8}">가전&디지털</c:when></c:choose></c:when><c:when
                                            test="${store.class_first == 5}"><c:choose><c:when
                                            test="${store.class_second == 1}">과일</c:when><c:when
                                            test="${store.class_second == 2}">채소</c:when><c:when
                                            test="${store.class_second == 3}">쌀&잡곡&견과</c:when><c:when
                                            test="${store.class_second == 4}">정육&계란</c:when><c:when
                                            test="${store.class_second == 5}">수산물</c:when><c:when
                                            test="${store.class_second == 6}">밀키트</c:when><c:when
                                            test="${store.class_second == 7}">베이커리</c:when><c:when
                                            test="${store.class_second == 8}">기타</c:when></c:choose></c:when></c:choose></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 1rem">
                                <label for="vendor-store-explain">상점 소개</label>
                                <textarea class="payus-textarea" id="vendor-store-explain" rows="2" readonly
                                >${store.explain}</textarea>
                            </div>
                        </div>
                        <div class="col-12" style="margin-bottom: 1rem">
                            <button type="button" class="btn btn-payus e-e-btn edit"
                                    id="service-edit-btn">
                                수정
                            </button>
                            <button type="button" class="btn btn-grey" style="display: none"
                                    id="service-edit-cancel-btn">
                                취소
                            </button>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">서비스</label>
                                <div style="display: flex; align-content: center; flex-direction: column">
                                    <c:forEach var="service" items="${store.service_list}">
                                        <div style="margin-bottom: 1rem; border: 1px solid grey"
                                             service-data="${service.service_no}">
                                            <div style="width: 100%; display: flex; margin-bottom: 5px; align-items: center">
                                                <textarea class="payus-textarea" rows="1" style="width: 76%" readonly
                                                          placeholder="서비스 제목을 입력하세요."
                                                >${service.title}</textarea>
                                                <button class="e-s-btn btn btn-payus edit" type="button"
                                                        style="width: 16%; margin: 0 0 0 10px"><i class="fa fa-pencil"
                                                                                                  aria-hidden="true"></i>
                                                </button>
                                                <button class="d-s-btn btn btn-grey" type="button"
                                                        style="width: 16%; margin: 0 0 0 10px;background-color: #BBBBBB">
                                                    <i class="fa fa-trash" aria-hidden="true"></i></button>
                                            </div>
                                            <textarea class="payus-textarea" rows="2" readonly
                                                      placeholder="서비스 내용을 입력하세요."
                                            >${service.content}</textarea>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div>
                                    <button class="p-s-btn btn btn-payus-table" type="button"><i class="fa fa-plus"
                                                                                                 aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group" style="margin-bottom: 2rem">
                                <label for="vendor-store-explain">이용안내</label>
                                <div style="display: flex; align-content: center; flex-direction: column">
                                    <c:forEach var="information" items="${store.information}">
                                        <div style="margin-bottom: 1rem; border: 1px solid grey"
                                             information-data="${information.information_no}">
                                            <div style="width: 100%; display: flex; margin-bottom: 5px; align-items: center">
                                                <textarea class="payus-textarea" rows="1" style="width: 76%" readonly
                                                          placeholder="이용안내 제목을 입력하세요."
                                                >${information.title}</textarea>
                                                <button class="e-i-btn btn btn-payus edit" type="button"
                                                        style="width: 16%; margin: 0 0 0 10px"><i class="fa fa-pencil"
                                                                                                  aria-hidden="true"></i>
                                                </button>
                                                <button class="d-i-btn btn btn-grey" type="button"
                                                        style="width: 16%; margin: 0 0 0 10px;background-color: #BBBBBB">
                                                    <i class="fa fa-trash" aria-hidden="true"></i></button>
                                            </div>
                                            <textarea class="payus-textarea" rows="2" readonly
                                                      placeholder="이용안내 내용을 입력하세요."
                                            >${information.content}</textarea>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div>
                                    <button class="p-i-btn btn btn-payus-table" type="button"><i class="fa fa-plus"
                                                                                                 aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12" style="margin-bottom: 1rem">
                            <button type="button" class="btn btn-grey"
                                    id="btn-back">
                                뒤로 가기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script>
    let body = $(document.body);
    let originalExplain = $('#vendor-store-explain').val();

    $('.p-s-btn').on('click', function () {
        let targetDiv = $(this).parent().prev();
        targetDiv.append('<div style="margin-bottom: 1rem; border: 1px solid grey" service-data="new">\n' +
            '                                            <div style="width: 100%; display: flex;margin-bottom: 5px; align-items: center">\n' +
            '                                                <textarea class="payus-textarea" rows="1" style="width: 76%"\n' +
            '                                                placeholder="서비스 제목을 입력하세요."></textarea>\n' +
            '                                                <button class="r-s-btn btn btn-payus" type="button" style="width: 16%; margin: 0 0 0 10px;background-color: #34A853"><i class="fa fa-check" aria-hidden="true"></i></button>\n' +
            '                                                <button class="d-s-btn btn btn-grey" type="button" style="width: 16%; margin: 0 0 0 10px;background-color: #BBBBBB"><i class="fa fa-trash" aria-hidden="true"></i></button>\n' +
            '                                            </div>\n' +
            '                                            <textarea class="payus-textarea" rows="2"\n' +
            '                                            placeholder="서비스 내용을 입력하세요."></textarea>\n' +
            '                                        </div>');
    });

    $('.p-i-btn').on('click', function () {
        let targetDiv = $(this).parent().prev();
        targetDiv.append('<div style="margin-bottom: 1rem; border: 1px solid grey" information-data="new">\n' +
            '                                            <div style="width: 100%; display: flex;margin-bottom: 5px; align-items: center">\n' +
            '                                                <textarea class="payus-textarea" rows="1" style="width: 76%"\n' +
            '                                                placeholder="이용안내 제목을 입력하세요."></textarea>\n' +
            '                                                <button class="r-i-btn btn btn-payus" type="button" style="width: 16%; margin: 0 0 0 10px;background-color: #34A853"><i class="fa fa-check" aria-hidden="true"></i></button>\n' +
            '                                                <button class="d-i-btn btn btn-grey" type="button" style="width: 16%; margin: 0 0 0 10px;background-color: #BBBBBB"><i class="fa fa-trash" aria-hidden="true"></i></button>\n' +
            '                                            </div>\n' +
            '                                            <textarea class="payus-textarea" rows="2"\n' +
            '                                            placeholder="이용안내 내용을 입력하세요."></textarea>\n' +
            '                                        </div>');
    });

    $(body).on('click', '.e-s-btn.edit', function () {
        $(this).removeClass('edit');
        $(this).addClass('submit');
        $(this).prev().removeAttr('readonly');
        $(this).parent().next().removeAttr('readonly');
        $(this).html('<i class="fa fa-check" aria-hidden="true"></i>');
        $(this).css('background-color', '#34A853')
    });

    $(body).on('click', '.e-i-btn.edit', function () {
        $(this).removeClass('edit');
        $(this).addClass('submit');
        $(this).prev().removeAttr('readonly');
        $(this).parent().next().removeAttr('readonly');
        $(this).html('<i class="fa fa-check" aria-hidden="true"></i>');
        $(this).css('background-color', '#34A853')
    });

    $(body).on('click', '.e-e-btn.edit', function () {
        let explainInput = $('#vendor-store-explain');
        explainInput.removeAttr('readonly');
        originalExplain = explainInput.val();
        $('#service-edit-cancel-btn').css('display', 'block');
        $(this).text('완료');
        $(this).removeClass('edit');
        $(this).addClass('submit');
    });

    $(body).on('click', '.e-e-btn.submit', function () {
        let explain = $('#vendor-store-explain').val();
        let data = {"explain": explain};
        $.ajax({
            type: 'POST',
            url: '/vendor/manage/store/detail/edit/explain',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            if (result === 0) {
                alert('상점 소개가 수정되었습니다.');
                let explainInput = $('#vendor-store-explain');
                let explainEditBtn = $('.e-e-btn');
                let cancelBtn = $('#service-edit-cancel-btn');
                cancelBtn.css('display', 'none');
                explainInput.attr('readonly', true);
                explainEditBtn.removeClass('submit');
                explainEditBtn.addClass('edit');
                explainEditBtn.text('수정');
            }
        }).fail(function (error) {
            console.log(error);
        })
    });

    $(body).on('click', '#service-edit-cancel-btn', function () {
        let explainInput = $('#vendor-store-explain');
        let explainEditBtn = $('.e-e-btn');
        explainInput.val(originalExplain);
        explainInput.attr('readonly', true);
        $(this).css('display', 'none');
        explainEditBtn.removeClass('submit');
        explainEditBtn.addClass('edit');
        explainEditBtn.text('수정');
    });

    $(body).on('click', '.e-s-btn.submit', function () {
        if(confirm('해당 서비스를 수정하시겠습니까?')){
            let pressedBtn = $(this);
            let service_no = $(this).parent().parent().attr('service-data');
            console.log('service_no : ' + service_no);
            let title = $(this).prev();
            console.log('title : ' + title.val());
            let content = $(this).parent().next();
            console.log('content : ' + content.val());
            let data = {"service_no": service_no, "title": title.val(), "content": content.val()};
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/store/detail/edit/service',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result === 0) {
                    alert('수정되었습니다.');
                    title.attr('readonly', true);
                    content.attr('readonly', true);
                    console.log($(this));
                    pressedBtn.html('<i class="fa fa-pencil" aria-hidden="true"></i>');
                    pressedBtn.css('background-color', 'rgba(109, 41, 208, 0.8)');
                    pressedBtn.removeClass('submit');
                    pressedBtn.addClass('edit');
                }
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            return false;
        }
    });

    $(body).on('click', '.e-i-btn.submit', function () {
        if(confirm('해당 이용안내를 수정하시겠습니까?')){
            let pressedBtn = $(this);
            let information_no = $(this).parent().parent().attr('information-data');
            console.log('information_no : ' + information_no);
            let title = $(this).prev();
            console.log('title : ' + title.val());
            let content = $(this).parent().next();
            console.log('content : ' + content.val());
            let data = {"information_no": information_no, "title": title.val(), "content": content.val()};
            // TODO 이용안내 수정 AJAX
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/store/detail/edit/information',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                if (result === 0) {
                    alert('수정되었습니다.');
                    title.attr('readonly', true);
                    content.attr('readonly', true);
                    pressedBtn.html('<i class="fa fa-pencil" aria-hidden="true"></i>');
                    pressedBtn.css('background-color', 'rgba(109, 41, 208, 0.8)');
                    pressedBtn.removeClass('submit');
                    pressedBtn.addClass('edit');
                }
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            return false;
        }
    });

    $(body).on('click', '.r-s-btn', function () {
        if(confirm('새 서비스를 등록하시겠습니까?')){
            let pressedBtn = $(this);
            let title = $(this).prev();
            console.log('title : ' + title.val());
            let content = $(this).parent().next();
            console.log('content : ' + content.val());
            let data = {"title": title.val(), "content": content.val()};
            // TODO 서비스 등록 AJAX
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/store/detail/register/service',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                alert('등록되었습니다.');
                pressedBtn.parent().parent().attr('service-data', result);
                title.attr('readonly', true);
                content.attr('readonly', true);
                pressedBtn.html('<i class="fa fa-pencil" aria-hidden="true"></i>');
                pressedBtn.css('background-color', 'rgba(109, 41, 208, 0.8)');
                pressedBtn.removeClass('r-s-btn');
                pressedBtn.addClass('e-s-btn');
                pressedBtn.addClass('edit');
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            return false;
        }
    });

    $(body).on('click', '.r-i-btn', function () {
        if(confirm('새 이용안내를 등록하시겠습니까?')){
            let pressedBtn = $(this);
            let title = $(this).prev();
            console.log('title : ' + title.val());
            let content = $(this).parent().next();
            console.log('content : ' + content.val());
            let data = {"title": title.val(), "content": content.val()};
            // TODO 이용안내 등록 AJAX
            $.ajax({
                type: 'POST',
                url: '/vendor/manage/store/detail/register/information',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function (result) {
                alert('등록되었습니다.');
                pressedBtn.parent().parent().attr('information-data', result);
                title.attr('readonly', true);
                content.attr('readonly', true);
                pressedBtn.html('<i class="fa fa-pencil" aria-hidden="true"></i>');
                pressedBtn.css('background-color', 'rgba(109, 41, 208, 0.8)');
                pressedBtn.removeClass('r-i-btn');
                pressedBtn.addClass('e-i-btn');
                pressedBtn.addClass('edit');
            }).fail(function (error) {
                console.log(error);
            })
        } else {
            return false;
        }
    });

    $(body).on('click', '.d-s-btn', function () {
        if(confirm('해당 서비스 내용을 삭제하시겠습니까?')){
            let pressedBtn = $(this);
            let service_data = $(this).parent().parent().attr('service-data');
            if (service_data !== 'new') {
                let data = {"service_no": service_data};
                $.ajax({
                    type: 'POST',
                    url: '/vendor/manage/store/detail/delete/service',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data)
                }).done(function (result) {
                    if(result === 0) {
                        alert('삭제되었습니다.');
                        pressedBtn.parent().parent().remove();
                    }
                }).fail(function (error) {
                    console.log(error);
                })
            } else {
                console.log($(this).parent().parent());
                $(this).parent().parent().remove();
            }
        } else {
            return false;
        }
    });

    $(body).on('click', '.d-i-btn', function () {
        if(confirm('해당 이용안내 내용을 삭제하시겠습니까?')){
            let pressedBtn = $(this);
            let information_data = $(this).parent().parent().attr('information-data');
            if (information_data !== 'new') {
                let data = {"information_no": information_data};
                // TODO 이용안내 삭제 AJAX
                $.ajax({
                    type: 'POST',
                    url: '/vendor/manage/store/detail/delete/information',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data)
                }).done(function (result) {
                    if(result === 0) {
                        alert('삭제되었습니다.');
                        pressedBtn.parent().parent().remove();
                    }
                }).fail(function (error) {
                    console.log(error);
                })
            } else {
                console.log($(this).parent().parent());
                $(this).parent().parent().remove();
            }
        } else {
            return false;
        }
    });

    $('#btn-back').on('click', function () {
        window.location = document.referrer;
    });
</script>
</body>
</html>
