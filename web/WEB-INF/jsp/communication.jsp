<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/4/8
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>私信</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script>
        function displayCommunication() {

            $.get({
                url: "${pageContext.request.contextPath}/communication/displayCommunication",
                data: {"userName": $("#displayName").val()},
                datatype:"json",
                success: function (data) {
                    console.log(data);
                    // $("#commDisplayText").text(data)
                    <%--if (data.toString() === 'ok') {--%>
                    <%--    var array = new Array();--%>
                    <%--    $("#commDisplayText").text("${communicationInnerList.communicationText}")--%>
                    <%--    console.log("${communicationInnerList.communicationText}")--%>
                    <%--    <c:forEach items="${communicationInnerList}" var="communication" varStatus="status">--%>
                    <%--        array.push("${items}");--%>
                    <%--        var temp="${items}";--%>
                    <%--        alert("${status.count}");--%>
                    <%--        alert("${item.communicationText}")--%>
                    <%--    </c:forEach>--%>
                    <%--    console.log(data);--%>
                    <%--}--%>
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
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="row">
                <div class="row">
                    <div class="col-md-3">
                        <div class="input-group">
                            <h3><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                <span class="label label-default">私信消息</span></h3>
                            <div class="tab-content">
                                <div class="tab-pane active" id="home">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>私信成员</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="communicationName" items="${communicationNameList}">
                                            <input hidden="hidden" id="displayName" value=${communicationName}>
                                            <tr>
                                                <td><a onclick="displayCommunication()">${communicationName}</a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <textarea class="form-control" rows="20" id="commDisplayText">

                            </textarea>
                            <textarea class="form-control" rows="4"></textarea>
                            <button class="btn btn-primary" type="button" style="float: right">回复</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
