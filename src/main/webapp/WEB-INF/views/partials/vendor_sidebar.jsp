<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
    $(function () {
        // this will get the full URL at the address bar
        let url = window.location.href;
        console.log(url);

        // passes on every "a" tag
        $(".sidebar a").each(function () {
            // checks if its the same on the address bar
            if (url === (this.href)) {
                $(this).addClass("active");
                //for making parent of submenu active
                console.log($(this).parent());
                let childrenElementNumber = $(this).parent().children().length;
                $(this).parent().css("height", 54 * childrenElementNumber + "px");
                $(this).parent().css("visibility", "visible");
                $(this).parent().prev('button').addClass("active");
                let dropdown = document.getElementsByClassName("dropdown-btn");
                let i;
                for (i = 0; i < dropdown.length; i++) {
                    let dropdownContent = dropdown[i].nextElementSibling;
                    if (dropdownContent.style.visibility === 'visible') {
                        console.log(i);
                        dropdown[i].style.backgroundColor = "rgba(109, 41, 208, 0.8)";
                        dropdown[i].style.color = "white";
                    }
                }
            }
        });
    });

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    $.ajax({
        type: 'POST',
        url: '/vendor/mypage/point',
        dataType: 'json',
        contentType: 'application/json; charset=utf-8'
    }).done(function (result) {
        $('#sidebar-store-name').text(result.name + '님');
        $('#sidebar-store-point').text(comma(result.point + 'P'));
    }).fail(function (error) {
        console.log(error);
    });
</script>
<div class="sidebar">
    <div class="sidebar-header">
        <div>
            <img src="/images/payus_logo.png" width="48px" height="48px" style="margin-right: 8px" alt=""/>
            <span style="color: rgb(109, 41, 208)">PayUs</span>
        </div>
        <div style="margin-top: 20px">
            <span class="sidebar-info name" style="display: block; font-size: 20px;word-break: break-word"
                  id="sidebar-store-name"></span>
            <span class="sidebar-info point" style="display: block; font-size: 20px;color: rgb(109, 41, 208)"
                  id="sidebar-store-point"></span>
        </div>
        <button type="button" class="btn btn-sidebar-close">
            <img src="/images/modal-x.svg" alt width="100%">
        </button>
    </div>
    <button class="dropdown-btn">내 정보 관리
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/vendor/mypage/vendor.do">회원 정보</a>
        <a href="/vendor/mypage/business.do">사업장 정보</a>
    </div>
    <button class="dropdown-btn">상점 관리
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/vendor/manage/store/info.do">상점 정보</a>
        <a href="/vendor/manage/store/detail.do">상세 페이지</a>
        <a href="/vendor/manage/store/review.do">상점 리뷰</a>
    </div>
    <button class="dropdown-btn">상품 관리
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/vendor/manage/goods/list.do">상품 목록</a>
        <a href="/vendor/manage/goods/register.do">상품 등록</a>
    </div>
    <button class="dropdown-btn">포인트 관리
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/vendor/manage/point/charge.do">포인트 충전 내역</a>
        <a href="/vendor/manage/point/accumulate.do">포인트 적립 내역</a>
    </div>
    <button class="dropdown-btn">매출 관리
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/vendor/manage/sales.do">매출 현황</a>
    </div>
    <button class="dropdown-btn">고객센터
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/vendor/manage/customer/notice.do">공지사항</a>
        <a href="/vendor/manage/customer/faq.do">FAQ</a>
        <a href="/vendor/manage/customer/inquiry/list.do">문의 내역</a>
        <a href="/vendor/manage/customer/inquiry/request.do">문의 하기</a>
    </div>
    <div style="display: flex; flex-direction: column">
        <a id="withdraw" style="cursor: pointer">회원탈퇴</a>
        <a id="logout" style="cursor: pointer">로그아웃</a>
    </div>
</div>
<script>
    /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
    let dropdown = document.getElementsByClassName("dropdown-btn");
    let i;
    let outBody = $(document.body);

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function () {
            console.log("toggled");
            this.classList.toggle("active");
            let dropdownContent = this.nextElementSibling;
            let childrenElementNumber = dropdownContent.childElementCount;
            if (dropdownContent.style.height === 54 * childrenElementNumber + "px") {
                dropdownContent.style.visibility = "hidden";
                if (dropdownContent.style.visibility === "hidden")
                    dropdownContent.style.height = 0;
                // dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.height = 54 * childrenElementNumber + "px";
                // dropdownContent.style.display = "block";
                dropdownContent.style.visibility = "visible";
            }
        });
    }

    $("#withdraw").on("click", function () {
        if (confirm('회원 탈퇴 하시겠습니까?')) {
            if (confirm('공급자 회원 탈퇴 시 상점, 포인트, 리뷰 정보가 모두 삭제됩니다.\n삭제 후 복구는 불가능합니다.\n그래도 회원 탈퇴 하시겠습니까?')) {
                $.ajax({
                    type: 'POST',
                    url: '/vendor/mypage/withdraw',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8'
                }).done(function (result) {
                    if (result) {
                        alert('회원 탈퇴 되었습니다.\n페이어스를 이용해주셔서 감사합니다.');
                        window.location.reload();
                    }
                }).fail(function (error) {
                    console.log(error);
                })
            }
        }
    });

    $("#logout").on("click", function () {
        if (confirm('로그아웃 하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '/vendor/mypage/logout',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8'
            }).done(function (result) {
                if (result) {
                    alert("로그아웃 되었습니다.");
                    window.location.reload();
                }
            }).fail(function (error) {
                console.log(error);
            })
        }
    });

    $('.btn-sidebar-close').on("click", function () {
        $('.sidebar').css("width", 0);
        outBody.css("overflow", "auto");
    });


</script>