<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有文章</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .text_slice{
            width: 100px;
            display: block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;

        }

    </style>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small> 文章列表--显示所有文章</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md 4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/essay/toAdminAddEssay">新增文章</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/essay/allEssay">显示全部文章</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allUser">显示全部用户</a>
            </div>

            <div class="col-md 8 column">
                <form class="form-inline" action="${pageContext.request.contextPath}/essay/queryEssay" method="post" style="float: right">
                    <span style="color: #ff0000;font-weight: bold">${error}</span>
                    <input type="text" name="queryEssayName" class="form-control" placeholder="输入查询的信息">
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
                    <th>文章编号</th>
                    <th>文章名字</th>
                    <th>文章内容</th>
                    <th>文章作者</th>
                    <th>文章类别</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="essay" items="${list}">
                    <tr>
                        <td>${essay.essayId}</td>
                        <td>${essay.essayName}</td>
                        <td class="text_slice">${essay.essayText}</td>
                        <td>${essay.essayUserDisplayName}</td>
                        <td>${essay.essayCategory}</td>
                        <td> <fmt:formatDate value="${essay.essayCreateTime}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/essay/toUpdateEssay?id=${essay.essayId}">修改</a>
                            &nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/essay/deleteEssay/${essay.essayId}">删除</a>
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
