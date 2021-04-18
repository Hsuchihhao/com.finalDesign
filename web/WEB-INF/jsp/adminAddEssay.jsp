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
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

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
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
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
                <li ><a href="${pageContext.request.contextPath}/essay/allEssay">总览 <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/allUser">用户</a></li>
                <li><a href="${pageContext.request.contextPath}/school/allSchool">学校 <span class="sr-only">(current)</span></a></li>
            </ul>

            <ul class="nav nav-sidebar">
                <li class="active">
                    <a data-toggle="modal" data-target="#"
                       id="privateChatButton" href="${pageContext.request.contextPath}/essay/toAdminAddEssay">新增文章</a>
                </li>
                <li><a href="">新增用户</a></li>
                <li><a href="">新增学校</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">退出</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">新增文章</h1>

            <form action="${pageContext.request.contextPath}/essay/addEssay" method="post">

                <input type="hidden" name="essayUserDisplayName" value="${addEssayUserInfo}">
                文章名字：<input type="text" class="form-control" name="essayName" required ><br><br><br>
                文章内容：<textarea id="essayText" class="form-control" name="essayText" required class="form-control"
                               rows="6"></textarea><br><br><br>
                <div class="form-group">
                    文章作者： <label>${addEssayUserInfo}</label>

                </div>
                文章分类：
                <div class="dropdown" id="myDrop">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                        ${QEssay.essayCategory}

                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="schoolul" >
                        <c:forEach var="school" items="${QSchool}">
                            <li  id="selectSchoolName">
                                <a href="#" name="${school.schoolName}" >${school.schoolName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <input readonly="readonly" type="hidden" name="essayCategory" id="inputEssayCategory">
                <br><br><br>
                <button type="submit" class="btn btn-primary">修改</button>
            </form>
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
<script type="text/javascript">
    // 获取选中的值
    $("#schoolul li").on('click',function(){

        //获取dom元素，点击哪个显示哪个
        $("#inputEssayCategory").val($(this).text());

        console.log("inputEssayCategory内容---"+ $("#inputEssayCategory").val())

        //下框口变成选中字符
        $(dropdownMenu1).text($(this).text());
        console.log("button内容----"+$(dropdownMenu1).text());

        $("#inputEssayCategory").val( $(this).children(":first").attr("name"));
        console.log("inputEssayCategory内容---"+ $("#inputEssayCategory").val())

    });
</script>
</body>
</html>
