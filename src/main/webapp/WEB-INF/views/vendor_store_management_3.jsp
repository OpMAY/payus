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
<body>
<!-- partial:partials/_footer.jsp -->
<jsp:include page="partials/vendor_sidebar.jsp" flush="true"></jsp:include>
<!-- partial -->
<div class="main-wrapper sidemain">
    <div class="page-wrapper full-page">

        <div class="page-content d-flex align-items-center justify-content-center" style="flex-direction: column">
            <div class="row" style="width: 100%; margin-top: 3rem">
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="row" style="margin-bottom: 1rem">
                        <h3 class="d-block mb-2" style="color: #8668d0; padding-left: 10px">상점 리뷰</h3>
                    </div>
                </div>
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12"
                     style="margin-bottom: 20px; flex-direction: row; align-items: center">
                    <div class="row">
                        <table class="payus-table">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>리뷰 내용</th>
                                <th>별점</th>
                                <th>작성자</th>
                                <th>생성일자</th>
                                <th>답변 상태</th>
                                <th>신고</th>
                                <th>상세 정보</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>답변 완료</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>안녕하세요. 너무 맛있어요</td>
                                <td>4</td>
                                <td>한지우</td>
                                <td>2021.01.12</td>
                                <td>미답변</td>
                                <td>신고하기</td>
                                <td>자세히 보기</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4cf906c03295c29420721a730a4ef0b&libraries=services"></script>
</body>
</html>
