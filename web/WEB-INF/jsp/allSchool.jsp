<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/8
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学校展示</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small> 学校列表--显示所有学校</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md 4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUser">新增学校</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allUser">显示全部学校</a>
            </div>

            <div class="col-md 8 column">
                <form class="form-inline" action="${pageContext.request.contextPath}/user/queryUser" method="post"
                      style="float: right">
                    <span style="color: #ff0000;font-weight: bold">${error}</span>
                    <input type="text" name="queryUserName" class="form-control" placeholder="输入查询的信息">
                    <input type="submit" value="查询" class="btn btn-primary">
                </form>

            </div>
        </div>
    </div>
    <div class="row clearfix">

        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>学校编号</th>
                    <th>学校名字</th>
                    <th>学校图片</th>
                    <th>学校介绍</th>
                    <th>学校文章数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="school" items="${list}">
                    <tr>
                        <td>${school.schoolId}</td>
                        <td>${school.schoolName}</td>
                        <td><img src="/SchoolPicUpload/${school.schoolPic}" width="100px"  height="80px"> </td>
                        <td>${school.schoolProfile}</td>
                        <td>${school.schoolNumber}</td>
                        <td>

                            <a href="${pageContext.request.contextPath}/user/toUpdateUser?id=${user.userId}">修改</a>
                            &nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/user/deleteUser/${user.userId}">删除</a>
                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
