<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/8
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small> 书籍列表--修改书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <input type="hidden" name="bookID" value="${QBook.bookID}">
        书籍名称：<input type="text" name="bookName" required value="${QBook.bookName}"><br><br><br>
        书籍数量：<input type="text" name="bookCounts" required value="${QBook.bookCounts}"><br><br><br>
        书籍详情：<input type="text" name="detail" required value="${QBook.detail}"><br><br><br>
        <input type="submit" value="添加">
    </form>
</div>
</body>
</html>
