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
    <title>修改用户</title>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small> 用户列表--用户列表</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
        <input type="hidden" name="userId" value="${QUser.userId}">

        用户账号：<input type="text" name="userName" required value="${QUser.userName}"><br><br><br>
        用户名字：<input type="text" name="userDisplayName" required value="${QUser.userDisplayName}"><br><br><br>
        用户密码：<input type="text" name="userPassword" required value="${QUser.userPassword}"><br><br><br>
        用户邮件：<input type="text" name="userEmail" required value="${QUser.userEmail}"><br><br><br>
        <input type="submit" value="添加">
    </form>
</div>
</body>
</html>
