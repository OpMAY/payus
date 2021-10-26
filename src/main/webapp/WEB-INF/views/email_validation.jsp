<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-09-23
  Time: 오후 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="textbox">
    <input id="text" name=validation_code type="text"/>
    <label for="text">인증 코드</label>
    <div class="error">인증 코드를 입력하세요.</div>
</div>
<br><br>
<button type="button" id="check" value="인증하기" onclick="checkValidation()"></button>
<script>
    function checkValidation() {
        let validationToken = $("#text").val();
        let data = {"validationToken" : validationToken};
        $.ajax({
            type: 'POST',
            url: '/demo/email/validation.do',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (result) {
            console.log(result);
            if (result === 1) {
                alert("인증 성공");
                window.location = "/home.do";
            } else {
                alert("인증 실패");
                window.location.reload();
            }
        }).fail(function (error) {
            console.log(error);
            window.location.reload();
        })
    }
</script>
</body>
</html>
