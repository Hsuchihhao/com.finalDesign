<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/20
  Time: 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <title>帖子</title>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <style>

        .timeColor {
            color: grey
        }
    </style>

    <script>
        function toBottom() {
            var high = document.documentElement.scrollHeight;
            var high2 = document.documentElement.clientHeight;
            window.scrollTo(0, document.documentElement.scrollHeight);
            console.log("点击去底部");
            console.log("实际高度----" + high);
            console.log("页面高度----" + high2);
        }

        function follow() {
            $.get({
                url: "${pageContext.request.contextPath}/follow/addFollow",
                data: {
                    "commentEssay": $("#commentEssay").val(),
                    "commentCategory": $("#commentCategory").val(),
                    "followbtn": $("#followbtn").text()
                },
                success: function (data) {
                    if (data.toString() === '未登录') {
                        console.log(data);
                        $(followbtn).text('未登录')

                    }
                    if (data.toString() === '已点击关注') {
                        console.log(data);
                        $(followbtn).text("取消关注");
                    }
                    if (data.toString() === '已点击取消关注') {
                        console.log(data);
                        $(followbtn).text("关注");
                    }
                }
            })
        }
    </script>


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
                <li><a href="${pageContext.request.contextPath}/essay/allEssay">管理员界面</a></li>
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
<ol class="breadcrumb">
    <li><a href="#">主页</a></li>
    <li><a href="#">论坛</a></li>
    <li class="active">当前</li>
</ol>
<!--文章部分-->
<form action="${pageContext.request.contextPath}/userComment/addComment" method="post">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h3 align="center"><a name="commentEssay">${essayInner.essayName}</a></h3>
            <!--隐藏input获取值-->
            <input type="hidden" value="${essayInner.essayName}" name="commentEssay" id="commentEssay">
            <input type="hidden" value="${essayInner.essayCategory}" name="commentCategory" id="commentCategory">
            <h5 align="center">作者：<a name="commentDisplayName" id="commentDisplayName" href="${pageContext.request.contextPath}/user/otherUserPage?userName=${essayInner.essayUserDisplayName}">${essayInner.essayUserDisplayName}</a>
                发布时间：${essayInner.essayCreateTime}</h5>
            <h4>${essayInner.essayText}</h4>
            <br>

            <button type="button" class="btn btn-info" onclick="toBottom()">留言</button>

            <button type="button" class="btn btn-success" style="float: right" id="followbtn"
                    onclick="follow()">${followInnerInfo}</button>

        </div>
    </div>

    <!--评论-->
    <c:forEach var="userComment" items="${userCommentInnerList}">
        <div class="media col-md-offset-3">
            <div class="media-left">
                <a href="#">
                    <img class="media-object"
                         src="${pageContext.request.contextPath}/statics/UserDefaultPic/UserDefaultPic.jpg" alt="...">
                </a>
            </div>
            <div class="media-body">
                <h5 class="media-heading">${userComment.commentDisplayName}</h5>
                <a>${userComment.commentText}</a> <br>
                <a class="timeColor">${userComment.commentDate}</a>
            </div>
        </div>
    </c:forEach>
    <!--留言板-->
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <textarea class="form-control" rows="3" name="commentText" id="commentText"></textarea>
            <button type="submit" class="btn btn-info">留言</button>
        </div>
    </div>
</form>
</body>
</html>
