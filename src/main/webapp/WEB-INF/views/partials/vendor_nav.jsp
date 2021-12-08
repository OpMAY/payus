<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-12-08
  Time: 오후 7:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row payus-nav">
    <div class="div-sidebar-open">
        <img src="/images/hamburger.svg" alt style="width: 100%; transform: scale(0.6)">
    </div>
</div>
<script>
    const originBody = $(document.body);
    $('.div-sidebar-open').on("click", function () {
        $('.sidebar').css("transition", "0.5s");
        $('.sidebar').css("width", '100%');
        $('.sidebar').scrollTop(0);
        originBody.css("overflow", "hidden");
    })
</script>
