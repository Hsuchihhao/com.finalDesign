<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>管理端界面</title>

    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/statics/css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .text_slice {
            width: 100px;
            display: block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;

        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/school/toMain">返回论坛</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">

                <li><a href="#">退出</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li ><a href="${pageContext.request.contextPath}/essay/allEssay">总览</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/user/allUser">用户<span
                        class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/school/allSchool">学校 <span
                        class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li >
                    <a data-toggle="modal" data-target="#"
                       id="privateChatButton" href="${pageContext.request.contextPath}/essay/toAdminAddEssay">新增文章</a>
                </li>
            <li><a href="">新增用户</a></li>
            <li><a href="">新增学校</a></li>
        </ul>

            <ul class="nav nav-sidebar">
                <li><a href="${pageContext.request.contextPath}/communication/toCommunication">私信</a></li>
                <li><a href="">退出</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">总览</h1>
            <div class="row placeholders">
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="${pageContext.request.contextPath}/statics/fourPic/wenzhangshu.jpg"
                         width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>文章</h4>
                    <span class="text-muted">新增文章</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="${pageContext.request.contextPath}/statics/fourPic/yonghushu.jpg"
                         width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>用户</h4>
                    <span class="text-muted">新增用户</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="${pageContext.request.contextPath}/statics/fourPic/xuexiaoshu.jpg"
                         width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>学校</h4>
                    <span class="text-muted">新增学校</span>
                </div>

                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="${pageContext.request.contextPath}/statics/fourPic/pinglunshu.jpg"
                         width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>评论</h4>
                    <span class="text-muted">新增评论</span>
                </div>


            </div>

            <h2 class="sub-header">用户列表</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>用户编号</th>
                        <th>用户账号</th>
                        <th>用户名称</th>
                        <th>用户密码</th>
                        <th>用户邮箱</th>
                        <th>操作</th>
                    </tr>

                    </thead>
                    <c:forEach var="user" items="${list}">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.userName}</td>
                            <td>${user.userDisplayName}</td>
                            <td>${user.userPassword}</td>
                            <td>${user.userEmail}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/user/toUpdateUser?id=${user.userId}" method="post">
                                    <button type="submit" class="btn btn-warning">修改</button>
                                </form>
                                    <%--                                <a href="${pageContext.request.contextPath}/essay/toUpdateEssay?id=${essay.essayId}">修改</a>--%>
                                &nbsp;&nbsp;
                                <form action="${pageContext.request.contextPath}/user/deleteUser/${user.userId}">

                                    <button type="submit" class="btn btn-danger">删除</button>
                                </form>

                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
