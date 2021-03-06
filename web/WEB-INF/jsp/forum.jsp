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
    <title>主页</title>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <style>

        #myBtn {
            display: none;
            position: fixed;

            right: 20%;
            z-index: 99;
            border: none;
            outline: none;
            background-color: #ffffff;
            color: #2d64b3;
            cursor: pointer;
            padding: 15px;
            border-radius: 10px;
        }
        .myBtn {
            display: none;
            position: fixed;

            right: 20%;
            z-index: 99;
            border: none;
            outline: none;
            background-color: #ffffff;
            color: #2d64b3;
            cursor: pointer;
            padding: 15px;
            border-radius: 10px;
        }

        #myBtn:hover {
            background-color: #ffffff;
        }

    </style>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
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
            <a class="navbar-brand" href="#" id="top">论坛</a>
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
<div class="jumbotron">
    <h1>${QSchool.schoolName}</h1>
    <p>${QSchool.schoolProfile}</p>
    <p><a class="btn btn-primary btn-lg"
          href="${pageContext.request.contextPath}/school/toAddSchoolEssay?id=${QSchool.schoolId}"
          role="button">我有想法</a></p>
</div>
<div class="container-fluid">
    <div class="row ">
        <div class="col-md-6 col-md-offset-3 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>文章名字</th>
                    <th>文章作者</th>
                    <th>发布时间</th>
                </tr>

                </thead>
                <tbody>
                <c:forEach var="essay" items="${essayList}">
                    <tr>

                        <td style="min-height: 50px"><a
                                href="${pageContext.request.contextPath}/essay/toEssayInner?EssayName=${essay.essayName}">${essay.essayName}</a>
                        </td>
                        <td>${essay.essayUserDisplayName}</td>
                        <td><fmt:formatDate value="${essay.essayCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <button onclick="topFunction()" id="myBtn" title="回顶部">返回顶部</button>
        <button onclick="topFunction()" class="myBtn" title="回顶部">刷新</button>

    </div>
</div>

<script>

    window.onscroll = function() {scrollFunction()};
    function scrollFunction() {console.log(121);
        if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
            document.getElementById("myBtn").style.display = "block";
        } else {
            document.getElementById("myBtn").style.display = "none";
        }
    }

    // 点击按钮，返回顶部
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }

</script>
</body>
</html>
