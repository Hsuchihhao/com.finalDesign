<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/8
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加文章</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

    <script>
        // function selectSchool() {
        //     console.log("点击选择框");
        //     var schoolName = document.getElementById("selectSchoolName").innerText;
        //     $(dropdownMenu1).text(schoolName);
        //     console.log(schoolName);
        // }
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
                <li class="active"><a href="${pageContext.request.contextPath}/essay/allEssay">总览 <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/allUser">用户</a></li>
                <li><a href="${pageContext.request.contextPath}/school/allSchool">学校 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li>
                    <a data-toggle="modal" data-target="#addEssay"
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
            <h1 class="page-header">总览</h1>
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
