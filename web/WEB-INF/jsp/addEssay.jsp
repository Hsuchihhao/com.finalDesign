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
    <title>修改文章</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <!--加载富文本编辑器-->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        div {
            width: 100%;
        }
    </style>
    <!--加载富文本编辑器-->
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
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small> 文章列表--添加文章</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/essay/addEssay" method="post">

        <input type="hidden" name="essayUserDisplayName">
        文章名字：<input type="text" class="form-control" name="essayName" required><br><br><br>
        文章内容：  <script id="editor" name="essayText" type="text/plain" style="width:1024px;height:500px;"></script>
<%--        <textarea id="essayText" class="form-control" name="essayText" required class="form-control"--%>
<%--                       rows="6"></textarea>--%>
        <br><br><br>
        <div class="form-group">
            文章作者： <label>${addEssayUserInfo.userDisplayName}</label>

        </div>
        文章分类：
        <div class="form-group">
            <input type="text" class="form-control" readonly="readonly" value="${QSchoolId.schoolName}" name="essayCategory" id="exampleInputPassword1" placeholder="Password">
        </div>
        <input readonly="readonly" type="hidden"  id="inputEssayCategory">
        <br><br><br>
        <button type="submit" class="btn btn-primary">添加</button>
    </form>
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
<script type="text/javascript">
    // 实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
</script>
</html>
