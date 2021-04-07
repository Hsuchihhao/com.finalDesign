
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small> 书籍列表--新增书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/user/addUser" method="post">
        用户名称：<input type="text" name="userName" required><br><br><br>
        用户名字：<input type="text" name="userDisplayName" required><br><br><br>
        用户密码：<input type="text" name="userPassword" required><br><br><br>
        用户邮箱：<input type="text" name="userEmail" required><br><br><br>
        <input type="submit" value="添加">
    </form>
</div>
</body>
</html>
