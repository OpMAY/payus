<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
  <button class="dropdown-btn">
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a class="sidebar-subject" disabled>내 정보 관리</a>
    <a href="/vendor/mypage/vendor.do">회원 정보</a>
    <a href="#">사업장 정보</a>
  </div>
  <a class="sidebar-subject" disabled>상점 관리</a>
  <a href="#">상점 정보</a>
  <a href="#">상세 페이지</a>
  <a href="#">상점 리뷰</a>
  <a class="sidebar-subject" disabled>상품 관리</a>
  <a href="#">상품 목록</a>
  <a href="#">상점 등록</a>
  <a class="sidebar-subject" disabled>포인트 관리</a>
  <a href="#">포인트 충전 내역</a>
  <a href="#">포인트 적립 내역</a>
  <a class="sidebar-subject" disabled>매출 관리</a>
  <a href="#">매출 현황</a>
  <a class="sidebar-subject" disabled>고객센터</a>
  <a href="#">공지사항</a>
  <a href="#">FAQ</a>
  <a href="#">문의 내역</a>
  <a href="#">문의 하기</a>
</div>
<script type="text/javascript">
  $(function() {
    // this will get the full URL at the address bar
    let url = window.location.href;
    console.log(url);

    // passes on every "a" tag
    $(".sidebar a").each(function() {
      // checks if its the same on the address bar
      if (url === (this.href)) {
        $(this).addClass("active");
        //for making parent of submenu active
        $(this).parent().parent().addClass("active");
      }
    });
  });
</script>