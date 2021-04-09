<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/4/8
  Time: 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function toUserPage(){
            window.location.href="${pageContext.request.contextPath}/user/toUserPage"
        }
    </script>
</head>
<body onload="toUserPage()">

</body>
</html>
