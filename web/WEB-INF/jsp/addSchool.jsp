
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
                    <small> 学校列表--新增学校</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/school/addSchool" method="post" enctype="multipart/form-data">

        学校名字：<input type="text" name="schoolName" required><br><br><br>
        学校图片：<input type="text" name="schoolPic" required><br><br><br>
        学校图片：<input type="file" name="schoolPic2" required><br><br><br>
        学校介绍：<input type="text" name="schoolProfile" required><br><br><br>
        <input type="submit" value="添加">
    </form>
</div>
</body>
</html>
