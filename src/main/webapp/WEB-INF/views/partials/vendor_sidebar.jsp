<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="sidebar">
  <div class="sidebar-header">
    <span class="noto-font" style="">공급자</span>
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
    <a href="#">포인트 충전 내역</a>
    <a href="#">포인트 적립 내역</a>
  </div>
  <button class="dropdown-btn">매출 관리
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">매출 현황</a>
  </div>
  <button class="dropdown-btn">고객센터
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">공지사항</a>
    <a href="#">FAQ</a>
    <a href="#">문의 내역</a>
    <a href="#">문의 하기</a>
  </div>
  <a href="#">회원탈퇴</a>
  <a href="#">로그아웃</a>
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
        console.log($(this).parent());
        $(this).parent().css("display", "block");
        $(this).parent().addClass("active");
        let dropdown = document.getElementsByClassName("dropdown-btn");
        let i;
        for(i = 0; i < dropdown.length; i++){
          let dropdownContent = dropdown[i].nextElementSibling;
          if(dropdownContent.style.display === "block"){
            console.log(i);
            dropdown[i].style.backgroundColor = "rgba(109, 41, 208, 0.8)";
            dropdown[i].style.color = "white";
          }
        }
      }
    });
  });
</script>
<script>
  /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
  let dropdown = document.getElementsByClassName("dropdown-btn");
  let i;

  for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function() {
      console.log("toggled");
      this.classList.toggle("active");
      let dropdownContent = this.nextElementSibling;
      if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
      } else {
        dropdownContent.style.display = "block";
      }
    });
  }
</script>