<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/13
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/school/addFile" method="post" enctype="multipart/form-data">
<input type="file" name="file">上传
<input type="submit" name="上传">
</form>
</body>
</html>
