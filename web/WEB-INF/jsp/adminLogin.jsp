<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/9
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员登录</title>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="https://www.recaptcha.net/recaptcha/api.js?oncallback=renderRecaptcha" async defer></script>
    <script>
        function namedisfcous() {
            $.get({
                url: "${pageContext.request.contextPath}/admin/queryAdminName",
                data: {"name": $("#name").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#userInfo").css("color", "green");
                        console.log(data);
                    }
                    $("#userInfo").html(data);
                }
            })
        }

        function pwddisfcous() {
            $.get({
                url: "${pageContext.request.contextPath}/admin/queryAdminPwd",
                data: {"password": $("#password").val(), "name": $("#name").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#pwdInfo").css("color", "green");
                    }
                    $("#pwdInfo").html(data);
                }
            })
        }


    </script>
</head>

<body style=" background-color:gainsboro;
             ">
<div class="modal-dialog" style="margin-top: 10%; width:400px;">
    <div class="modal-content">
        <div class="modal-header">

            <h4 class="modal-title text-center" id="myModalLabel">登录</h4>
        </div>
        <form action="${pageContext.request.contextPath}/admin/adminLogin" method="post">
            <div class="modal-body" id="model-body">
                <div class="form-group">

                    <label>用户名</label>
                    <span id="userInfo"></span>
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    <input type="text" class="form-control" id="name" name="name" placeholder="输入管理员用户名"
                           autocomplete="off"
                           onblur="namedisfcous()">
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="输入密码"
                           autocomplete="off"
                           onblur="pwddisfcous()">
                    <span id="pwdInfo"></span>

                </div>
            </div>

            <div class="modal-footer">

                <div class="form-group">
                    <button class="btn btn-primary form-control" type="submit" id="toUserPage"
                    >登录
                    </button>
                </div>
            </div>
        </form>


    </div>
</div><!-- /.modal-content -->
</div><!-- /.modal -->

</body>
</html>
