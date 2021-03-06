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


    <title>管理端界面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/statics/css/dashboard.css" rel="stylesheet">

    <style>
        .text_slice {
            width: 100px;
            display: block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;

        }
    </style>
    <script>

    </script>
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
                <li><a href="${pageContext.request.contextPath}/essay/allEssay">总览 <span
                        class="sr-only">(current)</span></a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/user/allUser">用户</a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/school/allSchool">学校
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
            </ul>

            <ul class="nav nav-sidebar">
                <li>
                    <a href="${pageContext.request.contextPath}/essay/toAdminAddEssay">新增文章</a>
                </li>

                <li>
                    <a href="">新增用户</a>
                </li>

                <li class="active">
                    <a href="${pageContext.request.contextPath}/school/toAddSchool">新增学校</a>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="${pageContext.request.contextPath}/communication/toCommunication">私信</a></li>
                <li><a href="">退出</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">新增学校</h1>
            <form action="${pageContext.request.contextPath}/school/addSchool" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="input-group">
                            学校名字：<input type="text" class="form-control" name="schoolName"
                                        aria-describedby="basic-addon1" required><br><br><br>
                        </div>
                        <br><br>
                        <div class="input-group">
                            学校图片：<input type="file" class="form-control" name="schoolPic2"
                                        aria-describedby="basic-addon1" required>
                        </div>
                        <br><br>
                        <div class="input-group">
                            学校介绍：<input type="text" class="form-control" name="schoolProfile"
                                        aria-describedby="basic-addon1" required>
                        </div>
                        <br><br>
                        <button type="submit" class="btn btn-primary">添加</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <div class="modal fade" id="addSchool" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增学校</h4>
                </div>
                <form enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">

                            <div class="col-md-6 col-md-offset-3">

                                <div class="input-group">
                                    学校名字：<input type="text" class="form-control" name="schoolName"
                                                aria-describedby="sizing-addon2" required>
                                </div>

                                <br><br>

                                <div class="input-group">
                                    学校图片：<input type="file" class="form-control" name="schoolPic2"
                                                id="schoolPic2" aria-describedby="sizing-addon2" required>
                                </div>

                                <br><br>

                                <div class="input-group">
                                    学校介绍：<input type="text" class="form-control" name="schoolProfile"
                                                id="schoolProfile" aria-describedby="sizing-addon2" required>
                                </div>
                                <br><br>

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeMassage">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="addSchoolBtn()">确定新增</button>
                    </div>
                </form>
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
