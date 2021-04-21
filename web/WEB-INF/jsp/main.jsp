<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/9
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <!-- jQThumb缩略图插件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jqthumb.js"></script>
    <script>
        //处理缩略图
        function DrawImage(hotimg) {
            $(hotimg).jqthumb({
                width: '100%',//宽度
                height: '25%px',//高度
                position : { y: '50%', x: '50%'},//从图片的中间开始产生缩略图
                zoom: '1',//缩放比例
                method: 'auto'//提交方法，用于不同的浏览器环境，默认为‘auto’
            });
        }
    </script>
    <style>
        .mid-picture {
            padding-top: 60px;
            padding-bottom: 60px;
            padding-left: 60px;
            height: 350px;
            background-color: #6f5499;
            width: auto;
            font-size: 20px;
            color: #cdbfe3;
            font-size: 20px;
        }

        .main-fornt-size {
            color: #fff;
            font-size: 20px;
        }
        .jqthumb {
            width: 100% !important;
        }
        .jqthumb > div {
            background-size: auto 100% !important;
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
            <a class="navbar-brand" href="#">论坛</a>
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
                    <a  class="dropdown-toggle"
                       data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我的信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li ><a href="${pageContext.request.contextPath}/user/toUserPage">登录</a></li>

                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class=mid-picture>
    <div class="main-fornt-size">
        <h1>专升本论坛</h1>
    </div>
    <p>在这里你可以学习到最新的专升本知识，了解最新的动态</p>
</div>
<div class="row">
    <c:forEach var="school" items="${list}">
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/SchoolPicUpload/${school.schoolPic}" class="img-circle" width="100%" height="100%"
                     alt="通用的占位符缩略图"
                     onload="DrawImage(this)">
                <div class="caption">
                    <h3>${school.schoolName}</h3>
                    <p>${school.schoolProfile}</p>
                    <p>
                        <a href="${pageContext.request.contextPath}/school/toForum?id=${school.schoolId}" class="btn btn-primary" role="button">
                            查看文章
                        </a>
                        <a href="#" class="btn btn-default" role="button">
                            关注
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
