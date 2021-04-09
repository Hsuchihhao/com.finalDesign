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
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/school/toMain">论坛</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">主页 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>

            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入内容">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/essay/allEssay">管理员</a></li>
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/user/toUserPage" class="dropdown-toggle"
                       data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我的信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
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
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/school/allSchool">显示全部学校</a>
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
