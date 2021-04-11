<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/12
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户界面</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
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
        function userCheck() {
            var flag =${checkFlag};
            if (flag > 0) {
                $("#privateChatButton").attr("style", "display:none;");
            }
        }

        function sendMassage() {
            $.get({
                url:  "${pageContext.request.contextPath}/communication/sendMassage",
                data: {
                    "communicationText": $("#communicationText").val(),
                    "communicationReceiverName":"${userAccount}"
                },
                success: function (data) {
                    if (data.toString() === 'ok') {
                        console.log(data);
                        $('#myModal').modal('hide');

                    } else {
                    }
                }
            })
        }
    </script>

</head>
<body onload="userCheck()">
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
                <li class="active"><a href="${pageContext.request.contextPath}/school/toMain">主页 <span class="sr-only">(current)</span></a>
                </li>
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
                        <li><a href="${pageContext.request.contextPath}/communication/toCommunication">我的私信</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="row">
    <div class="col-md-6 col-md-offset-3"><h1>这是用户页面</h1>
        <span id="userLoginInfo">${userLoginInfo}</span>
        <a href="${pageContext.request.contextPath}/user/goOutUser">注销</a>
        <h3>
            <a href="${pageContext.request.contextPath}/school/toMain">进入主页页面</a>
        </h3>
        <div class="media">
            <div class="media-left media-middle">
                <a href="#">
                    <img class="media-object"
                         src="${pageContext.request.contextPath}/statics/UserDefaultPic/UserDefaultPic.jpg" alt="...">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">${userPageName}</h4>
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"
                        id="privateChatButton">私信
                </button>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">私信</h4>
                    </div>
                    <div class="modal-body">
                        <textarea class="form-control" rows="3" id="communicationText"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeMassage">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="sendMassage()">发送私信</button>
                    </div>
                </div>
            </div>
        </div>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#home" data-toggle="tab">我的文章</a></li>
            <li><a href="#fcous" data-toggle="tab">我的关注</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="home">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>文章编号</th>
                        <th>文章名字</th>
                        <th>文章内容</th>
                        <th>发布时间</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="essay" items="${essayListByDisplayName}">
                        <tr>
                            <td>${essay.essayId}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/essay/toEssayInner?EssayName=${essay.essayName}">${essay.essayName}</a>
                            </td>
                            <td class="text_slice">${essay.essayText}</td>
                            <td><fmt:formatDate value="${essay.essayCreateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="tab-pane" id="fcous">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>文章名字</th>
                        <th>文章类别</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="follow" items="${followList}">
                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/essay/toEssayInner?EssayName=${follow.followEssay}">${follow.followEssay}</a>
                            </td>
                            <td>${follow.followCategory}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
